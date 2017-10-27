<?php if (!defined ('ABSPATH')) die('No direct access allowed');

/**
 * WP BackItUp  - Restore View
 *
 * @package WP BackItUp
 * @author  Chris Simmons <chris.simmons@wpbackitup.com>
 * @link    http://www.wpbackitup.com
 *
 */

    $namespace = $this->namespace;
    $page_title = sprintf(__('%s Restore', 'wp-backitup'), $this->friendly_name );

    //Path Variables
    $backup_folder_root = WPBACKITUP__BACKUP_PATH .'/';

    $license_active = $this->license_active();

    //Make sure backup folder exists
    $backup_dir = WPBACKITUP__CONTENT_PATH . '/' . WPBACKITUP__BACKUP_FOLDER;
    $backup_folder_exists=false;
    if( !is_dir($backup_dir) ) {
        if (@mkdir($backup_dir, 0755)){
            $backup_folder_exists=true;
        }
    }else{
        $backup_folder_exists=true;
    }

    //Check restore folder folders
    $restore_dir = WPBACKITUP__CONTENT_PATH . '/' . WPBACKITUP__RESTORE_FOLDER;
    $restore_folder_exists=false;
    if( !is_dir($restore_dir) ) {
        if (@mkdir($restore_dir, 0755)){
            $restore_folder_exists=true;
        }
    }else{
        $restore_folder_exists=true;
    }

    // get retention number set
    $number_retained_archives = $this->backup_retained_number();

    $restore_list_size = 10;
    $backup_job_list =  WPBackItUp_Job::get_jobs_by_status(WPBackItUp_Job::BACKUP,array(WPBackItUp_Job::COMPLETE),$restore_list_size);


    $chunk_size = min(wp_max_upload_size()-1024, 1024*1024*2);
    $plupload_config = array(
      'runtimes' => 'html5,flash,silverlight,html4',
      'browse_button' => 'plupload-browse-button',
      'container' => 'plupload-upload-ui',
      'drop_element' => 'drag-drop-area',
      'file_data_name' => 'async-upload',
      'multiple_queues' => true,
      'max_file_size' => '100Gb',
      'chunk_size' => $chunk_size.'b',
      'url' => admin_url('admin-ajax.php'),
      'filters' => array(array('title' => __('Zip Files'), 'extensions' => 'zip')),
      'multipart' => true,
      'multi_selection' => true,
      'urlstream_upload' => true,
      'multipart_params' => array(
          '_wpnonce' => wp_create_nonce($namespace . '-upload'),
          'action' => 'wp-backitup_plupload_action')
  );

?>

<?php
//Fatal Error - no backup folder
if (!$backup_folder_exists) {
echo '<div class="error"><p><strong>';
    printf(__('Error: Backup folder does not exist. Please contact %s for assistance.', 'wp-backitup'), $this->get_anchor_with_utm(__('support','wp-backitup'),'support' ,'restore+error','no+backup+folder'));
    echo '</strong></p></div>';
}

//Fatal Error - no restore folder
if (!$restore_folder_exists) {
    echo '<div class="error"><p><strong>';
    printf(__('Error: Restore folder does not exist. Please contact %s for assistance.', 'wp-backitup'), $this->get_anchor_with_utm(__('support','wp-backitup'),'support' ,'restore+error','no+restore+folder') );
    echo '</strong></p></div>';
}
?>

