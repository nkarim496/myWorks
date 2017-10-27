<?php if (!defined ('ABSPATH')) die('No direct access allowed');

/**
 * WP BackItUp  - Restore Class
 *
 * @package WP BackItUp
 * @author  Chris Simmons <chris.simmons@wpbackitup.com>
 * @link    http://www.wpbackitup.com
 *
 */

class WPBackItUp_Restore {

	private $log_name;

	//Public Properties
	private $backup_id;
	private $backup_name;
    private $backup_folder_path;
	private $restore_root_folder_path;
	private $restore_staging_suffix;

	const SITEDATAPATH =  'site-data';
	const PLUGINSPATH   =  'wp-content-plugins';
	const THEMESPATH    =  'wp-content-themes';
	const OTHERPATH     =  'wp-content-other';
	const UPLOADPATH   =  'wp-content-uploads';

	function __construct($log_name, $backup_name, $backup_id) {
		//global $WPBackitup;

		try {

			$this->log_name = 'debug_restore';//default log name
			if (is_object($log_name)){
				//This is for the old logger
				$this->log_name = $log_name->getLogFileName();
			} else{
				if (is_string($log_name) && isset($log_name)){
					$this->log_name = $log_name;
				}
			}

			$this->backup_name=$backup_name;
			$this->backup_folder_path = WPBACKITUP__BACKUP_PATH  .'/' .$backup_name;

            $this->restore_root_folder_path = WPBACKITUP__RESTORE_PATH;

			$this->backup_id=$backup_id;
			$this->restore_staging_suffix = '_' .$backup_id;


		} catch(Exception $e) {
			error_log($e);
			WPBackItUp_LoggerV2::log_error($this->log_name,__METHOD__,'Constructor Exception: ' .$e);
		}
   }

   function __destruct() {
   		
   }

	public function delete_restore_folder() {
		WPBackItUp_LoggerV2::log_info($this->log_name,__METHOD__,'Begin delete restore folders.' );

		//get a list of all the folders
		$item_list = glob($this->restore_root_folder_path .'/*');
		return $this->delete_folders($item_list);
	}

	public function delete_staged_folders() {
		WPBackItUp_LoggerV2::log_info($this->log_name,__METHOD__,'Begin delete staged folders.' );

		//get a list of all the staged folders
		$item_list = glob(WPBACKITUP__CONTENT_PATH .'/*'.$this->restore_staging_suffix .'*');
		return $this->delete_folders($item_list);

	}

	private function delete_folders($item_list) {
		WPBackItUp_LoggerV2::log_info($this->log_name,__METHOD__,'Begin' );

		WPBackItUp_LoggerV2::log_info($this->log_name,__METHOD__,'Folders to be deleted:' );
		WPBackItUp_LoggerV2::log($this->log_name,$item_list);

		$file_system = new WPBackItUp_FileSystem($this->log_name);
		foreach($item_list as $item) {
			if (is_dir($item)) {
				if (! $file_system->recursive_delete( $item )){
					WPBackItUp_LoggerV2::log_error($this->log_name,__METHOD__,'Folder could NOT be deleted:' . $item);
					return false;
				}
			}else{
				if (! unlink($item)){
					WPBackItUp_LoggerV2::log_error($this->log_name,__METHOD__,'File could NOT be deleted:' . $item);
					return false;
				}
			}
		}

		WPBackItUp_LoggerV2::log_info($this->log_name,__METHOD__,'End' );
		return true;
	}


	//Create an empty restore folder
	public function create_restore_root_folder() {
		WPBackItUp_LoggerV2::log_info($this->log_name,__METHOD__,'Create restore folder.' . $this->restore_root_folder_path);

		$fileSystem = new WPBackItUp_FileSystem($this->log_name);
		if( $fileSystem->create_dir($this->restore_root_folder_path)) {
			//Secure restore folder
			$fileSystem->secure_folder( $this->restore_root_folder_path);
			return true;

		} else{
			return false;
		}

	}

	//Unzip the backup to the restore folder
	function unzip_archive_file($backup_set_list){
		WPBackItUp_LoggerV2::log_info($this->log_name,__METHOD__,'Begin');

		if (! is_array($backup_set_list) || count($backup_set_list)<=0) return false;

		$backup_file_path = current($backup_set_list);
		WPBackItUp_LoggerV2::log_info($this->log_name,__METHOD__,'Begin -  Unzip Backup File:' .$backup_file_path);
		try {
			$zip = new ZipArchive;
			$res = $zip->open($backup_file_path);
			if ($res === TRUE) {
				if (true===$zip->extractTo($this->restore_root_folder_path)){
					$zip->close();
				} else {
					$zip->close();
					WPBackItUp_LoggerV2::log_error($this->log_name,__METHOD__,'Cant unzip backup:'.$backup_file_path);
					return false;
				}
			} else {
				WPBackItUp_LoggerV2::log_error($this->log_name,__METHOD__,'Cant open backup archive:'.$backup_file_path);
				return false;
			}

			WPBackItUp_LoggerV2::log_info($this->log_name,__METHOD__,'Backup file unzipped: ' .$backup_file_path);

		} catch(Exception $e) {
			WPBackItUp_LoggerV2::log_error($this->log_name,__METHOD__,'An Unexpected Error has happened: ' .$e);
			return false;
		}

		return true;
	}

	//Validate the restore folder
	function validate_restore_folder(){
		WPBackItUp_LoggerV2::log_info($this->log_name,__METHOD__,'Begin');

		$restore_folder_root=$this->restore_root_folder_path . '/';
		WPBackItUp_LoggerV2::log_info($this->log_name,__METHOD__,'Validate restore folder : ' .$restore_folder_root);


		//Do we have at least 4 folders - other may sometimes not be there
		if ( count( glob( $restore_folder_root.'*', GLOB_ONLYDIR ) ) < 4 ) {
			WPBackItUp_LoggerV2::log_error($this->log_name,__METHOD__,'Restore directory INVALID: ' .$restore_folder_root);
			return false;
		}


		$site_data_folder = $restore_folder_root .self::SITEDATAPATH;
		if(!is_dir($site_data_folder) ){
			WPBackItUp_LoggerV2::log_error($this->log_name,__METHOD__,'site-data missing from restore folder:' .$site_data_folder);
			return false;
		}

		$plugins_folder = $restore_folder_root .self::PLUGINSPATH;
		if(!is_dir($plugins_folder) ){
			WPBackItUp_LoggerV2::log_error($this->log_name,__METHOD__,'wp-content-plugins missing from restore folder:' .$plugins_folder);
			return false;
		}

		$themes_folder = $restore_folder_root .self::THEMESPATH;
		if(!is_dir($themes_folder) ){
			WPBackItUp_LoggerV2::log_error($this->log_name,__METHOD__,'wp-content-themes missing from restore folder:' .$themes_folder);
			return false;
		}

		//Not an error
		$other_folder = $restore_folder_root .self::OTHERPATH;
		if(!is_dir($other_folder) ){
			WPBackItUp_LoggerV2::log_info($this->log_name,__METHOD__,'wp-content-other missing from restore folder:' .$other_folder);
		}

		$uploads_folder = $restore_folder_root .self::UPLOADPATH;
		if(!is_dir($uploads_folder) && !$this->validate_no_uploads()){
			WPBackItUp_LoggerV2::log_error($this->log_name,__METHOD__,'wp-content-uploads missing from restore folder:' .$uploads_folder);
			return false;
		}

		WPBackItUp_LoggerV2::log_info($this->log_name,__METHOD__,'End - Restoration directory validated: ' .$restore_folder_root);
		return true;
	}

