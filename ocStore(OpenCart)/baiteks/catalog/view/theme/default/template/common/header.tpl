<!DOCTYPE html>
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
<head>
<meta charset="UTF-8" />

<meta name="format-detection" content = "telephone=no" />
<meta name="HandheldFriendly" content="True" />
<meta name="MobileOptimized" content="320" />
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no" />

<title><?php echo $title; if (isset($_GET['page'])) { echo " - ". ((int) $_GET['page'])." ".$text_page;} ?></title>
<base href="<?php echo $base; ?>" />
<?php if ($description) { ?>
<meta name="description" content="<?php echo $description; if (isset($_GET['page'])) { echo " - ". ((int) $_GET['page'])." ".$text_page;} ?>" />
<?php } ?>
<?php if ($keywords) { ?>
<meta name="keywords" content="<?php echo $keywords; ?>" />
<?php } ?>
<meta property="og:title" content="<?php echo $title; if (isset($_GET['page'])) { echo " - ". ((int) $_GET['page'])." ".$text_page;} ?>" />
<meta property="og:type" content="website" />
<meta property="og:url" content="<?php echo $og_url; ?>" />
<?php if ($og_image) { ?>
<meta property="og:image" content="<?php echo $og_image; ?>" />
<?php } else { ?>
<meta property="og:image" content="<?php echo $logo; ?>" />
<?php } ?>
<meta property="og:site_name" content="<?php echo $name; ?>" />
<?php if ($icon) { ?>
<link href="<?php echo $icon; ?>" rel="icon" />
<?php } ?>
<?php foreach ($links as $link) { ?>
<link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
<?php } ?>
<!-- AppleIcon -->
<link rel="apple-touch-icon" href="image/appleicon/touch-icon-iphone.png">
<link rel="apple-touch-icon" sizes="76x76" href="image/appleicon/touch-icon-ipad.png">
<link rel="apple-touch-icon" sizes="120x120" href="image/appleicon/touch-icon-iphone-retina.png">
<link rel="apple-touch-icon" sizes="152x152" href="image/appleicon/touch-icon-ipad-retina.png">
<!-- GoogleFonts -->
<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700&subset=latin,cyrillic-ext,latin-ext,cyrillic' rel="stylesheet" type="text/css">
<link href='http://fonts.googleapis.com/css?family=Marck+Script&subset=latin,cyrillic' rel='stylesheet' type='text/css'>
<!-- CSS -->
<link rel="stylesheet" type="text/css" href="catalog/view/theme/default/stylesheet/stylesheet.css" />
<link rel="stylesheet" type="text/css" href="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css" />
<link rel="stylesheet" type="text/css" href="catalog/view/javascript/jquery/ui/themes/ui-lightness/jquery-ui-1.8.16.custom.css" />
<?php foreach ($styles as $style) { ?>
<link rel="<?php echo $style['rel']; ?>" type="text/css" href="<?php echo $style['href']; ?>" media="<?php echo $style['media']; ?>" />
<?php } ?>
<!-- JS -->
<script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<script type="text/javascript" src="catalog/view/javascript/js/jquery.flexnav.js"></script>
<script type="text/javascript">jQuery(document).ready(function($) {$(".flexnav").flexNav();});</script>
<script type="text/javascript" src="catalog/view/javascript/jquery/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="catalog/view/javascript/jquery/jquery.flexslider-min.js"></script>
<script type="text/javascript" src="catalog/view/javascript/common.js"></script>
<script type="text/javascript" src="catalog/view/javascript/jquery/ui/jquery-ui-1.8.16.custom.min.js"></script>
<script type="text/javascript" src='catalog/view/javascript/js/jquery.elevatezoom.js'></script>
<script type="text/javascript" src="catalog/view/javascript/js/animation-menu.js"></script>
<script type="text/javascript" src="catalog/view/javascript/js/owl.carousel.js"></script>
<script type="text/javascript" src="catalog/view/javascript/js/jquery.dcjqaccordion.js"></script>
<?php foreach ($scripts as $script) { ?>
<script type="text/javascript" src="<?php echo $script; ?>"></script>
<?php } ?>

<!-- html5.js for IE less than 9 -->
<!--[if lt IE 9]>
	<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
<![endif]-->

<!-- css3-mediaqueries.js for IE less than 9 -->
<!--[if lt IE 9]>
	<script src="http://css3-mediaqueries-js.googlecode.com/svn/trunk/css3-mediaqueries.js"></script>
<![endif]-->

<!--[if IE 7]> 
<link rel="stylesheet" type="text/css" href="catalog/view/theme/default/stylesheet/ie7.css" />
<![endif]-->
<!--[if lt IE 7]>
<link rel="stylesheet" type="text/css" href="catalog/view/theme/default/stylesheet/ie6.css" />
<script type="text/javascript" src="catalog/view/javascript/DD_belatedPNG_0.0.8a-min.js"></script>
<script type="text/javascript">
DD_belatedPNG.fix('#logo img');
</script>
<![endif]-->

<?php if ($stores) { ?>
<script type="text/javascript"><!--
$(document).ready(function() {
<?php foreach ($stores as $store) { ?>
$('body').prepend('<iframe src="<?php echo $store; ?>" style="display: none;"></iframe>');
<?php } ?>
});
//--></script>
<?php } ?>
<?php echo $google_analytics; ?>

<style type="text/css">

