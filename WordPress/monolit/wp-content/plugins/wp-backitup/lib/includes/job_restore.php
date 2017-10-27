<?php if (!defined ('ABSPATH')) die('No direct access allowed (restore)');

// Checking safe mode is on/off and set time limit
if( ini_get('safe_mode') ){
   @ini_set('max_execution_time', WPBACKITUP__SCRIPT_TIMEOUT_SECONDS);
}else{
   @set_time_limit(WPBACKITUP__SCRIPT_TIMEOUT_SECONDS);
}

/**
 * WP BackItUp  - Restore Job
 *
 * @package WP BackItUp
 * @author  Chris Simmons <chris.simmons@wpbackitup.com>
 * @link    http://www.wpbackitup.com
 *
 */

/*** Includes ***/

if( !class_exists( 'WPBackItUp_Restore' ) ) {
    include_once 'class-restore.php';
}

if( !class_exists( 'WPBackItUp_Filesystem' ) ) {
    include_once 'class-filesystem.php';
}

if( !class_exists( 'WPBackItUp_Zip' ) ) {
	include_once 'class-zip.php';
}

if( !class_exists( 'WPBackItUp_Utility' ) ) {
	include_once 'class-utility.php';
}

if( !class_exists( 'WPBackItUp_SQL' ) ) {
    include_once 'class-sql.php';
}

if( !class_exists( 'WPBackItUp_Job_Task' ) ) {
	include_once 'class-job-task.php';
}

/*** Globals ***/
global $WPBackitup;
global $table_prefix; //this is from wp-config

global $backup_name; //name of the backup file
global $RestorePoint_SQL; //path to restore point

global $status_array,$inactive,$active,$complete,$failure,$warning,$success;
$inactive=0;
$active=1;
$complete=2;
$failure=-1;
$warning=-2;
$success=99;

//setup the status array
global $status_array;
$status_array = array(
	'preparing' =>$inactive ,
	'unpacking' =>$inactive ,
	'unzipping' =>$inactive ,
	'validation'=>$inactive,
	'deactivate_plugins' =>$inactive ,
	'restore_point'=>$inactive,
	'stage_wpcontent'=>$inactive,
	'restore_wpcontent'=>$inactive,
	'restore_database'=>$inactive,
	'update_user'=>$inactive,
	'update_site_info'=>$inactive,
	'update_permalinks'=>$inactive,
 );

//*****************//
//*** MAIN CODE ***//
//*****************//

// always logging turned on for restore
$WPBackitup->set_logging(true);


if (! is_object ($current_job)){
	WPBackItUp_LoggerV2::log_error($events_logname,$process_id,'Current job not object:');
	WPBackItUp_LoggerV2::log_error($events_logname,$process_id,var_export($current_job));
	return false;
}

if (! is_object ($current_task)){
	WPBackItUp_LoggerV2::log_error($events_logname,$process_id,'Current task not object');
	WPBackItUp_LoggerV2::log_error($events_logname,$process_id,var_export($current_task));
	return false;
}

WPBackItUp_LoggerV2::log_info($events_logname,$process_id ,'Run task:' .$current_task->getTaskName());


//Get the job name
$job_log_name =  sprintf('JobLog_%s',$current_job->getJobName());

$restore_logname = $job_log_name;
$log_function='job_restore::'.$current_task->getTaskName();

$backup_name = $current_job->getJobMetaValue('backup_name');
if( empty($backup_name)) {
	WPBackItUp_LoggerV2::log_error($restore_logname,$log_function,'Backup name not found in job meta.');
	write_fatal_error_status('error201');
	end_restore();
	return false;
}

//Get user ID
$user_id = $current_job->getJobMetaValue('user_id');
if( empty($user_id)) {
	WPBackItUp_LoggerV2::log_error($restore_logname,$log_function,'User Id not found in job meta.');
	write_fatal_error_status('error201');
	end_restore();
	return false;
}

global $wp_restore; //Eventually everything will be migrated to this class
$wp_restore = new WPBackItUp_Restore($restore_logname,$backup_name,$current_job->getJobId());