	//Validate the restore folder
	function validate_siteinfo_file(){
		WPBackItUp_LoggerV2::log_info($this->log_name,__METHOD__,'Begin');

		$site_info_path = $this->restore_root_folder_path . '/' .self::SITEDATAPATH .'/backupsiteinfo.txt';
		WPBackItUp_LoggerV2::log_info($this->log_name,__METHOD__,'Validate Site info file: ' . $site_info_path);
		if(! file_exists($site_info_path) || empty($site_info_path)) {
			WPBackItUp_LoggerV2::log_error($this->log_name,__METHOD__,'backupsiteinfo.txt missing or empty ' .$site_info_path);
			return false;
		}


		//Get file values
		WPBackItUp_LoggerV2::log_info($this->log_name,__METHOD__,'GET Site Info data' );
		$import_siteinfo_lines = file( $site_info_path);
		if (!is_array($import_siteinfo_lines) || count($import_siteinfo_lines)<3){
			WPBackItUp_LoggerV2::log_error($this->log_name,__METHOD__,'Site Data file NOT valid.' );
			return false;
		} else {
			$restore_siteurl                = str_replace( "\n", '', trim( $import_siteinfo_lines[0] ) );
			$restore_table_prefix           = str_replace( "\n", '', $import_siteinfo_lines[1] );
			$restore_wp_version             = str_replace( "\n", '', $import_siteinfo_lines[2] );
			$restore_wpbackitup_version     = str_replace( "\n", '', $import_siteinfo_lines[3] );

			$site_data = array (
				'restore_siteurl'=>$restore_siteurl,
				'restore_table_prefix'=>$restore_table_prefix,
				'restore_wp_version'=>$restore_wp_version,
				'restore_wpbackitup_version'=>$restore_wpbackitup_version,
			);

			WPBackItUp_LoggerV2::log_info($this->log_name,__METHOD__,'Site Data:' );
			WPBackItUp_LoggerV2::log($this->log_name,$site_data);
			return $site_data;
		}

	}

	//Validate the manifest
	function validate_manifest_file($backup_set_list, &$error_code){
		WPBackItUp_LoggerV2::log_info($this->log_name,__METHOD__,'Begin');

		$manifest_file_path = $this->restore_root_folder_path . '/' .self::SITEDATAPATH .'/backupmanifest.txt';
		WPBackItUp_LoggerV2::log_info($this->log_name,__METHOD__,'Validate backup manifest: ' . $manifest_file_path);

		//if file missing
		if(! file_exists($manifest_file_path)) {
			WPBackItUp_LoggerV2::log_info($this->log_name,__METHOD__,'No manifest found.');
			$error_code=5;
			return false;
		}

		//empty manifest
		$manifest_data_string = file_get_contents($manifest_file_path);
		if (false===$manifest_data_string || empty($manifest_data_string)){
			WPBackItUp_LoggerV2::log_error($this->log_name,__METHOD__,'Manifest empty.');
			$error_code=1;
			return false;
		}

		// make sure all the files in the manifest are part of the set
		$manifest_data_array = json_decode($manifest_data_string,true);

		//if there are less files in the folder than in the manifest
		if (count($backup_set_list) < count($manifest_data_array) )
		{
			WPBackItUp_LoggerV2::log_error($this->log_name,__METHOD__,'Zip File Missing');
			$error_code=2;
			return false;

		}

		//if there are more files in the folder than in the manifest
		if (count($backup_set_list) > count($manifest_data_array) )
		{
			WPBackItUp_LoggerV2::log_error($this->log_name,__METHOD__,'Extra Zip File.');
			$error_code=3;
			return false;
		}

		//loop through each file in folder
		foreach($backup_set_list as $zip_file){
			$file_name = basename($zip_file);

			//is file in manifest
			if (array_key_exists($file_name,$manifest_data_array)){
				$real_file_size = filesize($zip_file);
				$manifest_file_size = $manifest_data_array[$file_name];
				if ($real_file_size!=$manifest_file_size){

					//is this the main zip then size will be a little bigger because the manifest is added after the size is checked
					if ( strrpos( $file_name, '-main-' ) !== false ){
						if ($real_file_size<$manifest_file_size) {
							$error_code=4;
							WPBackItUp_LoggerV2::log_error($this->log_name,__METHOD__,'Size doesnt match manifest' .$zip_file);
							return false;
						}
					} else {
						$error_code=4;
						WPBackItUp_LoggerV2::log_error($this->log_name,__METHOD__,'Size doesnt match manifest' .$zip_file);
						return false;
					}
				}
			}else if (false===$this->search_array($file_name, $manifest_data_array)){
				$error_code=3;
				WPBackItUp_LoggerV2::log_error($this->log_name,__METHOD__,'Zip File NOT in manifest:' .$zip_file);
				return false;
			}
		}

		WPBackItUp_LoggerV2::log_info($this->log_name,__METHOD__,'End' );
		return true;

	}

	// validate if no uploads
	function validate_no_uploads(){
		WPBackItUp_LoggerV2::log_info($this->log_name,__METHOD__,'Begin');

		$manifest_file_path = $this->restore_root_folder_path . '/' .self::SITEDATAPATH .'/backupmanifest.txt';
		$manifest_data_string = file_get_contents($manifest_file_path);
		$manifest_data_array = json_decode($manifest_data_string,true);
		foreach($manifest_data_array as $filename=>$filesize){
			if ( strrpos( $filename, '-uploads-' ) !== false ){
				WPBackItUp_LoggerV2::log_info($this->log_name, __METHOD__, 'uploads folder exists');
				return false; 
			}
		}
		WPBackItUp_LoggerV2::log_info($this->log_name, __METHOD__, 'uploads folder NOT in Manifest');
		WPBackItUp_LoggerV2::log_info($this->log_name,__METHOD__,'End' );
		return true;

	}

	private function search_array($search, $array)
	{
		foreach($array as $key => $value)
		{
			if (stristr($value, $search))
			{
				return $key;
			}
		}
		return false;
	}

