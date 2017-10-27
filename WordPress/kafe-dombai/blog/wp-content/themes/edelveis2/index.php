<?php
/**
 * @package WordPress
 * @subpackage Edelveis 2.0
 */
get_header(); // Подключаем хедер?>
<!-- banner -->
<div class="banner banner5">
	<div class="tint">
		<div class="fix-container">
				<h2 class="banner-title wow fadeInLeft" data-wow-delay=".25s">Новости</h2>
			<div class="clear-fix"></div>
		</div>
	</div>
</div>
<!-- //banner -->
<div class="news">
	<div class="fix-container">
<main>
<?php if (have_posts()) : while (have_posts()) : the_post(); // Цикл записей ?>
<article <?php post_class('post wow fadeInUp'); ?> id="post-<?php the_ID(); ?>" data-wow-delay=".5s">
<div class="art-box">
<?php if ( has_post_thumbnail() ) { ?> <a href="<?php the_permalink(); ?>"> <?php the_post_thumbnail('spec_thumb'); ?></a><?php } // Проверяем наличие миниатюры, если есть показываем ?>
<div class="post-descript">
<h3><a href="<?php the_permalink(); ?>"><?php the_title(); ?></a></h3><!-- Заголовок поста + ссылка на него -->
<span><?php the_time('F j, Y'); // Дата создания поста ?></span>
<p><?php the_truncated_post( 200 ); // Выводим анонс ?></p>
<a class="view-more" href="<?php the_permalink(); ?>">Читать далее</a>
</div>
<div class="clear-fix"></div>
</div>
</article>
<?php endwhile; // Конец цикла.
else: echo '<h2>Извините, ничего не найдено...</h2>'; endif; // Если записей нет - извиняемся ?>	 
<?php // Пагинация
global $wp_query;
$big = 999999999;
echo paginate_links( array(
	'base' => str_replace( $big, '%#%', esc_url( get_pagenum_link( $big ) ) ),
	'format' => '?paged=%#%',
	'current' => max( 1, get_query_var('paged') ),
	'type' => 'list',
	'prev_text'    => __('« Сюда'), 
    'next_text'    => __('Туда »'),
	'total' => $wp_query->max_num_pages
) );
?>
</main>
</div>
</div>
<?php get_footer(); // Подключаем футер ?>