<?php echo $header; ?>
<?php echo $column_left; ?><?php echo $column_right; ?>
<div id="content"><?php echo $content_top; ?>
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
<script type="text/javascript" src="catalog/view/theme/fastfood/js/jquery.lightbox.min.js"></script>
<div id="gallery">
<?php if (isset($gallerys)) { ?>
<?php foreach ($gallerys as $key => $gallery) { ?>
<div class="box-heading"><?php echo $gallery['name']; ?></div>
<div class="gallery_wrapper">
	<div class="gallery gallery_<?php echo $key; ?>">
	<?php foreach ($gallery['images'] as $key => $images) { ?>
		<div>
			<div class="image"><a href="<?php echo $images['popup']; ?>" title="<?php echo $images['title']; ?>" data-caption="<?php echo $images['title']; ?>" ><img src="<?php echo $images['image']; ?>" alt="<?php echo $images['title']; ?>" title="<?php echo $images['title']; ?>" /></a>
				<?php if ($images['title']) { ?><?php if ($images['link']) { ?><div class="name"><a href="<?php echo $images['link']; ?>"><?php echo $images['title']; ?></a></div><?php } else { ?><div class="name"><?php echo $images['title']; ?></div><?php } ?><?php } ?>
			</div>
		</div>
	<?php } ?>
  </div>
</div>
<?php } ?>
<?php } ?>
<div class="gallery_popup">
<div class="wrap">
</div>
</div>
</div>
<?php echo $content_bottom; ?>
</div>	
	
<script type="text/javascript">
	$('.gallery').owlCarousel({
		responsiveBaseWidth: '.gallery',
		navigation: true,
		slideSpeed: 200,
		paginationSpeed: 300,
		autoPlay: false,
		stopOnHover: true,
		touchDrag: true,
		mouseDrag: false,
		navigationText: ['<i class="fa fa-chevron-left"></i>', '<i class="fa fa-chevron-right"></i>'],
		pagination: false,
	});
	$(function() {
		$('.gallery .image > a').lightbox(); 	
	});
</script>
<?php echo $footer; ?>