	//Make sure there IS a backup to restore
	function validate_SQL_add_items(){
		global $table_prefix;
		WPBackItUp_LoggerV2::log_info($this->log_name,__METHOD__,'Begin');

		//fetch the sql files
		$sql_files = array_filter(glob($this->restore_root_folder_path . '/' .self::SITEDATAPATH . '/*.sql'), 'is_file');
		WPBackItUp_LoggerV2::log_info($this->log_name,__METHOD__,'SQL files found:'. var_export($sql_files,true));


		// Exclude wp backitup job tables from backup
		$exclude_table_list = WPBackItUp_DataAccess::get_excluded_jobs_tables();

		$sql_exists=false;
		$sql='';
		$options_files = array();
		foreach ($sql_files as $sql_file){
			$sql_file_name=basename($sql_file);

			//check the sql file name to make sure the exclude table does not appear in it
			foreach($exclude_table_list  as $exclude_table_name) {
				$pos = strpos($sql_file_name,$exclude_table_name);
				if ($pos!==false) { //found
					WPBackItUp_LoggerV2::log_info($this->log_name,__METHOD__, sprintf('EXCLUDE table:%s',$sql_file_name));
					continue 2; //break out to the second for
				};
			}

			//Save these for last
			if (false===strpos($sql_file_name, '_options-')) {
				$file_size = ceil( filesize( $sql_file ) / 1024 );//round up
				$sql .= "(" . $this->backup_id . ", '" . WPBackItUp_Job_Item::DATABASE . "', '" . $sql_file_name . "', " . $file_size . ",'" . current_time( 'mysql' ) . "' ),";
				$sql_exists = true;
				WPBackItUp_LoggerV2::log_info( $this->log_name, __METHOD__, 'SQL File:' . var_export( $sql_file, true ) );
			} else{
				$options_files[] = $sql_file;
			}
		}

		//add option files to bottom
		foreach ($options_files as $option_file){
			$sql_file_name=basename($option_file);
			$file_size = ceil( filesize( $option_file ) / 1024 );//round up
			$sql .= "(" . $this->backup_id . ", '" . WPBackItUp_Job_Item::DATABASE . "', '" . $sql_file_name . "', " . $file_size . ",'" . current_time( 'mysql' ) . "' ),";
			WPBackItUp_LoggerV2::log_info( $this->log_name, __METHOD__, 'SQL File:' . var_export( $option_file, true ) );
		}


		//write to job_item table for restore
		if ($sql_exists) {
			$db = new WPBackItUp_DataAccess();
			if (! $db->insert_job_items($sql)) {
				return false;
			}
		}

		WPBackItUp_LoggerV2::log_info($this->log_name,__METHOD__,'Database backup files exist:' .$sql_exists?'true':'false');
		return $sql_exists;
	}

	public function export_database(){
		WPBackItUp_LoggerV2::log_info($this->log_name,__METHOD__,'Begin');

		$date = date_i18n('Y-m-d-Hi',current_time( 'timestamp' ));
		$backup_file = $this->backup_folder_path .'/'. 'db-backup-' . $date .'.cur';

		$sqlUtil = new WPBackItUp_SQL($this->log_name);
		WPBackItUp_LoggerV2::log_info($this->log_name,__METHOD__,'Begin - Export Database: ' .$backup_file);

		//Try SQLDump First
		WPBackItUp_LoggerV2::log_info($this->log_name,__METHOD__,'Export DB with MYSQLDUMP');
		if(!$sqlUtil->mysqldump_export($backup_file) ) {

			WPBackItUp_LoggerV2::log_info($this->log_name,__METHOD__,'Export DB with MYSQLDUMP/PATH');
			if(!$sqlUtil->mysqldump_export($backup_file,true) ) {

				WPBackItUp_LoggerV2::log_info($this->log_name,__METHOD__,'Export DB with Manual SQL EXPORT');
				if(!$sqlUtil->manual_export($backup_file) ) {
					WPBackItUp_LoggerV2::log_error($this->log_name,__METHOD__,'SQL EXPORT FAILED');
					return false;
				}
			}
		}
		WPBackItUp_LoggerV2::log_info($this->log_name,__METHOD__,'Database Exported successfully');

		return true;
	}


	public function rename_folder($from_folder_name,$to_folder_name){
		WPBackItUp_LoggerV2::log_info($this->log_name,__METHOD__,'Begin');
		WPBackItUp_LoggerV2::log_info($this->log_name,__METHOD__,'Rename from folder name:' . $from_folder_name);
		WPBackItUp_LoggerV2::log_info($this->log_name,__METHOD__,'Rename to folder name: '. $to_folder_name);

		$file_system = new WPBackItUp_FileSystem($this->log_name);
		if ( !$file_system->rename_file($from_folder_name,$to_folder_name)) {
			WPBackItUp_LoggerV2::log_error($this->log_name,__METHOD__,'Folder could not be renamed');
			return false;
		}

		WPBackItUp_LoggerV2::log_info($this->log_name,__METHOD__,'End');

		return true;
	}

	// Restore everything but plugins
	public function restore_wpcontent(){
		WPBackItUp_LoggerV2::log_info($this->log_name,__METHOD__,'Begin');
		$error_folders = array();
		$error_files = array();

		//Create the archive folder
		$archive_folder = $this->restore_root_folder_path .'/Archive'.$this->restore_staging_suffix;
		if (! is_dir($archive_folder)){
			mkdir($archive_folder);
		}

		//Get all staged directories and rename them
		//Plugins, backup & restore folders wereent staged
		$wpcontent_folder_list = glob(WPBACKITUP__CONTENT_PATH .'/*'.$this->restore_staging_suffix ,GLOB_ONLYDIR);
		foreach ( $wpcontent_folder_list as $from_folder_name ) {

			$folder_name_only = basename( $from_folder_name );
			WPBackItUp_LoggerV2::log_info($this->log_name,__METHOD__,'Folder name:' . $folder_name_only);

			$to_folder_name = WPBACKITUP__CONTENT_PATH . '/' . str_replace( $this->restore_staging_suffix, '', $folder_name_only );

			//rename the existing folder to OLD if exists
			$archive_success=true;
			if (is_dir($to_folder_name)){
				//try to rename it 5 times
				$archive_folder_name = $archive_folder .'/' .str_replace( $this->restore_staging_suffix, '', $folder_name_only );
				for ($i = 1; $i <= 5; $i++) {
					WPBackItUp_LoggerV2::log_info($this->log_name,__METHOD__,'Archive attempt:' . $i);
					if ( $this->rename_folder($to_folder_name,$archive_folder_name)) {
						$archive_success=true;
						break; // break out if rename successful
					}else{
						$archive_success=false;
						sleep(1); //give it a second
					}
				}
			}

			$rename_success=false;
			//Rename the staged folder
			if ($archive_success) {
				for ($i = 1; $i <= 5; $i++) {
					WPBackItUp_LoggerV2::log_info($this->log_name,__METHOD__,'Restore attempt:' . $i);
					if (  $this->rename_folder( $from_folder_name, $to_folder_name ) ) {
						$rename_success=true;
						break; // break out if rename successful
					}else{
						$rename_success=false;
						sleep(1); //give it a second
					}
				}
			}

			//keep going on failure
			if (! $rename_success){
				array_push($error_folders,$from_folder_name);
				WPBackItUp_LoggerV2::log_error($this->log_name,__METHOD__,'Cant restore folder.' .$from_folder_name );
			}
		}


		if ( is_array($error_folders) && count($error_folders)>0){
			WPBackItUp_LoggerV2::log_error($this->log_name,__METHOD__,'End - Error Folders:');
			WPBackItUp_LoggerV2::log($this->log_name,$error_folders);
			return $error_folders;
		}

		WPBackItUp_LoggerV2::log_info($this->log_name,__METHOD__,'End Restont WPContent Folders- No errors');

		//NOW restore the files
		$wpcontent_files_only = array_filter(glob($this->restore_root_folder_path .'/' .self::OTHERPATH .'/*'), 'is_file');
		foreach ( $wpcontent_files_only as $from_file_name ) {
			$file_name_only = basename( $from_file_name );

			WPBackItUp_LoggerV2::log_info($this->log_name,__METHOD__,'WPContent File name:' . $file_name_only);

			//Archive the old file
			$to_file_name = WPBACKITUP__CONTENT_PATH .'/' . $file_name_only;
			$archive_success=true;
			if (file_exists($to_file_name)){

				//try to rename it 5 times
				$archive_file_name = $archive_folder .'/' . $file_name_only;
				for ($i = 1; $i <= 5; $i++) {
					WPBackItUp_LoggerV2::log_info($this->log_name,__METHOD__,'Archive attempt:' . $i);
					if ( $this->rename_folder($to_file_name,$archive_file_name)) {
						$archive_success=true;
						break; // break out if rename successful
					}else{
						$archive_success=false;
						sleep(1); //give it a second
					}
				}
			}

			$rename_success=false;
			if ($archive_success){
				//Restore the file
				for ($i = 1; $i <= 5; $i++) {
					WPBackItUp_LoggerV2::log_info($this->log_name,__METHOD__,'Restore attempt:' . $i);
					if (  $this->rename_folder( $from_file_name, $to_file_name ) ) {
						$rename_success=true;
						break; // break out if rename successful
					}else{
						$rename_success=false;
						sleep(1); //give it a second
					}
				}

			}

			//keep going on failure but add file to list
			if (!$rename_success){
				array_push($error_files,$from_folder_name);
				WPBackItUp_LoggerV2::log_error($this->log_name,__METHOD__,'Cant restore file.' .$from_file_name );

			}
		}


		if ( is_array($error_files) && count($error_files)>0) {
			WPBackItUp_LoggerV2::log_error($this->log_name,__METHOD__,'End - Error Files:');
			WPBackItUp_LoggerV2::log($this->log_name,$error_files);
			return $error_folders;
		} else{
			WPBackItUp_LoggerV2::log_info($this->log_name,__METHOD__,'End Restore WPContent - No errors');
			return true;
		}

	}

