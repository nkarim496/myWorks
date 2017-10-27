<!DOCTYPE html>
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
<head>
<meta charset="UTF-8" />
<title><?php echo $title; if (isset($_GET['page'])) { echo " - ". ((int) $_GET['page'])." ".$text_page;} ?></title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<?php if (isset($_GET['page'])) { ?>
<meta name="robots" content="noindex, follow">
<?php } ?>
<base href="<?php echo $base; ?>" />
<?php if ($description) { ?>
<meta name="description" content="<?php echo $description; if (isset($_GET['page'])) { echo " - ". ((int) $_GET['page'])." ".$text_page;} ?>" />
<?php } ?>
<?php if ($keywords) { ?>
<meta name="keywords" content="<?php echo $keywords; ?>" />
<?php } ?>
<meta property="og:title" content="<?php echo $title; if (isset($_GET['page'])) { echo " - ". ((int) $_GET['page'])." ".$text_page;} ?>" />
<meta property="og:type" content="website" />
<?php if (isset($og_url)) { ?>
<meta property="og:url" content="<?php echo $og_url; ?>" />
<?php } else {$og_url = $base;}?>
<?php if (isset($og_image)) { ?>
<meta property="og:image" content="<?php echo $og_image; ?>" />
<?php } else { ?>
<meta property="og:image" content="<?php echo $logo; ?>" />
<?php } ?>
<meta property="og:site_name" content="<?php echo $name; ?>" />
<?php if (isset($icon)) { ?>
<link href="<?php echo $icon; ?>" rel="icon" />
<?php } ?>
<?php foreach ($links as $link) { ?>
<link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
<?php } ?>
<link href="catalog/view/javascript/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen" />
<link rel="stylesheet" type="text/css" href="catalog/view/theme/fastfood/stylesheet/stylesheet.css?v=1.0.4" />
<?php if ($custom_style) { ?>
<link rel="stylesheet" type="text/css" href="catalog/view/theme/fastfood/stylesheet/<?php echo $custom_style; ?>" />
<?php } ?>
<?php if ($background_image) { ?>
<link rel="stylesheet" type="text/css" href="catalog/view/theme/fastfood/stylesheet/additional.css" />
<?php } ?>
<?php foreach ($styles as $style) { ?>
<link rel="<?php echo $style['rel']; ?>" type="text/css" href="<?php echo $style['href']; ?>" media="<?php echo $style['media']; ?>" />
<?php } ?>
<script src="catalog/view/javascript/jquery/jquery-2.1.1.min.js" type="text/javascript"></script>
<script src="catalog/view/javascript/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<script type="text/javascript" src="catalog/view/theme/fastfood/js/owl.carousel.min.js"></script>
<?php foreach ($scripts as $script) { ?>
<script type="text/javascript" src="<?php echo $script; ?>"></script>
<?php } ?>
<link rel="stylesheet" type="text/css" property="stylesheet" href="catalog/view/theme/fastfood/stylesheet/font-awesome.min.css" />
</head>
<body <?php if ($background_image) { ?>style="background:url('../image/<?php echo $background_image; ?>') repeat"<?php } ?>>
<div id="wrap">
<div id="header">
<div class="container">
<div class="row">
	<?php if ($logo) { ?>
		<div id="logo" class="col-xs-12 col-sm-12 col-md-4 col-lg-3">
			<?php if ($home == $og_url) { ?>
				<img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" />
			<?php } else { ?>
				<a href="<?php echo $home; ?>"><img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" /></a>
			<?php } ?>
		</div>
	<?php } ?>
	<div class="col-xs-12 col-sm-12 col-md-8 col-lg-9">
		<div class="row">
		<div id="phone" class="col-xs-12 col-sm-12 col-md-4 col-lg-3 col-md-push-8 col-lg-push-9">
			<div><?php echo $phone1; ?><i class="fa fa-chevron-down"></i></div>
			<div class="dropdown">
				<?php if (isset($show_callback)) { ?><span class="open_callback" onclick="$('#callback').popup('show');"><i class="fa fa-share"></i><b>Перезвоните мне!</b></span><div></div><?php } ?>
				<?php foreach ($phones as $phone) { ?>
					<span><i class="fa <?php echo $phone['icon']; ?>"></i><?php echo $phone['number']; ?></span>
				<?php } ?>
				<?php if($fax) { ?><span><i class="fa fa-fax"></i><?php echo $fax; ?></span><?php } ?>
				<?php if($mail) { ?><span><i class="fa fa-envelope-o"></i><?php echo $mail; ?></span><?php } ?>
				<?php if(isset($delivery_hours)) { ?><div></div><span><i class="fa fa-truck"></i><?php echo $delivery_hours; ?></span><?php } ?>
			</div>
		</div>
		<div id="links" class="col-xs-12 col-sm-12 col-md-8 col-lg-9 col-md-pull-4 col-lg-pull-3">
			<div class="hidden-md">
			<ul>
				<?php if (isset($headerlinks)) { ?>
					<?php foreach ($headerlinks as $headerlink) { ?>
						<li><a href="<?php echo $headerlink['link']; ?>" title="<?php echo $headerlink['title']; ?>"><?php echo $headerlink['title']; ?></a></li>
					<?php } ?>
				<?php } ?>
			</ul>
			</div>
			<div class="btn-group pull-left visible-md">
				<button class="btn btn-link dropdown-toggle" data-toggle="dropdown"><i class="fa fa-info" aria-hidden="true"></i> <span>Информация</span> <span class="caret"></span></button>
				<ul class="dropdown-menu dropdown-menu-left">
					<?php foreach ($headerlinks as $headerlink) { ?>
						<li><a href="<?php echo $headerlink['link']; ?>" title="<?php echo $headerlink['title']; ?>"><?php echo $headerlink['title']; ?></a></li>
					<?php } ?>
				</ul>
			</div>
			<div>
				<ul>
					<?php if (isset($show_search)) { ?><li class="search hidden-xs"><i class="fa fa-search" title="Показать строку поиска по сайту"></i></li><?php } ?>
					<?php if (isset($show_account)) { ?><li class="user"><i class="fa fa-user" title="Перейти на страницу авторизации/регистрации" onclick="location='index.php?route=account/account'"></i></li><?php } ?>
					<?php echo $language; ?>
					<?php echo $currency; ?>
					<?php if (isset($show_callback)) { ?><li class="open_callback"><a onclick="$('#callback').popup('show');">Перезвоните мне!</a></li><?php } ?>
				</ul>
			</div>
		</div>
		<div class="col-xs-12"><hr /></div>
		</div>
		<?php if ($categories) { ?>
		<div class="row">
			<div id="menu" class="col-xs-12 col-sm-6 col-md-12">
				<div class="open_menu" onclick="$('#menu > ul').toggleClass('show');"><?php if (isset($text_menu)) { ?><?php echo $text_menu; ?><?php } ?> <i class="fa fa-bars"></i></div>
				<ul>
					<?php foreach ($categories as $key => $category) { ?>
						<li>
							<a href="<?php echo $category['href']; ?>" <?php if (isset($category['active'])) { ?>class="active"<?php } ?> title="<?php echo $category['name']; ?>"><?php echo $category['name']; ?></a>
							<?php if ($category['children']) { ?>
								<i class="fa fa-chevron-down"></i>
								<span class="open_child_menu visible-xs visible-sm" onclick="$(this).parent().find('div').toggleClass('show'); $(this).children().toggleClass('show');">
									<i class="fa fa-plus plus show"></i>
									<i class="fa fa-minus minus"></i>
								</span>
							<?php } ?>
							<?php if ($category['children']) { ?>
								<div>
									<?php foreach (array_chunk($category['children'], ceil(count($category['children']) / $category['column'])) as $children) { ?>
										<ul class="list-unstyled <?php if ($category['column']) { echo 'column'; } ?>">
											<?php foreach ($children as $child) { ?>
												<li>
													<a href="<?php echo $child['href']; ?>"><i class="fa fa-level-up visible-xs visible-sm" aria-hidden="true"></i><?php echo $child['name']; ?></a>
													<?php if ($child['children']) { ?>
														<span class="open_child_menu visible-xs visible-sm" onclick="$(this).parent().find('ul').toggleClass('show'); $(this).children().toggleClass('show');">
															<i class="fa fa-plus plus show"></i>
															<i class="fa fa-minus minus"></i>
														</span>
														<ul class="list-unstyled">
															<?php foreach ($child['children'] as $child) { ?>
																<li><a href="<?php echo $child['href']; ?>"><i class="fa fa-level-up visible-xs visible-sm" aria-hidden="true"></i><?php echo $child['name']; ?></a></li>
															<?php } ?>
														</ul>
													<?php } ?>
												</li>
											<?php } ?>
										</ul>
									<?php } ?>
								</div>
							<?php } ?>
						</li>
					<?php } ?>
					<?php if(isset($show_gallery)) { ?>
						<li><a href="<?php echo $gallery; ?>"><?php echo $text_gallery; ?></a></li>
					<?php } ?>
				</ul>
			</div>
			<div class="col-sm-6 visible-sm"><?php echo $search; ?></div>
		</div>
		<?php } ?>
	</div>
	<div id="cart_wrap" class="col-xs-12"></div>
</div>
<div class="row hidden-sm search_block">
	<div class="col-xs-12"><?php echo $search; ?></div>
</div>
</div>
</div>

<div class="container">
<div class="row margin">
<div id="col-xs-12 notification"></div>