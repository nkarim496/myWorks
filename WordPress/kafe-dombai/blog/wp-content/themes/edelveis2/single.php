<?php
/**
 * Чистый Шаблон для разработки
 * Шаблон вывода поста
 * http://dontforget.pro
 * @package WordPress
 * @subpackage clean
 */
get_header(); // Подключаем хедер?>
<!-- banner -->
<div class="banner banner-pat">
	<div class="fix-container">
			<h2 class="banner-title wow fadeInLeft" data-wow-delay=".25s"><?php the_title(); // Заголовок ?></h2>
		<div class="clear-fix"></div>
	</div>
</div>
<!-- //banner -->
<div class="news">
<div class="fix-container">
<?php if ( have_posts() ) while ( have_posts() ) : the_post(); // Начало цикла ?>
<?php the_content(); // Содержимое страницы ?>
<?php the_tags( 'Тэги: ', ' | ', '' ); // Выводим тэги(метки) поста ?>
<?php endwhile; // Конец цикла ?>
</div>
</div>
<?php get_footer(); // Подключаем футер ?>