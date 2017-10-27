<?php
/**
 * Эдельвейс
 * Шаблон хэдера
 * @package WordPress
 * @subpackage Edelveis 2.0
 */
?>
<!DOCTYPE html>
<html lang="ru">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="UTF-8">
<!-- RSS, стиль и всякая фигня -->
<link rel="alternate" type="application/rdf+xml" title="RDF mapping" href="<?php bloginfo('rdf_url'); ?>" />
<link rel="alternate" type="application/rss+xml" title="RSS" href="<?php bloginfo('rss_url'); ?>" />
<link rel="alternate" type="application/rss+xml" title="Comments RSS" href="<?php bloginfo('comments_rss2_url'); ?>" />
<link rel="pingback" href="<?php bloginfo( 'pingback_url' ); ?>" />
<link rel="stylesheet" type="text/css" href="<?php echo get_template_directory_uri(); ?>/style.css">
<link href="<?php echo get_template_directory_uri(); ?>/css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<link href="<?php echo get_template_directory_uri(); ?>/css/main.css" rel="stylesheet" type="text/css" media="all" />
<link href="<?php echo get_template_directory_uri(); ?>/css/animate.min.css" rel="stylesheet" type="text/css" media="all" />
<link href="<?php echo get_template_directory_uri(); ?>/css/jquery-ui.css" rel="stylesheet" type="text/css" media="all" />
<link href='//fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600,600italic,700,700italic,800,800italic' rel='stylesheet' type='text/css'>
<link href='//fonts.googleapis.com/css?family=Oswald:400,300,700' rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
<script src="<?php echo get_template_directory_uri(); ?>/js/jquery-1.11.1.min.js"></script>
<script src="<?php echo get_template_directory_uri(); ?>/js/wow.min.js"></script>
<script>
 new WOW().init();
</script>
 <!--[if lt IE 9]>
 <script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
 <![endif]-->
<title>
<?php // Генерируем тайтл в зависимости от контента с разделителем " | "
	global $page, $paged;
	wp_title( '|', true, 'right' );
	bloginfo( 'name' );
	$site_description = get_bloginfo( 'description', 'display' );
	if ( $site_description && ( is_home() || is_front_page() ) )
		echo " | $site_description";
	if ( $paged >= 2 || $page >= 2 )
		echo ' | ' . sprintf( __( 'Page %s', 'twentyten' ), max( $paged, $page ) );
?>
</title>
<?php
	wp_head(); // Необходимо для работы плагинов и функционала wp
?>
<?php $category = get_the_category(); //получаем массив данных категории ?>
<script>
 $(function () {
 	var cat = '<?php echo $category[0]->cat_ID; ?>';
 	if (cat == 2) {
    $('.active').removeClass('active');
    $('.uslugi').addClass('active');
    } 
});
</script>
</head>
<body>
<!-- header -->
	<div class="header-nav">
		<div class="fix-container">
			<div class="logo wow fadeIn">
				<a href="<?php echo the_home_url(); ?>/index.html">Эдельвейс <span>Гостиница и кафе</span></a>
			</div>
			<nav class="top-links">
				<ul>
					<li><a href="<?php echo the_home_url(); ?>/index.html">Главная</a>
					<li><a href="<?php echo the_home_url(); ?>/nomera.html">Номера</a>
					<li><a href="<?php echo the_home_url(); ?>/karaoke.html">Караоке-бар</a>
					<li class="uslugi"><a href="<?php echo the_home_url(); ?>/uslugi.html">Услуги</a></li>
					<li class="active"><a href="<?php echo get_home_url(); ?>/">Новости</a>
					<li class="otzivi"><a href="<?php echo get_home_url(); ?>/%D0%BE%D1%82%D0%B7%D1%8B%D0%B2%D1%8B">Отзывы</a>
					<li><a href="<?php echo the_home_url(); ?>/contact.html">Контакты</a>
				</ul>
			</nav>
		</div>
	</div>
<!-- //header -->