//*************************//
//***   RESTORE TASKS   ***//
//*************************//
//An error has occurred on the previous run
if (WPBackItUp_Job::ERROR==$current_task->getStatus()){

	WPBackItUp_LoggerV2::log_error($restore_logname,$log_function,'Fatal error on previous task:'. $current_task->getTaskName());

	//Fetch last wordpress error(might not be related to timeout)
	//error type constants: http://php.net/manual/en/errorfunc.constants.php
	WPBackItUp_LoggerV2::log_info($restore_logname,$log_function,'Last Error: ' .var_export(error_get_last(),true));

	//Check for error type
	switch ( $current_task->getTaskName() ) {
		case "task_preparing":
			$current_task->setStatus(WPBackItUp_Job_Task::ERROR,2001);
			fatal_error( 'preparing', '2001', 'Task ended in error:'.$current_task->getTaskName() );
			break;

		case "task_unzip_backup_files":
			$current_task->setStatus(WPBackItUp_Job_Task::ERROR,2002);
			fatal_error( 'unzipping', '2002', 'Task ended in error:'.$current_task->getTaskName());
			break;

		case "task_validate_backup":
			$current_task->setStatus(WPBackItUp_Job_Task::ERROR,2003);
			fatal_error( 'validation', '2003', 'Task ended in error:'.$current_task->getTaskName() );
			break;

		case "task_create_checkpoint":
			$current_task->setStatus(WPBackItUp_Job_Task::ERROR,2004);
			fatal_error( 'restore_point', '2004', 'Task ended in error:'.$current_task->getTaskName() );
			break;

		case "task_stage_wpcontent":
			$current_task->setStatus(WPBackItUp_Job_Task::ERROR,2005);
			fatal_error( 'stage_wpcontent', '2005', 'Task ended in error:'.$current_task->getTaskName() );
			break;

		case "task_restore_wpcontent":
			$current_task->setStatus(WPBackItUp_Job_Task::ERROR,2006);
			fatal_error( 'restore_wpcontent', '2006', 'Task ended in error:'.$current_task->getTaskName() );
			break;

		case "task_restore_database":
			$current_task->setStatus(WPBackItUp_Job_Task::ERROR,2007);
			fatal_error( 'restore_database', '2007', 'Task ended in error:'.$current_task->getTaskName() );
			break;

		default:
			$current_task->setStatus(WPBackItUp_Job_Task::ERROR,2999);
			fatal_error( 'unknown', '2999', 'Task ended in error:'.$current_task->getTaskName() );
			break;
	}

	return false;
}

//Cleanup Task
if ('task_preparing'==$current_task->getTaskName()) {
	WPBackItUp_LoggerV2::log($restore_logname,'***BEGIN RESTORE***');
	WPBackItUp_LoggerV2::log_sysinfo($restore_logname);

	$task = 'preparing';
	start_status($task);

	WPBackItUp_LoggerV2::log($restore_logname,'**PREPARING FOR RESTORE**');

	//ONLY check license here and prevent restore from starting. If
	//IF license check fails in later steps could be because DB was restored and no license on backup
	//which is a valid condition.
	if ( ! $this->license_active()){
		$current_task->setStatus(WPBackItUp_Job_Task::ERROR,225);
		fatal_error($task,'225','Restore is not available because license is not active.');
		return false;
	}

	//PREPARE TASK
	if ( ! class_exists('ZipArchive')){
		$current_task->setStatus(WPBackItUp_Job_Task::ERROR,235);
		fatal_error($task,'235','Zip Archive Class is not available.');
		return false;
	}

	WPBackItUp_LoggerV2::log($restore_logname,'*DELETE RESTORE FOLDER*');
	if ( ! $wp_restore->delete_restore_folder()){
		$current_task->setStatus(WPBackItUp_Job_Task::ERROR,222);
		fatal_error($task,'222','Restore folder could not be deleted.');
		return false;
	}
	WPBackItUp_LoggerV2::log($restore_logname,'*END DELETE RESTORE FOLDER*');

	WPBackItUp_LoggerV2::log($restore_logname,'*CREATE ROOT RESTORE FOLDER*');
	if ( ! $wp_restore->create_restore_root_folder()){
		$current_task->setStatus(WPBackItUp_Job_Task::ERROR,222);
		fatal_error($task,'222','Root Restore folder could not be created.');
		return false;
	}
	WPBackItUp_LoggerV2::log($restore_logname,'*END CREATE RESTORE FOLDER*');

	WPBackItUp_LoggerV2::log($restore_logname,'*DELETE STAGED FOLDER*');
	if ( ! $wp_restore->delete_staged_folders()){
		$current_task->setStatus(WPBackItUp_Job_Task::ERROR,222);
		fatal_error($task, '222','Staged folders could not be deleted.');
		return false;
	}
	WPBackItUp_LoggerV2::log($restore_logname,'*END DELETE STAGED FOLDER*');

	WPBackItUp_LoggerV2::log($restore_logname,'*UPDATE SITE VALUES META*' );
	$siteurl    = $wp_restore->get_siteurl();
	if (false===$siteurl){
		$current_task->setStatus(WPBackItUp_Job_Task::ERROR,207);
		fatal_error($task,'207','Unable to fetch site url.');
		return false;
	}else {
		$current_job->setJobMetaValue('current_siteurl',$siteurl);
	}

	$homeurl    = $wp_restore->get_homeurl();
	if (false===$homeurl){
		$current_task->setStatus(WPBackItUp_Job_Task::ERROR,208);
		fatal_error($task, '208','Unable to fetch home url.');
		return false;
	}else{
		$current_job->setJobMetaValue('current_homeurl',$homeurl);
	}

	//stash current user.
	$current_user = $wp_restore->get_current_user();
	if (false===$current_user) {
		$current_task->setStatus(WPBackItUp_Job_Task::ERROR,209);
		fatal_error($task,'209','Unable to fetch user information.');
		return false;
	}else{
		$current_job->setJobMetaValue('current_user',$current_user);
	}

	//Stash  current user meta
	$current_user_meta = $wp_restore->get_current_user_meta();
	if (false===$current_user_meta) {
		$current_task->setStatus(WPBackItUp_Job_Task::ERROR,209);
		fatal_error($task,'209','Unable to fetch user meta information.');
		return false;
	}else{
		$current_job->setJobMetaValue('current_user_meta',$current_user_meta);
	}

	//fetch options and save to job meta
	$wpbackitup_options = $wp_restore->get_options_wpbackitup();
	if (false!==$wpbackitup_options) {
		$current_job->setJobMetaValue('wpbackitup_options',$wpbackitup_options);
	}

	WPBackItUp_LoggerV2::log($restore_logname,'*END UPDATE SITE VALUES META*' );

	$current_task->setStatus(WPBackItUp_Job_Task::COMPLETE);
	WPBackItUp_LoggerV2::log($restore_logname,'**END PREPARING FOR RESTORE**');

	end_status($task);
	return;
}


