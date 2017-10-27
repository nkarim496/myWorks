<?php if (count($products) > 0) { ?>
<div class="box">
  <div class="box-heading"><i class="fa fa-eye"></i> <?php echo $heading_title; ?></div>
  <div class="box-content">

  <div id="owl-example11" class="owl-carousel owl-theme" style="display: block; opacity: 1;">

      <?php foreach ($products as $product) { ?>
      <div class="item">
        <?php if ($product['thumb']) { ?>
        <div class="image">

      <?php if ($product['price']) { ?>
        <?php if (!$product['special']) { ?>
        	<?php } else { ?>
	<span class="sale">-<?php echo $product['saving']; ?>%</span>
        <?php } ?>
      <?php } ?>

	<a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" /></a></div>
        <?php } ?>

	<div class="info">
        <div class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></div>
        <?php if ($product['price']) { ?>
        <div class="price">
          <?php if (!$product['special']) { ?>
          <?php echo $product['price']; ?>
          <?php } else { ?>
          <span class="price-old"><?php echo $product['price']; ?></span> <span class="price-new"><?php echo $product['special']; ?></span>
          <?php } ?>
        </div>
        <?php } ?>
        <div class="cart"><a onclick="addToCart('<?php echo $product['product_id']; ?>');" class="button" /><i class="fa fa-shopping-cart"></i> <?php echo $button_cart; ?></a></div>
        <?php if ($product['rating']) { ?>
        <div class="rating"><img src="catalog/view/theme/default/image/stars-<?php echo $product['rating']; ?>.png" alt="<?php echo $product['reviews']; ?>" /></div>
        <?php } ?>
	</div>

      </div>
      <?php } ?>

    </div>
  </div>
</div>
<?php } ?>

<script>
$(document).ready(function () {
        if (!$("#owl-example11").parents("#column-left, #column-right").length) {
            $("#owl-example11").owlCarousel({

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
		scrollPerPage : false,  // сразу в конец или начало

	    });
        }
});
</script>