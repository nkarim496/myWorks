<?php
/**
 * Чистый Шаблон для разработки
 * Шаблон обычной страницы
 * http://dontforget.pro
 * @package WordPress
 * @subpackage clean
 */
get_header(); // Подключаем хедер?>
<!-- banner -->
<div class="banner banner5">
	<div class="tint">
		<div class="fix-container">
				<h2 class="banner-title wow fadeInLeft" data-wow-delay=".25s">Отзывы</h2>
			<div class="clear-fix"></div>
		</div>
	</div>
</div>
<!-- //banner -->
<div class="news">
<div class="fix-container">
<?php if ( have_posts() ) while ( have_posts() ) : the_post(); // Начало цикла ?>
<?php the_content(); // Содержимое страницы ?>
<?php endwhile; // Конец цикла ?> 
<?php // If comments are open or we have at least one comment, load up the comment template.
 if ( comments_open() || '0' != get_comments_number() ) :
 	comments_template();
 endif;
?>
</div>
</div>
<script>
 $(function () {
    $('.active').removeClass('active');
    $('.otzivi').addClass('active');  
});
</script>
<?php get_footer(); // Подключаем футер ?>