//Check for backup set in folder
if ('task_inventory_backupset'==$current_task->getTaskName()) {

	WPBackItUp_LoggerV2::log( $restore_logname, '*INVENTORY BACKUPSET*' );

	$task = 'unpacking';
	start_status($task);

	$missing_archives = $wp_restore->get_backupset_unpack_list($current_job,$current_task);
	if ( ! is_array($missing_archives)){
		$current_task->setStatus(WPBackItUp_Job_Task::ERROR,261);
		fatal_error($task,'261','Unable to extract archives from backup set.');
		return false;
	}

	//save list to job meta for next task - empty array is  ok
	$current_job->setJobMetaValue('backupset_unpack_remaining',$missing_archives);
	$current_task->setStatus(WPBackItUp_Job_Task::COMPLETE);


	WPBackItUp_LoggerV2::log( $restore_logname, '*INVENTORY BACKUPSET*' );

	return;

}


//unpack zip from list
//on last file build job list for regular path
//do this even if no backupset
//Unpack backup set and update job meta
if ('task_unpack_backupset'==$current_task->getTaskName()) {
	WPBackItUp_LoggerV2::log( $restore_logname, '*UNPACK BACKUPSET*' );

	$task = 'unpacking';
	start_status($task);

	//	//Are there any backups to unpack from set file
	$backupset_unpack_remaining = $current_job->getJobMetaValue('backupset_unpack_remaining');
	WPBackItUp_LoggerV2::log_info( $restore_logname, $log_function, 'Backupset Remaining Files:' . var_export( $backupset_unpack_remaining, true ) );

	if (is_array($backupset_unpack_remaining) && count($backupset_unpack_remaining)>0) {

		//found one so unpack it
		$backup_file = current($backupset_unpack_remaining);
		$backup_file_key = key($backupset_unpack_remaining);
		WPBackItUp_LoggerV2::log_info( $restore_logname, $log_function, 'Unpack backup file:' . var_export( $backup_file, true ) );

		//Get backup set file
		$backupset_file = $current_job->getJobMetaValue('backupset_file');
		WPBackItUp_LoggerV2::log_info( $restore_logname, $log_function, 'Backup Set file:' . var_export( $backupset_file, true ) );

		if ($wp_restore->unpack_backup_from_backupset( $current_job, $current_task,$backupset_file,$backup_file )){

			//remove this element and save to job meta
			unset($backupset_unpack_remaining[$backup_file_key]);
			$current_job->setJobMetaValue('backupset_unpack_remaining',$backupset_unpack_remaining);//save to job meta for next task
			WPBackItUp_LoggerV2::log_info( $restore_logname, $log_function, 'Backupset Remaining Files:' . var_export( $backupset_unpack_remaining, true ) );

			//If there are more files to unpack then set task to queued and return
			if (is_array($backupset_unpack_remaining) && count($backupset_unpack_remaining)>0) {
				$current_task->setStatus( WPBackItUp_Job_Task::QUEUED );
				WPBackItUp_LoggerV2::log_info( $restore_logname, $log_function, 'More backup files to extract - task queued.');
				return;
			}
		} else{
			//Error occurred
			WPBackItUp_LoggerV2::log_error( $restore_logname, __METHOD__, 'Failed to unpack backup file:' . $backup_file);
			$current_task->setStatus(WPBackItUp_Job_Task::ERROR,260);
			fatal_error($task,'260','Unable to unpack backup from backup set.');
			return false;
		}
	}


	// NO more backup files to unpack

	//get the backup files contained in the backup folder
	$backup_files = $wp_restore->get_backups_in_folder($current_job,$current_task,false);
	if (is_array($backup_files)){
		WPBackItUp_LoggerV2::log_info( $restore_logname, $log_function, 'Backup Files Found in Backup Folder:' . var_export( $backup_files, true ) );

		$current_job->setJobMetaValue('backup_set',$backup_files);
		$current_job->setJobMetaValue('backup_set_remaining',$backup_files);

	}else{
		$current_task->setStatus(WPBackItUp_Job_Task::ERROR,262);
		fatal_error($task,'262','No zip files found in backup folder:' . $backup_files);
		return false;
	}

	$current_task->setStatus( WPBackItUp_Job_Task::COMPLETE );
	WPBackItUp_LoggerV2::log_info( $restore_logname, $log_function, 'No More backup files to extract - task completed.');

	end_status($task);

	WPBackItUp_LoggerV2::log( $restore_logname, '*END UNPACK BACKUPSET*' );
	return;
}