	public function restore_plugins(){
		WPBackItUp_LoggerV2::log_info($this->log_name,__METHOD__,'Begin');
		$error_folders = array();
		$error_files = array();

		//Create the archive folder if it doesnt exist
		$archive_folder = $this->restore_root_folder_path .'/Archive'.$this->restore_staging_suffix;
		if (! is_dir($archive_folder)){
			mkdir($archive_folder);
		}

		//Create the plugins archive
		$plugin_archive_folder = $archive_folder .'/' . basename(WPBACKITUP__PLUGINS_ROOT_PATH);
		if (! is_dir($plugin_archive_folder)){
			 mkdir($plugin_archive_folder);
		}


		//Move the folders ONLY
		$plugins_folder_list = glob($this->restore_root_folder_path .'/' .self::PLUGINSPATH .'/*' ,GLOB_ONLYDIR);
		foreach ( $plugins_folder_list as $from_folder_name ) {
			$folder_name_only = basename( $from_folder_name );

			//Dont restore wp backitup plugin
			WPBackItUp_LoggerV2::log_info($this->log_name,__METHOD__,'Plugin Folder name:' . $folder_name_only);
			if ( $folder_name_only != WPBACKITUP__PLUGIN_FOLDER) {

				//Archive the old plugin
				$to_folder_name = WPBACKITUP__PLUGINS_ROOT_PATH .'/' . $folder_name_only;
				$archive_success=true;
				if (is_dir($to_folder_name)){

					//try to rename it 5 times
					$archive_folder_name = $plugin_archive_folder .'/' . $folder_name_only;
					for ($i = 1; $i <= 5; $i++) {
						WPBackItUp_LoggerV2::log_info($this->log_name,__METHOD__,'Archive attempt:' . $i);
						if ( $this->rename_folder($to_folder_name,$archive_folder_name)) {
							$archive_success=true;
							break; // break out if rename successful
						}else{
							$archive_success=false;
							sleep(1); //give it a second
						}
					}
				}

				$rename_success=false;
				if ($archive_success){
					//Restore the plugin
					for ($i = 1; $i <= 5; $i++) {
						WPBackItUp_LoggerV2::log_info($this->log_name,__METHOD__,'Restore attempt:' . $i);
						if (  $this->rename_folder( $from_folder_name, $to_folder_name ) ) {
							$rename_success=true;
							break; // break out if rename successful
						}else{
							$rename_success=false;
							sleep(1); //give it a second
						}
					}

				}

				//keep going on failure but add folder to list
				if (!$rename_success){
					array_push($error_folders,$from_folder_name);
					WPBackItUp_LoggerV2::log_error($this->log_name,__METHOD__,'Cant restore plugin folder.' .$from_folder_name );
				}
			}
		}


		//If error on folders then return
		if (is_array($error_folders) && count($error_folders)>0){
			WPBackItUp_LoggerV2::log_error($this->log_name,__METHOD__,'End - Error Folders:');
			WPBackItUp_LoggerV2::log($this->log_name,$error_folders);
			return $error_folders;
		}
		WPBackItUp_LoggerV2::log_info($this->log_name,__METHOD__,'End restore plugin folders.');


		//NOW move the files
		$plugins_files_only = array_filter(glob($this->restore_root_folder_path .'/' .self::PLUGINSPATH .'/*'), 'is_file');
		foreach ( $plugins_files_only as $from_file_name ) {
			$file_name_only = basename( $from_file_name );

			WPBackItUp_LoggerV2::log_info($this->log_name,__METHOD__,'Plugin File name:' . $file_name_only);

			//Archive the old file
			$to_file_name = WPBACKITUP__PLUGINS_ROOT_PATH .'/' . $file_name_only;
			$archive_success=true;
			if (file_exists($to_file_name)){

				//try to rename it 5 times
				$archive_file_name = $plugin_archive_folder .'/' . $file_name_only;
				for ($i = 1; $i <= 5; $i++) {
					WPBackItUp_LoggerV2::log_info($this->log_name,__METHOD__,'Archive attempt:' . $i);
					if ( $this->rename_folder($to_file_name,$archive_file_name)) {
						$archive_success=true;
						break; // break out if rename successful
					}else{
						$archive_success=false;
						sleep(1); //give it a second
					}
				}
			}

			$rename_success=false;
			if ($archive_success){
				//Restore the plugin
				for ($i = 1; $i <= 5; $i++) {
					WPBackItUp_LoggerV2::log_info($this->log_name,__METHOD__,'Restore attempt:' . $i);
					if (  $this->rename_folder( $from_file_name, $to_file_name ) ) {
						$rename_success=true;
						break; // break out if rename successful
					}else{
						$rename_success=false;
						sleep(1); //give it a second
					}
				}

			}

			//keep going on failure but add file to list
			if (!$rename_success){
				array_push($error_files,$from_folder_name);
				WPBackItUp_LoggerV2::log_error($this->log_name,__METHOD__,'Cant restore plugin file.' .$from_file_name );

			}
		}


		if (is_array($error_files) && count($error_files)>0) {
			WPBackItUp_LoggerV2::log_error($this->log_name,__METHOD__,'End - Error Files:');
			WPBackItUp_LoggerV2::log($this->log_name,$error_files);
			return $error_folders;
		} else{
			WPBackItUp_LoggerV2::log_info($this->log_name,__METHOD__,'End Restore Plugins - No errors');
			return true;
		}


	}