<?php if($this->config->get('themer_grid') == 980) { ?>

#container { max-width: 980px; }
#top { max-width: 980px; }
#header { max-width: 980px; }
.breadcrumb {    max-width: 980px; }
#footer { max-width: 980px; }
#social { max-width: 980px; }
#powered { max-width: 980px; }
.owl-origin {
    -webkit-perspective: 980px;
    -moz-perspective : 980px;
    perspective : 980px;
}

/****************************************************************/
/****************** AVA STORE RESPONSIVE 900 ********************/
/****************************************************************/

@media screen and (max-width: 10000px) {
        
        #container { max-width: 980px; }
        #header { max-width: 980px; }
        #top { max-width: 980px; }
        #footer { max-width: 980px; }
        #powered { max-width: 980px; }
        .breadcrumb { max-width: 980px; }

        .top-search2 { width: 120px; }
        .top-search2:focus { width: 640px; }
        #top > ul > li { padding-right: 2px; }

        #column-left + #column-right + #content .flex-direction-nav a { top: 20%; }
        #column-left + #content .flex-direction-nav a { top: 30%; }
        #column-right + #content .flex-direction-nav a { top: 30%; }

        #column-left + #column-right + #content .product-compare { width: 100%; text-align: center;    padding: 0px 0px 20px; }
        #column-left + #column-right + #content .category-details .display a { max-width: 220px; }
        
        .product-grid > div { margin: 0px 5px 15px 10px; }
        .product-grid .description { height: 46px; }
        #column-left + #content .product-grid > div { margin: 0px 10px 15px; }
        #column-right + #content .product-grid > div { margin: 0px 10px 15px; }
        #column-left + #column-right + #content .product-grid { margin-right: -22px; }
        #column-left + #column-right + #content .product-grid > div { margin: 0px 22px 15px 10px; }
        
        #column-left + #column-right + #content .product-info .left { float: none; display: block; margin: 0px 0px 30px 110px; }
        #column-left + #column-right + #content .product-info > .left + .right { margin: 0px; }
        
        .category-list ul li { margin-left:6px; width:147px; }
        #column-left + #content .category-list ul li { margin-left:16px; width: 156px;}
        #column-right + #content .category-list ul li {    margin-left:16px; width: 156px;}
        #column-left + #column-right + #content .category-list ul li { margin-left: 7px; width: 150px; }
        
        .product-info .option-image .imagename{ width: 100%; }
        .product-info .option-image tr { width: 100%; }
        
        .box-product > div { margin: 0px 0px 20px 22px; }
        #column-left + #content .box-product > div { margin: 0px 0px 20px 10px; }
        #column-right + #content .box-product > div { margin: 0px 0px 20px 10px; }
        #column-left + #column-right + #content .box-product > div { margin: 0px 0px 20px 46px; }
        
        .box-news { width: 304px; }
        #column-left + #content .box-news { width:342px; }
        #column-right + #content .box-news { width:342px; }
        #column-left + #column-right + #content .box-news { margin: 0px 4px 30px !important;width: 230px; }
		
        .sitemap-info .right { float: none; }
        .sitemap-info .left { float: none; }
}

@media screen and (max-width: 1024px) {
        .product-grid .image::after { bottom: -6px; }
        .product-grid .grid-button { opacity: 1; bottom: 0px; position: relative; }
        .product-grid .image { padding-bottom: 50px; background-color: #EEEEEE; }
        .product-grid .cart { bottom: 10px; left: 60px; }
        .product-grid .cart .button{ 
                -webkit-border-radius: 3px;
                -moz-border-radius: 3px;
                -khtml-border-radius: 3px;
                border-radius: 3px;
                height: 30px; width: 92px;
                background: url('catalog/view/theme/default/image/icon-cart2.png') 50% 50% no-repeat #22B699;
                -webkit-transform: rotate(0deg);
                -moz-transform: rotate(0deg);
                -o-transform: rotate(0deg);
                -ms-transform: rotate(0deg);
                transform: rotate(0deg);
        }
        .product-grid .wishlist { bottom: 10px; left: 10px; }
        .product-grid .wishlist a {
                -webkit-border-radius: 3px;
                -moz-border-radius: 3px;
                -khtml-border-radius: 3px;
                border-radius: 3px;
                height: 30px;
                width: 32px;
                background: url('catalog/view/theme/default/image/icon-wishList2.png') 50% 50% no-repeat #22B699;
                -webkit-transform: rotate(0deg);
                -moz-transform: rotate(0deg);
                -o-transform: rotate(0deg);
                -ms-transform: rotate(0deg);
                transform: rotate(0deg);
        }
        .product-grid .compare { bottom: 10px; left: 170px; }
        .product-grid .compare a {
                -webkit-border-radius: 3px;
                -moz-border-radius: 3px;
                -khtml-border-radius: 3px;
                border-radius: 3px;
                height: 30px;
                width: 32px;
                background: url('catalog/view/theme/default/image/icon-compare2.png') 50% 50% no-repeat #22B699;
                -webkit-transform: rotate(0deg);
                -moz-transform: rotate(0deg);
                -o-transform: rotate(0deg);
                -ms-transform: rotate(0deg);
                transform: rotate(0deg);
        }
}

@media screen and (max-width: 1000px) {
		
		#container { max-width: 740px; }
		#header { max-width: 740px; }
		#top { max-width: 740px; }
		#footer { max-width: 740px; }
		#powered { max-width: 740px; }
		.breadcrumb { max-width: 740px; }
		
		#top > ul > .headinfo .headmobile { display:none; }
		#top > ul > .headinfo .heademail { display:none; }
		.headinfo { font-size: 14px; font-weight: 600; top: 14px;}
		
		.success { left: 28%; }
		.warning { left: 28%; }
		
		/* ADAPTIVE HEADER */
		#menu { display: none; }
		#top .search2 { left: 5px!important; z-index: 10; }
		.top-search2 { width: 110px; }
		.top-search2:focus { width: 400px; }
		.mobile-menu { display: table-cell; vertical-align: middle; width: 100%; text-align: right; }
		.mobile-menu a { font-size: 14px; margin: 4px 2px; }
		.menu-button { display: block; }
		.mobile-category { display: block; }
		/* ADAPTIVE HEADER END */
	
		.flex-direction-nav a { top: 30% !important; }
		
		#column-left + #column-right + #content .product-filter .limit { float: left; margin-left: 0px; }
		.category-details .display a { max-width: 340px; }
		#column-left + #column-right + #content .category-details .display a { max-width: 340px; }
		
		#column-left + #column-right + #content { margin-right: 0px; margin-left: 0px; }
		#column-right + #content { margin-right: 0px; }
		#column-left + #content { margin-left: 0px; }
		#column-left, #column-right { display: none; }
		
		#column-left + #column-right + #content .product-grid {	margin-right: -12px; }
		.product-grid > div { margin: 0px 10px 15px }
		#column-left + #column-right + #content .product-grid > div { margin: 0px 10px 15px; }
		
		#column-left + #column-right + #content .product-info .left { float: left; margin: 0px 15px 0px 0px; }
		#column-left + #column-right + #content .product-info > .left + .right { margin-left: 280px; }
		
		.category-list ul li { margin-left:16px; width:156px; }
		#column-left + #content .category-list ul li { margin-left:16px; width:156px; }
		#column-right + #content .category-list ul li {	margin-left:16px; width:156px; }
		#column-left + #column-right + #content .category-list ul li { margin-left:16px; width:156px; }
		
		.box-product > div { margin: 0px 0px 20px 10px; }
		#column-left + #content .box-product > div { margin: 0px 0px 20px 10px; }
		#column-right + #content .box-product > div { margin: 0px 0px 20px 10px; }
		#column-left + #column-right + #content .box-product > div { margin: 0px 0px 20px 10px; }
		
		#footer .column { display: table-cell; margin: 0px 5px 10px; width: 48%; min-height: 174px }
		
		.box-news { margin: 0 10px 30px!important; width: 338px!important; }
		#column-left + #column-right + #content .box-news { margin: 0 10px 30px!important; width: 338px!important; }
}
		
		
@media screen and (max-width: 760px) {
		
		#container { max-width: 500px; }
		#header { max-width: 540px; }
		#top { max-width: 540px; }
		#footer { max-width: 540px; }
		#powered { max-width: 540px; }
		.breadcrumb { max-width: 540px; }
		
		.headinfo .headworktime { display: none!important; }
		#header #logo img { max-width: 100%; }
		
		#top > ul > li { padding-right: 10px; }
		#top .search2 { display: none; }
		
		.success { left: 18%; }
		.warning { left: 18%; }
		
		#header #logo { display: block; padding-right: 0px; text-align: center; }
		.mobile-search { display: block; }
		.no-search { display: none; }
		#menu ul { text-align: left; }
		#menu { display: none; }
		
		/* ADAPTIVE MENU */
		.small_cat { position: relative; display: none; margin-top: 20px; }
		.mobile-category { display: block; }
		.menu-button { display: block; }
		.mobile-menu { display: block; text-align: center!important; }
		/* ADAPTIVE MENU END */
		
		.checkout-content .left, .checkout-content .right { width: 100%; }
		.login-content .left, .login-content .right { width: 100%; }
		.contact-info .left, .contact-info .right { width: 100%; }
		.sitemap-info .left, .sitemap-info .right { width: 100%; }
		
		.checkout-heading { height: 13px; overflow: hidden; }
		input.large-field, select.large-field { width: 440px; }
		#payment-new td input {width: 200px;}
		#payment-new td select {width: 200px;}
		#shipping-new td input {width: 200px;}
		#shipping-new  td select {width: 200px;}
		.checkout-product td { padding: 2px; }
		
		.flex-direction-nav a { top: 20% !important; }
		
		.jcarousel-skin-opencart .jcarousel-prev-horizontal { top: 28px!important; }
		.jcarousel-skin-opencart .jcarousel-next-horizontal { top: 28px!important; }
		
		.compare-info { overflow-x: scroll; display: block; }
		
		.product-compare { width: 100%; text-align: center;	padding: 0px 0px 20px; }
		.product-filter .limit { float: left; margin-left: 0px; }
		.category-details .display a { max-width: 220px; }
		#column-left + #column-right + #content .category-details .display a { max-width: 220px; }
		
		.product-grid { margin-right: -24px; }
		#column-left + #column-right + #content .product-grid { margin-right: -24px; }
		#column-left + #content .product-grid { margin-right: -24px; }
		#column-right + #content .product-grid { margin-right: -24px; }
		
		.product-grid > div { margin: 0px 24px 15px 10px; }
		#column-left + #column-right + #content .product-grid > div { margin: 0px 24px 15px 10px; }
		#column-left + #content .product-grid > div { margin: 0px 24px 15px 10px; }
		#column-right + #content .product-grid > div { margin: 0px 24px 15px 10px; }
		
		.category-list ul li { margin-left: 16px; width: 138px; }
		#column-left + #content .category-list ul li { margin-left:16px; width: 138px;}
		#column-right + #content .category-list ul li {	margin-left:16px; width: 138px;}
		#column-left + #column-right + #content .category-list ul li { margin-left:16px; width: 138px; }
		
		.product-info .left { float: none; display: block; margin: 0px 0px 30px 110px; }
		.product-info > .left + .right { margin: 0px; }
		#column-left + #column-right + #content .product-info .left { float: none; display: block; margin: 0px 0px 30px 110px; }
		#column-left + #column-right + #content .product-info > .left + .right { margin: 0px; }
		
		.box-product > div { margin: 0px 0px 20px 48px; }
		#column-left + #content .box-product > div { margin: 0px 0px 20px 48px; }
		#column-right + #content .box-product > div { margin: 0px 0px 20px 48px; }
		#column-left + #column-right + #content .box-product > div { margin: 0px 0px 20px 48px; }
		
		.box-news { margin: 0 0 40px 10px!important; width: 224px!important; }
		.newsimage img { width: 100px !important; }
		#column-left + #column-right + #content .box-news { margin: 0 0 40px 10px!important; width: 224px!important; }
		
		#content .content .left { width: 100%; }
 		#content .content .right { width: 100%; }
		
		/*** account-register ***/
		table.form tr td {display: block;}
		.soglasie { display: table;padding: 20px 5px;font-size: 14px;text-align: center; }
		.soglasie a { font-size: 14px; }
		
		.return-name { width: 100%; margin-bottom: 10px; }
		.return-model { width: 100%; margin-bottom: 10px; }
		.return-quantity { width: 100%; margin-bottom: 10px; }
		.return-reason { width: 100%; margin-bottom: 20px; }
		.return-opened { width: 100%; margin-bottom: 20px; }
		.return-captcha { width: 100%; margin-bottom: 20px; }
		
}
		
		
@media screen and (max-width: 560px) {
		
		#container { max-width: 450px; }
		#header { max-width: 450px; }
		#top { max-width: 450px; }
		#footer { max-width: 450px; }
		#powered { max-width: 450px; }
		.breadcrumb { max-width: 450px; }
		
		.headinfo { display:inline-block; }
		#top > ul > .headinfo .headphone { display:inline-block; }
		#top > ul > .headinfo .headmobile { display:inline-block; }
		#top > ul > .headinfo .headworktime { display:none; }
		#top > ul > .headinfo .heademail { display:none; }
		
		.success { top: 70px; left: 15%; }
		.warning { top: 70px; left: 15%; }
		
		input.large-field, select.large-field { width: 390px; }
		#payment-new td input {width: 200px;}
		#payment-new td select {width: 200px;}
		#shipping-new td input {width: 200px;}
		#shipping-new  td select {width: 200px;}
		
		.flex-direction-nav a { top: 16% !important;  }

		.jcarousel-skin-opencart .jcarousel-prev-horizontal { top: 22px!important; }
		.jcarousel-skin-opencart .jcarousel-next-horizontal { top: 22px!important; }

		.category-list ul li { margin-left:16px; width: 27%; }
		#column-left + #column-right + #content .category-list ul li { margin-left:16px; width: 27%; }
		#column-left + #content .category-list ul li { margin-left:16px; width: 27%;}
		#column-right + #content .category-list ul li {	margin-left:16px; width: 27%;}
		
		.product-filter .sortb { display: block; }
		.product-filter .limitb { display: block; }
		
		.category-details .display a { max-width: 180px; }
		#column-left + #column-right + #content .category-details .display a { max-width: 180px; }
		
		.product-list .name a { font-size: 12px!important; font-weight: 600!important; }
		
		.product-grid { margin-right: -10px; }
		#column-left + #column-right + #content .product-grid { margin-right: -10px; }
		#column-left + #content .product-grid { margin-right: -10px; }
		#column-right + #content .product-grid { margin-right: -10px; }
		
		.product-grid > div { margin: 0px 0px 15px 10px; width: 198px; }
		#column-left + #column-right + #content .product-grid > div { margin: 0px 0px 15px 10px; width: 198px; }
		#column-left + #content .product-grid > div { margin: 0px 0px 15px 10px; width: 198px; }
		#column-right + #content .product-grid > div { margin: 0px 0px 15px 10px; width: 198px; }
		
		.product-grid .cart { left: 55px; }
		.product-grid .wishlist { left: 10px; }
		.product-grid .compare { left: 160px; }
		
		#top .menu_name  { display: none; }
 		#top .menu_name1 { display: none; }
 		#top .menu_name2 { display: none; }
 		#top .menu_name3 { display: none; }
 		
 		.product-info .left { float: none; display: block; margin: 0px 0px 30px 80px; }
		.product-info > .left + .right { margin: 0px; }
		#column-left + #column-right + #content .product-info .left { float: none; display: block; margin: 0px 0px 30px 80px; }
		#column-left + #column-right + #content .product-info > .left + .right { margin: 0px; }
 		
 		.box-product > div { margin: 0px 0px 20px 28px; }
		#column-left + #content .box-product > div { margin: 0px 0px 20px 28px; }
		#column-right + #content .box-product > div { margin: 0px 0px 20px 28px; }
		#column-left + #column-right + #content .box-product > div { margin: 0px 0px 20px 28px; }

 		.box-news { margin: 0 0 40px 0!important; width: 100%!important;  }
		.newsimage img { width: 100px !important; }
		#column-left + #column-right + #content .box-news { margin: 0 0 40px 0!important; width: 100%!important; }
		.panelcollapsed .description { display: block;line-height: 20px;padding: 0px 10px 0px; }
		.panelcollapsed .image { margin: 0px; width: 100%; }
		.panelcollapsed .image img { margin: 0px; width: 100%; }
		.panelcollapsed h2 { margin-top: 20px; }
 		
		.order_info .order2 { display: none; }
		
		.wishlist-info .model { display: none; }
		
 		#footer .column { display: table-cell; margin: 0px 5px 10px; width: 98%; min-height: 174px }
}
		
		
@media screen and (max-width: 470px) {
		
		#container { max-width: 300px; }
		#header { max-width: 300px; }
		#top { max-width: 300px; }
		#footer { max-width: 300px; }
		#powered { max-width: 300px; }
		.breadcrumb { max-width: 300px; }
		
		.headinfo { display:inline-block; right: 36px; top: 14px; }
		#top > ul > .headinfo .headphone { display:inline-block; }
		#top > ul > .headinfo .headmobile { display:none; }
		#top > ul > .headinfo .headworktime { display:none; }
		#top > ul > .headinfo .heademail { display:none; }
		
		.success { padding: 90px 0px 20px; width: 100%; top: 60px; left: 0%;}
		.warning { padding: 90px 0px 20px; width: 100%; top: 60px; left: 0%;}
		
		.mini-cart-info .name { width: 100px; }
		#top #cart .checkout .button { width: 100%; margin-bottom: 10px; }
		.cart-info thead .image { display: none; }
		.cart-info tbody .image { display: none; }
		.cart-info thead .model { display: none; }
		.cart-info tbody .model { display: none; }
		.cart-info thead .price { display: none; }
		.cart-info tbody .price { display: none; }
		.cart-info tbody .total { width: 70px; }
		#payment-new td input {width: 140px;}
		#payment-new td select {width: 140px;}
		#shipping-new td input {width: 140px;}
		#shipping-new  td select {width: 140px;}
		
		.buttons .left, .buttons .right { float: none; display: block; }
		.buttons .left .button, .buttons .right .button { width: 100%; margin: 5px 0px; }
		
		.checkout-content .left, .checkout-content .right { width: 100%; }
		.login-content .left, .login-content .right { width: 100%; }
		.contact-info .left, .contact-info .right { width: 100%; }
		.sitemap-info .left, .sitemap-info .right { width: 100%; }
		
		
		.checkout-heading { height: 13px; overflow: hidden; }
		input.large-field, select.large-field { width: 140px; }
		.checkout-product td { padding: 2px; }
		.checkout-product thead .model { display: none; }
		.checkout-product tbody .model { display: none; }
		.checkout-product tr { font-size: 9px; }
		.checkout-product td { font-size: 9px; }
		.checkout-product a { font-size: 9px; }
		.checkout-product > th { font-size: 9px; }
		.checkout-product > textarea { font-size: 9px; }
		
		.flex-direction-nav a { display: none!important; }
		
		#owl-example .item { padding-left: 34px; }
		#owl-example2 .item { padding-left: 34px; }
		#owl-example3 .item { padding-left: 34px; }
		#owl-example4 .item { padding-left: 34px; }
		#owl-example5 .item { padding-left: 34px; }
		#owl-example6 .item { padding-left: 34px; }
		#owl-example7 .item { padding-left: 34px; }
		#owl-example8 .item { padding-left: 34px; }
		#owl-example9 .item { padding-left: 34px; }
		#owl-example10 .item { padding-left: 34px; }
		#owl-example11 .item { padding-left: 34px; }
		
		.nocarousel { display: none }
		
		.category-list ul li { margin-left:16px; width: 40%; }
		#column-left + #content .category-list ul li { margin-left:16px; width: 40%;}
		#column-right + #content .category-list ul li {	margin-left:16px; width: 40%;}
		#column-left + #column-right + #content .category-list ul li { margin-left:16px; width: 40%; }
		
		.product-filter .sortb { display: block; }
		.product-filter .sort select { width: 160px; }
		.product-filter .limitb { display: block; }
		.product-filter .limit select { width: 80px; }
		
		.category-details .display a { max-width: 120px; }
		#column-left + #column-right + #content .category-details .display a { max-width: 120px; }
		
		.product-grid { margin-right: -10px; text-align: center; }
		#column-left + #column-right + #content .product-grid { margin-right: -10px; text-align: center;  }
		#column-left + #content .product-grid { margin-right: -10px; text-align: center;  }
		#column-right + #content .product-grid { margin-right: -10px; text-align: center; }
		
		.product-grid > div { margin: 0px 0px 15px; width: 211px; }
		#column-left + #column-right + #content .product-grid > div { margin: 0px 0px 15px; width: 211px; }
		#column-left + #content .product-grid > div { margin: 0px 0px 15px; width: 211px; }
		#column-right + #content .product-grid > div { margin: 0px 0px 15px; width: 211px; }
		.product-grid .cart { left: 60px; }
		.product-grid .wishlist { left: 10px; }
		.product-grid .compare { left: 170px; }
		
		.product-list .right { float: right; margin-left: 0px; padding-left: 0px; }
		.product-list .left .image { float: none; }
		
		#top .menu_name  { display: none; }
 		#top .menu_name1 { display: none; }
 		#top .menu_name2 { display: none; }
 		#top .menu_name3 { display: none; }
 		
 		#header #logo { padding-right: 10px; }
 		
 		.product-info .image .sale { right: -6px; }
 		.product-info .infoleft { display: block; }
 		.product-info .wishlist .w1 { display: none; }
 		.product-info .wishlist .w2 { display: none; }
 		.product-info .compare .c1 { display: none; }
 		.product-info .compare .c2 { display: none; }
 		.product-info .cart-inside { width: 250px; }
 		.product-info .left { float: none; display: block; margin: 0px 0px 30px 5px; }
		.product-info > .left + .right { margin: 0px; }
		#column-left + #column-right + #content .product-info .left { float: none; display: block; margin: 0px 0px 30px 5px; }
		#column-left + #column-right + #content .product-info > .left + .right { margin: 0px; }
		.product-info .inforight { border-top: 1px solid #EEEEEE; display: block; margin-top: 10px; padding: 10px 0px 0px 65px; width: 185px; }
 		
 		.product-info .option-image img { width: 50px!important; }
 		
 		.box-product > div { margin: 0px 0px 20px 10px; width: 114px; }
		#column-left + #content .box-product > div { margin: 0px 0px 20px 10px; width: 114px; }
		#column-right + #content .box-product > div { margin: 0px 0px 20px 10px; width: 114px; }
		#column-left + #column-right + #content .box-product > div { margin: 0px 0px 20px 10px; width: 114px; }
 		
 		.powered_oplata { text-align: center; float: none; }
		.powered_oplata a img { width: 46px; }
 		
		.order_info td { padding: 1px!important; font-size: 10px!important; }
		
		.scrollup{ display: none!important; }
		
		ul { padding-left: 10px; }
		
		.wishlist-info .model { display: none; }
		.wishlist-info .stock { display: none; }
		.wishlist-info .image { display: none; }
		.wishlist-info td { padding: 7px 2px; }
		
		.order-list .order-content div { margin-bottom: 10px; text-align: left; width: 100%; }
		
		input[type="text"], input[type="password"], select, textarea { width: 100%; }
		
		.manufacturer-list ul { width: 100%; }
		
 		#footer .column { display: table-cell; margin: 0px 5px 10px; width: 98%; min-height: 174px }
}
		
		
img {
    	max-width: 100%;
    	height: auto;
    	width: auto\9; /* ie8 */
}
.video embed,
.video object,
.video iframe {
    	width: 100%;
    	height: auto;
}
/****************************************************************/
/****************** AVA STORE RESPONSIVE END ********************/
/****************************************************************/

<?php } else { ?>

#container { max-width: 1200px; }
#top { max-width: 1200px; }
#header { max-width: 1200px; }
.breadcrumb {    max-width: 1200px; }
#footer { max-width: 1200px; }
#social { max-width: 1200px; }
#powered { max-width: 1200px; }
.owl-origin {
    -webkit-perspective: 1200px;
    -moz-perspective : 1200px;
    perspective : 1200px;
}

/****************************************************************/
/***************** AVA STORE RESPONSIVE 1200 ********************/
/****************************************************************/

@media screen and (min-width: 1201px) and (max-width: 5000px) {
        .product-list { margin-left: -10px; }
        .product-list .name { height: 34px; margin-bottom: 3px; overflow: hidden; }
        .product-list > div { display: inline-block; vertical-align: top; width: 573px; margin-left: 10px; }
        #column-left + #content .product-list > div { display: inline-block; vertical-align: top; width: 453px;    margin-left: 10px; }
        #column-right + #content .product-list > div { display: inline-block; vertical-align: top; width: 453px; margin-left: 10px; }
        #column-left + #column-right + #content .product-list > div { display: inline-block; vertical-align: top; width: 700px; margin-left: 10px; }
}

@media screen and (max-width: 1200px) {
        
        #container { max-width: 980px; }
        #header { max-width: 980px; }
        #top { max-width: 980px; }
        #footer { max-width: 980px; }
        #powered { max-width: 980px; }
        .breadcrumb { max-width: 980px; }

        .top-search2 { width: 120px; }
        .top-search2:focus { width: 640px; }
        #top > ul > li { padding-right: 2px; }

        #column-left + #column-right + #content .flex-direction-nav a { top: 20%; }
        #column-left + #content .flex-direction-nav a { top: 30%; }
        #column-right + #content .flex-direction-nav a { top: 30%; }

        #column-left + #column-right + #content .product-compare { width: 100%; text-align: center;    padding: 0px 0px 20px; }
        #column-left + #column-right + #content .category-details .display a { max-width: 220px; }
        
        .product-grid > div { margin: 0px 5px 15px 10px; }
        .product-grid .description { height: 46px; }
        #column-left + #content .product-grid > div { margin: 0px 10px 15px; }
        #column-right + #content .product-grid > div { margin: 0px 10px 15px; }
        #column-left + #column-right + #content .product-grid { margin-right: -22px; }
        #column-left + #column-right + #content .product-grid > div { margin: 0px 22px 15px 10px; }
        
        #column-left + #column-right + #content .product-info .left { float: none; display: block; margin: 0px 0px 30px 110px; }
        #column-left + #column-right + #content .product-info > .left + .right { margin: 0px; }
        
        .category-list ul li { margin-left:6px; width:147px; }
        #column-left + #content .category-list ul li { margin-left:16px; width: 156px;}
        #column-right + #content .category-list ul li {    margin-left:16px; width: 156px;}
        #column-left + #column-right + #content .category-list ul li { margin-left: 7px; width: 150px; }
        
        .product-info .option-image .imagename{ width: 100%; }
        .product-info .option-image tr { width: 100%; }
        
        .box-product > div { margin: 0px 0px 20px 22px; }
        #column-left + #content .box-product > div { margin: 0px 0px 20px 10px; }
        #column-right + #content .box-product > div { margin: 0px 0px 20px 10px; }
        #column-left + #column-right + #content .box-product > div { margin: 0px 0px 20px 46px; }
        
        .box-news { width: 304px; }
        #column-left + #content .box-news { width:342px; }
        #column-right + #content .box-news { width:342px; }
        #column-left + #column-right + #content .box-news { margin: 0px 4px 30px !important;width: 230px; }
		
        .sitemap-info .right { float: none; }
        .sitemap-info .left { float: none; }
}

@media screen and (max-width: 1024px) {
        .product-grid .image::after { bottom: -6px; }
        .product-grid .grid-button { opacity: 1; bottom: 0px; position: relative; }
        .product-grid .image { padding-bottom: 50px; background-color: #EEEEEE; }
        .product-grid .cart { bottom: 10px; left: 60px; }
        .product-grid .cart .button{ 
                -webkit-border-radius: 3px;
                -moz-border-radius: 3px;
                -khtml-border-radius: 3px;
                border-radius: 3px;
                height: 30px; width: 92px;
                background: url('catalog/view/theme/default/image/icon-cart2.png') 50% 50% no-repeat #22B699;
                -webkit-transform: rotate(0deg);
                -moz-transform: rotate(0deg);
                -o-transform: rotate(0deg);
                -ms-transform: rotate(0deg);
                transform: rotate(0deg);
        }
        .product-grid .wishlist { bottom: 10px; left: 10px; }
        .product-grid .wishlist a {
                -webkit-border-radius: 3px;
                -moz-border-radius: 3px;
                -khtml-border-radius: 3px;
                border-radius: 3px;
                height: 30px;
                width: 32px;
                background: url('catalog/view/theme/default/image/icon-wishList2.png') 50% 50% no-repeat #22B699;
                -webkit-transform: rotate(0deg);
                -moz-transform: rotate(0deg);
                -o-transform: rotate(0deg);
                -ms-transform: rotate(0deg);
                transform: rotate(0deg);
        }
        .product-grid .compare { bottom: 10px; left: 170px; }
        .product-grid .compare a {
                -webkit-border-radius: 3px;
                -moz-border-radius: 3px;
                -khtml-border-radius: 3px;
                border-radius: 3px;
                height: 30px;
                width: 32px;
                background: url('catalog/view/theme/default/image/icon-compare2.png') 50% 50% no-repeat #22B699;
                -webkit-transform: rotate(0deg);
                -moz-transform: rotate(0deg);
                -o-transform: rotate(0deg);
                -ms-transform: rotate(0deg);
                transform: rotate(0deg);
        }
}

@media screen and (max-width: 1000px) {
		
		#container { max-width: 740px; }
		#header { max-width: 740px; }
		#top { max-width: 740px; }
		#footer { max-width: 740px; }
		#powered { max-width: 740px; }
		.breadcrumb { max-width: 740px; }
		
		#top > ul > .headinfo .headmobile { display:none; }
		#top > ul > .headinfo .heademail { display:none; }
		.headinfo { font-size: 14px; font-weight: 600; top: 14px;}
		
		.success { left: 28%; }
		.warning { left: 28%; }
		
		/* ADAPTIVE HEADER */
		#menu { display: none; }
		#top .search2 { left: 5px!important; z-index: 10; }
		.top-search2 { width: 110px; }
		.top-search2:focus { width: 400px; }
		.mobile-menu { display: table-cell; vertical-align: middle; width: 100%; text-align: right; }
		.mobile-menu a { font-size: 14px; margin: 4px 2px; }
		.menu-button { display: block; }
		.mobile-category { display: block; }
		/* ADAPTIVE HEADER END */
	
		.flex-direction-nav a { top: 30% !important; }
		
		#column-left + #column-right + #content .product-filter .limit { float: left; margin-left: 0px; }
		.category-details .display a { max-width: 340px; }
		#column-left + #column-right + #content .category-details .display a { max-width: 340px; }
		
		#column-left + #column-right + #content { margin-right: 0px; margin-left: 0px; }
		#column-right + #content { margin-right: 0px; }
		#column-left + #content { margin-left: 0px; }
		#column-left, #column-right { display: none; }
		
		#column-left + #column-right + #content .product-grid {	margin-right: -12px; }
		.product-grid > div { margin: 0px 10px 15px }
		#column-left + #column-right + #content .product-grid > div { margin: 0px 10px 15px; }
		
		#column-left + #column-right + #content .product-info .left { float: left; margin: 0px 15px 0px 0px; }
		#column-left + #column-right + #content .product-info > .left + .right { margin-left: 280px; }
		
		.category-list ul li { margin-left:16px; width:156px; }
		#column-left + #content .category-list ul li { margin-left:16px; width:156px; }
		#column-right + #content .category-list ul li {	margin-left:16px; width:156px; }
		#column-left + #column-right + #content .category-list ul li { margin-left:16px; width:156px; }
		
		.box-product > div { margin: 0px 0px 20px 10px; }
		#column-left + #content .box-product > div { margin: 0px 0px 20px 10px; }
		#column-right + #content .box-product > div { margin: 0px 0px 20px 10px; }
		#column-left + #column-right + #content .box-product > div { margin: 0px 0px 20px 10px; }
		
		#footer .column { display: table-cell; margin: 0px 5px 10px; width: 48%; min-height: 174px }
		
		.box-news { margin: 0 10px 30px!important; width: 338px!important; }
		#column-left + #column-right + #content .box-news { margin: 0 10px 30px!important; width: 338px!important; }
}
		
		
@media screen and (max-width: 760px) {
		
		#container { max-width: 500px; }
		#header { max-width: 540px; }
		#top { max-width: 540px; }
		#footer { max-width: 540px; }
		#powered { max-width: 540px; }
		.breadcrumb { max-width: 540px; }
		
		.headinfo .headworktime { display: none!important; }
		#header #logo img { max-width: 100%; }
		
		#top > ul > li { padding-right: 10px; }
		#top .search2 { display: none; }
		
		.success { left: 18%; }
		.warning { left: 18%; }
		
		#header #logo { display: block; padding-right: 0px; text-align: center; }
		.mobile-search { display: block; }
		.no-search { display: none; }
		#menu ul { text-align: left; }
		#menu { display: none; }
		
		/* ADAPTIVE MENU */
		.small_cat { position: relative; display: none; margin-top: 20px; }
		.mobile-category { display: block; }
		.menu-button { display: block; }
		.mobile-menu { display: block; text-align: center!important; }
		/* ADAPTIVE MENU END */
		
		.checkout-content .left, .checkout-content .right { width: 100%; }
		.login-content .left, .login-content .right { width: 100%; }
		.contact-info .left, .contact-info .right { width: 100%; }
		.sitemap-info .left, .sitemap-info .right { width: 100%; }
		
		.checkout-heading { height: 13px; overflow: hidden; }
		input.large-field, select.large-field { width: 440px; }
		#payment-new td input {width: 200px;}
		#payment-new td select {width: 200px;}
		#shipping-new td input {width: 200px;}
		#shipping-new  td select {width: 200px;}
		.checkout-product td { padding: 2px; }
		
		.flex-direction-nav a { top: 20% !important; }
		
		.jcarousel-skin-opencart .jcarousel-prev-horizontal { top: 28px!important; }
		.jcarousel-skin-opencart .jcarousel-next-horizontal { top: 28px!important; }
		
		.compare-info { overflow-x: scroll; display: block; }
		
		.product-compare { width: 100%; text-align: center;	padding: 0px 0px 20px; }
		.product-filter .limit { float: left; margin-left: 0px; }
		.category-details .display a { max-width: 220px; }
		#column-left + #column-right + #content .category-details .display a { max-width: 220px; }
		
		.product-grid { margin-right: -24px; }
		#column-left + #column-right + #content .product-grid { margin-right: -24px; }
		#column-left + #content .product-grid { margin-right: -24px; }
		#column-right + #content .product-grid { margin-right: -24px; }
		
		.product-grid > div { margin: 0px 24px 15px 10px; }
		#column-left + #column-right + #content .product-grid > div { margin: 0px 24px 15px 10px; }
		#column-left + #content .product-grid > div { margin: 0px 24px 15px 10px; }
		#column-right + #content .product-grid > div { margin: 0px 24px 15px 10px; }
		
		.category-list ul li { margin-left: 16px; width: 138px; }
		#column-left + #content .category-list ul li { margin-left:16px; width: 138px;}
		#column-right + #content .category-list ul li {	margin-left:16px; width: 138px;}
		#column-left + #column-right + #content .category-list ul li { margin-left:16px; width: 138px; }
		
		.product-info .left { float: none; display: block; margin: 0px 0px 30px 110px; }
		.product-info > .left + .right { margin: 0px; }
		#column-left + #column-right + #content .product-info .left { float: none; display: block; margin: 0px 0px 30px 110px; }
		#column-left + #column-right + #content .product-info > .left + .right { margin: 0px; }
		
		.box-product > div { margin: 0px 0px 20px 48px; }
		#column-left + #content .box-product > div { margin: 0px 0px 20px 48px; }
		#column-right + #content .box-product > div { margin: 0px 0px 20px 48px; }
		#column-left + #column-right + #content .box-product > div { margin: 0px 0px 20px 48px; }
		
		.box-news { margin: 0 0 40px 10px!important; width: 224px!important; }
		.newsimage img { width: 100px !important; }
		#column-left + #column-right + #content .box-news { margin: 0 0 40px 10px!important; width: 224px!important; }
		
		#content .content .left { width: 100%; }
 		#content .content .right { width: 100%; }
 		
		/*** account-register ***/
		table.form tr td {display: block;}
		.soglasie { display: table;padding: 20px 5px;font-size: 14px;text-align: center; }
		.soglasie a { font-size: 14px; }
		
		.return-name { width: 100%; margin-bottom: 10px; }
		.return-model { width: 100%; margin-bottom: 10px; }
		.return-quantity { width: 100%; margin-bottom: 10px; }
		.return-reason { width: 100%; margin-bottom: 20px; }
		.return-opened { width: 100%; margin-bottom: 20px; }
		.return-captcha { width: 100%; margin-bottom: 20px; }
}
		
		
@media screen and (max-width: 560px) {
		
		#container { max-width: 450px; }
		#header { max-width: 450px; }
		#top { max-width: 450px; }
		#footer { max-width: 450px; }
		#powered { max-width: 450px; }
		.breadcrumb { max-width: 450px; }
		
		.headinfo { display:inline-block; }
		#top > ul > .headinfo .headphone { display:inline-block; }
		#top > ul > .headinfo .headmobile { display:inline-block; }
		#top > ul > .headinfo .headworktime { display:none; }
		#top > ul > .headinfo .heademail { display:none; }
		
		.success { top: 70px; left: 15%; }
		.warning { top: 70px; left: 15%; }
		
		input.large-field, select.large-field { width: 390px; }
		#payment-new td input {width: 200px;}
		#payment-new td select {width: 200px;}
		#shipping-new td input {width: 200px;}
		#shipping-new  td select {width: 200px;}
		
		.flex-direction-nav a { top: 16% !important;  }

		.jcarousel-skin-opencart .jcarousel-prev-horizontal { top: 22px!important; }
		.jcarousel-skin-opencart .jcarousel-next-horizontal { top: 22px!important; }

		.category-list ul li { margin-left:16px; width: 27%; }
		#column-left + #column-right + #content .category-list ul li { margin-left:16px; width: 27%; }
		#column-left + #content .category-list ul li { margin-left:16px; width: 27%;}
		#column-right + #content .category-list ul li {	margin-left:16px; width: 27%;}
		
		.product-filter .sortb { display: block; }
		.product-filter .limitb { display: block; }
		
		.category-details .display a { max-width: 180px; }
		#column-left + #column-right + #content .category-details .display a { max-width: 180px; }
		
		.product-list .name a { font-size: 12px!important; font-weight: 600!important; }
		
		.product-grid { margin-right: -10px; }
		#column-left + #column-right + #content .product-grid { margin-right: -10px; }
		#column-left + #content .product-grid { margin-right: -10px; }
		#column-right + #content .product-grid { margin-right: -10px; }
		
		.product-grid > div { margin: 0px 0px 15px 10px; width: 198px; }
		#column-left + #column-right + #content .product-grid > div { margin: 0px 0px 15px 10px; width: 198px; }
		#column-left + #content .product-grid > div { margin: 0px 0px 15px 10px; width: 198px; }
		#column-right + #content .product-grid > div { margin: 0px 0px 15px 10px; width: 198px; }
		
		.product-grid .cart { left: 55px; }
		.product-grid .wishlist { left: 10px; }
		.product-grid .compare { left: 160px; }
		
		#top .menu_name  { display: none; }
 		#top .menu_name1 { display: none; }
 		#top .menu_name2 { display: none; }
 		#top .menu_name3 { display: none; }
 		
 		.product-info .left { float: none; display: block; margin: 0px 0px 30px 80px; }
		.product-info > .left + .right { margin: 0px; }
		#column-left + #column-right + #content .product-info .left { float: none; display: block; margin: 0px 0px 30px 80px; }
		#column-left + #column-right + #content .product-info > .left + .right { margin: 0px; }
 		
 		.box-product > div { margin: 0px 0px 20px 28px; }
		#column-left + #content .box-product > div { margin: 0px 0px 20px 28px; }
		#column-right + #content .box-product > div { margin: 0px 0px 20px 28px; }
		#column-left + #column-right + #content .box-product > div { margin: 0px 0px 20px 28px; }

 		.box-news { margin: 0 0 40px 0!important; width: 100%!important;  }
		.newsimage img { width: 100px !important; }
		#column-left + #column-right + #content .box-news { margin: 0 0 40px 0!important; width: 100%!important; }
		.panelcollapsed .description { display: block;line-height: 20px;padding: 0px 10px 0px; }
		.panelcollapsed .image { margin: 0px; width: 100%; }
		.panelcollapsed .image img { margin: 0px; width: 100%; }
		.panelcollapsed h2 { margin-top: 20px; }
 		
		.order_info .order2 { display: none; }
		
		.wishlist-info .model { display: none; }
		
 		#footer .column { display: table-cell; margin: 0px 5px 10px; width: 98%; min-height: 174px }
}
		
		
@media screen and (max-width: 470px) {
		
		#container { max-width: 300px; }
		#header { max-width: 300px; }
		#top { max-width: 300px; }
		#footer { max-width: 300px; }
		#powered { max-width: 300px; }
		.breadcrumb { max-width: 300px; }
		
		.headinfo { display:inline-block; right: 36px; top: 14px; }
		#top > ul > .headinfo .headphone { display:inline-block; }
		#top > ul > .headinfo .headmobile { display:none; }
		#top > ul > .headinfo .headworktime { display:none; }
		#top > ul > .headinfo .heademail { display:none; }
		
		.success { padding: 90px 0px 20px; width: 100%; top: 60px; left: 0%;}
		.warning { padding: 90px 0px 20px; width: 100%; top: 60px; left: 0%;}
		
		.mini-cart-info .name { width: 100px; }
		#top #cart .checkout .button { width: 100%; margin-bottom: 10px; }
		.cart-info thead .image { display: none; }
		.cart-info tbody .image { display: none; }
		.cart-info thead .model { display: none; }
		.cart-info tbody .model { display: none; }
		.cart-info thead .price { display: none; }
		.cart-info tbody .price { display: none; }
		.cart-info tbody .total { width: 70px; }
		#payment-new td input {width: 140px;}
		#payment-new td select {width: 140px;}
		#shipping-new td input {width: 140px;}
		#shipping-new  td select {width: 140px;}

		.buttons .left, .buttons .right { float: none; display: block; }
		.buttons .left .button, .buttons .right .button { width: 100%; margin: 5px 0px; }
		
		.checkout-content .left, .checkout-content .right { width: 100%; }
		.login-content .left, .login-content .right { width: 100%; }
		.contact-info .left, .contact-info .right { width: 100%; }
		.sitemap-info .left, .sitemap-info .right { width: 100%; }
		
		
		.checkout-heading { height: 13px; overflow: hidden; }
		input.large-field, select.large-field { width: 140px; }
		.checkout-product td { padding: 2px; }
		.checkout-product thead .model { display: none; }
		.checkout-product tbody .model { display: none; }
		.checkout-product tr { font-size: 9px; }
		.checkout-product td { font-size: 9px; }
		.checkout-product a { font-size: 9px; }
		.checkout-product > th { font-size: 9px; }
		.checkout-product > textarea { font-size: 9px; }
		
		.flex-direction-nav a { display: none!important; }
		
		#owl-example .item { padding-left: 34px; }
		#owl-example2 .item { padding-left: 34px; }
		#owl-example3 .item { padding-left: 34px; }
		#owl-example4 .item { padding-left: 34px; }
		#owl-example5 .item { padding-left: 34px; }
		#owl-example6 .item { padding-left: 34px; }
		#owl-example7 .item { padding-left: 34px; }
		#owl-example8 .item { padding-left: 34px; }
		#owl-example9 .item { padding-left: 34px; }
		#owl-example10 .item { padding-left: 34px; }
		#owl-example11 .item { padding-left: 34px; }
		
		.nocarousel { display: none }
		
		.category-list ul li { margin-left:16px; width: 40%; }
		#column-left + #content .category-list ul li { margin-left:16px; width: 40%;}
		#column-right + #content .category-list ul li {	margin-left:16px; width: 40%;}
		#column-left + #column-right + #content .category-list ul li { margin-left:16px; width: 40%; }
		
		.product-filter .sortb { display: block; }
		.product-filter .sort select { width: 160px; }
		.product-filter .limitb { display: block; }
		.product-filter .limit select { width: 80px; }
		
		.category-details .display a { max-width: 120px; }
		#column-left + #column-right + #content .category-details .display a { max-width: 120px; }
		
		.product-grid { margin-right: -10px; text-align: center; }
		#column-left + #column-right + #content .product-grid { margin-right: -10px; text-align: center;  }
		#column-left + #content .product-grid { margin-right: -10px; text-align: center;  }
		#column-right + #content .product-grid { margin-right: -10px; text-align: center; }
		
		.product-grid > div { margin: 0px 0px 15px; width: 211px; }
		#column-left + #column-right + #content .product-grid > div { margin: 0px 0px 15px; width: 211px; }
		#column-left + #content .product-grid > div { margin: 0px 0px 15px; width: 211px; }
		#column-right + #content .product-grid > div { margin: 0px 0px 15px; width: 211px; }
		.product-grid .cart { left: 60px; }
		.product-grid .wishlist { left: 10px; }
		.product-grid .compare { left: 170px; }
		
		.product-list .right { float: right; margin-left: 0px; padding-left: 0px; }
		.product-list .left .image { float: none; }
		
		#top .menu_name  { display: none; }
 		#top .menu_name1 { display: none; }
 		#top .menu_name2 { display: none; }
 		#top .menu_name3 { display: none; }
 		
 		#header #logo { padding-right: 10px; }
 		
 		.product-info .image .sale { right: -6px; }
 		.product-info .infoleft { display: block; }
 		.product-info .wishlist .w1 { display: none; }
 		.product-info .wishlist .w2 { display: none; }
 		.product-info .compare .c1 { display: none; }
 		.product-info .compare .c2 { display: none; }
 		.product-info .cart-inside { width: 250px; }
 		.product-info .left { float: none; display: block; margin: 0px 0px 30px 5px; }
		.product-info > .left + .right { margin: 0px; }
		#column-left + #column-right + #content .product-info .left { float: none; display: block; margin: 0px 0px 30px 5px; }
		#column-left + #column-right + #content .product-info > .left + .right { margin: 0px; }
		.product-info .inforight { border-top: 1px solid #EEEEEE; display: block; margin-top: 10px; padding: 10px 0px 0px 65px; width: 185px; }
 		
 		.product-info .option-image img { width: 50px!important; }
 		
 		.box-product > div { margin: 0px 0px 20px 10px; width: 114px; }
		#column-left + #content .box-product > div { margin: 0px 0px 20px 10px; width: 114px; }
		#column-right + #content .box-product > div { margin: 0px 0px 20px 10px; width: 114px; }
		#column-left + #column-right + #content .box-product > div { margin: 0px 0px 20px 10px; width: 114px; }
 		
 		.powered_oplata { text-align: center; float: none; }
		.powered_oplata a img { width: 46px; }
 		
		.order_info td { padding: 1px!important; font-size: 10px!important; }
		
		.scrollup{ display: none!important; }
		
		ul { padding-left: 10px; }
		
		.wishlist-info .model { display: none; }
		.wishlist-info .stock { display: none; }
		.wishlist-info .image { display: none; }
		.wishlist-info td { padding: 7px 2px; }
		
		.order-list .order-content div { margin-bottom: 10px; text-align: left; width: 100%; }
		
		input[type="text"], input[type="password"], select, textarea { width: 100%; }
		
		.manufacturer-list ul { width: 100%; }
		
 		#footer .column { display: table-cell; margin: 0px 5px 10px; width: 98%; min-height: 174px }
}
		
		
img {
    	max-width: 100%;
    	height: auto;
    	width: auto\9; /* ie8 */
}
.video embed,
.video object,
.video iframe {
    	width: 100%;
    	height: auto;
}
/****************************************************************/
/****************** AVA STORE RESPONSIVE END ********************/
/****************************************************************/
<?php } ?>


<?php if($this->config->get('themer_buttons') == 'off') { ?>
.product-info .cart .button{
    padding: 0px 10px 0px 30px;
    margin: 0px 10px 10px;
    -webkit-border-radius: 5px;
    -moz-border-radius: 5px;
    -khtml-border-radius: 5px;
    border-radius: 5px;
    height: 38px;
    background: url('catalog/view/theme/default/image/icon-cart2.png') 10px 50% no-repeat #22B699;
    -moz-box-shadow:inset 0 0 0 2px rgba(255, 255, 255, 0.35);
    -webkit-box-shadow:inset 0 0 0 2px rgba(255, 255, 255, 0.35);
    box-shadow:inset 0 0 0 2px rgba(255, 255, 255, 0.35);
    color: #fff;
    text-decoration: none;
    font-size: 14px;
    line-height: 38px;
    font-weight: 400;
}
.product-info .cartbutton {
    display: inline-block;
}
.product-info .cartbutton a {
    padding: 0px;
    margin: 0px 0px 10px;
    height: 38px;
    display: inline-block;
    font-size: 14px;
    line-height: 38px;
}
.product-info .wishlist .w3 {
    padding: 0px 10px 0px 30px;
    margin: 0px 0px 10px;
    -webkit-border-radius: 5px;
    -moz-border-radius: 5px;
    -khtml-border-radius: 5px;
    border-radius: 5px;
    height: 38px;
    background: url('catalog/view/theme/default/image/icon-wishList2.png') 8px 50% no-repeat #22B699;
    display: inline-block;
    -moz-box-shadow:inset 0 0 0 2px rgba(255, 255, 255, 0.35);
    -webkit-box-shadow:inset 0 0 0 2px rgba(255, 255, 255, 0.35);
    box-shadow:inset 0 0 0 2px rgba(255, 255, 255, 0.35);
    color: #fff;
    text-decoration: none;
    font-size: 14px;
    line-height: 38px;
}
.product-info .compare .c3 {
    padding: 0 10px 0 30px;
    margin: 0px 0px 10px;
    -webkit-border-radius: 5px;
    -moz-border-radius: 5px;
    -khtml-border-radius: 5px;
    border-radius: 5px;
    height: 38px;
    background: url('catalog/view/theme/default/image/icon-compare2.png') 8px 50% no-repeat #22B699;
    display: inline-block;
    -moz-box-shadow:inset 0 0 0 2px rgba(255, 255, 255, 0.35);
    -webkit-box-shadow:inset 0 0 0 2px rgba(255, 255, 255, 0.35);
    box-shadow:inset 0 0 0 2px rgba(255, 255, 255, 0.35);
    color: #fff;
    text-decoration: none;
    font-size: 14px;
    line-height: 38px;
}
<?php } else if ($this->config->get('themer_buttons') == 'on') { ?>
.product-info .cart .button{
    padding: 0px;
    margin: 10px;
    -webkit-border-radius: 5px;
    -moz-border-radius: 5px;
    -khtml-border-radius: 5px;
    border-radius: 5px;
    height: 38px;
    width: 38px;
    background: #ccc;
    background: url('catalog/view/theme/default/image/icon-cart.png') 50% 50% no-repeat #22B699;
    -webkit-transform: rotate(45deg);
    -moz-transform: rotate(45deg);
    -o-transform: rotate(45deg);
    -ms-transform: rotate(45deg);
    transform: rotate(45deg);
    -moz-box-shadow:inset 0 0 0 2px rgba(255, 255, 255, 0.35);
    -webkit-box-shadow:inset 0 0 0 2px rgba(255, 255, 255, 0.35);
    box-shadow:inset 0 0 0 2px rgba(255, 255, 255, 0.35);
}
.product-info .wishlist .w3 {
    padding: 0px;
    margin: 13px 5px 10px;
    -webkit-border-radius: 5px;
    -moz-border-radius: 5px;
    -khtml-border-radius: 5px;
    border-radius: 5px;
    height: 32px;
    width: 32px;
    background: #ccc;
    display: block;
    background: url('catalog/view/theme/default/image/icon-wishList.png') 50% 50% no-repeat #22B699;
    -webkit-transform: rotate(45deg);
    -moz-transform: rotate(45deg);
    -o-transform: rotate(45deg);
    -ms-transform: rotate(45deg);
    transform: rotate(45deg);
    -moz-box-shadow:inset 0 0 0 2px rgba(255, 255, 255, 0.35);
    -webkit-box-shadow:inset 0 0 0 2px rgba(255, 255, 255, 0.35);
    box-shadow:inset 0 0 0 2px rgba(255, 255, 255, 0.35);
}
.product-info .compare .c3 {
    padding: 0px;
    margin: 13px 5px 10px;
    -webkit-border-radius: 5px;
    -moz-border-radius: 5px;
    -khtml-border-radius: 5px;
    border-radius: 5px;
    height: 32px;
    width: 32px;
    background: #ccc;
    display: block;
    background: url('catalog/view/theme/default/image/icon-compare.png') 50% 50% no-repeat #22B699;
    -webkit-transform: rotate(45deg);
    -moz-transform: rotate(45deg);
    -o-transform: rotate(45deg);
    -ms-transform: rotate(45deg);
    transform: rotate(45deg);
    -moz-box-shadow:inset 0 0 0 2px rgba(255, 255, 255, 0.35);
    -webkit-box-shadow:inset 0 0 0 2px rgba(255, 255, 255, 0.35);
    box-shadow:inset 0 0 0 2px rgba(255, 255, 255, 0.35);
}

<?php } else { ?>
	
.product-info .cart .button{
float: left;
padding: 0px 10px 0px 30px;
margin: 0px 2px 10px;
-webkit-border-radius: 5px;
-moz-border-radius: 5px;
-khtml-border-radius: 5px;
border-radius: 5px;
height: 38px;
background: url('catalog/view/theme/default/image/icon-cart2.png') 10px 50% no-repeat #22B699;
-moz-box-shadow:inset 0 0 0 2px rgba(255, 255, 255, 0.35);
-webkit-box-shadow:inset 0 0 0 2px rgba(255, 255, 255, 0.35);
box-shadow:inset 0 0 0 2px rgba(255, 255, 255, 0.35);
color: #fff;
text-decoration: none;
font-size: 14px;
line-height: 38px;
font-weight: 400;
}
.product-info .cartbutton {
display: inline-block;
}
.product-info .cartbutton a {
padding: 0px;
margin: 0px 0px 10px;
height: 38px;
display: inline-block;
font-size: 14px;
line-height: 38px;
}
.product-info .wishlist .w3 {
float: left;
padding: 0px;
margin: 0px 0px 12px;
-webkit-border-radius: 5px;
-moz-border-radius: 5px;
-khtml-border-radius: 5px;
border-radius: 5px;
height: 34px;
width: 34px;
background: url('catalog/view/theme/default/image/icon-wishList2.png') 50% no-repeat #22B699;
display: inline-block;
-moz-box-shadow:inset 0 0 0 2px rgba(255, 255, 255, 0.35);
-webkit-box-shadow:inset 0 0 0 2px rgba(255, 255, 255, 0.35);
box-shadow:inset 0 0 0 2px rgba(255, 255, 255, 0.35);
color: #fff;
text-decoration: none;
font-size: 14px;
line-height: 34px;
}
.product-info .compare .c3 {
float: left;
padding: 0;
margin: 0px 0px 12px;
-webkit-border-radius: 5px;
-moz-border-radius: 5px;
-khtml-border-radius: 5px;
border-radius: 5px;
height: 34px;
width: 34px;
background: url('catalog/view/theme/default/image/icon-compare2.png') 50% no-repeat #22B699;
display: inline-block;
-moz-box-shadow:inset 0 0 0 2px rgba(255, 255, 255, 0.35);
-webkit-box-shadow:inset 0 0 0 2px rgba(255, 255, 255, 0.35);
box-shadow:inset 0 0 0 2px rgba(255, 255, 255, 0.35);
color: #fff;
text-decoration: none;
font-size: 14px;
line-height: 34px;
}

<?php } ?>

#container-100 {
<?php if($this->config->get('themer_background_image')) { ?>
background-image: url('image/<?php echo $this->config->get('themer_background_image'); ?>');
<?php } else if ($this->config->get('themer_background_pattern')) { ?> 
background-image: url('catalog/view/theme/default/image/background/bg<?php echo $this->config->get('themer_background_pattern'); ?>.jpg');
<?php } else if ($this->config->get('themer_background_color')) { ?>
background-color: #<?php echo $this->config->get('themer_background_color'); ?>;
<?php } ?>

background-repeat: <?php echo $this->config->get('themer_background_repeat'); ?>;
background-position: <?php echo $this->config->get('themer_background_position'); ?>;
background-attachment: <?php echo $this->config->get('themer_background_attachment'); ?>;
}
a, a:visited, a b {color:#<?php echo $this->config->get('themer_main_color'); ?>;}
#retinaicon{background:#<?php echo $this->config->get('themer_main_color'); ?>;}
#top #cart .heading {background-color:#<?php echo $this->config->get('themer_main_color'); ?>;}
#top #cart .content {border-top: 3px solid #<?php echo $this->config->get('themer_main_color'); ?>;}
#top #cart .content:before {border-bottom: 8px solid #<?php echo $this->config->get('themer_main_color'); ?>;}
#menu > ul > li > a > span {background-color: #<?php echo $this->config->get('themer_main_color'); ?>;}
#menu > ul > li:hover a {color: #<?php echo $this->config->get('themer_main_color'); ?>;}
#menu > ul > li > a:hover {color: #<?php echo $this->config->get('themer_main_color'); ?>;}
#menu > ul > li > a.active {border-bottom: 1px solid #<?php echo $this->config->get('themer_main_color'); ?>; color: #<?php echo $this->config->get('themer_main_color'); ?>;}
#menu > ul > li > a.active:hover {color: #<?php echo $this->config->get('themer_main_color'); ?>;}
#menu > ul > li > div {border-top: 3px solid #<?php echo $this->config->get('themer_main_color'); ?>;}
#menu > ul > li > div > ul > li > a:hover {color:#<?php echo $this->config->get('themer_main_color'); ?>!important;}
#menu > ul > li.active a {border-bottom: 1px solid #<?php echo $this->config->get('themer_main_color'); ?>;	color: #<?php echo $this->config->get('themer_main_color'); ?>;}
.top-search2:focus { border: 1px solid #<?php echo $this->config->get('themer_main_color'); ?>!important; }
.top-mobile-search:focus { border: 1px solid #<?php echo $this->config->get('themer_main_color'); ?>!important; }
.pagination .links b {border: 3px solid #<?php echo $this->config->get('themer_main_color'); ?>;}
a.button, input.button {background-color: #<?php echo $this->config->get('themer_main_color'); ?>;}
input.button {background-color: #<?php echo $this->config->get('themer_main_color'); ?>;}
.htabs a.selected {border-top: 5px solid #<?php echo $this->config->get('themer_main_color'); ?>;}
.box .box-heading {border-top: 5px solid #<?php echo $this->config->get('themer_main_color'); ?>;}
.abc-a b {color: #<?php echo $this->config->get('themer_main_color'); ?>;}
.abc-a b:hover { background-color: #<?php echo $this->config->get('themer_main_color'); ?>;}
ul.accordion > li > a.active {background-color: #<?php echo $this->config->get('themer_main_color'); ?>;}
ul.accordion > li ul > li > a {color: #<?php echo $this->config->get('themer_main_color'); ?>;}
ul.box-category > li > a.active {background-color: #<?php echo $this->config->get('themer_main_color'); ?>;}
ul.box-category > li ul:before {background-color: #<?php echo $this->config->get('themer_main_color'); ?>;}
ul.box-category > li ul > li > a{color: #<?php echo $this->config->get('themer_main_color'); ?>;}
#sample-menu-1 li.active {background-color: #<?php echo $this->config->get('themer_main_color'); ?>!important; }
ul.box-category-openchild > li > a.active { background-color: #<?php echo $this->config->get('themer_main_color'); ?>!important; }
ul.box-category-openchild > li ul > li > a { color: #<?php echo $this->config->get('themer_main_color'); ?>!important; }
ul.box-category-openchild > li > a.active + ul:before { background-color: #<?php echo $this->config->get('themer_main_color'); ?>!important; }
ul.box-category-openchild > li > a.active + ul:after{ background-color: #<?php echo $this->config->get('themer_main_color'); ?>!important; }
.box-accordeon ul li .down {background-color: #<?php echo $this->config->get('themer_main_color'); ?>;}
.box-accordeon > ul > li > a.active {background-color: #<?php echo $this->config->get('themer_main_color'); ?>;}
.box-accordeon > ul > li ul li a {color: #<?php echo $this->config->get('themer_main_color'); ?>;}
.box-accordeon > ul > li ul > li > ul li a {color: #<?php echo $this->config->get('themer_main_color'); ?>;}
.box-accordeon > ul > li ul > li > ul li > ul li a {color: #<?php echo $this->config->get('themer_main_color'); ?>;}
.category-list ul li:hover span {color: #<?php echo $this->config->get('themer_main_color'); ?>; border-top: 1px solid #<?php echo $this->config->get('themer_main_color'); ?>;}
.category-list ul li:hover span:before{background-color: #<?php echo $this->config->get('themer_main_color'); ?>;}
.category-details .display .select {background-color: #<?php echo $this->config->get('themer_main_color'); ?>;}
.category-details .display .select:after {background-color: #<?php echo $this->config->get('themer_main_color'); ?>;}
.product-compare .icon-compare {background-color: #<?php echo $this->config->get('themer_main_color'); ?>;}
.product-compare:hover a {color: #<?php echo $this->config->get('themer_main_color'); ?>;}
.product-list .cart .button {background-color: #<?php echo $this->config->get('themer_main_color'); ?>;}
.product-list .wishlist a {background-color: #<?php echo $this->config->get('themer_main_color'); ?>;}
.product-list .compare a {background-color: #<?php echo $this->config->get('themer_main_color'); ?>;}
.product-grid .cart .button{background-color: #<?php echo $this->config->get('themer_main_color'); ?>;}
.product-grid .wishlist a {background-color: #<?php echo $this->config->get('themer_main_color'); ?>;}
.product-grid .compare a {background-color: #<?php echo $this->config->get('themer_main_color'); ?>;}
.product-info .description span {color: #<?php echo $this->config->get('themer_main_color'); ?>;}
.product-info .cart .button {background-color: #<?php echo $this->config->get('themer_main_color'); ?>;}
.product-info .wishlist .w3 {background-color: #<?php echo $this->config->get('themer_main_color'); ?>;}
.product-info .compare .c3 {background-color: #<?php echo $this->config->get('themer_main_color'); ?>;}
.step{background-color: #<?php echo $this->config->get('themer_main_color'); ?>;}
.step:before{background-color: #<?php echo $this->config->get('themer_main_color'); ?>;}
.contact-info i {background-color: #<?php echo $this->config->get('themer_main_color'); ?>;}
.sitemap-info ul li a {border: 1px solid #<?php echo $this->config->get('themer_main_color'); ?>; color: #<?php echo $this->config->get('themer_main_color'); ?>;}
.sitemap-info ul li ul li a {background-color: #<?php echo $this->config->get('themer_main_color'); ?>;}
.sitemap-info ul li ul li:first-child:before {border-bottom: 8px solid #<?php echo $this->config->get('themer_main_color'); ?>;}
#footer .column i {background-color: #<?php echo $this->config->get('themer_main_color'); ?>;}
#social a i:hover {color: #<?php echo $this->config->get('themer_main_color'); ?>;}
#social a .myworld:hover {background-color: #<?php echo $this->config->get('themer_main_color'); ?>;}
#social a .odnoklassniki:hover {background-color: #<?php echo $this->config->get('themer_main_color'); ?>;}
.banner div {border-top: 5px solid #<?php echo $this->config->get('themer_main_color'); ?>;}
#top > ul > div li:hover i {background-color: #<?php echo $this->config->get('themer_main_color'); ?>;}
.menu_head {background-color: #<?php echo $this->config->get('themer_main_color'); ?>;}
.menu_head1{background-color: #<?php echo $this->config->get('themer_main_color'); ?>;}
.menu_head2{background-color: #<?php echo $this->config->get('themer_main_color'); ?>;}
.menu_head3{background-color: #<?php echo $this->config->get('themer_main_color'); ?>;}
.menu_body {border-top: 3px solid #<?php echo $this->config->get('themer_main_color'); ?>;}
.menu_body:before {background-color: #<?php echo $this->config->get('themer_main_color'); ?>;}
.menu_body1 {border-top: 3px solid #<?php echo $this->config->get('themer_main_color'); ?>;}
.menu_body1:before {background-color: #<?php echo $this->config->get('themer_main_color'); ?>;}
.menu_body2 {border-top: 3px solid #<?php echo $this->config->get('themer_main_color'); ?>;}
.menu_body2:before {background-color: #<?php echo $this->config->get('themer_main_color'); ?>;}
.menu_body3 {border-top: 3px solid #<?php echo $this->config->get('themer_main_color'); ?>;}
.menu_body3:before {background-color: #<?php echo $this->config->get('themer_main_color'); ?>;}
.owl-theme .owl-controls .owl-buttons div {color: #<?php echo $this->config->get('themer_main_color'); ?>;}
.owl-theme .owl-controls .owl-buttons div:hover {color: #<?php echo $this->config->get('themer_main_color'); ?>;}
.owl-theme .owl-controls .owl-page span {background: #<?php echo $this->config->get('themer_main_color'); ?>;}
#column-right .item:hover .info .name a {color: #<?php echo $this->config->get('themer_main_color'); ?>;}    
#column-left .item:hover .info .name a {color: #<?php echo $this->config->get('themer_main_color'); ?>;}
.slideshow {border-top: 5px solid #<?php echo $this->config->get('themer_main_color'); ?>;}
.jcarousel-skin-opencart .jcarousel-next-horizontal {background-color: #<?php echo $this->config->get('themer_main_color'); ?>;}
.jcarousel-skin-opencart .jcarousel-prev-horizontal {background-color: #<?php echo $this->config->get('themer_main_color'); ?>;}

<?php if($this->config->get('themer_shadow') == 'on') { ?>
.breadcrumb-100 { box-shadow: 0px 7px 20px -10px rgba(0, 0, 0, 0.506); }
.footer-100 { box-shadow: 0px 7px 20px 3px rgba(0, 0, 0, 0.506) }
<?php } else { ?>
.breadcrumb-100 { box-shadow: 0px 0px 0px 0px rgba(0, 0, 0, 0.506); }
.footer-100 { box-shadow: 0px 0px 0px 0px rgba(0, 0, 0, 0.506); }
<?php } ?>

<?php if($this->config->get('themer_description') == 'on') {?>
.product-grid .description {
	display: block;
}
<?php } ?>
<?php if($this->config->get('themer_buybuttons') == 'on') {?>
	.item .cart { display: block; }
	#column-left .item .info .cart { display: none; }
	#column-right .item .info .cart { display: none; }
<?php } ?>

<?php if($this->config->get('themer_cart_button') == 'on') {?>
	.item .name a {max-height: 34px;min-height: 34px;overflow: hidden;}
	#column-left .item .name a {max-height: 34px;min-height: 12px;overflow: hidden;}
	#column-right .item .name a {max-height: 34px;min-height: 12px;overflow: hidden;}
<?php } ?>

<?php if($this->config->get('themer_menu_category_photo') != 'on') {?>
#menu > ul > li > div > ul > li > a img { display: none; }
<?php } ?>

<?php echo htmlspecialchars_decode($this->config->get('themer_css_block')); ?> 
</style>
</head>



<body>
<div class="header-100">
<div class="top-100"><div id="top">
<ul>
<li>
<p><a class="menu_head"></a><a class="menu_name"><?php echo $text_myaccount; ?></a></p>
<div class="myaccount">
<ul class="menu_body">
<li class="li_menu_account">
    <?php if (!$logged) { ?>
    <?php echo $text_welcome; ?>
    <?php } else { ?>
    <?php echo $text_logged; ?>
    <?php } ?>
</li>
<li class="li_menu"><a href="<?php echo $home; ?>"><i class="fa fa-home"></i><?php echo $text_home; ?></a></li>
<li class="li_menu"><a href="<?php echo $wishlist; ?>" id="wishlist-total"><i class="fa fa-star"></i><?php echo $text_wishlist; ?></a></li>
<li class="li_menu"><a href="<?php echo $compare; ?>" id="compare-total"><i class="fa fa-exchange"></i><?php echo $text_compare; ?></a></li>
<li class="li_menu"><a href="<?php echo $shopping_cart; ?>"><i class="fa fa-shopping-cart"></i><?php echo $text_shopping_cart; ?></a></li>
<li class="li_menu"><a href="<?php echo $checkout; ?>"><i class="fa fa-share"></i><?php echo $text_checkout; ?></a></li>
<li class="li_menu"><a href="<?php echo $contact; ?>"><i class="fa fa-map-marker"></i><?php echo $text_contact; ?></a></li>
</ul>
</div>
</li>

<?php if ($this->config->get('themer_hide_currency') != 'off') { ?>
<li><?php echo $currency; ?></li>
<?php } ?>

<?php if ($this->config->get('themer_hide_language') != 'off') { ?>
<li><?php echo $language; ?></li>
<?php } ?>

<?php if ($this->config->get('themer_search') == 'on') {?>

<li class="no-search">
<p><a class="menu_head1"></a><a class="menu_name1"><?php echo $text_search; ?></a></p>
<div id="header" style="margin:0px;min-height:0px;padding:0px;position:absolute;z-index:6;left:0px;top:0px;">
 <div class="search">
  <ul class="menu_body1">
	<li style="margin:0px; padding:0px; list-style:none; position:relative;">
	<div class="button-search"><i class="fa fa-search"></i></div>
	<input class="top-search" type="text" name="search" placeholder="<?php echo $text_search; ?>" value="<?php echo $search; ?>" />
	</li>
  </ul>
 </div>
</div>
</li>

<?php } else { ?>

<li class="search2">
<div id="header" style="margin:0px;min-height:0px;padding:0px;position:absolute;z-index:6;left:0px;top:0px;">
	<div class="button-search"><i class="fa fa-search"></i></div>
	<input class="top-search2" type="text" name="search" placeholder="<?php echo $text_search; ?>" value="<?php echo $search; ?>" />
</div>
</li>

<?php } ?>


<div class="headinfo">
<?php if ($this->config->get('themer_phone_number')) {?>
<li class="headphone"><i title="Phone" class="fa fa-phone"></i><a href="tel:<?php echo $this->config->get('themer_phone_number'); ?>"><?php echo $this->config->get('themer_phone_number'); ?></a></li>
<?php } ?>

<?php if ($this->config->get('themer_mobile_phone_number')) {?>
<li class="headmobile"><i title="Mobile" class="fa fa-mobile"></i><a href="tel:<?php echo $this->config->get('themer_mobile_phone_number'); ?>"><?php echo $this->config->get('themer_mobile_phone_number'); ?></a></li>
<?php } ?>

<?php if ($this->config->get('themer_working_hours'.$lang)) {?>
<li class="headworktime"><i title="Work Time" class="fa fa-clock-o"></i><?php echo $this->config->get('themer_working_hours'.$lang); ?></li>
<?php } ?>

<?php if ($this->config->get('themer_email')) {?>
<li class="heademail"><i title="Email" class="fa fa-envelope-o"></i><a href="mailto:<?php echo $this->config->get('themer_email'); ?>"><?php echo $this->config->get('themer_email'); ?></a></li>
<?php } ?>
</div>
</ul>

<?php echo $cart; ?>

</div></div>


<div id="header">

  <?php if ($logo) { ?>
  <div id="logo">
  <?php if ($home == $og_url) { ?>
  <img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" />
  <?php } else { ?>
  <a href="<?php echo $home; ?>"><img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" /></a>
  <?php } ?>
  </div>
  <?php } ?>


<?php
$flag = false;

$menus = array(
	'themer_menu1', 'themer_link1',
	'themer_menu2', 'themer_link2',
	'themer_menu3', 'themer_link3',
	'themer_menu4', 'themer_link4',
	'themer_menu5', 'themer_link5',
	'themer_menu6', 'themer_link6',
	'themer_menu7', 'themer_link7',
	'themer_menu8', 'themer_link8',
	'themer_menu9', 'themer_link9',
	'themer_menu10', 'themer_link10',
	'themer_menu11', 'themer_link11',
	'themer_menu12', 'themer_link12',
	'themer_menu13', 'themer_link13',
	'themer_menu14', 'themer_link14',
	'themer_menu15', 'themer_link15',
	'themer_menu16', 'themer_link16',
	'themer_menu17', 'themer_link17',
	'themer_menu18', 'themer_link18',
	'themer_menu19', 'themer_link19',
	'themer_menu20', 'themer_link20'
);

foreach ($menus as $menu) {
  if($this->config->get($menu.$lang)) {
    $flag = true;
  }
}
?>

<div id="menu">

<?php if ($flag) { ?>
<ul>
            <?php if ($this->config->get('themer_link1'.$lang) and $this->config->get('themer_menu1'.$lang)) { ?>
            <li><a href="<?php echo $this->config->get('themer_link1'.$lang); ?>"><?php echo $this->config->get('themer_menu1'.$lang); ?></a></li>
            <?php } ?>
            <?php if ($this->config->get('themer_link2'.$lang) and $this->config->get('themer_menu2'.$lang)) { ?>
            <li><a href="<?php echo $this->config->get('themer_link2'.$lang); ?>"><?php echo $this->config->get('themer_menu2'.$lang); ?></a></li>
            <?php } ?>
            <?php if ($this->config->get('themer_link3'.$lang) and $this->config->get('themer_menu3'.$lang)) { ?>
            <li><a href="<?php echo $this->config->get('themer_link3'.$lang); ?>"><?php echo $this->config->get('themer_menu3'.$lang); ?></a></li>
            <?php } ?>
            <?php if ($this->config->get('themer_link4'.$lang) and $this->config->get('themer_menu4'.$lang)) { ?>
            <li><a href="<?php echo $this->config->get('themer_link4'.$lang); ?>"><?php echo $this->config->get('themer_menu4'.$lang); ?></a></li>
            <?php } ?>
            <?php if ($this->config->get('themer_link5'.$lang) and $this->config->get('themer_menu5'.$lang)) { ?>
            <li><a href="<?php echo $this->config->get('themer_link5'.$lang); ?>"><?php echo $this->config->get('themer_menu5'.$lang); ?></a></li>
            <?php } ?>
            <?php if ($this->config->get('themer_link6'.$lang) and $this->config->get('themer_menu6'.$lang)) { ?>
            <li><a href="<?php echo $this->config->get('themer_link6'.$lang); ?>"><?php echo $this->config->get('themer_menu6'.$lang); ?></a></li>
            <?php } ?>
            <?php if ($this->config->get('themer_link7'.$lang) and $this->config->get('themer_menu7'.$lang)) { ?>
            <li><a href="<?php echo $this->config->get('themer_link7'.$lang); ?>"><?php echo $this->config->get('themer_menu7'.$lang); ?></a></li>
            <?php } ?>
            <?php if ($this->config->get('themer_link8'.$lang) and $this->config->get('themer_menu8'.$lang)) { ?>
            <li><a href="<?php echo $this->config->get('themer_link8'.$lang); ?>"><?php echo $this->config->get('themer_menu8'.$lang); ?></a></li>
            <?php } ?>
            <?php if ($this->config->get('themer_link9'.$lang) and $this->config->get('themer_menu9'.$lang)) { ?>
            <li><a href="<?php echo $this->config->get('themer_link9'.$lang); ?>"><?php echo $this->config->get('themer_menu9'.$lang); ?></a></li>
            <?php } ?>
            <?php if ($this->config->get('themer_link10'.$lang) and $this->config->get('themer_menu10'.$lang)) { ?>
            <li><a href="<?php echo $this->config->get('themer_link10'.$lang); ?>"><?php echo $this->config->get('themer_menu10'.$lang); ?></a></li>
            <?php } ?>
            <?php if ($this->config->get('themer_link11'.$lang) and $this->config->get('themer_menu11'.$lang)) { ?>
            <li><a href="<?php echo $this->config->get('themer_link11'.$lang); ?>"><?php echo $this->config->get('themer_menu11'.$lang); ?></a></li>
            <?php } ?>
            <?php if ($this->config->get('themer_link12'.$lang) and $this->config->get('themer_menu12'.$lang)) { ?>
            <li><a href="<?php echo $this->config->get('themer_link12'.$lang); ?>"><?php echo $this->config->get('themer_menu12'.$lang); ?></a></li>
            <?php } ?>
            <?php if ($this->config->get('themer_link13'.$lang) and $this->config->get('themer_menu13'.$lang)) { ?>
            <li><a href="<?php echo $this->config->get('themer_link13'.$lang); ?>"><?php echo $this->config->get('themer_menu13'.$lang); ?></a></li>
            <?php } ?>
            <?php if ($this->config->get('themer_link14'.$lang) and $this->config->get('themer_menu14'.$lang)) { ?>
            <li><a href="<?php echo $this->config->get('themer_link14'.$lang); ?>"><?php echo $this->config->get('themer_menu14'.$lang); ?></a></li>
            <?php } ?>
            <?php if ($this->config->get('themer_link15'.$lang) and $this->config->get('themer_menu15'.$lang)) { ?>
            <li><a href="<?php echo $this->config->get('themer_link15'.$lang); ?>"><?php echo $this->config->get('themer_menu15'.$lang); ?></a></li>
            <?php } ?>
            <?php if ($this->config->get('themer_link16'.$lang) and $this->config->get('themer_menu16'.$lang)) { ?>
            <li><a href="<?php echo $this->config->get('themer_link16'.$lang); ?>"><?php echo $this->config->get('themer_menu16'.$lang); ?></a></li>
            <?php } ?>
            <?php if ($this->config->get('themer_link17'.$lang) and $this->config->get('themer_menu17'.$lang)) { ?>
            <li><a href="<?php echo $this->config->get('themer_link17'.$lang); ?>"><?php echo $this->config->get('themer_menu17'.$lang); ?></a></li>
            <?php } ?>
            <?php if ($this->config->get('themer_link18'.$lang) and $this->config->get('themer_menu18'.$lang)) { ?>
            <li><a href="<?php echo $this->config->get('themer_link18'.$lang); ?>"><?php echo $this->config->get('themer_menu18'.$lang); ?></a></li>
            <?php } ?>
            <?php if ($this->config->get('themer_link19'.$lang) and $this->config->get('themer_menu19'.$lang)) { ?>
            <li><a href="<?php echo $this->config->get('themer_link19'.$lang); ?>"><?php echo $this->config->get('themer_menu19'.$lang); ?></a></li>
            <?php } ?>
            <?php if ($this->config->get('themer_link20'.$lang) and $this->config->get('themer_menu20'.$lang)) { ?>
            <li><a href="<?php echo $this->config->get('themer_link20'.$lang); ?>"><?php echo $this->config->get('themer_menu20'.$lang); ?></a></li>
            <?php } ?>

<script type="text/javascript"><!-- 
$('div#menu li').each(function () {if (this.getElementsByTagName("a")[0].href == location.href) this.className = "active";});
//--></script>

</ul>
<?php } else { ?>
  <ul>
    <?php foreach ($categories as $category) { ?>
    <li><?php if ($category['active']) { ?>
	<a href="<?php echo $category['href']; ?>" class="active"><?php echo $category['name']; ?><?php if ($category['children']) { ?><span></span><?php } ?></a>
	<?php } else { ?>
	<a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?><?php if ($category['children']) { ?><span></span><?php } ?></a>
	<?php } ?>
	
      <?php if ($category['children']) { ?>
      <div>
        <?php for ($i = 0; $i < count($category['children']);) { ?>
        <ul>
          <?php $j = $i + ceil(count($category['children']) / $category['column']); ?>
          <?php for (; $i < $j; $i++) { ?>
          <?php if (isset($category['children'][$i])) { ?>
          <li><a href="<?php echo $category['children'][$i]['href']; ?>"><img src="<?php echo $category['children'][$i]['thumb']; ?>"> <?php echo $category['children'][$i]['name']; ?></a></li>
          <?php } ?>
          <?php } ?>
        </ul>
        <?php } ?>
      </div>
      <?php } ?>
    </li>
    <?php } ?>
  </ul>
<?php } ?>

</div>

<div class="mobile-menu">
  	    <?php if ($this->config->get('themer_link1'.$lang) and $this->config->get('themer_menu1'.$lang)) { ?>
            <a href="<?php echo $this->config->get('themer_link1'.$lang); ?>"><?php echo $this->config->get('themer_menu1'.$lang); ?></a><?php } ?>
            <?php if ($this->config->get('themer_link2'.$lang) and $this->config->get('themer_menu2'.$lang)) { ?>
            <a href="<?php echo $this->config->get('themer_link2'.$lang); ?>"><?php echo $this->config->get('themer_menu2'.$lang); ?></a><?php } ?>
            <?php if ($this->config->get('themer_link3'.$lang) and $this->config->get('themer_menu3'.$lang)) { ?>
            <a href="<?php echo $this->config->get('themer_link3'.$lang); ?>"><?php echo $this->config->get('themer_menu3'.$lang); ?></a><?php } ?>
            <?php if ($this->config->get('themer_link4'.$lang) and $this->config->get('themer_menu4'.$lang)) { ?>
            <a href="<?php echo $this->config->get('themer_link4'.$lang); ?>"><?php echo $this->config->get('themer_menu4'.$lang); ?></a><?php } ?>
            <?php if ($this->config->get('themer_link5'.$lang) and $this->config->get('themer_menu5'.$lang)) { ?>
            <a href="<?php echo $this->config->get('themer_link5'.$lang); ?>"><?php echo $this->config->get('themer_menu5'.$lang); ?></a><?php } ?>
            <?php if ($this->config->get('themer_link6'.$lang) and $this->config->get('themer_menu6'.$lang)) { ?>
            <a href="<?php echo $this->config->get('themer_link6'.$lang); ?>"><?php echo $this->config->get('themer_menu6'.$lang); ?></a><?php } ?>
            <?php if ($this->config->get('themer_link7'.$lang) and $this->config->get('themer_menu7'.$lang)) { ?>
            <a href="<?php echo $this->config->get('themer_link7'.$lang); ?>"><?php echo $this->config->get('themer_menu7'.$lang); ?></a><?php } ?>
            <?php if ($this->config->get('themer_link8'.$lang) and $this->config->get('themer_menu8'.$lang)) { ?>
            <a href="<?php echo $this->config->get('themer_link8'.$lang); ?>"><?php echo $this->config->get('themer_menu8'.$lang); ?></a><?php } ?>
            <?php if ($this->config->get('themer_link9'.$lang) and $this->config->get('themer_menu9'.$lang)) { ?>
            <a href="<?php echo $this->config->get('themer_link9'.$lang); ?>"><?php echo $this->config->get('themer_menu9'.$lang); ?></a><?php } ?>
            <?php if ($this->config->get('themer_link10'.$lang) and $this->config->get('themer_menu10'.$lang)) { ?>
            <a href="<?php echo $this->config->get('themer_link10'.$lang); ?>"><?php echo $this->config->get('themer_menu10'.$lang); ?></a><?php } ?>
            <?php if ($this->config->get('themer_link11'.$lang) and $this->config->get('themer_menu11'.$lang)) { ?>
            <a href="<?php echo $this->config->get('themer_link11'.$lang); ?>"><?php echo $this->config->get('themer_menu11'.$lang); ?></a><?php } ?>
            <?php if ($this->config->get('themer_link12'.$lang) and $this->config->get('themer_menu12'.$lang)) { ?>
            <a href="<?php echo $this->config->get('themer_link12'.$lang); ?>"><?php echo $this->config->get('themer_menu12'.$lang); ?></a><?php } ?>
            <?php if ($this->config->get('themer_link13'.$lang) and $this->config->get('themer_menu13'.$lang)) { ?>
            <a href="<?php echo $this->config->get('themer_link13'.$lang); ?>"><?php echo $this->config->get('themer_menu13'.$lang); ?></a><?php } ?>
            <?php if ($this->config->get('themer_link14'.$lang) and $this->config->get('themer_menu14'.$lang)) { ?>
            <a href="<?php echo $this->config->get('themer_link14'.$lang); ?>"><?php echo $this->config->get('themer_menu14'.$lang); ?></a><?php } ?>
            <?php if ($this->config->get('themer_link15'.$lang) and $this->config->get('themer_menu15'.$lang)) { ?>
            <a href="<?php echo $this->config->get('themer_link15'.$lang); ?>"><?php echo $this->config->get('themer_menu15'.$lang); ?></a><?php } ?>
            <?php if ($this->config->get('themer_link16'.$lang) and $this->config->get('themer_menu16'.$lang)) { ?>
            <a href="<?php echo $this->config->get('themer_link16'.$lang); ?>"><?php echo $this->config->get('themer_menu16'.$lang); ?></a><?php } ?>
            <?php if ($this->config->get('themer_link17'.$lang) and $this->config->get('themer_menu17'.$lang)) { ?>
            <a href="<?php echo $this->config->get('themer_link17'.$lang); ?>"><?php echo $this->config->get('themer_menu17'.$lang); ?></a><?php } ?>
            <?php if ($this->config->get('themer_link18'.$lang) and $this->config->get('themer_menu18'.$lang)) { ?>
            <a href="<?php echo $this->config->get('themer_link18'.$lang); ?>"><?php echo $this->config->get('themer_menu18'.$lang); ?></a><?php } ?>
            <?php if ($this->config->get('themer_link19'.$lang) and $this->config->get('themer_menu19'.$lang)) { ?>
            <a href="<?php echo $this->config->get('themer_link19'.$lang); ?>"><?php echo $this->config->get('themer_menu19'.$lang); ?></a><?php } ?>
            <?php if ($this->config->get('themer_link20'.$lang) and $this->config->get('themer_menu20'.$lang)) { ?>
            <a href="<?php echo $this->config->get('themer_link20'.$lang); ?>"><?php echo $this->config->get('themer_menu20'.$lang); ?></a><?php } ?>
</div>

<div class="mobile-search">
 <div id="header" style="margin:0px;min-height:0px;padding:0px;position:relative;z-index:6;left:0px;top:0px;">
   <div class="button-search"><i class="fa fa-search"></i></div>
   <input class="top-mobile-search" type="text" name="search" placeholder="<?php echo $text_search; ?>" value="<?php echo $search; ?>" />
 </div>
</div>

<?php if ($categories) { ?>


<div class="menu-button"><i class="fa fa-bars"></i> <?php echo $text_category; ?></div>
        <nav class="mobile-category">
          <ul data-breakpoint="2000" class="flexnav">
    <li><a href="<?php echo $home; ?>"><?php echo $text_home; ?></a></li>
    <?php foreach ($categories as $category) { ?>
    <li><?php if ($category['active']) { ?>
	<a href="<?php echo $category['href']; ?>" class="active"><?php echo $category['name']; ?><?php if ($category['children']) { ?><span></span><?php } ?></a>
	<?php } else { ?>
	<a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?><?php if ($category['children']) { ?><span></span><?php } ?></a>
	<?php } ?>
            
      <?php if ($category['children']) { ?>
      
        <?php for ($i = 0; $i < count($category['children']);) { ?>
        <ul>
          <?php $j = $i + ceil(count($category['children']) / $category['column']); ?>
          <?php for (; $i < $j; $i++) { ?>
          <?php if (isset($category['children'][$i])) { ?>
          <li><a href="<?php echo $category['children'][$i]['href']; ?>"><?php echo $category['children'][$i]['name']; ?></a></li>
          <?php } ?>
          <?php } ?>
        </ul>
        <?php } ?>
      
      <?php } ?>
    </li>
    <?php } ?>
            
          </ul>
        </nav>

<?php } ?>
</div>

</div>

<div id="container-100">
<div id="container">
<div id="notification"></div>

<script type="text/javascript">
	$(document).ready(function() {
		if($(window).width()<=750) {
			//confirm("wow!");
			$('#header input').attr('name','search2');
			$('.mobile-search #header input').attr('name','search');
		} else {
			$('#header input').attr('name','search');
		}
	});
</script>