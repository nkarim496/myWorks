<?php if ($news) { ?>
<div class="news_box">
      <div class="box-heading"><?php echo $customtitle; ?></div>
	  <div class="news_wrapper">
      <div class="news_module">
        <?php foreach ($news as $news_story) { ?>
          <div class="news">
			<?php if ($news_story['image']) { ?>
              <div class="image">
                <a onclick="location='<?php echo $news_story['href']; ?>'" title="<?php echo $news_story['title']; ?>"><img src="<?php echo $news_story['image']; ?>" alt="<?php echo $news_story['title']; ?>" /></a>
              </div>
            <?php } ?>
			<?php if ($show_headline) { ?>
				<div class="name"><a href="<?php echo $news_story['href']; ?>" title=""><?php echo $news_story['title']; ?></a></div>
			<?php } ?>
			<div class="description"><?php echo $news_story['description']; ?></div>
            <div class="posted"><a onclick="location='<?php echo $news_story['href']; ?>'"> <?php echo $text_more; ?></a><?php echo $news_story['posted']; ?></div>
          </div>
        <?php } ?>
        <?php if ($showbutton) { ?>
          <div style="text-align:right;">
            <a href="<?php echo $newslist; ?>" class="button"><span><?php echo $buttonlist; ?></span></a>
          </div>
        <?php } ?>
      </div>
    </div>
</div>
<?php } ?>
<script type="text/javascript">
	$('.news_module').owlCarousel({
		responsiveBaseWidth: '.news_module',
		itemsCustom: [[0, 1], [448, 2], [650, 3], [750, 3], [1000, 4]],
		navigation: true,
		autoPlay: false,
		navigationText: ['<i class="fa fa-chevron-left"></i>', '<i class="fa fa-chevron-right"></i>'],
		pagination: false,
	});
</script>