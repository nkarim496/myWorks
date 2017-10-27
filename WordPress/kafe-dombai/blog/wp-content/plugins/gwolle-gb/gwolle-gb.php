<?php
/*
Plugin Name: Gwolle Guestbook
Plugin URI: http://zenoweb.nl
Description: Gwolle Guestbook is not just another guestbook for WordPress. The goal is to provide an easy and slim way to integrate a guestbook into your WordPress powered site. Don't use your 'comment' section the wrong way - install Gwolle Guestbook and have a real guestbook.
Version: 1.7.0
Author: Marcel Pol
Author URI: http://zenoweb.nl
License: GPLv2 or later
Text Domain: gwolle-gb
Domain Path: /lang/
*/

/*  Copyright 2009       Wolfgang Timme  (email: gwolle@wolfgangtimme.de)
	Copyright 2014-2016  Marcel Pol      (email: marcel@timelord.nl)

	This program is free software; you can redistribute it and/or modify
	it under the terms of the GNU General Public License as published by
	the Free Software Foundation; either version 2 of the License, or
	(at your option) any later version.

	This program is distributed in the hope that it will be useful,
	but WITHOUT ANY WARRANTY; without even the implied warranty of
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
	GNU General Public License for more details.

	You should have received a copy of the GNU General Public License
	along with this program; if not, write to the Free Software
	Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
*/


// Plugin Version
define('GWOLLE_GB_VER', '1.7.0');


/*
 * Todo List:
 *
 * - Entries Admin page, make columns sortable, add order parameters to get* functions.
 * - On Page editor, have a postbox with link to the guestbook admin entries.
 * - Add all the hooks to the readme.
 * - Add comments to translations.
 * - When saving new date in editor, change date in postbox too.
 * - Check if formdata array is still needed in posthandling.php.
 * - Simplify checking the array of user_ids in gwolle_gb_notification() (in_array).
 * - Use role__in and role__not_in for WP_User_Query (add to Codex).
 * - Add rel="next" attributes: https://news.ycombinator.com/item?id=11515888
 * - Test install function: https://wordpress.org/support/topic/install-failure-5?replies=6#post-8319224
 * - Test Debian 7 and Ubuntu 10.04 for Emoji: https://wordpress.org/support/topic/emoji-test-failed?replies=12
 *   There are Emoji characters that do not get encoded maybe?
 */


/*
 * Definitions
 */
define('GWOLLE_GB_FOLDER', plugin_basename(dirname(__FILE__)));
define('GWOLLE_GB_DIR', WP_PLUGIN_DIR . '/' . GWOLLE_GB_FOLDER);


global $wpdb;

// Declare database table names
$wpdb->gwolle_gb_entries = $wpdb->prefix . 'gwolle_gb_entries';
$wpdb->gwolle_gb_log = $wpdb->prefix . 'gwolle_gb_log';


// Classes
include_once( GWOLLE_GB_DIR . '/functions/class-entry.php' );

// Functions for the frontend
include_once( GWOLLE_GB_DIR . '/frontend/captcha-ajax.php' );
include_once( GWOLLE_GB_DIR . '/frontend/infinite_scroll.php' );
include_once( GWOLLE_GB_DIR . '/frontend/shortcodes.php' );
include_once( GWOLLE_GB_DIR . '/frontend/pagination.php' );
include_once( GWOLLE_GB_DIR . '/frontend/posthandling.php' );
include_once( GWOLLE_GB_DIR . '/frontend/read.php' );
include_once( GWOLLE_GB_DIR . '/frontend/rss.php' );
include_once( GWOLLE_GB_DIR . '/frontend/write.php' );

// Functions and pages for the backend
include_once( GWOLLE_GB_DIR . '/admin/ajax.php' );
include_once( GWOLLE_GB_DIR . '/admin/page-editor.php' );
include_once( GWOLLE_GB_DIR . '/admin/page-entries.php' );
include_once( GWOLLE_GB_DIR . '/admin/page-export.php' );
include_once( GWOLLE_GB_DIR . '/admin/page-gwolle-gb.php' );
include_once( GWOLLE_GB_DIR . '/admin/page-import.php' );
include_once( GWOLLE_GB_DIR . '/admin/page-settings.php' );
include_once( GWOLLE_GB_DIR . '/admin/pagination.php' );
include_once( GWOLLE_GB_DIR . '/admin/upgrade.php' );

// Tabs for page-settings.php
include_once( GWOLLE_GB_DIR . '/admin/tabs/formtab.php' );
include_once( GWOLLE_GB_DIR . '/admin/tabs/readingtab.php' );
include_once( GWOLLE_GB_DIR . '/admin/tabs/admintab.php' );
include_once( GWOLLE_GB_DIR . '/admin/tabs/antispamtab.php' );
include_once( GWOLLE_GB_DIR . '/admin/tabs/emailtab.php' );
include_once( GWOLLE_GB_DIR . '/admin/tabs/debugtab.php' );
include_once( GWOLLE_GB_DIR . '/admin/tabs/uninstalltab.php' );

// General Functions
include_once( GWOLLE_GB_DIR . '/functions/akismet.php' );
include_once( GWOLLE_GB_DIR . '/functions/bbcode_emoji.php' );
include_once( GWOLLE_GB_DIR . '/functions/compatibility.php' );
include_once( GWOLLE_GB_DIR . '/functions/debug.php' );
include_once( GWOLLE_GB_DIR . '/functions/formatting.php' );
include_once( GWOLLE_GB_DIR . '/functions/get_entries.php' );
include_once( GWOLLE_GB_DIR . '/functions/get_entry_count.php' );
include_once( GWOLLE_GB_DIR . '/functions/log.php' );
include_once( GWOLLE_GB_DIR . '/functions/mail.php' );
include_once( GWOLLE_GB_DIR . '/functions/messages.php' );
include_once( GWOLLE_GB_DIR . '/functions/misc.php' );

// WordPress Hooks
include_once( GWOLLE_GB_DIR . '/hooks.php' );

// Frontend Widget
include_once( GWOLLE_GB_DIR . '/frontend/widget.php' );

// Dashboard Widget (for the WP-Admin dashboard)
include_once( GWOLLE_GB_DIR . '/admin/dashboard-widget.php' );


/*
 * Trigger an install/upgrade function when the plugin is activated.
 */
function gwolle_gb_activation( $networkwide ) {
	global $wpdb;

	$current_version = get_option( 'gwolle_gb_version' );

	if ( function_exists('is_multisite') && is_multisite() ) {
		$blogids = $wpdb->get_col("SELECT blog_id FROM $wpdb->blogs");
		foreach ($blogids as $blog_id) {
			switch_to_blog($blog_id);
			if ( $current_version == false ) {
				gwolle_gb_install();
			} elseif ($current_version != GWOLLE_GB_VER) {
				gwolle_gb_upgrade();
			}
			restore_current_blog();
		}
	} else {
		if ( $current_version == false ) {
			gwolle_gb_install();
		} elseif ($current_version != GWOLLE_GB_VER) {
			gwolle_gb_upgrade();
		}
	}
}
register_activation_hook(__FILE__, 'gwolle_gb_activation');


/* Translate Description */
function gwolle_gb_description() {
	$var = __( "Gwolle Guestbook is not just another guestbook for WordPress. The goal is to provide an easy and slim way to integrate a guestbook into your WordPress powered site. Don't use your 'comment' section the wrong way - install Gwolle Guestbook and have a real guestbook.", 'gwolle-gb' );
	$var = __( "Gwolle Guestbook is the WordPress guestbook you've just been looking for. Beautiful and easy.", 'gwolle-gb' );
}