	/**
	 * Restore database using item list
	 *
	 * @param $current_job
	 *
	 * @return bool|mixed
	 */
	public function restore_database($current_job) {
		WPBackItUp_LoggerV2::log_info( $this->log_name, __METHOD__, 'Begin -  restore database.' );

		//Get one item at a time because batch is split on inventory
		$job_id = $current_job->getJobId();
		$items  = WPBackItUp_Job_Item::get_item_batch_by_group( $job_id, 1, WPBackItUp_Job_Item::DATABASE );
		if ( false === $items || !is_array($items)) {
			return false;
		}

		//process the SQL file
		$item = current( $items );
		$sql_file_name = $item->getItem();
		$sql_file_path = $this->restore_root_folder_path . '/' . self::SITEDATAPATH . '/' . $sql_file_name;
		WPBackItUp_LoggerV2::log_info( $this->log_name, __METHOD__, 'Process SQL File:' . $sql_file_path );

		//run the import
		$run_import = $this->run_sql_from_file( $sql_file_path );
		if (false===$run_import){
			$item->setStatus(WPBackItUp_Job_Item::ERROR);
			WPBackItUp_LoggerV2::log_error($this->log_name,__METHOD__,'Import Error.');
			return false;
		}

		//mark item complete
		$item->setStatus(WPBackItUp_Job_Item::COMPLETE);

		//get count of remaining items
		$remaining_count = WPBackItUp_Job_Item::get_open_item_count($job_id,WPBackItUp_Job_Item::DATABASE);


		// 0==$remaining_count means the last import was completed
		// this could be an old backup where all data is in one SQL file


		// Options need to be updated/created only once because there is a unique index on option_name
		// This will prevent wpbackitup options from being inserted IF they are present in a file other than 0.sql
		if (false!==strpos($sql_file_name, '_options-') || 0==$remaining_count){

			//dispatch background processor - was deleted when options table replaced
			WPBackItUp_LoggerV2::log_info( $this->log_name, __METHOD__, 'Dispatch Background Process:'.$current_job->getJobName() );
			$background_processor  = new WPBackItUp_Task_Processor();
			$background_processor->push_to_queue( $current_job->getJobName());
			$background_processor->save()->dispatch();

			$stashed_wpbackitup_options = $current_job->getJobMetaValue('wpbackitup_options');
			if (!empty($stashed_wpbackitup_options) && true===$this->update_create_options($stashed_wpbackitup_options)){
				WPBackItUp_LoggerV2::log_info( $this->log_name, __METHOD__, 'WPBackItUp Options Updated' );
				$current_job->setJobMetaValue('wpbackitup_options',null);
			}

			$stashed_siteurl = $current_job->getJobMetaValue('current_siteurl');
			if (!empty($stashed_siteurl) && true===$this->update_siteurl_option($stashed_siteurl)){
				WPBackItUp_LoggerV2::log_info( $this->log_name, __METHOD__, 'Site URL Updated' );
				$current_job->setJobMetaValue('current_siteurl',null);
			}

			$stashed_homeurl = $current_job->getJobMetaValue('current_homeurl');
			if (!empty($stashed_homeurl) && $this->update_homeurl_option($stashed_homeurl)){
				WPBackItUp_LoggerV2::log_info( $this->log_name, __METHOD__, 'HomeURL Updated' );
				$current_job->setJobMetaValue('current_homeurl',null);
			}

		}


		//user table found so update current user
		//This needs to happen on every pass
		if (false!==strpos($sql_file_name, '_users-')  || 0 == $remaining_count) {

			//get the stashed user
			$stashed_user = $current_job->getJobMetaValue( 'current_user' );
			if ( ! empty( $stashed_user ) ) {

				//Create or update the current user
				// - current user may not exist after import so update or create profile
				//Need to do this on every pass then cleanup at the end of the run
				if (! $this->update_create_user($stashed_user)){
					WPBackItUp_LoggerV2::log_error( $this->log_name, __METHOD__, 'User could not be updated.' );
				}

				//Get current user & update meta with stashed meta
				$current_user=$this->get_user_by_login($stashed_user->user_login);
				//User ID will almost always change so authenticate
				wp_set_current_user( $current_user->ID, $current_user->user_login );
				wp_set_auth_cookie( $current_user->ID );

			}


		}

		//usermeta table found so update current user meta
		//This needs to happen on every pass
		if (false!==strpos($sql_file_name, '_usermeta-')  || 0 == $remaining_count) {

			//get the stashed user
			$stashed_user = $current_job->getJobMetaValue( 'current_user' );
			if ( ! empty( $stashed_user ) ) {

				//Get current user & update meta with stashed meta
				$current_user=$this->get_user_by_login($stashed_user->user_login);
				if (! empty($current_user)){
					//update meta
					$stashed_usermeta=$current_job->getJobMetaValue('current_user_meta');
					if (! $this->update_create_usermeta($current_user->ID,$stashed_usermeta)){
						WPBackItUp_LoggerV2::log_error( $this->log_name, __METHOD__, 'One or more meta values were not updated.' );
					}
				}

				//User ID will almost always change so authenticate
				wp_set_current_user( $current_user->ID, $current_user->user_login );
				wp_set_auth_cookie( $current_user->ID );

			}


		}

		//There are NO MORE files to import
		if ( 0 == $remaining_count) {
			//cleanup duplicate user accounts
			//get current user
			$current_user = wp_get_current_user();
			if ( ! $this->delete_duplicate_users( $current_user->ID, $current_user->user_login ) ) {
				WPBackItUp_LoggerV2::log_error( $this->log_name, __METHOD__, 'Error removing duplicate profiles' );
			}

			//remove old job table
			$this->drop_job_table();
		}


		WPBackItUp_LoggerV2::log_info( $this->log_name, __METHOD__, 'End WPBackItUp Database Export' );

		return $remaining_count; //return count;

	}

	/**
	 * Save Database tasks to file
	 *  - this is necessary because the post and post meta table will be restored and job information will be lost.
	 *
	 * @return bool
	 */
	public function save_database_tasks_to_file($external_id,$site_info){
		WPBackItUp_LoggerV2::log_info($this->log_name,__METHOD__,'Begin -  restore database.');

		//fetch the sql files
		$restore_path = $this->restore_root_folder_path . '/' .self::SITEDATAPATH . '/';
		$sql_files = array_filter(glob($restore_path . '*.sql'), 'is_file');
		WPBackItUp_LoggerV2::log_info($this->log_name,__METHOD__,'SQL files found:'. var_export($sql_files,true));

		$response_array=array();
		$response_array['site_info']=$site_info;
		$response_array['backup_files'] = $sql_files;

		$json_response = json_encode($response_array,true);
		$db_tasks_file= sprintf('%s/restore_database_%s.tasks',$restore_path,$external_id);
		return file_put_contents($db_tasks_file,$json_response);

	}

	private function run_sql_from_file($sql_file_path){
		WPBackItUp_LoggerV2::log_info($this->log_name,__METHOD__,'Begin - SQL: '. $sql_file_path);

		$dbc = new WPBackItUp_SQL($this->log_name);
		if(!$dbc->run_sql_exec($sql_file_path)) {
			//try with sql path on this time
			if(!$dbc->run_sql_exec($sql_file_path,true)) {
				//Try manually
				if ( ! $dbc->run_sql_manual( $sql_file_path ) ) {
					WPBackItUp_LoggerV2::log_error($this->log_name,__METHOD__,'Database import error.' );
					return false;
				}
			}
		}

		WPBackItUp_LoggerV2::log_info($this->log_name,__METHOD__,'End');
		return true;
	}

