/**
 * WP Backitup Admin Control Panel JavaScripts
 * 
 * @version 1.4.0
 * @since 1.0.1
 */

(function($){
    var namespace = 'wp-backitup';
    var current_job_id=0;

    //$( "#tabs" ).tabs();

    //Add View Log Click event to backup page
    wpbackitup_add_viewlog_onclick();

    //Add download backup Click event to backup page
    wpbackitup_add_downloadbackup_onclick();

    //UPLOADS
    try {
        if(typeof wpbackitup_plupload_config !== 'undefined') {
            plupload_init(wpbackitup_plupload_config);
        }
    } catch (err) {
        console.log(err);
    }

    $( "#scheduled-backups-accordian" ).click(function() {

        scheduled_backups=$("#scheduled-backups");
        scheduled_backups_button = $( "#scheduled-backups-accordian");

        if ($(this).is(".fa-angle-double-down")){
            scheduled_backups.fadeIn( "slow" )
            scheduled_backups_button.toggleClass( "fa-angle-double-down", false);
            scheduled_backups_button.toggleClass( "fa-angle-double-up", true);
        } else{
            scheduled_backups_button.toggleClass( "fa-angle-double-down", true);
            scheduled_backups_button.toggleClass( "fa-angle-double-up", false);
            scheduled_backups.fadeOut( "slow" )
        }

    });

    $( "#upload-backups-accordian" ).click(function() {

        upload_backups=$("#wpbackitup-plupload-modal");
        upload_backups_button = $( "#upload-backups-accordian");

        if ($(this).is(".fa-angle-double-down")){
            upload_backups.fadeIn( "slow" )
            upload_backups_button.toggleClass( "fa-angle-double-down", false);
            upload_backups_button.toggleClass( "fa-angle-double-up", true);
        } else{
            upload_backups_button.toggleClass( "fa-angle-double-down", true);
            upload_backups_button.toggleClass( "fa-angle-double-up", false);
            upload_backups.fadeOut( "slow" )
        }

    });

    //binds to onchange event of the upload file input field
    $('#wpbackitup-zip').bind('change', function() {

        //this.files[0].size gets the size of your file.
        var upload_file_size = this.files[0].size;
        var max_file_size = $('#maxfilesize').val();

        //IF Not supported by browser just check on server
        if (upload_file_size == 'undefined' ||
            max_file_size == 'undefined' ||
            upload_file_size == '' ||
            max_file_size =='')
        {
            return;
        }

        if (upload_file_size > max_file_size){
            alert(wpbackitup_local.upload_file_size_exceed);
            $("#wpbackitup-zip").val("");
        }
    });

    // Setting checkbox value
    $('#wpbackitup_delete_all').change(function(){
         cb = $(this);
         cb.val(cb.prop('checked')=== true? 1: 0);
     });
    
    $('#wpbackitup_rversion_compare').change(function(){
         cb = $(this);
         cb.val(cb.prop('checked')=== true? 1: 0);
     });

    $('#wpbackitup_single_file_backupset').change(function(){
         cb = $(this);
         cb.val(cb.prop('checked')=== true ? 1: 0);
     });

    /* settings filters */
    $('#wpbackitup_backup_plugins_filter').tagit();
    $('#wpbackitup_backup_themes_filter').tagit();
    $('#wpbackitup_backup_uploads_filter').tagit();
    $('#wpbackitup_backup_others_filter').tagit();

    // DB tables filter
    $('#wpbackitup_backup_dbtables_filterable_list , #wpbackitup_backup_dbtables_filtered_list').sortable({
        connectWith: '.wpbackitup_connectedSortable'
    }).disableSelection();

    $('#Save_DBFilters').click(function(e){
        var list = Array();
        $('#wpbackitup_backup_dbtables_filtered_list li').each(function(index){
             list.push($(this).text());
        });
        $("#wpbackitup_backup_dbtables_filter_list").val(list.join(", "));
        
    });

    // import uploads
    $('#import-uploads').click(function(){
        setTimeout(function () {
            window.location.reload()
        }, 100);
    });
    
    $(document.body).on('click', '.thickbox', function(){
        var job_id = $(this).data('jobid');
        console.log(job_id);
        var job_name = this.name;
        wpbackitup_get_single_backup_zip_filelist(job_id, job_name);
    });

    function wpbackitup_add_viewlog_onclick(){
        $(".viewloglink").click(function(){
            var href = $(this).attr("href");
            $("#backup_name").val(href);
            $("#viewlog").submit();
            return false;
        });
    }

    function wpbackitup_add_downloadbackup_onclick(){
        $(".downloadbackuplink").bind('click', function(){
            var href = $(this).attr("href");
            $("#backup_file").val(href);
            $("#download_backup").submit();
            return false;
        });
    }

  /* get single backup list */
  function wpbackitup_get_single_backup_zip_filelist(backup_job_id, job_name){
    var get_filelist_action = {
        action: wpbackitup_get_action_name('backup_zip_filelist'),job_id: backup_job_id
    };

    var inlineId = job_name.replace(/[^A-Za-z0-9\-]/g, '');

    var row_no=0;
    var html_backupset='';
    var html_data = 
        '<div id="'+ inlineId +'">\
            <h2>WP BackItUp Backup Set: &nbsp;<em>'+ job_name +'</em></h2>\
            <p>Below are the archive files included in this backup set. Click the link to download.</p>\
            <table class="widefat" id="datatable">\
              <tbody>';

      $.ajax({
          url: ajaxurl,
          type: 'POST',
          data: {action: wpbackitup_get_action_name('backup_zip_filelist'),job_id: backup_job_id},
          dataType: "json"
      })

      //success
      .done(function( response ) {

            if (response.data){
                $.each(response.data,function() {
                      var zip_name = $(this)[0].name.split(/[\/]+/).pop();
                      var file_size = $(this)[0].size;
                      console.log(zip_name, file_size);

                      if (zip_name.indexOf('-backupset-') > -1 ) {
                          html_backupset='<p><a class="downloadbackuplink" href="'+ zip_name +'"><i class="fa fa-cloud-download fa-3x"></i> <strong>Download a single zip file that contains all these files.</strong></a>\
                                          <br><em>* Please note that this is a ' +file_size +' file which may timeout on some hosts.</em></p>';

                      }
                      else {
                          row_no++;
                          var classname = '';
                          if(row_no%2!=0){
                              classname ='alternate';
                          }

                          html_data += '<tr class="' + classname + '" id="row' + row_no +'">\
                          <td><a class="downloadbackuplink" href="'+ zip_name +'">'+ zip_name +'</a></td> \
                          <td>' + file_size +'</td> \
                        </tr>';
                      }
                });

                html_data += html_backupset + '</tbody></table></div>';
                $('#TB_ajaxContent').html(html_data);
                wpbackitup_add_downloadbackup_onclick();
            }
            else {
                unexpected_alert(response, null, null);
            }
          })

          .fail(function(response, textStatus, errorThrown) {
              unexpected_alert(response, textStatus, errorThrown);
          });
  }


  function unexpected_alert(response, textStatus, errorThrown){

      var error_message = 'Error-Invalid response from server:  ';
      if (textStatus) error_message += textStatus + '\n';
      if (errorThrown) error_message += errorThrown + '\n';
      error_message += '\nResponse: \n\n' +JSON.stringify(response);

      alert(error_message);
  }

  /* get restore status */
  function wpbackitup_get_restore_status() {

    var restore_action = {
          action: wpbackitup_get_action_name('restore_status_reader'),job_id: current_job_id
      };

    $.post(ajaxurl, restore_action , function(response) {
       /* Get response from log reader */
      var xmlObj = $(response);

           /* For each response */
            xmlObj.each(function() {

              /* Select correct status */
              var attributename = "." + $(this).attr('class');
              var icon_attributename = "." + $(this).attr('class') + '-icon';

              //Hide all
              if ( $(this).html() == 0 ) {
  
                $(attributename).find(".status").hide();
                $(attributename).find(".status-icon").hide(); 

              } 

              //Processing
              if ( $(this).html() == 1 ) {
  
                $(icon_attributename).css('visibility', 'visible');
                $(attributename).find(".status").fadeOut(200);
                $(attributename).find(".status-icon").fadeIn(1500); 

              } 

              //Done
              if ( $(this).html() == 2 ) {
                
                /* If status returns 1, display 'Done' or show detailed message */
                $(attributename).find(".status-icon").fadeOut(200);
                $(attributename).find(".status").fadeIn(1500);
                
              }

              //Fatal Error
              if ( $(this).html() == -1 ) {
  
                $(attributename).find(".status-icon").fadeOut(200);
                $(attributename).find(".fail").fadeIn(1500); 
                $(attributename).find(".isa_error").fadeIn(1500);

                 /*  Stop status reader */
                 clearInterval(window.intervalDefine);                 

              } 

              //Warning
              if ( $(this).html() == -2 ) {

                $(attributename).find(".isa_warning").fadeIn(1500);

              } 

              //success
              if ( $(this).html() == 99 ) {

                $(attributename).find(".isa_success").fadeIn(1500);

                /*  Stop statusreader */
                clearInterval(window.intervalDefine);

              } 

            });
    });
  }

    /* get backup status */
    function wpbackitup_get_backup_status() {
        var backup_action = {
            action: wpbackitup_get_action_name('backup_status_reader'),job_id: current_job_id
        };

        $.post(ajaxurl, backup_action, function(response) {
            /* Get response from log reader */

            //if backup was cancelled then stop processing
            if (backup_cancelled){
                /*  Stop statusreader */
                clearInterval(window.intervalDefine);

                //shut down the backup UI
                $('.status-icon').fadeOut(200);
                $("#backup-button").removeAttr("disabled");
                $("#cancel-button").fadeOut(200);
                $('.backup-cancelled').fadeIn(200);

                return false;
            }

            var xmlObj = $(response);

            /* For each response */
            xmlObj.each(function() {

                /* Select correct status */
                var attributename = "." + $(this).attr('class');
                var icon_attributename = "." + $(this).attr('class') + '-icon';

                //Hide all
                if ( $(this).html() == 0 ) {

                    $(attributename).find(".status").hide();
                    $(attributename).find(".status-icon").hide();

                }

                //Processing
                if ( $(this).html() == 1 ) {

                    $(icon_attributename).css('visibility', 'visible');
                    $(attributename).find(".status").fadeOut(200);
                    $(attributename).find(".status-icon").fadeIn(1500);

                }

                //Done
                if ( $(this).html() == 2 ) {

                    $(attributename).find(".status-icon").fadeOut(200);
                    $(attributename).find(".status").fadeIn(1500);

                }

                //Fatal Error
                if ( $(this).html() == -1 ) {

                    $(attributename).find(".status-icon").fadeOut(200);
                    $(attributename).find(".fail").fadeIn(1500);


                    /*  Stop status reader */
                    clearInterval(window.intervalDefine);

                    //Show error status
                    wpbackitup_get_backup_response();
                }

                //Warning
                if ( $(this).html() == -2 ) {

                    $(attributename).find(".status-icon").fadeOut(200);
                    $(attributename).find(".wpbackitup-warning").fadeIn(1500);

                }

                //success
                if ( $(this).html() == 99 ) {

                    /* If status returns 1, display 'Done' or show detailed message */
                    $(attributename).find(".status-icon").fadeOut(200);
                    $(attributename).find(".status").fadeIn(1500);

                    /*  Stop statusreader */
                    clearInterval(window.intervalDefine);

                    //Show error status
                    wpbackitup_get_backup_response();

                }

            });
        });
    }

    //global to track backup response.
    var backup_response=false;
    /* define backup response_reader function */
    function wpbackitup_get_backup_response() {
    //This function is required because of 504 gateway timeouts

        var jqxhr = $.ajax({
            url: ajaxurl,
            type: 'POST',
            data: {action: wpbackitup_get_action_name('backup_response_reader')},
            dataType: "json"
        });

        jqxhr.always(function(jsonData, textStatus, errorThrown) {
            console.log("Backup Response:" + JSON.stringify(jsonData));

            if (typeof  jsonData.backupStatus !== 'undefined' && typeof  jsonData.backupMessage !== 'undefined')
            {
                console.log("JSON Backup Status:" + jsonData.backupStatus);
                console.log("JSON Backup Message:" + jsonData.backupMessage);

                //If response aleady received
                if (backup_response) return;
                backup_response=true;

                switch (jsonData.backupStatus) {
                    case 'success':
                        console.log("JSON success response received.");
                        //fade out all of the spinners
                        $('.status-icon').fadeOut(200);
                        $("#backup-button").removeAttr("disabled"); //enable button
                        $("#cancel-button").addClass('cancel-hidden');

                        $('.isa_success').show;
                        $('.backup-success').fadeIn(1500);

                        wpbackitup_processRow_backup(jsonData);

                        //Are there any warnings?
                        if (typeof  jsonData.backupWarnings !== 'undefined'){
                            var warning = $('.backup-warning');

                            var $warningMessages = jsonData.backupWarnings;
                            $warningMessages.forEach(function(obj) {
                                var  warningMessage = obj.warningMessage;
                                warning.append('<li class="isa_warning">' + wpbackitup_local.warning + ': ' + warningMessage + '</li>');
                            });

                            warning.fadeIn(1500);
                        }

                        break;

                    case 'error':
                        console.log("JSON error response received.");

                        var msg= wpbackitup_local.unexpected_err;
                        if (typeof  jsonData.backupMessage !== 'undefined'){
                            msg= jsonData.backupMessage;
                        }
                        var status_message=wpbackitup_local.error + ': &nbsp;' + msg;

                        var backup_error= $('.backup-error');
                        backup_error.html(status_message);
                        backup_error.addClass("isa_error");
                        backup_error.fadeIn(1500);

                        //fade out all of the spinners
                        $('.status-icon').fadeOut(200);
                        $("#backup-button").removeAttr("disabled"); //enable button
                        $("#cancel-button").addClass('cancel-hidden');

                        break;

                    default:
                        console.log("Unexpected JSON response status received.");

                        var msg= wpbackitup_local.unexpected_err2;
                        if (typeof  jsonData.backupMessage !== 'undefined'){
                            msg= jsonData.backupMessage;
                        }
                        var status_message= wpbackitup_local.error + '(JS998) : &nbsp;' + msg;

                        var unexpected_error= $('.backup-error');
                        unexpected_error.html(status_message);
                        unexpected_error.addClass("isa_error");
                        unexpected_error.fadeIn(1500);

                        //fade out all of the spinners
                        $('.status-icon').fadeOut(200);
                        $("#backup-button").removeAttr("disabled"); //enable button
                        $("#cancel-button").addClass('cancel-hidden');

                        break;

                }

            } else { //Didnt get any json back
                console.log("NON JSON response received.");
                console.log("Backup Response:" + errorThrown);
                status_message= wpbackitup_local.unexpected_err3 + ': &nbsp;';
                status_message+= '</br>' + wpbackitup_local.response + ': &nbsp;' + JSON.stringify(jsonData);
                status_message+= '</br>' + wpbackitup_local.status + ': &nbsp;' + textStatus;
                status_message+= '</br>' + wpbackitup_local.error + ': &nbsp;' +  JSON.stringify(errorThrown);

                $('.backup-status').hide();

                var unexpected_error= $('.backup-error');
                unexpected_error.html(status_message);
                unexpected_error.addClass("isa_error");
                unexpected_error.show();

                $('.status-icon').fadeOut(200);
            }
        });
    }

    // Notification Widget close
    $("#wp-backitup-notification-widget-close").click(function() {
        notification_bar = $( "#wp-backitup-notification-widget");
        notification_bar.fadeOut("slow");

        //ajax call to delete it from the transient array
        var jqxhr = $.ajax({
            url: ajaxurl,
            type: 'POST',
            data: {action: wpbackitup_get_action_name('delete_transient')},
            dataType: "json"
        });


        jqxhr.always(function(jsonData, textStatus, errorThrown) {
            if(jsonData !== false){
                notification_bar.removeClass();
                notification_bar.addClass('notice');
                notification_bar.addClass('notice-'+jsonData.message_type);
                $("#wp-backitup-notification-widget-message p").html(jsonData.message);
                notification_bar.hide().fadeIn("slow");
            }
        });
        
    });

    //Save Schedule CLICK
    $("#wp-backitup-notification-close").click(function() {
        wpbackitup_dismiss_message();
    });


    //Save Schedule CLICK
    $("#wp-backitup-save_schedule_form").submit(function() {

        var formData = new FormData();
        formData.append('action', wpbackitup_get_action_name('update-schedule'));
        formData.append('_wpnonce', $('#wp-backitup_nonce-update-schedule').val());
        formData.append('_wp_http_referer',$("[name='_wp_http_referer']").val());

        var days_selected = [];
        $.each($("input[name='dow']:checked"), function(){
            days_selected.push($(this).val());
        });

        formData.append('days_selected', days_selected);

        jQuery.ajax({
            url: ajaxurl,
            type: 'POST',
            cache: false,
            contentType: false,
            processData: false,
            dataType: "json",
            data: formData,

            success: function(data, textStatus, jqXHR){
                response=data.message;
                console.log("Success:" + response);

                //Turn on the notification bar
                switch (response)
                {
                case 'success':
                    wpbackitup_show_success_message(wpbackitup_local.scheduled_saved);
                    break;
                case 'error':
                    wpbackitup_show_error_message(wpbackitup_local.scheduled_not_saved);
                    break;
                default:

                }

            },
            error: function(jqXHR, textStatus, errorThrown){
                console.log("Error." + textStatus +':' +errorThrown);
            },
            complete: function(jqXHR, textStatus){
                console.log("Complete");
            }
        });

        return false;

    });

  // Tracking ajax request.
  var jqxhr = null;

  // BACKUP button click
  $(".backup-button").click(function(e) {
    e.preventDefault();

    backup_cancelled = false;
    $("#backup-button").attr('disabled', 'disabled'); //Disable button
    $("#cancel-button").removeClass('cancel-hidden');
    $("#cancel-button").removeAttr("disabled");
    $("#cancel-button").fadeIn(200);



      jqxhr = $.ajax({
          url: ajaxurl,
          type: 'POST',
          data: {action: wpbackitup_get_action_name('backup')},
          cache: false,
          dataType: "json",

      beforeSend: function(jqXHR, settings) {
          console.log("BeforeSend:Nothing to report.");
          wpbackitup_show_backup();
      }
    });

      //Fetch the JSON response file if it exists
      jqxhr.always(function(data, textStatus, errorThrown) {
          console.log("Backup Button Click - Always");
          console.log(data.message);//backup queued?

          if (typeof data.job_id !== 'undefined'){
              current_job_id=data.job_id;
              console.log("Job_Id:" + data.job_id);
          }else{
              console.log("No Job Id found:" + data);
          }
      });
  });

    function wpbackitup_show_backup(){
        /* display processing icon */
        $('.backup-icon').css('visibility', 'visible');
        $('.backup-icon').show();

        /* hide default message */
        $('.backup-success').hide();
        $('.default-status').hide();
        $('.backup-error').hide();
        $(".backup-cancelled").hide();

        /* hide the status just incase this is the second run */
        $("ul.backup-status").children().children().hide();
        $(".backup-errors").children().children().hide();
        $(".backup-success").children().children().hide();

        /* show backup status, backup errors */
        $('.backup-status').show();
        backup_response=false;
        window.intervalDefine = setInterval(wpbackitup_get_backup_status, 5000);
    }

  // Cancel button click
  var backup_cancelled = false;
  $(".cancel-button").click(function(e) {
    e.preventDefault();

    $("#cancel-button").attr('disabled', 'disabled'); //Disable button

      // abort previous ajax call
      if(jqxhr != null){
        jqxhr.abort();
        jqxhr = null;
      }


      jqxhr = $.ajax({
          url: ajaxurl,
          type: 'POST',
          data: {action: wpbackitup_get_action_name('cancel_backup'),job_id: current_job_id},
          cache: false,
          dataType: "json",

      beforeSend: function(jqXHR, settings) {
          console.log("BeforeSend:Nothing to report.");
          wpbackitup_show_cancel_backup();
      }
    });

      //Fetch the JSON response file if it exists
      jqxhr.always(function(data, textStatus, errorThrown) {
          console.log("Cancel Button Click - Always");
          console.log(data);

          if (typeof data.success !== 'undefined' && data.success==true){
              console.log("Job Cancelled successfully");
          }else{
              console.log("Job was not cancelled successfully");
          }

          backup_cancelled = true;
      });
  });

    function wpbackitup_show_cancel_backup(){
        /* display processing icon */
        $('.backup-icon').css('visibility', 'visible');
        $('.backup-icon').show();

        /* show backup status, backup errors */
        $('.backup-status').show();
        backup_response=false;
        clearInterval(window.intervalDefine);
        window.intervalDefine = setInterval(wpbackitup_get_backup_status, 5000);
    }

    //RESTORE button click
    $('#datatable').on('click', 'a.restoreRow', function(e) {
        e.preventDefault();

        if (confirm(wpbackitup_local.confirm_restore))
        {
            var filename = this.title;
            var row = this.id.replace('restoreRow', 'row');
            userid = $('input[name=user_id]').val();

            var jqxhr = $.ajax({
                url: ajaxurl,
                type: 'post',
                data: {action: wpbackitup_get_action_name('restore'), selected_file: filename,user_id: userid},
                cache: false,
                dataType: "json",

                //success: function(response) {
                //   /* Return PHP messages, used for development */
                //    $("#php").html(response);
                //
                //    //clearInterval(window.intervalDefine);
                //     var data = $.parseJSON(response);
                //
                //},
                beforeSend: function () {
                    console.log("BeforeSend:Nothing to report.");
                    wpbackitup_show_restore();
                }
            });

            //Fetch the JSON response file if it exists
            jqxhr.always(function(data, textStatus, errorThrown) {
                //console.log("Restore Button Click - Always");
                //console.log("Response:" + data);

                if (typeof data.job_id !== 'undefined'){
                    current_job_id=data.job_id;
                    console.log("Job_Id:" + data.job_id);
                }else{
                    console.log("No Job Id found:" + data);
                }

            });
        }
    });


    function wpbackitup_show_restore(){
        /* display processing icon */
        $('.restore-icon').css('visibility', 'visible');

        /* hide default message, backup status and backup errors */
        $('.default-status, .upload-status').hide();

        $("ul.restore-status").children().children().hide();
        $(".restore-errors").children().children().hide();
        $(".restore-success").children().children().hide();

        /* show restore status messages */
        $('.restore-status, .restore-errors, .restore-success').show();
        $('.preparing-icon').css('visibility', 'visible');
        $('.preparing').find(".status-icon").fadeIn(1500);

        window.intervalDefine = setInterval(wpbackitup_get_restore_status, 5000);
    }

  // DELETE file action
  $('#datatable').on('click', 'a.deleteRow', function(e) {

    e.preventDefault();

    if (confirm(wpbackitup_local.sure))
    {
      var filename = this.title;
      var post_id = $(this).data('id');
      var row = this.id.replace('deleteRow', 'row');

      $.ajax({
        url: ajaxurl,
        type: 'post',
        data: {action: wpbackitup_get_action_name('delete_file'), filed: filename, post_id: post_id},
        success: function(data) {
          var found_pos = data.search("deleted");//must start in pos 0
          if (found_pos == 0)
          {
            $('#' + row).remove();
          }
          else
          {
            alert(wpbackitup_local.file_not_del);
          }
        }
      });
    }
    else
    {
      return;
    }
  });

  //UPLOADS
  //http://www.plupload.com/example_events.php
  function plupload_init(plupload_config) {

        var uploader = new plupload.Uploader(plupload_config);
        uploader.init();

        //File Added event
        uploader.bind('FilesAdded', function(up, files){
            plupload.each(files, function(file){
                //add some file name validation here?
                $('#filelist').append(
                    '<div id="media-item-' + file.id + '" class="media-item child-of-0">' +
                    '<img class="pinkynail" alt="" src="' + site_url + '/wp-includes/images/media/archive.png">' +
                    '<div class="filename new" id="' + file.id + '">' +
                    file.name + ' (<span>' + plupload.formatSize(0) + '</span> of ' + plupload.formatSize(file.size) + ') ' +
                    '<div class="progress" style="width: 0%;"></div></div></div>');
            });

            up.refresh();
            up.start();
        });

        //File Progress Event
        uploader.bind('UploadProgress', function(up, file) {
            $('#' + file.id + " .progress").width((file.percent *.15 )+ "%");
            $('#' + file.id + " span").html(plupload.formatSize(parseInt(file.size * file.percent / 100)));
        });

      //Chunked upload
      uploader.bind(' ChunkUploaded', function(up, file,info) {
          console.log('Chunk Uploaded:');
          console.log(info);

          if (is_plupload_error(info,up,file)){
              console.log('chunk error');
          }

      });

        //Error Event
        uploader.bind('Error', function(up, error) {
            console.log('PlUpload Error:');
            console.log(error);

            var error_div = "error-item-"+ error.file.id;

            //If error div NOT exists then add it
            //Chunk and file uploaded both will call this routine
            if (! $('#'+ error_div).length){
                $('#filelist').append(
                    '<div class="error-div error" id="' + error_div + '" >' +
                    '<strong>' + error.file.name + ' has failed to upload due to error:&nbsp;</strong> <span>' + error.message + '</span> ' +
                    '</div>'
                );
            }


        });


        // a file was uploaded
        uploader.bind('FileUploaded', function(up, file, response) {
            console.log('File Uploaded');
            console.log(response);


            if (is_plupload_error(response,up,file)){
                console.log('uploaded error')
            }else{
                console.log('uploaded success')
                $('#' + file.id + " .progress").css("background-color", "green");
                $('#import-uploads').show();
            }

    });
  }

  function is_plupload_error(response,uploader,file){
      if (response.status == '200') {
          try {
              response_json = jQuery.parseJSON(response.response);

              if (response_json.error) {
                  plupload_error (uploader,file, 100, response_json.error)
                  return true;
              }

              //success
              return false;


          } catch (err) {
              console.log('Unexpected JSON Error' + err);
              plupload_error (uploader,file, 998, response.response)
              return true;
          }

      } else {
          alert('Unknown server response status: '+response.code);
          console.log(response);
          plupload_error (uploader,file, 999, response.response)
          return true;
      }

  }
  function plupload_error (uploader,file, code, error_message){

          file.status = plupload.FAILED;
          uploader.trigger("Error", {
              code: code,
              message: error_message,
              file: file
          });

          //remove upload from list
          $('#media-item-' + file.id).hide();
  }

  function wpbackitup_processRow_backup(data)
  {
    console.log(data);
    // decide class of row to be inserted dynamically
    var css_class;
    css_class = 'class="success-grid"';

    if (!$('#datatable tr').first().hasClass('alternate'))
      css_class = 'class="alternate success-grid"';
    // decided class of row to be inserted dynamically

    // build id of the row to be inserted dynamically
    var  cur_row = ($('#datatable tr:last')[0].id.replace('row', ''));
    cur_row++;

    // built id of the row to be inserted dynamically
    if (typeof data !== 'undefined')
    {
      //var restoreColumn = '<td><a href="#" title="' + data.backupFile + '" class="restoreRow" id="restoreRow' + cur_row + '">Restore</a></td>\n';

      var viewColumn = '<td class="word-capitalize">'+ data.backupRuntype +'</td>\n<td>' + data.backupDate + '</td>\n';
      viewColumn += '<td>'+ data.backupDuration +'</td>\n';
      if(data.backupMessage) {
          viewColumn += '<td>'+ data.backupMessage +'</td>\n';
      }

      // generate inline id
      var str = data.backupName;
      var inlineId = str.replace(/[^A-Za-z0-9\-]/g, '');

      var start = str.lastIndexOf("_");
      var jobId = str.substring(start+1);
      //var jobId = str.replace(/[^0-9\-]/g, '');

      var newRow =
        '<tr ' + css_class + ' id="row' + cur_row + '">\n\
          <td><a href="#TB_inline?width=600&height=550&inlineId='+ inlineId + '" class="thickbox" title="Download Backup" name="'+ data.backupName +'" data-jobid="'+jobId+'"><i class="fa fa-download"></i> ' + data.backupName + '</a></td>\n';
        newRow += viewColumn;
        //newRow +='<td><a href="#" title="' + data.backupName + '" class="deleteRow" id="deleteRow' + cur_row + '">' + wpbackitup_local.delete + '</a></td>\n';
        newRow += '<td>&nbsp;</td>';
        newRow +='</tr>';

      if ($('#nofiles'))
        $('#nofiles').remove();

      var total_rows = $('#datatable tr').length;
      $('#datatable').prepend(newRow);
      $('#datatable tr:first').hide().show('slow'); // just an animation to show newly added row
      
      //if(total_rows >= data.backupRetained)
      //  $('#datatable tr:last').hide();

        wpbackitup_add_viewlog_onclick();

        wpbackitup_add_downloadbackup_onclick();

    }
  }

    function wpbackitup_processRow_restore(data)
    {
        // decide class of row to be inserted dynamically
        var css_class;
        css_class = '';

        if (!$('#datatable tr').first().hasClass('alternate'))
            css_class = 'class="alternate"';
        // decided class of row to be inserted dynamically

        // build id of the row to be inserted dynamically
        var  cur_row = ($('#datatable tr:last')[0].id.replace('row', ''));
        cur_row++;

        // built id of the row to be inserted dynamically
        if (data != undefined)
        {
            var restoreColumn = '<td><a href="#" title="' + data.file + '" class="restoreRow" id="restoreRow' + cur_row + '">' + wpbackitup_local.restore + '</a></td>\n';
            var newRow =
                '<tr ' + css_class + ' id="row' + cur_row + '">\n\
          <td>' + wpbackitup_local.uploaded_backup + '<i class="fa fa-long-arrow-right"></i>' + data.file +'</td>\n\
          <td><a href="' + data.zip_link + '">' + wpbackitup_local.download + '</a></td>\n\
          <td><a href="#" title="' + data.file + '" class="deleteRow" id="deleteRow' + cur_row + '">' + wpbackitup_local.delete + '</a></td>\n\
          <td><a href="#" title="' + data.file + '" class="restoreRow" id="restoreRow' + cur_row + '">' + wpbackitup_local.restore + '</a></td>\n\
         </tr>';

            if ($('#nofiles'))
                $('#nofiles').remove();

            var total_rows = $('#datatable tr').length;
            $('#datatable').prepend(newRow);
            $('#datatable tr:first').hide().show('slow'); // just an animation to show newly added row

            if(total_rows >= data.retained)
                $('#datatable tr:last').hide();
        }
    }


    function wpbackitup_get_action_name(action) {
        return namespace + '_' + action;
    }

    function wpbackitup_dismiss_message(){
        notification_bar = $( "#wp-backitup-notification-parent");
        notification_bar.fadeOut( "slow" )
    }

    function wpbackitup_show_success_message(message){
        notification_bar_message = $( "#wp-backitup-notification-message");
        notification_bar_message.html("<p>" + message + "</p>");

        notification_bar = $( "#wp-backitup-notification-parent");
        notification_bar.toggleClass("error",false);
        notification_bar.toggleClass("updated",true);

        notification_bar.show();
        $('html, body').animate({ scrollTop: 0 }, 'slow');
    }

    function wpbackitup_show_error_message(message){
        notification_bar_message = $( "#wp-backitup-notification-message");
        notification_bar_message.html("<p>" + message + "</p>");

        notification_bar = $( "#wp-backitup-notification-parent");
        notification_bar.toggleClass("updated",false);
        notification_bar.toggleClass("error",true);

        notification_bar.show();
        $('html, body').animate({ scrollTop: 0 }, 'slow');
    }

    //**TEST METHODS**//

    //wpbackitup_show_restore();
    //wpbackitup_show_backup();

})(jQuery);