//Unzip all the zip files into the restore folder.
//- check for backupset archive FIRST
if ('task_unzip_backup_files'==$current_task->getTaskName()) {

	WPBackItUp_LoggerV2::log($restore_logname,'**UNZIP BACKUP**' );
	$task = 'unzipping';
	start_status($task);

	//get the list of plugins zips in folder
	$backup_set_list=$current_job->getJobMetaValue('backup_set_remaining');
	WPBackItUp_LoggerV2::log_info($restore_logname,$log_function,'Begin -  Backup set list:');
	WPBackItUp_LoggerV2::log($restore_logname,$backup_set_list);


	if ( ! $wp_restore->unzip_archive_file( $backup_set_list) ) {
		$current_task->setStatus(WPBackItUp_Job_Task::ERROR,203);
		fatal_error($task,'203','Unable to unzip archive.');
		return false;
	} else {

		array_shift( $backup_set_list ); //remove from list
		$current_job->setJobMetaValue('backup_set_remaining',$backup_set_list);

		if (is_array($backup_set_list) && count($backup_set_list)>0){
			//CONTINUE
			WPBackItUp_LoggerV2::log_info($restore_logname,__METHOD__,'Continue unzipping backup set.');
			$current_task->setStatus(WPBackItUp_Job_Task::QUEUED);
		} else{
			//COMPLETE
			WPBackItUp_LoggerV2::log_info($restore_logname,__METHOD__,'Complete - All archives restored.');
			end_status( $task);
			$current_task->setStatus(WPBackItUp_Job_Task::COMPLETE);
			WPBackItUp_LoggerV2::log($restore_logname,'**END UNZIP BACKUP**' );
		}

	}

	return;

}