	public function activate_plugins(){
		WPBackItUp_LoggerV2::log_info($this->log_name,__METHOD__,'Begin');

		$plugins = get_plugins();
		foreach ( $plugins as $plugin => $value ) {
			//Activate plugin if NOT already active
			if (! is_plugin_active($plugin) ) {
				$result = activate_plugin($plugin);
				if ( is_wp_error( $result ) ) {
					WPBackItUp_LoggerV2::log_error($this->log_name,__METHOD__,'Plugin could NOT be activated:' .$plugin);
				} else{
					WPBackItUp_LoggerV2::log_info($this->log_name,__METHOD__,'Plugin activated:' .$plugin);
				}
			}
		}

		WPBackItUp_LoggerV2::log_info($this->log_name,__METHOD__,'End');
		return true;
	}

	public function deactivate_plugins(){
		WPBackItUp_LoggerV2::log_info($this->log_name,__METHOD__,'Begin');

		$plugins = get_option('active_plugins');
		foreach ($plugins as $plugin) {
			//dont deactivate wp-backitup
			if ('wp-backitup/wp-backitup.php' != $plugin){
				deactivate_plugins($plugin);
				WPBackItUp_LoggerV2::log_info($this->log_name,__METHOD__,'Plugin Deactivated:' . $plugin);
			}
		}

		WPBackItUp_LoggerV2::log_info($this->log_name,__METHOD__,'End');
	}

	//get siteurl
	public function get_siteurl(){
		WPBackItUp_LoggerV2::log_info($this->log_name,__METHOD__,'Begin');

		$db = new WPBackItUp_DataAccess();
		$siteurl = $db->get_option_value('siteurl');
		if (empty($siteurl)) {
			WPBackItUp_LoggerV2::log_error($this->log_name,__METHOD__,'Siteurl not found');
			return false;
		}

		WPBackItUp_LoggerV2::log_info($this->log_name,__METHOD__,'End - Siteurl found:' .$siteurl);
		return $siteurl;
	}

	//get homeurl
	function get_homeurl(){
		global $table_prefix;
		WPBackItUp_LoggerV2::log_info($this->log_name,__METHOD__,'Begin');

		$db = new WPBackItUp_DataAccess();
		$homeurl = $db->get_option_value('home');

		if (empty($homeurl)) {
			WPBackItUp_LoggerV2::log_error($this->log_name,__METHOD__,'Homeurl not found.');
			return false;
		}
		WPBackItUp_LoggerV2::log_info($this->log_name,__METHOD__,'End - homeurl found:' . $homeurl);
		return $homeurl;
	}


	/**
	 * Delete all users but the current user
	 *
	 * @return bool
	 */
	public function delete_users_except_current( ) {
		WPBackItUp_LoggerV2::log_info($this->log_name,__METHOD__,'Begin');
		$current_user = wp_get_current_user();

		$db= new WPBackItUp_DataAccess();
		$users_deleted = $db->delete_users_except($current_user->ID);
		if (false===$users_deleted){
			WPBackItUp_LoggerV2::log_error($this->log_name,__METHOD__,'Delete user error');
			return false;
		}
		WPBackItUp_LoggerV2::log_info($this->log_name,__METHOD__,'users deleted: '.$users_deleted);

		//return number of users remaining
		return $db->get_user_count();
	}

	/**
	 * Delete all usermeta but the current user
	 *
	 * @return bool
	 */
	public function delete_usermeta_except_current( ) {
		WPBackItUp_LoggerV2::log_info($this->log_name,__METHOD__,'Begin');
		$current_user = wp_get_current_user();

		$db= new WPBackItUp_DataAccess();
		$usermeta_deleted = $db->delete_usermeta_except($current_user->ID);
		if (false===$usermeta_deleted){
			WPBackItUp_LoggerV2::log_error($this->log_name,__METHOD__,'Delete usermeta error');
			return false;
		}
		WPBackItUp_LoggerV2::log_info($this->log_name,__METHOD__,'usermeta deleted: '.$usermeta_deleted);

		//return number of users remaining
		return $db->get_usermeta_count();
	}

	function get_options_wpbackitup(){
		$db= new WPBackItUp_DataAccess();
		return $db->get_options_wpbackitup();
	}

	function update_create_options($options){
		WPBackItUp_LoggerV2::log_info($this->log_name,__METHOD__,'Begin');

		if (!is_array($options)) return false;

		$rtn_val=true;
		$db = new WPBackItUp_DataAccess();

		foreach($options as $option){

			if ($db->update_create_option($option->option_name,$option->option_value,$option->autoload)){
				WPBackItUp_LoggerV2::log_info($this->log_name,__METHOD__,'Option updated in database:' .$option->option_name);
			}else{
				$rtn_val=false;
				WPBackItUp_LoggerV2::log_error($this->log_name,__METHOD__,'Option NOT updated in database:' .$option->option_name);
			}
		}

		return $rtn_val;
	}

	function get_current_user(){
		$current_user = wp_get_current_user();
		return $this->get_user_by_login($current_user->user_login);

	}

	function get_user_by_login($user_login){
		$db= new WPBackItUp_DataAccess();
		return $db->get_user_by_login($user_login);
	}

	function get_current_user_meta(){
		$current_user = wp_get_current_user();
		$db= new WPBackItUp_DataAccess();

		return $db->get_usermeta_by_id($current_user->ID);
	}


	/**
	 * Update site URL in option table
	 *
	 * @param $siteurl_value
	 *
	 * @return bool
	 */
	function update_siteurl_option($siteurl_value){
		WPBackItUp_LoggerV2::log_info($this->log_name,__METHOD__,'Begin');

		$db= new WPBackItUp_DataAccess();
			if (true===$db->update_create_option('siteurl',$siteurl_value,'yes')){
			WPBackItUp_LoggerV2::log_info($this->log_name,__METHOD__,'SiteURL updated in database:' .$siteurl_value);
			return true;
		}

		WPBackItUp_LoggerV2::log_error($this->log_name,__METHOD__,'Error: SiteURL updated failed.');
		return false;
	}


	/**
	 * Update home URL  in options table
	 *
	 * @param $homeurl_value
	 *
	 * @return bool
	 */
	function update_homeurl_option($homeurl_value){
		WPBackItUp_LoggerV2::log_info($this->log_name,__METHOD__,'Begin');

		$db= new WPBackItUp_DataAccess();
		if (true===$db->update_create_option('home',$homeurl_value,'yes')){
			WPBackItUp_LoggerV2::log_info($this->log_name,__METHOD__,'HomeURL updated in database:'.$homeurl_value);
			return true;
		}
		WPBackItUp_LoggerV2::log_error($this->log_name,__METHOD__,'HomeURL database update failed..');
		return false;

	}

	function update_create_user($db_user){
		WPBackItUp_LoggerV2::log_info($this->log_name,__METHOD__,'Begin');

		$db = new WPBackItUp_DataAccess();
		if (true===$db->update_create_user_by_login($db_user)){
			WPBackItUp_LoggerV2::log_info($this->log_name,__METHOD__,'User updated in database:'.$db_user->user_login);
			return true;
		}
		WPBackItUp_LoggerV2::log_error($this->log_name,__METHOD__,'User database update failed:'.$db_user->user_login);
		return false;
	}

