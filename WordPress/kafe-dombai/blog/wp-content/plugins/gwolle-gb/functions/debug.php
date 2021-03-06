<?php


/*
 * Add debug info to debug tab on the settings page.
 *
 * Since 1.6.2
 */
function gwolle_gb_debug_info() {
	global $wp_version, $wp_db_version, $wpdb;

	if ( function_exists('current_user_can') && !current_user_can('manage_options') ) {
		return;
	} ?>

	<tr>
		<th><?php _e('WordPress version:', 'gwolle-gb'); ?></th>
		<td><?php echo $wp_version . ' (db: ' . $wp_db_version . ')'; ?></td>
	</tr>

	<tr>
		<th><?php _e('WordPress theme:', 'gwolle-gb'); ?></th>
		<td><?php
			if (version_compare($wp_version,'3.4', '>=')) {
				echo wp_get_theme()->get('Name');
			} else {
				echo get_current_theme();
			} ?>
		</td>
	</tr>

	<tr>
		<th><?php _e('Active plugins:', 'gwolle-gb'); ?></th>
		<td><?php
			$active_plugins = get_option('active_plugins');
			print_r( $active_plugins ); ?>
		</td>
	</tr>

	<tr>
		<th><?php _e('PHP Version:', 'gwolle-gb'); ?></th>
		<td><?php echo PHP_VERSION; ?></td>
	</tr>

	<tr>
		<th><?php _e('MySQL Version:', 'gwolle-gb'); ?></th>
		<td><?php
			$mysql_version = $wpdb->get_var('SELECT VERSION()');
			echo $mysql_version; ?>
		</td>
	</tr>

	<tr>
		<th><?php _e('MySQL Charset:', 'gwolle-gb'); ?></th>
		<td><?php
			echo __('MySQL Charset:', 'gwolle-gb') . ' ' . $wpdb->charset;

			if ( method_exists($wpdb, 'get_col_charset') ) {
				$charset = $wpdb->get_col_charset( $wpdb->gwolle_gb_entries, 'content' );
				echo '<br />' . __('MySQL Column Charset:', 'gwolle-gb') . ' ' . $charset;
			} ?>
		</td>
	</tr>

	<tr>
		<th><?php _e('MySQL / MySQLi:', 'gwolle-gb'); ?></th>
		<td><?php
			if ( $wpdb->use_mysqli == true ) {
				echo "mysqli";
			} else {
				echo "mysql";
			} ?>
		</td>
	</tr>

	<tr>
		<th><?php _e('MySQL variables:', 'gwolle-gb'); ?></th>
		<td><?php
			$mysql_variables = (array) $wpdb->get_results('SHOW VARIABLES', ARRAY_N);
			$mysql_variables_char = array();
			foreach ( $mysql_variables as $variable ) {
				$pattern = '/^char/';
				if ( preg_match( $pattern, $variable[0], $matches ) ) {
					$mysql_variables_char[$variable[0]] = $variable[1];
				}
			}
			print_r( $mysql_variables_char );
			?>
		</td>
	</tr>

	<?php
}


/*
 * Test adding an entry
 */
function gwolle_gb_test_add_entry( $emoji = false ) {
	// Sample data
	$content = __('Test entry, delete if you wish.', 'gwolle-gb');
	$data = array(
		'author_name'     => 'Marcel Pol',
		'author_id'       => 0,
		'author_email'    => 'marcel@timelord.nl',
		'author_origin'   => 'Zwolle',
		'author_website'  => 'http://timelord.nl',
		'author_ip'       => '192.168.1.254',
		'author_host'     => 'timelord.nl',
		'content'         => $content,
		'datetime'        => current_time( 'timestamp' ),
		'ischecked'       => 0,
		'checkedby'       => 0,
		'istrash'         => 1,
		'isspam'          => 0,
		'admin_reply'     => __('Just a test', 'gwolle-gb'),
		'admin_reply_uid' => 0,
		'book_id'         => 1
	);
	if ( $emoji ) {
		$data['content'] = gwolle_gb_maybe_encode_emoji( $content . ' 😄👍👌', 'content' );
	}

	$entry = new gwolle_gb_entry();

	$set_data = $entry->set_data( $data );
	$entry_id = 0;

	if ( $set_data ) {
		$entry_id = $entry->save();
	}

	return $entry_id;
}