//Validate the backup folder
if ('task_validate_backup'==$current_task->getTaskName()) {
	WPBackItUp_LoggerV2::log($restore_logname,'**VALIDATE BACKUP**' );

	$task =  'validation';
	start_status($task);

	//Validate the restore folder

	if ( ! $wp_restore->validate_restore_folder( )){
		$current_task->setStatus(WPBackItUp_Job_Task::ERROR,204);
		fatal_error($task,'204','Restore directory INVALID.');
		return false;
	}

	WPBackItUp_LoggerV2::log($restore_logname,'*VALIDATE MANIFEST*' );
	$backup_set_list=$current_job->getJobMetaValue('backup_set');
	if ( $wp_restore->validate_manifest_file($backup_set_list,$error_code)===false){

		WPBackItUp_LoggerV2::log_error($restore_logname,__METHOD__,'Error Code:' .$error_code );

		switch ($error_code) {
			case 1:
				$current_task->setStatus(WPBackItUp_Job_Task::ERROR,251);
				fatal_error($task,'251','Empty manifest.');
				break;
			case 2:
				$current_task->setStatus(WPBackItUp_Job_Task::ERROR,252);
				fatal_error($task,'252','Missing zip file.');
				break;
			case 3:
				$current_task->setStatus(WPBackItUp_Job_Task::ERROR,253);
				fatal_error($task,'253','Zip file not in manifest.');
				break;
			case 4:
				$current_task->setStatus(WPBackItUp_Job_Task::ERROR,254);
				fatal_error($task,'254','Zip file is not correct size.');
				break;
			case 5:
				$current_task->setStatus(WPBackItUp_Job_Task::ERROR,255);
				fatal_error($task,'255','Missing manifest.');
				break;
			default:
				$current_task->setStatus(WPBackItUp_Job_Task::ERROR,999);
				fatal_error($task,'999','Unexpected error code:' . $error_code);
		}

		return false;

	}
	WPBackItUp_LoggerV2::log($restore_logname,'*END VALIDATE MANIFEST*' );

	WPBackItUp_LoggerV2::log($restore_logname,'*VALIDATE SITEDATA FILE*' );
	//validate the site data file
	$site_info = $wp_restore->validate_siteinfo_file();
	if ( $site_info===false){
		$current_task->setStatus(WPBackItUp_Job_Task::ERROR,204);
		fatal_error($task,'204','Site Data file INVALID.');
		return false;
	}else{
		//save restore info to meta
		$current_job->setJobMetaValue('restore_site_info',$site_info);
	}

	//Check table prefix values FATAL - need to add link to article
	WPBackItUp_LoggerV2::log_info($restore_logname,$log_function,'Site table Prefix:' . $table_prefix);
	if ( $table_prefix != $site_info['restore_table_prefix'] ) {
		$current_task->setStatus(WPBackItUp_Job_Task::ERROR,221);
		fatal_error($task,'221','Table prefix different from restore.');
		return false;
	}

	//Check wordpress version
	if($WPBackitup->rversion_compare() === 0){
		$site_wordpress_version =  get_bloginfo('version');
		$backup_wordpress_version = $site_info['restore_wp_version'];
		WPBackItUp_LoggerV2::log_info($restore_logname,$log_function,'Site Wordpress Version:' . $site_wordpress_version);
		WPBackItUp_LoggerV2::log_info($restore_logname,$log_function,'Backup Wordpress Version:' . $backup_wordpress_version);
		if ( ! WPBackItUp_Utility::version_compare($site_wordpress_version, $backup_wordpress_version )) {
			WPBackItUp_LoggerV2::log($restore_logname,'*VALIDATE SITEDATA FILE*' );
			$current_task->setStatus(WPBackItUp_Job_Task::ERROR,226);
			fatal_error($task,'226','Backup was created using different version of wordpress');
			return false;
		}


		$restore_wpbackitup_version = $site_info['restore_wpbackitup_version'];
		$current_wpbackitup_version = WPBACKITUP__VERSION;
		WPBackItUp_LoggerV2::log_info($restore_logname,$log_function,'WPBackItUp current Version:' . $current_wpbackitup_version);
		WPBackItUp_LoggerV2::log_info($restore_logname,$log_function,'WPBackItUp backup  Version:' . $restore_wpbackitup_version);
		if (! WPBackItUp_Utility::version_compare($restore_wpbackitup_version, $current_wpbackitup_version )){
			$current_task->setStatus(WPBackItUp_Job_Task::ERROR,227);
			fatal_error($task,'227','Backup was created using different version of WPBackItUp');
			return false;
		}
	}
	WPBackItUp_LoggerV2::log($restore_logname,'*END VALIDATE SITEDATA FILE*' );


	//all SQL files will be added to the jon_item table during validation
	WPBackItUp_LoggerV2::log($restore_logname,'*VALIDATE SQL FILE EXISTS*' );
	if ( ! $wp_restore->validate_SQL_add_items( )){
		$current_task->setStatus(WPBackItUp_Job_Task::ERROR,216);
		fatal_error($task,'216','NO Database backups in backup.');
		return false;
	}
	WPBackItUp_LoggerV2::log($restore_logname,'*END VALIDATE SQL FILE EXISTS*' );
	end_status($task);

	WPBackItUp_LoggerV2::log($restore_logname,'*DEACTIVATE ACTIVE PLUGINS*');
	$task='deactivate_plugins';
	start_status($task);
	$wp_restore->deactivate_plugins();
	end_status($task);
	WPBackItUp_LoggerV2::log($restore_logname,'*END DEACTIVATE ACTIVE PLUGINS*');

	$current_task->setStatus(WPBackItUp_Job_Task::COMPLETE);
	WPBackItUp_LoggerV2::log($restore_logname,'**END VALIDATE BACKUP**' );

	return;
}


