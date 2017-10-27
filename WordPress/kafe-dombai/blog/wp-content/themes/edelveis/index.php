<?php get_header(); ?>
<!-- main -->
	<main>
		<?php while ( have_posts() ) : the_post(); ?>
			<article <?php post_class('post'); ?> id="post-<?php the_ID(); ?>">
				<div class="blog-grid1 animated wow slideInUp" data-wow-delay=".5s">
					<a href="single.html">
						<?php if ( has_post_thumbnail() ) { ?>
							<a href="<?php the_permalink(); ?>">
								<?php the_post_thumbnail( array( 'class' => 'thumbnail' ) ); ?>
							</a>
						<?php } ?>
					<div class="blog-grid1-info">
						<h2>
							<a href="<?php the_permalink(); ?>" rel="bookmark"><?php the_title(); ?></a>
						</h2>
						<span>Posted on <time datetime="<?php the_date();?>"><?php the_date();?> at <?php the_time();?></time> by <?php the_author();?></span>
						<?php the_content(); ?>
					</div>
				</div>
			</article>
		<?php endwhile; ?>
		<div class="clearfix"></div>
	</main>
<!-- //main -->
<?php get_sidebar(); ?>
<?php get_footer(); ?>