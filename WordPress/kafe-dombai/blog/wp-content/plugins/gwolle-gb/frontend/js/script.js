/*
 * JavaScript for Gwolle Guestbook Frontend.
 */


/*
 * Event for clicking the button, and getting the form visible.
 */
jQuery(document).ready(function($) {
	jQuery( "#gwolle_gb_write_button input" ).click(function() {
		document.getElementById("gwolle_gb_write_button").style.display = "none";
		jQuery("#gwolle_gb_new_entry").slideDown(1000);
		return false;
	});
});


/*
 * Event for clicking the readmore, and getting the full content of that entry visible.
 */
jQuery(document).ready(function($) {
	jQuery( ".gwolle_gb_readmore" ).click(function() {
		var content_div = jQuery(this).parent().parent();
		jQuery( content_div ).find('.gb-entry-excerpt').css( 'display', 'none' );
		jQuery( content_div ).find('.gb-entry-full_content').slideDown(500);
		return false;
	});
});


/*
 * Event for Infinite Scroll. Get more pages when you are at the bottom.
 */

var gwolle_gb_scroll_on = true; // The end has not been reached yet. We still get entries back.
var gwolle_gb_scroll_busy = false; // Handle async well. Only one request at a time.

jQuery(document).ready(function($) {
	if ( jQuery( "#gwolle_gb_entries" ).hasClass( 'gwolle_gb_infinite' ) ) {
		var gwolle_gb_scroll_count = 2;

		var gwolle_gb_load_message = '<div class="gb-entry gwolle_gb_load_message">' + gwolle_gb_frontend_script.load_message + '</div>' ;
		jQuery( "#gwolle_gb" ).append( gwolle_gb_load_message );

		jQuery(window).scroll(function() {
			// have 10px diff for sensitivity.
			if ( ( jQuery(window).scrollTop() > jQuery(document).height() - jQuery(window).height() -10 ) && gwolle_gb_scroll_on == true && gwolle_gb_scroll_busy == false) {
				gwolle_gb_scroll_busy = true;
				gwolle_gb_load_page(gwolle_gb_scroll_count);
				gwolle_gb_scroll_count++;
			}
		});
	}

	function gwolle_gb_load_page( page ) {

		jQuery('.gwolle_gb_load_message').toggle();

		var gwolle_gb_end_message = '<div class="gb-entry gwolle_gb_end_message">' + gwolle_gb_frontend_script.end_message + '</div>' ;

		var data = {
			action:  'gwolle_gb_infinite_scroll',
			pageNum: page,
			book_id: jQuery( "#gwolle_gb_entries" ).attr( "data-book_id" )
		};

		jQuery.post( gwolle_gb_frontend_script.ajax_url, data, function(response) {

			jQuery('.gwolle_gb_load_message').toggle();
			if ( response == 'false' ) {
				jQuery( "#gwolle_gb_entries" ).append( gwolle_gb_end_message );
				gwolle_gb_scroll_on = false;
			} else {
				jQuery( "#gwolle_gb_entries" ).append( response );
			}
			gwolle_gb_scroll_busy = false;

		});

		return true;
	}

});