//Create the DB restore point
if ('task_create_checkpoint'==$current_task->getTaskName()) {

	WPBackItUp_LoggerV2::log($restore_logname,'**CREATE RESTORE POINT**');
	$task = 'restore_point';
	start_status($task);

// skip this step

//	if ( ! $wp_restore->export_database()){
//	$current_task->setStatus(WPBackItUp_Job_Task::ERROR,205);
//		fatal_error($task,'205','Cant backup database.');
//		return false;
//	}

	$current_task->setStatus(WPBackItUp_Job_Task::COMPLETE);;
	end_status($task);
	WPBackItUp_LoggerV2::log($restore_logname,'**END CREATE RESTORE POINT**');

	return;
}


//Stage WP content folders
if ('task_stage_wpcontent'==$current_task->getTaskName()) {

	WPBackItUp_LoggerV2::log($restore_logname,'*STAGE WP-CONTENT*');
	$task = 'stage_wpcontent';

	start_status($task);

	$folder_stage_suffix = $wp_restore->get_restore_staging_suffix();

	//Stage all but plugins

	WPBackItUp_LoggerV2::log($restore_logname,'*STAGE THEMES*');
	$from_folder_name = $wp_restore->get_restore_root_folder_path() .'/' .WPBackItUp_Restore::THEMESPATH;
	$to_folder_name = WPBACKITUP__THEMES_ROOT_PATH . $folder_stage_suffix;
	if (! $wp_restore->rename_folder($from_folder_name,$to_folder_name)){
		$current_task->setStatus(WPBackItUp_Job_Task::ERROR,219);
		fatal_error($task,'219','Cant stage themes.',false);
		$wp_restore->delete_staged_folders();
		end_restore();
		return false;
	}
	WPBackItUp_LoggerV2::log($restore_logname,'*END STAGE THEMES*');

	WPBackItUp_LoggerV2::log($restore_logname,'*STAGE UPLOADS*');
	if(! $wp_restore->validate_no_uploads()){
		$from_folder_name = $wp_restore->get_restore_root_folder_path() .'/' .WPBackItUp_Restore::UPLOADPATH;
		$upload_array = wp_upload_dir();
		$uploads_root_path = $upload_array['basedir'];
		$to_folder_name = $uploads_root_path . $folder_stage_suffix;
		if (! $wp_restore->rename_folder($from_folder_name,$to_folder_name)){
			$current_task->setStatus(WPBackItUp_Job_Task::ERROR,219);
			fatal_error($task,'219','Cant stage uploads.',false);
			$wp_restore->delete_staged_folders();
			end_restore();
			return false;
		}
	}
	WPBackItUp_LoggerV2::log($restore_logname,'*END STAGE UPLOADS*');

	WPBackItUp_LoggerV2::log($restore_logname,'*STAGE OTHER FOLDERS*');
	$other_list = glob($wp_restore->get_restore_root_folder_path() .'/' .WPBackItUp_Restore::OTHERPATH .'/*',GLOB_ONLYDIR|GLOB_NOSORT);
	foreach ( $other_list as $from_folder_name ) {
		$to_folder_name = WPBACKITUP__CONTENT_PATH .'/' .basename($from_folder_name) . $folder_stage_suffix;
		if (! $wp_restore->rename_folder($from_folder_name,$to_folder_name)) {
			$current_task->setStatus(WPBackItUp_Job_Task::ERROR,219);
			fatal_error($task,'219','Cant stage other.',false);
			$wp_restore->delete_staged_folders();
			end_restore();
			return false;
		}
	}
	WPBackItUp_LoggerV2::log($restore_logname,'*END STAGE OTHER FOLDERS*');
	end_status($task);

	$current_task->setStatus(WPBackItUp_Job_Task::COMPLETE);;

	WPBackItUp_LoggerV2::log($restore_logname,'**END STAGE WP-CONTENT**');

	return;
}


