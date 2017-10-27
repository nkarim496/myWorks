<div class="box">
<div id="banner<?php echo $module; ?>" class="banner" style="height:<?php echo $height+37; ?>px;">
  <?php foreach ($banners as $banner) { ?>
  <div>
  <div class="box-heading"><?php echo $banner['title']; ?></div>
  <div class="banner_img" style="height:<?php echo $height; ?>px;">
	<?php if ($banner['link']) { ?><a href="<?php echo $banner['link']; ?>" title="<?php echo $banner['title']; ?>"><?php } ?> 
	<img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" title="<?php echo $banner['title']; ?>" />
	<?php if ($banner['link']) { ?></a><?php } ?> 
  </div>
  </div>
  <?php } ?>
</div>
</div>
<link rel="stylesheet" type="text/css" property="stylesheet" href="catalog/view/theme/fastfood/stylesheet/owl.transitions.css" />
<script type="text/javascript">
	$('#banner<?php echo $module; ?>').owlCarousel({
		singleItem:true,
		navigation:false,
		slideSpeed:800,
		paginationSpeed:1000,
		autoPlay:4000,
		stopOnHover:true,
		mouseDrag:false,
		transitionStyle:'fade',
		//itemsScaleUp:true,
		navigationText:['<i class="fa fa-chevron-left"></i>', '<i class="fa fa-chevron-right"></i>'],
	});
</script>