<?php
/**
 * Чистый Шаблон для разработки
 * Функции шаблона
 * http://dontforget.pro
 * @package WordPress
 * @subpackage clean
 */
register_nav_menus( array( // Регистрируем 2 меню
	'top' => 'Верхнее меню',
	'left' => 'Нижнее'
) );
add_theme_support('post-thumbnails'); // Включаем поддержку миниатюр
add_image_size('spec_thumb', 435, 290, true); 

if ( function_exists('register_sidebar') )
register_sidebar(); // Регистрируем сайдбар

function the_truncated_post($symbol_amount) {
	$filtered = strip_tags( preg_replace('@<style[^>]*?>.*?</style>@si', '', preg_replace('@<script[^>]*?>.*?</script>@si', '', apply_filters('the_content', get_the_content()))) );
	echo substr($filtered, 0, strrpos(substr($filtered, 0, $symbol_amount), ' ')) . '...';
}

function the_home_url() { //url без /blog в конце
	$url = get_home_url();
	echo substr($url, 0, -5);
}

function hidecategory($query) { // фильтр скрытых рубрик
if ( $query->is_home ) {
	$query->set('cat','-2');
	}
return $query;
}
add_filter('pre_get_posts', 'hidecategory');
?>