<script type="text/javascript">var __namespace = '<?php echo $namespace; ?>';</script>
<div class="wrap">
  <div id="wp-backitup-icon" class="icon32"><img src="<?php echo plugin_dir_url(dirname(__FILE__)); ?>images/icon32.png" alt="WPBackItUp Icon" height="32" width="32" /></div>
  <h2><?php echo $page_title; ?></h2>
  <div id="content">

    <!--Available Backups section-->
    <div class="widget">
      <h3><i class="fa fa-cloud-download"></i> <?php _e('Available Backups', 'wp-backitup'); ?></h3>
      <table class="widefat" id="datatable">
        <thead>
          <tr>
            <th><?php _e('Backup', 'wp-backitup') ?></th>
            <th><?php _e('Date', 'wp-backitup') ?></th>
            <th>&nbsp;</th>
            <th>&nbsp;</th>
          </tr>
        </thead>
        <tbody>
        <?php

        if ($backup_job_list !== false)
        {
          $i = 0;
          foreach ($backup_job_list as $job)
          {
            //Only show the number in the retained list
            $zip_files = $job->getJobMetaValue('backup_zip_files');
            if($zip_files == "" )  continue;

            $backup_name = $job->getJobName();
            $file_datetime = $job->getJobDate();
            $class = $i % 2 == 0 ? 'class="alternate"' : '';
            ?>
            <tr <?php echo $class ?> id="row<?php echo $i; ?>">
                <td><?php echo $backup_name; ?></td>

                <!--date-->
                <td><?php echo $file_datetime ?></td>

                <td>&nbsp;
                    <!--
                    <a href="#" title="<?php echo $backup_name; ?>" data-id="<?php echo $job->getJobId() ?>" class="deleteRow" id="deleteRow<?php echo $i; ?>"><?php _e('Delete', 'wp-backitup') ?></a>
                    -->
                </td>
                <td>
                    <?php
                    if ($this->license_active())
                    {
                        echo '<a href="#" title="' . $backup_name . '" class="restoreRow" id="restoreRow' . $i . '">' . __('Restore', 'wp-backitup') . '</a>';
                    } else {
                        echo "&nbsp;";
                    }
                    ?>
                </td>
            </tr>
            <?php
            $i++;
          }
        }
        else
        {
          echo '<tr id="nofiles"><td colspan="3">' . __('No backup archives found.', 'wp-backitup') .'</td></tr>';
        }
        ?>
      </table>  

      <form id="restore-form" method="post" action="<?php echo get_admin_url(),"admin-post.php"; ?>">
        <?php global $current_user; ?>
        <input type="hidden" name="user_id" value="<?php echo $current_user->ID; ?>" />
        <input type="hidden" name="is_selected" id="is_selected" value="0" />
        <input type="hidden" name="selected_file" id="selected_file" value="" />
      </form>

      <?php
      //Display restore note for lite customers
      if (!$this->license_active())
      {
        printf( __('<p>* The automated restore feature is only available to licensed customers.  Please visit <a href="%s" target="_blank">%s</a> to get license WPBackItUp risk free for 30 days.</p>', 'wp-backitup'), WPBACKITUP__SITE_URL, WPBACKITUP__SITE_URL);
      }
      ?>
    </div>		

    <!--Disable upload form if the user has not activated-->
    <?php
    if ($this->license_active())
    {
      ?>
      <div class="widget">
        <h3>
            <i class="fa fa-upload"></i> <?php _e('Upload', 'wp-backitup'); ?>
            <i id="upload-backups-accordian" style="float:right" class="fa fa-angle-double-down"></i>
        </h3>
        <p><b><?php _e('Upload WPBackItUp archive(zip) files to add to your list of available backups.', 'wp-backitup'); ?></b></p>
        <?php
        $max_upload = (int) (ini_get('upload_max_filesize'));
        $max_post = (int) (ini_get('post_max_size'));
        $memory_limit = (int) (ini_get('memory_limit'));
        $upload_mb = min($max_upload, $max_post, $memory_limit);
        $upload_bytes = $upload_mb * 1048576;
        ?>
        <p>

        </p>

        <script type="text/javascript">
          var wpbackitup_plupload_config=<?php echo json_encode($plupload_config); ?>;
          var site_url="<?php echo get_site_url(); ?>";
        </script>

        <div id="wpbackitup-plupload-modal" title="<?php _e('WPBackItUp - Upload backup files','wp-backitup'); ?>" style="width: 75%; margin: 16px; display:none; margin-left: 100px;">
          <p style="max-width: 610px;"><em><?php _e("Backup files may be uploaded into WPBackItUp with this form." ,'wp-backitup');?> <?php echo htmlspecialchars(__('They may also be uploaded manually into the WPBackItUp directory (wp-content/wpbackitup_backups) using FTP. When done uploading all backup files refresh this page.','wp-backitup'));?></em></p>
          <?php
          global $wp_version;
          if (version_compare($wp_version, '3.3', '<')) {
            echo '<em>'.sprintf(__('This feature requires %s version %s or later', 'wp-backitup'), 'WordPress', '3.3').'</em>';
          } else {
            ?>
            <div id="plupload-upload-ui" class ="drag-drop" style="width: 100%;">
              <div id="drag-drop-area">
                <div class="drag-drop-inside">
                  <p class="drag-drop-info"><?php _e('Drop backup files here', 'wp-backitup'); ?></p>
                  <p><?php _ex('or', 'Uploader: Drop backup files here - or - Select Files'); ?></p>
                  <p class="drag-drop-buttons"><input id="plupload-browse-button" type="button" value="<?php esc_attr_e('Select Files'); ?>" class="button" /></p>
                </div>
              </div>
            </div>
            <p style="max-width: 100%;"><em><?php _e("* Reload this page when done uploading to see new backups appear in the Available Backups section above. " ,'wp-backitup');?> </em></p>

            <div id="filelist" class="media-item" style="width: 100%;"></div>
            <button id="import-uploads" class="button button-secondary">Import Uploads</button>

          <?php } ?>

        </div>


      </div>
<?php } ?>
    <!--End of Upload form-->


    <div id="status" class="widget">
      <h3><i class="fa fa-check-square-o"></i> <?php _e('Status', 'wp-backitup'); ?></h3>

      <!--default status message-->
      <ul class="default-status">
        <li><?php _e('Nothing to report', 'wp-backitup'); ?></li>
      </ul>

      <!--Upload status messages-->
      <ul class="upload-status">
          <li><span class='upload-status'></span></li>
      </ul>

      <!--restore status messages-->
      <ul class="restore-status">
        <li class="preparing"><?php _e('Preparing for restore', 'wp-backitup'); ?>...<span class='status-icon'><img class="preparing-icon" src="<?php echo WPBACKITUP__PLUGIN_URL . "/images/loader.gif"; ?>" height="16" width="16" /></span><span class='status'><?php _e('Done', 'wp-backitup'); ?></span><span class='fail error'><?php _e('Failed', 'wp-backitup'); ?></span></li>
        <li class="unpacking"><?php _e('Unpacking backup set', 'wp-backitup'); ?>...<span class='status-icon'><img class="unpacking-icon" src="<?php echo WPBACKITUP__PLUGIN_URL . "/images/loader.gif"; ?>" height="16" width="16" /></span><span class='status'><?php _e('Done', 'wp-backitup'); ?></span><span class='fail error'><?php _e('Failed', 'wp-backitup'); ?></span></li>
        <li class="unzipping"><?php _e('Unzipping backup files', 'wp-backitup'); ?>...<span class='status-icon'><img class="unzipping-icon" src="<?php echo WPBACKITUP__PLUGIN_URL . "/images/loader.gif"; ?>" height="16" width="16" /></span><span class='status'><?php _e('Done', 'wp-backitup'); ?></span><span class='fail error'><?php _e('Failed', 'wp-backitup'); ?></span></li>
        <li class="validation"><?php _e('Validating backup files', 'wp-backitup'); ?>...<span class='status-icon'><img class="validation-icon" src="<?php echo WPBACKITUP__PLUGIN_URL . "/images/loader.gif"; ?>" height="16" width="16" /></span><span class='status'><?php _e('Done', 'wp-backitup'); ?></span><span class='fail error'><?php _e('Failed', 'wp-backitup'); ?></span></li>
        <li class="deactivate_plugins"><?php _e('Deactivating plugins', 'wp-backitup'); ?>...<span class='status-icon'><img class="deactivate_plugins-icon" src="<?php echo WPBACKITUP__PLUGIN_URL . "/images/loader.gif"; ?>" height="16" width="16" /></span><span class='status'><?php _e('Done', 'wp-backitup'); ?></span><span class='fail error'><?php _e('Failed', 'wp-backitup'); ?></span></li>
        <li class="restore_point"><?php _e('Creating database restore point', 'wp-backitup'); ?>...<span class='status-icon'><img class="restore_point-icon" src="<?php echo WPBACKITUP__PLUGIN_URL . "/images/loader.gif"; ?>" height="16" width="16" /></span><span class='status'><?php _e('Done', 'wp-backitup'); ?></span><span class='fail error'><?php _e('Failed', 'wp-backitup'); ?></span></li>
        <li class="stage_wpcontent"><?php _e('Staging content files', 'wp-backitup'); ?>...<span class='status-icon'><img class="stage_wpcontent-icon" src="<?php echo WPBACKITUP__PLUGIN_URL . "/images/loader.gif"; ?>" height="16" width="16" /></span><span class='status'><?php _e('Done', 'wp-backitup'); ?></span><span class='fail error'><?php _e('Failed', 'wp-backitup'); ?></span></li>
	    <li class="restore_wpcontent"><?php _e('Restoring content files', 'wp-backitup'); ?>...<span class='status-icon'><img class="stage_wpcontent-icon" src="<?php echo WPBACKITUP__PLUGIN_URL . "/images/loader.gif"; ?>" height="16" width="16" /></span><span class='status'><?php _e('Done', 'wp-backitup'); ?></span><span class='fail error'><?php _e('Failed', 'wp-backitup'); ?></span></li>
        <li class="restore_database"><?php _e('Restoring database', 'wp-backitup'); ?>...<span class='status-icon'><img class="restore_database-icon" src="<?php echo WPBACKITUP__PLUGIN_URL . "/images/loader.gif"; ?>" height="16" width="16" /></span><span class='status'><?php _e('Done', 'wp-backitup'); ?></span><span class='fail error'><?php _e('Failed', 'wp-backitup'); ?></span></li>
        <li class="update_user"><?php _e('Updating current user info', 'wp-backitup'); ?>...<span class='status-icon'><img class="update_user-icon" src="<?php echo WPBACKITUP__PLUGIN_URL . "/images/loader.gif"; ?>" height="16" width="16" /></span><span class='status'><?php _e('Done', 'wp-backitup'); ?></span><span class='fail error'><?php _e('Failed', 'wp-backitup'); ?></span></li>
        <li class="update_site_info"><?php _e('Updating site URL', 'wp-backitup'); ?>...<span class='status-icon'><img class="update_site_info-icon" src="<?php echo WPBACKITUP__PLUGIN_URL . "/images/loader.gif"; ?>" height="16" width="16" /></span><span class='status'><?php _e('Done', 'wp-backitup'); ?></span><span class='fail error'><?php _e('Failed', 'wp-backitup'); ?></span></li>