	function create_current_user($db_user){
		WPBackItUp_LoggerV2::log_info($this->log_name,__METHOD__,'Begin');

		$db = new WPBackItUp_DataAccess();
		if (true===$db->create_user($db_user)){
			WPBackItUp_LoggerV2::log_info($this->log_name,__METHOD__,'User created in database.');
			return true;
		}
		WPBackItUp_LoggerV2::log_error($this->log_name,__METHOD__,'User database create failed.');
		return false;
	}

	/**
	 * Delete duplicate profiles and reassign content
	 * - will NOT delete the profile passed as input
	 *
	 * @param $current_user_Id
	 * @param $current_user_login
	 *
	 * @return bool
	 */
	function delete_duplicate_users($current_user_Id, $current_user_login){
		WPBackItUp_LoggerV2::log_info($this->log_name,__METHOD__,'Begin');

		$rtn_value=true;
		$db = new WPBackItUp_DataAccess();
		$dup_users = $db->get_duplicate_users($current_user_Id, $current_user_login);
		foreach ($dup_users as $user){
			//delete user and reassign content to current user
			if (true===wp_delete_user( $user->ID, $current_user_Id)){
				WPBackItUp_LoggerV2::log_info($this->log_name,__METHOD__,sprintf('User was removed successfully:%s-%s', $user->ID,$user->user_login));
			}else{
				WPBackItUp_LoggerV2::log_error($this->log_name,__METHOD__,sprintf('User was NOT removed:%s-%s', $user->ID,$user->user_login));
				$rtn_value=false;
			}
		}

		return $rtn_value;
	}

	/**
	 * Update all user meta for this user
	 *
	 * @param $user_id
	 * @param $usermeta
	 *
	 * @return bool
	 */
	function update_create_usermeta($user_id,$usermeta){
		WPBackItUp_LoggerV2::log_info($this->log_name,__METHOD__,'Begin');

		if (!is_array($usermeta)) return false;

		$rtn_val=true;
		$db = new WPBackItUp_DataAccess();
		foreach($usermeta as $meta){
			if ($db->update_create_usermeta($user_id,$meta->meta_key,$meta->meta_value)){
				WPBackItUp_LoggerV2::log_info($this->log_name,__METHOD__,sprintf('User meta updated in database:%s-%s',$user_id,$meta->meta_key));
			}else{
				$rtn_val=false;
				WPBackItUp_LoggerV2::log_error($this->log_name,__METHOD__,sprintf('User meta NOT updated in database:%s-%s',$user_id,$meta->meta_key));
			}
		}

		return $rtn_val;
	}

	/**
	 * Drop the old job table
	 *
	 * @return mixed
	 */
	private  function drop_job_table() {
		$db = new WPBackItUp_DataAccess();
		return $db->drop_table('wpbackitup_job');
	}

	/**
	 * Update WP BackItUp license key in database
	 *
	 * @param $license_key
	 *
	 * @return bool
	 */
	function update_license_key($license_key){
		global $table_prefix;
		WPBackItUp_LoggerV2::log_info($this->log_name,__METHOD__,'Begin');

		$sql = "UPDATE ". $table_prefix ."options SET option_value='" .$license_key ."' WHERE option_name='wp-backitup_license_key'";
		$dbc = new WPBackItUp_SQL($this->log_name);
		if (true===$dbc->run_sql_command($sql)){
			WPBackItUp_LoggerV2::log_info($this->log_name,__METHOD__,'License Key updated in database:'.$license_key);
			return true;
		}

		WPBackItUp_LoggerV2::log_error($this->log_name,__METHOD__,'License Key was not updated.');
		return false;
	}

	function update_permalinks(){
		global $wp_rewrite;
		WPBackItUp_LoggerV2::log_info($this->log_name,__METHOD__,'Begin');

		try {
			$wp_rewrite->flush_rules( true );//Update permalinks -  hard flush

		}catch(Exception $e) {
			WPBackItUp_LoggerV2::log_error($this->log_name,__METHOD__,'Exception: ' .$e);
			return false;
		}
		WPBackItUp_LoggerV2::log_info($this->log_name,__METHOD__,'End - Permalinks updated.');
		return true;
	}

	public function zip_logs(){
		WPBackItUp_LoggerV2::log_info($this->log_name,__METHOD__,'Begin');

		//Zip up all the logs in the log folder
		$logs_path = WPBACKITUP__PLUGIN_PATH .'logs';
		$zip_file_path = $logs_path .'/Restore_Logs_' .$this->backup_id . '.zip';

		//copy/replace WP debug file
		$wpdebug_file_path = WPBACKITUP__CONTENT_PATH . '/debug.log';
		WPBackItUp_LoggerV2::log_info($this->log_name,__METHOD__,'Copy WP Debug: ' .$wpdebug_file_path);
		if (file_exists($wpdebug_file_path)) {
			copy( $wpdebug_file_path, $logs_path .'/wpdebug.log' );
		}

		$zip = new WPBackItUp_Zip($this->log_name,$zip_file_path);
		$zip->zip_files_in_folder($logs_path,$this->backup_id,'*.log');
		$zip->close();

		WPBackItUp_LoggerV2::log_info($this->log_name,__METHOD__,'End');

		return $zip_file_path;

	}

	function send_notification_email($err, $success,$logs=array(),$notification_email) {
		global $logger,$status_array,$backup_job;
		WPBackItUp_LoggerV2::log_info($this->log_name,__METHOD__,'Begin');

		$utility = new WPBackItUp_Utility($logger);

		if($success)
		{
			//Don't send logs on success unless debug is on.
			if (WPBACKITUP__DEBUG!==true){
				$logs=array();
			}

			$subject = get_bloginfo() . ' - Restore completed successfully.';
			$message = '<b>Your site was restored successfully.</b><br/><br/>';

		} else  {
			$subject = get_bloginfo() .' - Backup did not complete successfully.';
			$message = '<b>Your restore did not complete successfully.</b><br/><br/>';
		}

		$local_datetime = get_date_from_gmt(date( 'Y-m-d H:i:s',current_time( 'timestamp' )));
		$message .= 'WordPress Site: <a href="'  . home_url() . '" target="_blank">' . home_url() .'</a><br/>';
		$message .= 'Restore date: '  . $local_datetime . '<br/>';

		//$message .= 'Completion Code: ' . $backup_job->backup_id .'-'. $processing_minutes .'-' .$processing_seconds .'<br/>';
		$message .= 'WPBackItUp Version: '  . WPBACKITUP__VERSION . '<br/>';
		$message .= '<br/>';


		//Add the completed steps on success
//		if($success) {
//			$message .='<b>Steps Completed</b><br/>';
//
//			//Add the completed statuses
//			foreach ($status_array as $status_key => $status_value) {
//				if ($status_value==2) {
//					foreach ($status_description as $msg_key => $msg_value) {
//						if ($status_key==$msg_key) {
//							$message .=  $msg_value . '<br/>';
//							break;
//						}
//					}
//				}
//			}
//		} else  {
//			//Error occurred
//			$message .= '<br/>';
//			$message .= 'Errors:<br/>' . get_error_message($err);
//		}

//		$term='success';
//		if(!$success)$term='error';
//		$message .='<br/><br/>Checkout '. $WPBackitup->get_anchor_with_utm('www.wpbackitup.com', '', 'notification+email', $term) .' for info about WP BackItUp and our other products.<br/>';


		if($notification_email)
			$utility->send_email($notification_email,$subject,$message,$logs);

		WPBackItUp_LoggerV2::log_info($this->log_name,__METHOD__,'End');
	}

