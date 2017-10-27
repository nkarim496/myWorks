<div class="slideshow">
<div class="slides slides<?php echo $module; ?>">
<?php foreach ($banners as $banner) { ?>
  <div class="item">
    <?php if ($banner['link']) { ?>
    <a href="<?php echo $banner['link']; ?>"><img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" class="img-responsive" /></a>
    <?php } else { ?>
    <img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" class="img-responsive" />
    <?php } ?>
	<div class="title"><?php echo $banner['title']; ?></div>
  </div>
  <?php } ?>
</div>
</div>
<link rel="stylesheet" type="text/css" property="stylesheet" href="catalog/view/theme/fastfood/stylesheet/owl.transitions.css" />
<script type="text/javascript">
	$('.slides<?php echo $module; ?>').owlCarousel({
		singleItem:true,
		navigation:true,
		slideSpeed:800,
		paginationSpeed:1000,
		autoPlay:4000,
		stopOnHover:true,
		mouseDrag:false,
<?php if($slideshow_effect) { ?>transitionStyle:'<?php echo $slideshow_effect; ?>',<?php } ?>
		//itemsScaleUp:true,
		navigationText:['<i class="fa fa-chevron-left"></i>', '<i class="fa fa-chevron-right"></i>'],
	});
</script>