//Rename the staged folders to current
if ('task_restore_wpcontent'==$current_task->getTaskName()) {

	WPBackItUp_LoggerV2::log($restore_logname,'**RESTORE WPCONTENT**');
	$task ='restore_wpcontent';
	start_status($task);

	WPBackItUp_LoggerV2::log($restore_logname,'*RESTORE MAIN WPCONTENT*');
	$wpcontent_restore =$wp_restore->restore_wpcontent();
	if (! $wpcontent_restore===true) {
		//array with failed list returned
		//If any of them fail call it done.
		warning('300','Cant restore all WP content.');
	}
	WPBackItUp_LoggerV2::log($restore_logname,'*END RESTORE MAIN WPCONTENT*');

	WPBackItUp_LoggerV2::log($restore_logname,'*RESTORE PLUGINS*');
	$plugin_restore = $wp_restore->restore_plugins();
	if (! $plugin_restore ===true) {
		//array with fail list returned
		warning('305', 'Couldnt restore all plugins.');
	}

	WPBackItUp_LoggerV2::log($restore_logname,'*END RESTORE PLUGINS*');

	$current_task->setStatus(WPBackItUp_Job_Task::COMPLETE);;
	end_status($task);
	WPBackItUp_LoggerV2::log($restore_logname,'**END RESTORE WPCONTENT**');

	return;
}

//restore the DB
if ('task_restore_database'==$current_task->getTaskName()) {

	WPBackItUp_LoggerV2::log($restore_logname,'**RESTORE DATABASE**');
	$task ='restore_database';
	start_status($task);

	//Not going to use the restore Point SQL because IF the import failed then DB may be intact
	$tables_remaining_count =$wp_restore->restore_database($current_job);
	WPBackItUp_LoggerV2::log_info($restore_logname,$log_function,'Database Items remaining:' .var_export($tables_remaining_count,true));
	if (false===$tables_remaining_count) {
		$current_task->setStatus(WPBackItUp_Job_Task::ERROR,212);
		fatal_error($task,'212','Database NOT restored.');
		return false;
	}else{
		if ($tables_remaining_count>0){
			//CONTINUE
			WPBackItUp_LoggerV2::log_info($restore_logname,$log_function,'Continue restoring tables.');
			$current_task->setStatus(WPBackItUp_Job_Task::QUEUED);
			return;
		}else{
			//DB Restore Complete
			WPBackItUp_LoggerV2::log_info($restore_logname,$log_function,'Complete - All tables restored successfully.');
			$current_task->setStatus(WPBackItUp_Job_Task::COMPLETE);
			end_status($task);
			WPBackItUp_LoggerV2::log($restore_logname,'**END RESTORE DATABASE**');
		}
	}

	WPBackItUp_LoggerV2::log($restore_logname,'*UPDATE DATABASE VALUES*');


	/*  __ONLY OLD BACKUPS WILL DO THIS__ */

	start_status('update_user');

	end_status('update_user');

	end_status('update_site_info');

	start_status('update_permalinks');

	if (! $wp_restore->update_permalinks()){
		WPBackItUp_LoggerV2::log_error($restore_logname,$log_function,'Permalinks were not updated');
		//dont do anything
	}

	end_status('update_permalinks');

	WPBackItUp_LoggerV2::log($restore_logname,'*END UPDATE DATABASE VALUES*');


	//*************************************************************
	//
	//      NO MORE TASKS OR JOB DATA AFTER THIS POINT
	//
	//**************************************************************

	$current_job->setStatus(WPBackItUp_Job::COMPLETE);
	set_status_success();
	WPBackItUp_LoggerV2::log($restore_logname,'Restore completed successfully');
	WPBackItUp_LoggerV2::log($restore_logname,'***END RESTORE***');

	end_restore(null,true);
	return true;

}

//return back to task runner.
return;

/******************/
/*** Functions ***/
/******************/
function fatal_error($process,$error_code,$error_message, $end=true){
	global $current_job, $failure, $restore_logname;

	WPBackItUp_LoggerV2::log_error($restore_logname,__METHOD__,$error_message);
	$current_job->setStatus(WPBackItUp_Job::ERROR);

	write_response_file_error($error_code,$error_message);

	set_status($process,$failure,true);
	write_fatal_error_status('error' .$error_code);

	if (true===$end) {
		end_restore();
	}
}

function warning($error_code,$warning_message) {
	global $restore_logname, $status_array,$warning;

	WPBackItUp_LoggerV2::log_warning($restore_logname,__METHOD__, $warning_message);

	//Add warning to array
	$status_array['warning' .$error_code]=$warning;
	write_restore_status();
}

function set_status($process,$status,$flush){
	global $status_array,$complete;

	$status_array[$process]=$status;

	//Mark all the others complete and flush
	foreach ($status_array as $key => $value) {
		if ($process==$key) {
			break;
		}else{
			$status_array[$key]=$complete;
		}
	}

	if ($flush) write_restore_status();

}

