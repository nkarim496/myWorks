<div class="slideshow">
<div class="flex-container">
    <div class="flexslider<?php echo $module; ?>">
        <ul class="slides">
			 <?php foreach ($banners as $banner) { ?>
		   <li>
    <?php if ($banner['link']) { ?>
    <a href="<?php echo $banner['link']; ?>"><img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" /></a>
    <?php } else { ?>
    <img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" />
    <?php } ?>
    <?php } ?>
            </li>
         </ul>
    </div>
</div>
</div>
<script>
    $(document).ready(function () {
        if($(".flexslider<?php echo $module; ?> li").length == 1) {
             $('.flexslider<?php echo $module; ?>').flexslider({
                animation: 'slide',
                slideshow: true,
                controlsContainer: '.flexslider<?php echo $module; ?>',
                controlNav: false,
                directionNav: false
            });      
        } else {
             $('.flexslider<?php echo $module; ?>').flexslider({
                animation: 'slide',
                slideshow: true,
                controlsContainer: '.flexslider<?php echo $module; ?>',
                controlNav: false
             });      
        }
    });
</script>