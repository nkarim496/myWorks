<div id="carousel<?php echo $module; ?>">
  <div class="carousel">
    <?php foreach ($banners as $banner) { ?>
    <div><?php if($banner['link']) { ?><a href="<?php echo $banner['link']; ?>"><?php } ?><img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" title="<?php echo $banner['title']; ?>" /><?php if($banner['link']) { ?></a><?php } ?></div>
    <?php } ?>
  </div>
</div>
<script type="text/javascript">
	$('.carousel').owlCarousel({
		responsiveBaseWidth: '#carousel<?php echo $module; ?>',
		itemsCustom: [[0, 1], [448, 2], [650, 4], [750, 5], [1000, 6]],
		autoPlay: true,
		stopOnHover: true,
		navigation: true,
		navigationText: ['<i class="fa fa-chevron-left"></i>', '<i class="fa fa-chevron-right"></i>'],
		pagination: false,
	});
</script>