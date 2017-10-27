  <div id="tabs-<?php echo $module; ?>" class="htabs">
	<?php if($latest_products){ ?>
	<a href="#tab-latest-<?php echo $module; ?>"><?php echo $tab_latest; ?></a>
	<?php } ?>
	<?php if($featured_products){ ?>
	<a href="#tab-featured-<?php echo $module; ?>"><?php echo $tab_featured; ?></a>
	<?php } ?>
	<?php if($bestseller_products){ ?>
	<a href="#tab-bestseller-<?php echo $module; ?>"><?php echo $tab_bestseller; ?></a>
	<?php } ?>
	<?php if($special_products){ ?>
	<a href="#tab-special-<?php echo $module; ?>"><?php echo $tab_special; ?></a>
	<?php } ?>
 </div>




<?php if($latest_products){ ?>
 <div id="tab-latest-<?php echo $module; ?>" style="padding: 20px 10px 10px;" class="tab-content">
    <div id="owl-example7" class="owl-carousel owl-theme" style="display: block; opacity: 1;">
      <?php foreach ($latest_products as $product) { ?>
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
      <?php } ?>
    </div>
 </div>
<?php } ?>

<script>
$(document).ready(function() {
  $("#owl-example7").owlCarousel({
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
    navigation : false,
    rewindNav : true,
    scrollPerPage : false,  // сразу в конец или начало
  });
});
</script>



<?php if($featured_products){ ?>
  <div id="tab-featured-<?php echo $module; ?>" style="padding: 20px 10px 10px;" class="tab-content">
    <div id="owl-example8" class="owl-carousel owl-theme" style="display: block; opacity: 1;">
      <?php foreach ($featured_products as $product) { ?>
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
      <?php } ?>
    </div>
 </div>
<?php } ?>

<script>
$(document).ready(function() {
  $("#owl-example8").owlCarousel({
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
    navigation : false,
    rewindNav : true,
    scrollPerPage : false,  // сразу в конец или начало
  });
});
</script>


<?php if($bestseller_products){ ?>
 <div id="tab-bestseller-<?php echo $module; ?>" style="padding: 20px 10px 10px;" class="tab-content">
    <div id="owl-example9" class="owl-carousel owl-theme" style="display: block; opacity: 1;">
      <?php foreach ($bestseller_products as $product) { ?>
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
      <?php } ?>
    </div>
 </div>
<?php } ?>

<script>
$(document).ready(function() {
  $("#owl-example9").owlCarousel({
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
    navigation : false,
    rewindNav : true,
    scrollPerPage : false,  // сразу в конец или начало
  });
});
</script>

<?php if($special_products){ ?>
 <div id="tab-special-<?php echo $module; ?>" style="padding: 20px 10px 10px;" class="tab-content">
    <div id="owl-example10" class="owl-carousel owl-theme" style="display: block; opacity: 1;">
      <?php foreach ($special_products as $product) { ?>
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
      <?php } ?>
    </div>
 </div>
<?php } ?>

<script>
$(document).ready(function() {
  $("#owl-example10").owlCarousel({
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
    navigation : false,
    rewindNav : true,
    scrollPerPage : false,  // сразу в конец или начало
  });
});
</script>

<script type="text/javascript">
$('#tabs-<?php echo $module; ?> a').tabs();
</script> 