<!--        <li class="activate_plugins">--><?php //_e('Activating plugins', 'wp-backitup'); ?><!--...<span class='status-icon'><img class="activate_plugins-icon" src="--><?php //echo WPBACKITUP__PLUGIN_URL . "/images/loader.gif"; ?><!--" height="16" width="16" /></span><span class='status'>--><?php //_e('Done', 'wp-backitup'); ?><!--</span><span class='fail error'>--><?php //_e('Failed', 'wp-backitup'); ?><!--</span></li>-->
        <li class="update_permalinks"><?php _e('Updating permalinks', 'wp-backitup'); ?>...<span class='status-icon'><img class="update_permalinks-icon" src="<?php echo WPBACKITUP__PLUGIN_URL . "/images/loader.gif"; ?>" height="16" width="16" /></span><span class='status'><?php _e('Done', 'wp-backitup'); ?></span><span class='fail error'><?php _e('Failed', 'wp-backitup'); ?></span></li>
      </ul>
      <p>

        <!--restore error messages-->
      <div class="restore-errors">
        <span class="error201"><div class='isa_error'><?php _e('Error 201: No file selected', 'wp-backitup'); ?>.</div></span>
        <span class="error202"><div class='isa_error'><?php _e('Error 202: Your file could not be uploaded', 'wp-backitup'); ?>.</div></span>
        <span class="error203"><div class='isa_error'><?php _e('Error 203: Your backup could not be unzipped', 'wp-backitup'); ?>.</div></span>
        <span class="error204"><div class='isa_error'><?php _e('Error 204: Your backup appears to be invalid. Please ensure you selected a valid backup', 'wp-backitup'); ?>.</div></span>
        <span class="error205"><div class='isa_error'><?php _e('Error 205: Cannot create restore point', 'wp-backitup'); ?>.</div></span>
        <span class="error206"><div class='isa_error'><?php _e('Error 206: Unable to connect to your database', 'wp-backitup'); ?>.</div></span>
        <span class="error207"><div class='isa_error'><?php _e('Error 207: Unable to get current site URL from database. Please try again', 'wp-backitup'); ?>.</div></span>
        <span class="error208"><div class='isa_error'><?php _e('Error 208: Unable to get current home URL from database. Please try again', 'wp-backitup'); ?>.</div></span>
        <span class="error209"><div class='isa_error'><?php _e('Error 209: Unable to get current user ID from database. Please try again', 'wp-backitup'); ?>.</div></span>
        <span class="error210"><div class='isa_error'><?php _e('Error 210: Unable to get current user password from database. Please try again', 'wp-backitup'); ?>.</div></span>
        <span class="error211"><div class='isa_error'><?php _e('Error 211: Unable to get current user email from database. Please try again', 'wp-backitup'); ?>.</div></span>
        <span class="error212"><div class='isa_error'><?php _e('Error 212: Unable to import your database. This may require importing the file manually', 'wp-backitup'); ?>.</div></span>
        <span class="warning213"><div class='isa_warning'><?php _e('Warning 213: Unable to update your site URL value. Please check your WordPress general settings to make sure your Site and WordPress URLs are correct', 'wp-backitup'); ?>.</div></span>
        <span class="warning214"><div class='isa_warning'><?php _e('Warning 214: Unable to update your home URL value. Please check your WordPress general settings to make sure your Site and WordPress URLs are correct', 'wp-backitup'); ?>.</div></span>
        <span class="warning215"><div class='isa_warning'><?php _e('Warning 215: Unable to update your user information. This may require you to login with the admin username and password that was used when the backup was created', 'wp-backitup'); ?>.</div></span>
        <span class="error216"><div class='isa_error'><?php _e('Error 216: Database not found in backup', 'wp-backitup'); ?>.</div></span>
        <span class="warning217"><div class='isa_warning'><?php _e('Warning 217: Unable to remove existing wp-content directory', 'wp-backitup'); ?>.</div></span>
        <span class="error218"><div class='isa_error'><?php _e('Error 218: Unable to create new wp-content directory. Please check your CHMOD settings in /wp-content/', 'wp-backitup'); ?>.</div></span>
        <span class="error219"><div class='isa_error'><?php _e('Error 219: Unable to import wp-content. Please try again', 'wp-backitup'); ?>.</div></span>
        <span class="warning220"><div class='isa_warning'><?php _e('Warning 220: Unable to cleanup import directory. No action is required', 'wp-backitup'); ?>.</div></span>
        <span class="error221"><div class='isa_error'><?php printf(__('Error 221: Table prefix value in wp-config.php is different from backup. This MUST be changed in your wp-config.php file before you will be able to restore your site.  See www.wpbackitup.com <a href ="%s" target="_blank" > FAQs</a> for more info.'),esc_url('http://www.wpbackitup.com/documentation/migration/wordpress-table-prefix'), 'wp-backitup'); ?>.</div></span>
        <span class='error222'><div class='isa_error'><?php _e('Error 222: Unable to create restore folder', 'wp-backitup'); ?>.</div></span>
        <span class='error223'><div class='isa_error'><?php _e('Error 223: An error occurred during the restore.  WPBackItUp attempted to restore the database to its previous state but were unsuccessful.  Please contact WPBackItUp customer support and do not attempt to perform any further restores', 'wp-backitup'); ?>.</div></span>
        <span class='error224'><div class='isa_error'><?php _e('Error 224: An error occurred during the restore, however, we have successfully restored your database to the previous state', 'wp-backitup'); ?>.</div></span>
        <span class='error225'><div class='isa_error'><?php _e('Error 225: Restore option is only available to licensed WPBackItUp users', 'wp-backitup'); ?>.</div></span>
        <span class='error226'><div class='isa_error'><?php _e('Error 226: Restore cannot proceed because your backup was created using a different version of WordPress', 'wp-backitup'); ?>.</div></span>
        <span class='error227'><div class='isa_error'><?php _e('Error 227: Restore cannot proceed because your backup was created using a different version of WPBackItUp.  Please contact WPBackItUp support to help convert this backup to the current version', 'wp-backitup'); ?>.</div></span>
        <span class="error230"><div class='isa_error'><?php _e('Error 230: WPBackItUp ran into unexpected errors during the database restore.  However, we were able to successfully revert the database back to its original state . This error may require importing the database manually', 'wp-backitup'); ?>.</div></span>
	    <span class="error235"><div class='isa_error'><?php _e('Error 235: WPBackItUp is not able to proceed because there is no zip utility available.  Please contact support', 'wp-backitup'); ?>.</div></span>
	    <span class="error250"><div class='isa_error'><?php _e('Error 250: WPBackItUp is unable to begin the restore because a backup is running.  Please wait for the backup to complete and then try again', 'wp-backitup'); ?>.</div></span>

        <span class="error260"><div class='isa_error'><?php _e('Error 260: WPBackItUp is unable to extract archives from backup set.  Please try again and contact support if this issue continues', 'wp-backitup'); ?>.</div></span>
        <span class="error261"><div class='isa_error'><?php _e('Error 261: WPBackItUp is unable to extract archives from backup set.  Please try again and contact support if this issue continues', 'wp-backitup'); ?>.</div></span>
        <span class="error262"><div class='isa_error'><?php _e('Error 262: There were no backup files found in the backup folder.  Please try again and contact support if this issue continues', 'wp-backitup'); ?>.</div></span>

        <span class="error251"><div class='isa_error'><?php _e('Error 251: WPBackItUp is unable to begin the restore because the backup manifest is empty', 'wp-backitup'); ?>.</div></span>
        <span class="error252"><div class='isa_error'><?php _e('Error 252: At least one zip file is missing from your backup set.  Please make sure to upload all zip files that were part of this backup', 'wp-backitup'); ?>.</div></span>
        <span class="error253"><div class='isa_error'><?php _e('Error 253: Backup set contains a zip file that is not in the manifest.  Please make sure to upload only zip files that were part of this backup', 'wp-backitup'); ?>.</div></span>
        <span class="error254"><div class='isa_error'><?php _e('Error 254: The size of one the zip files in this backup set does not match the manifest so is most likely corrupt.  Upload all zip files in this backup set again and attempt the restore one more time. ', 'wp-backitup'); ?>.</div></span>
        <span class="error255"><div class='isa_error'><?php _e('Error 255: Backup set does not contain a manifest.  Please make sure to upload all zip files that were part of this backup', 'wp-backitup'); ?>.</div></span>

        <span class="warning300"><div class='isa_warning'><?php _e('Warning 300: Unable to restore all WordPress content. Please review your restore logs to see what WPBackItUp was unable to restore', 'wp-backitup'); ?>.</div></span>
        <span class="warning305"><div class='isa_warning'><?php _e('Warning 305: Unable to restore all plugins. Please review your restore logs to see what WPBackItUp was unable to restore', 'wp-backitup'); ?>.</div></span>

        <span class="error2001"><div class='isa_error'><?php _e('Error 2001: Unable to prepare site for restore', 'wp-backitup'); ?>.</div></span>
        <span class="error2002"><div class='isa_error'><?php _e('Error 2002: Unable to unzip backup', 'wp-backitup'); ?>.</div></span>
        <span class="error2003"><div class='isa_error'><?php _e('Error 2003: Unable to validate backup', 'wp-backitup'); ?>.</div></span>
        <span class="error2004"><div class='isa_error'><?php _e('Error 2004: Unable to create restore point', 'wp-backitup'); ?>.</div></span>
        <span class="error2005"><div class='isa_error'><?php _e('Error 2005: Unable to stage wp-content', 'wp-backitup'); ?>.</div></span>
        <span class="error2006"><div class='isa_error'><?php _e('Error 2006: Unable to restore content files', 'wp-backitup'); ?>.</div></span>
        <span class="error2007"><div class='isa_error'><?php _e('Error 2007: Unable to restore database', 'wp-backitup'); ?>.</div></span>
        <span class="error2999"><div class='isa_error'><?php _e('Error 2999: Unexpected error encountered', 'wp-backitup'); ?>.</div></span>


      </div>

      <!--restore success messages-->
      <div class="restore-success">
        <span class='finalinfo'><div class='isa_success'><?php _e('Restore completed successfully. If you are prompted to login please do so with your current username and password', 'wp-backitup'); ?>.</div></span>
      </div>                

    </div>  

  </div>

</div>