//write Response Log
function write_response_file_error($error_code,$error_message) {

	$jsonResponse = new stdClass();
	$jsonResponse->restoreStatus = 'error';
	$jsonResponse->errorCode = $error_code;
	$jsonResponse->restoreMessage = $error_message;

	write_response_file($jsonResponse);
}

//write Response Log
function write_response_file_success() {

	$jsonResponse = new stdClass();
	$jsonResponse->backupStatus = 'success';
	$jsonResponse->backupMessage = 'success';

	write_response_file($jsonResponse);
}


//write Response Log
function write_response_file($JSON_Response) {
	global $restore_logname;

	$json_response = json_encode($JSON_Response);
	WPBackItUp_LoggerV2::log($restore_logname,'Write response file:' . $json_response);

	$fh=get_response_file();
	fwrite($fh, $json_response);
	fclose($fh);
}

//Get Response Log
function get_response_file() {
	global $restore_logname;

	$response_file_path = WPBACKITUP__PLUGIN_PATH .'logs/restore_response.log';
	$filesytem = new WPBackItUp_FileSystem($restore_logname);
	return $filesytem->get_file_handle($response_file_path,false);
}

function get_job_log_name($timestamp){

	$url = home_url();
	$url = str_replace('http://','',$url);
	$url = str_replace('https://','',$url);
	$url = str_replace('/','-',$url);
	$fileUTCDateTime=$timestamp;//current_time( 'timestamp' );
	$localDateTime = date_i18n('Y-m-d-His',$fileUTCDateTime);
	$job_log_name = 'Restore_' . $url .'_' .$localDateTime;

	return $job_log_name;
}

//Get Status Log
function get_restore_Log() {
	global $restore_logname;

	$status_file_path = WPBACKITUP__PLUGIN_PATH .'/logs/restore_status.log';
	$filesystem = new WPBackItUp_FileSystem($restore_logname);
	return $filesystem->get_file_handle($status_file_path);

}

function write_fatal_error_status($status_code) {
	global $status_array,$inactive,$active,$complete,$failure,$warning,$success;
	
	//Find the active status and set to failure
	foreach ($status_array as $key => $value) {
		if ($value==$active){
			$status_array[$key]=$failure;	
		}
	}

	//Add failure to array
	$status_array[$status_code]=$failure;
	write_restore_status();
}



function write_restore_status() {
	global $status_array;
	$fh=get_restore_Log();
	
	foreach ($status_array as $key => $value) {
		fwrite($fh, '<div class="' . $key . '">' . $value .'</div>');		
	}
	fclose($fh);
}

function start_status($process){
	global $wp_restore,$active;

	set_status($process,$active,true);
	$wp_restore->save_process_status($process,'started');
}

function end_status($process){
	global $wp_restore,$complete;

	set_status($process,$complete,false);
	$wp_restore->save_process_status($process,'completed');
}


function set_status_success(){
	global $status_array,$inactive,$active,$complete,$failure,$warning,$success;
	global $active;

	$status_array['finalinfo']=$success;
	write_restore_status();
}

function end_restore($err=null, $success=null){
	global $current_job, $restore_logname;

	if (true===$success) WPBackItUp_LoggerV2::log_info($restore_logname,__METHOD__,'Restore completed: SUCCESS');
	if (false===$success) WPBackItUp_LoggerV2::log_error($restore_logname,__METHOD__,'Restore completed: ERROR');

	//copy/replace WP debug file
	$logs_path = WPBACKITUP__PLUGIN_PATH .'logs';
	$wpdebug_file_path = WPBACKITUP__CONTENT_PATH . '/debug.log';
	WPBackItUp_LoggerV2::log_info($restore_logname,__METHOD__,'Copy WP Debug: ' .$wpdebug_file_path);
	if (file_exists($wpdebug_file_path)) {
		$debug_log = sprintf('%s/wpdebug_%s.log',$logs_path,$current_job->getJobId());
		copy( $wpdebug_file_path, $debug_log );
	}

	WPBackItUp_LoggerV2::log($restore_logname,'*** END RESTORE ***');


	//Close the logger
	WPBackItUp_LoggerV2::close($restore_logname);
	$current_job->release_lock();

	//response back the status file since this method will end processing
	$log = WPBACKITUP__PLUGIN_PATH .'/logs/restore_status.log';
	if(file_exists($log) ) {
		readfile($log);
	}

}
