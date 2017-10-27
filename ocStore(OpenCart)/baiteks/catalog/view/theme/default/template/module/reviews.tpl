<div class="box">
  <div class="box-heading"><?php echo $header; ?></div>
  <div class="box-content">

  <div id="owl-example6" class="owl-carousel owl-theme" style="display: block; opacity: 1;">

      <?php foreach ($reviews as $review) { ?>
      <div class="item" style="padding: 15px 0px;">
        <?php if ($review['product_id']) {?>
          <?php if ($review['prod_thumb']) { ?>
          <div class="image" style="padding: 0px;text-align: center;width: 100%;"><a href="<?php echo $review['prod_href']; ?>"><img src="<?php echo $review['prod_thumb']; ?>" alt="<?php echo $review['prod_name']; ?>" title="<?php echo $review['prod_name']; ?>"/></a></div>
          <?php } ?>

	<div class="name" style="text-align:center;"><a href="<?php echo $review['prod_href']; ?>"><?php echo $review['prod_name']; ?></a></div>
          <?}?>
	<div class="rating" style="text-align:center;"><img src="catalog/view/theme/default/image/stars-<?php echo $review['rating']; ?>.png"/></div>
	<div style="text-align:center;"><?php echo $review['description']?></div></div>

      <?php } ?>

  </div>

<div style="display: block;background-color: #F5F5F5;border-top: 1px solid #EDEDED;margin: 12px -10px -18px;padding: 5px 10px 5px 0px;text-align: right;"><a href="<?php echo $link_all_reviews; ?>" class="button"><span><?php echo $text_all_reviews;?></span></a></div>

  </div>
</div>

<script>
$(document).ready(function () {
        if (!$("#owl-example6").parents("#column-left, #column-right").length) {
            $("#owl-example6").owlCarousel({

    		// Отображение
    		itemsCustom : [[0, 1], [461, 2], [750, 3], [1000, 4], [1200, 5]],

		//Скорость прокрутки
		slideSpeed : 500,
		paginationSpeed : 800,
		rewindSpeed : 1000,

		//Автопролистывание
		autoPlay : false,
		stopOnHover : false,

		// Кнопки навигации < >
		navigation : true,
		rewindNav : true,
		pagination: false,
		scrollPerPage : false,  // сразу в конец или начало

	    });
        }
});
</script>