	function save_process_status($process,$status){
		WPBackItUp_LoggerV2::log_info($this->log_name,__METHOD__,'Begin');

		//Write status to JSON file - cant use database because it will e restored
		$local_datetime = get_date_from_gmt(date( 'Y-m-d H:i:s',current_time( 'timestamp' )));
		$process_status = array(
			'status'    => $status,
			'start_time'=>$local_datetime,
			'end_time'  =>''
		);

		$log_file_path = WPBACKITUP__PLUGIN_PATH .'logs/restore_' .$this->backup_id .'.log';
		$restore_status_string=false;
		if (file_exists($log_file_path)){
			$restore_status_string = file_get_contents($log_file_path);
		}

		if (false===$restore_status_string || empty($restore_status_string)){
			$restore_status_array=array($process=>$process_status);
		} else{
			$restore_status_array = json_decode($restore_status_string,true);

			//Does the process already exist
			if (! array_key_exists ($process,$restore_status_array)){
				//Add to existing array
				$restore_status_array[$process]=$process_status;
			}else{
				//update the end time
				$restore_status_array[$process]['end_time'] = $local_datetime;
				$restore_status_array[$process]['status'] = $status;
			}

		}

		$restore_status_string = json_encode($restore_status_array);
		file_put_contents($log_file_path, $restore_status_string);

		WPBackItUp_LoggerV2::log_info($this->log_name,__METHOD__,'End');
	}


	/**
	 * Get all backup files that are contained in the backupset file but are not in the backup folder
	 * These files will be unpacked in a subsequent step
	 *
	 * Method will save backup set file to job meta
	 *
	 * @param $current_job
	 * @param $current_task
	 *
	 * @return array return array of files that are not already pressent in folder
	 */
	public function get_backupset_unpack_list($current_job,$current_task) {
		$missing_archives = array();

		//Get the zip list from folder
		$backup_files = $this->get_backups_in_folder($current_job,$current_task,true);
		WPBackItUp_LoggerV2::log_info( $this->log_name, __METHOD__, 'Zips Found in Backup Folder:' . var_export( $backup_files, true ) );

		//is there a backup set in this list
		$util                = new WPBackItUp_Utility();
		$backup_set_key = $util->strposa( '-backupset-', $backup_files );
		if ( false !== $backup_set_key ) {
			$backup_set_file = $backup_files[ $backup_set_key ];
			$current_job->setJobMetaValue('backupset_file',$backup_set_file);//save to job meta for next task
			WPBackItUp_LoggerV2::log_info( $this->log_name, __METHOD__, 'Backup Set Found:' . $backup_set_file );

			//open the archive
			$zip = new ZipArchive;
			if ( true === $zip->open( $backup_set_file ) ) {

				//iterate the archive files array and display the filename or each one
				for ( $i = 0; $i < $zip->numFiles; $i ++ ) {
					$backup_file = $this->get_backup_folder_path() . '/' . basename( $zip->getNameIndex( $i ) );
					if ( ! file_exists( $backup_file ) ) {
						$missing_archives[] = basename($backup_file);
					}
				}
			} else {
				//Log as error but ok to fail here, possible that files already exist in folder
				WPBackItUp_LoggerV2::log_warning( $this->log_name, __METHOD__, 'Failed to open the archive!' );
			}

		} else{
			WPBackItUp_LoggerV2::log_info( $this->log_name, __METHOD__, 'No backup set found in folder.' );
		}

		WPBackItUp_LoggerV2::log_info( $this->log_name, __METHOD__, 'Missing Archives:' . var_export( $missing_archives, true ) );
		return $missing_archives;

	}

	/**
	 * unpack a backup file from the backup set
	 *
	 * @param $current_job
	 * @param $current_task
	 * @param $backupset_file
	 * @param $backup_file
	 *
	 * @return bool  true on success, false on error
	 */
	public function unpack_backup_from_backupset( $current_job, $current_task,$backupset_file,$backup_file  ) {
		WPBackItUp_LoggerV2::log_info( $this->log_name, __METHOD__, 'Unpack:' . var_export( $backup_file, true ) );

		if (empty($backup_file) ) {
			WPBackItUp_LoggerV2::log_error( $this->log_name, __METHOD__, 'Backup file parm is empty' . $backup_file);
			return false;
		}

		if (empty($backupset_file) ) {
			WPBackItUp_LoggerV2::log_error( $this->log_name, __METHOD__, 'Backup set parm is empty' . $backup_file);
			return false;
		}


		$target_folder = $this->get_backup_folder_path() .'/';
		WPBackItUp_LoggerV2::log_info( $this->log_name, __METHOD__, 'Extract TO:' . $target_folder);

		//copy from the zip to the destination folder
		if ( ! copy("zip://".$backupset_file."#" .'backups/' .$backup_file, $target_folder .$backup_file)){
			WPBackItUp_LoggerV2::log_error( $this->log_name, __METHOD__, 'Failed to unpack backup file:' . $backup_file);
			return false;
		}

		WPBackItUp_LoggerV2::log_info( $this->log_name, __METHOD__, 'Unpacked backup file:' . $backup_file);
		return true;

	}

	/**
	 * Get list of all backup files in backup folder
	 *
	 * @param $current_job
	 * @param $current_task
	 * @param bool|false $include_backupset  Include backup set in list
	 *
	 * @return array  return array of backup file or false on error
	 */
	public function get_backups_in_folder( $current_job, $current_task,$include_backupset=false ) {

		//Get the zip list from folder
		$backup_path_pattern = $this->get_backup_folder_path() . '/' . $this->get_backup_name() . '*.zip';
		$backup_files        = glob( $backup_path_pattern );
		if ( is_array( $backup_files ) && count( $backup_files ) > 0 ) {

			//remove the backupset file from the list
			if ( false===$include_backupset ) {
				$util           = new WPBackItUp_Utility( $this->log_name );
				$backup_set_key = $util->strposa( '-backupset-', $backup_files );
				if ( false !== $backup_set_key ) {
					unset( $backup_files[ $backup_set_key ] );
				}
			}
		}

		return $backup_files;
	}

	/** GETTERS */

	/**
	 * @return string
	 */
	public function get_backup_folder_path() {
		return $this->backup_folder_path;
	}

	/**
	 * @return string
	 */
	public function get_restore_root_folder_path() {
		return $this->restore_root_folder_path;
	}

	/**
	 * @return string
	 */
//	public function get_restore_folder_path() {
//		return $this->restore_folder_path;
//	}

	/**
	 * @return mixed
	 */
	public function get_backup_name() {
		return $this->backup_name;
	}

	/**
	 * @return string
	 */
	public function get_restore_staging_suffix() {
		return $this->restore_staging_suffix;
	}

	/**
	 * @return mixed
	 */
	public function get_backup_id() {
		return $this->backup_id;
	}




}