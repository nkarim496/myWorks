﻿<?php
/**
 * The template for displaying the header
 *
 * Displays all of the head element and everything up until the "site-content" div.
 *
 * @package WordPress
 * @subpackage Edelveis
 * @since Edelveis 1.0
 */
?><!DOCTYPE html>
<html <?php language_attributes(); ?> class="no-js">
<head>
<meta charset="<?php bloginfo( 'charset' ); ?>">
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
		function hideURLbar(){ window.scrollTo(0,1); } </script>
<link href="<?php echo get_template_directory_uri(); ?>/css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<link href="<?php echo get_template_directory_uri(); ?>/css/main.css" rel="stylesheet" type="text/css" media="all" />
<!-- js -->
<script src="js/jquery-1.11.1.min.js"></script>
<!-- //js -->
<!-- login-pop-up -->
<script src="js/menu_jquery.js"></script>
<!-- //login-pop-up -->
<!-- animation-effect -->
<link href="css/animate.min.css" rel="stylesheet"> 
<script src="js/wow.min.js"></script>
<script>
 new WOW().init();
</script>
<!-- //animation-effect -->
<link href='//fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600,600italic,700,700italic,800,800italic' rel='stylesheet' type='text/css'>
<link href='//fonts.googleapis.com/css?family=Oswald:400,300,700' rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
<?php wp_head(); ?>
</head>	
<body>
<!-- header -->
	<div class="header-nav">
		<div class="fix-container">
			<div class="logo animated wow slideInLeft" data-wow-delay=".5s">
				<a href="index.html">Эдельвейс <span>Гостиница и кафе</span></a>
			</div>
			<nav class="top-links">
				<ul>
					<li><a href="index.html">Главная</a>
					<li><a href="nomera.html">Номера</a>
					<li><a href="karaoke.html">Караоке-бар</a>
					<li><a href="uslugi.html">Услуги</a></li>
					<li class="active"><a href="blog.html">Новости</a>
					<li><a href="otzivi.html">Отзывы</a>
					<li><a href="contact.html">Контакты</a>
				</ul>
			</nav>
		</div>
	</div>
<!-- //header -->
<!-- banner -->
<div class="banner banner5">
	<div class="tint">
		<div class="fix-container">
				<h2 class="banner-title animated wow slideInUp" data-wow-delay=".5s">Новости</h2>
			<div class="clear-fix"></div>
		</div>
	</div>
</div>
<!-- //banner -->
<div class="fix-container">