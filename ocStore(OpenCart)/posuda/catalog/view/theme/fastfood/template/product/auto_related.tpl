<?php if (isset($show_similar) && $products_similar) { ?>
<div class="box box_carousel">
	<div class="box-heading"><?php echo $title_similar; ?></div>
	<div class="box-content">
	<div class="box-product product_similar">
	<?php foreach ($products_similar as $product) { ?>
    <div class="product product_<?php echo $product['product_id']; ?>_ar">
	<?php foreach($product['stickers'] as $sticker) { ?>
		<div class="sticker"><?php echo $sticker['text']; ?> <?php echo $sticker['value']; ?> <?php echo $sticker['text_after']; ?></div>
	<?php } ?>
      <?php if ($product['thumb']) { ?>
      <div class="image">
	  <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" data-id="<?php echo $product['product_id']; ?>" class="image<?php echo $product['product_id']; ?> img-responsive" title="<?php echo $product['name']; ?>" alt="<?php echo $product['name']; ?>" /></a>
	    <?php if ($product['rating']) { ?>
        <div class="rating">
		<?php for ($i = 1; $i <= 5; $i++) { ?>
            <?php if ($product['rating'] < $i) { ?>
                <i class="fa fa-star-o"></i>
            <?php } else { ?>
                <i class="fa fa-star"></i>
            <?php } ?>
        <?php } ?>
		<sup onclick="location='<?php echo $product['href']; ?>#tab-review'"><?php echo $product['num_reviews']; ?></sup>
		</div>
        <?php } ?>
	  </div>
      <?php } ?>
	  <div class="desc">
		<div class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></div>
		<div class="description"><?php echo $product['description']; ?></div>
		<!-- options -->
		<?php if ($show_options) { ?>
			<div id="option_<?php echo $product['product_id']; ?>" class="option">
				<?php foreach ($product['options'] as $key => $option) { ?>
					<?php if ($key < $show_options_item) { ?>
						<?php if ($option['type'] == 'checkbox') { ?>
							<div id="input-option<?php echo $option['product_option_id']; ?>">
								<label><?php if ($option['required']) { ?>*<?php } ?> <?php echo $option['name']; ?>:</label>
								<?php foreach ($option['product_option_value'] as $option_value) { ?>
								<div class="checkbox">
									<input type="checkbox" name="option[<?php echo $option['product_option_id']; ?>][]" value="<?php echo $option_value['product_option_value_id']; ?>" id="option-value-<?php echo $option_value['product_option_value_id']; ?>" data-price_prefix="<?php echo $option_value['price_prefix']; ?>" data-price="<?php if($option_value['price_value']) { echo $option_value['price_value']; } else { echo '0';} ?>" onchange="recalculateprice('<?php echo $product['product_id']; ?>_ar');" />
									<label for="option-value-<?php echo $option_value['product_option_value_id']; ?>"></label>
									<label for="option-value-<?php echo $option_value['product_option_value_id']; ?>">
										<span><?php echo $option_value['name']; ?></span>
										<?php if ($option_value['price']) { ?>
											<span>(<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)</span>
										<?php } ?>
									</label>
								</div>
								<?php } ?>
							</div>
						<?php } ?>
						<?php if ($option['type'] == 'image') { ?>
							<div id="input-option<?php echo $option['product_option_id']; ?>">
								<label><?php if ($option['required']) { ?>*<?php } ?> <?php echo $option['name']; ?>:</label>
								<?php foreach ($option['product_option_value'] as $option_value) { ?>
								<div class="radio">
									<input type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" id="option-value-<?php echo $option_value['product_option_value_id']; ?>" data-price_prefix="<?php echo $option_value['price_prefix']; ?>" data-price="<?php if($option_value['price_value']) { echo $option_value['price_value']; } else { echo '0';} ?>" onchange="recalculateprice('<?php echo $product['product_id']; ?>_ar');" />
									<label for="option-value-<?php echo $option_value['product_option_value_id']; ?>"></label>
									<label for="option-value-<?php echo $option_value['product_option_value_id']; ?>">
										<span><?php echo $option_value['name']; ?></span>
										<?php if ($option_value['price']) { ?>
											<span>(<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)</span>
										<?php } ?>
									</label>
								</div>
								<?php } ?>
							</div>
						<?php } ?>
						<?php if ($option['type'] == 'select' || $option['type'] == 'radio') { ?>
							<div id="input-option<?php echo $option['product_option_id']; ?>">
								<label><?php if ($option['required']) { ?>*<?php } ?> <?php echo $option['name']; ?>:</label>
								<?php foreach ($option['product_option_value'] as $option_value) { ?>
								<div class="radio">
									<input type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" id="option-value-<?php echo $option_value['product_option_value_id']; ?>" data-price_prefix="<?php echo $option_value['price_prefix']; ?>" data-price="<?php if($option_value['price_value']) { echo $option_value['price_value']; } else { echo '0';} ?>" onchange="recalculateprice('<?php echo $product['product_id']; ?>_ar');" />
									<label for="option-value-<?php echo $option_value['product_option_value_id']; ?>"></label>
									<label for="option-value-<?php echo $option_value['product_option_value_id']; ?>">
										<span><?php echo $option_value['name']; ?></span>
										<?php if ($option_value['price']) { ?>
											<span>(<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)</span>
										<?php } ?>
									</label>
								</div>
								<?php } ?>
							</div>
						<?php } ?>
					<?php } ?>
				<?php } ?>
			</div>
		<?php } ?>
		<!-- options -->
	<?php if($product['weight_value'] > 0) { ?>
		<div class="weight weight_<?php echo $product['product_id']; ?>_ar" data-weight="<?php echo $product['weight_value']; ?>" data-weight-unit="<?php echo $product['weight_unit']; ?>"><?php echo $product['weight']; ?></div>
    <?php } ?>
	<?php if ($product['price']) { ?>
      <div class="price">
        <?php if (!$product['special']) { ?>
        <span class="price_<?php echo $product['product_id']; ?>_ar" data-price="<?php echo $product['price_value']; ?>"><?php echo $product['price']; ?></span>
        <?php } else { ?>
        <span class="price-old price_<?php echo $product['product_id']; ?>_ar" data-price="<?php echo $product['price_value']; ?>"><?php echo $product['price']; ?></span> 
		<span class="price-new special_<?php echo $product['product_id']; ?>_ar" data-price="<?php echo $product['special_value']; ?>"><?php echo $product['special']; ?></span>
        <?php } ?>
      </div>
      <?php } ?>
    <div class="cart">
    <?php if ($product['quantity'] > 0) { ?>
		<?php if ($show_quantity) { ?>
			<input type="tel" value="<?php echo $product['minimum']; ?>" onchange="recalculateprice('<?php echo $product['product_id']; ?>_ar', '<?php echo $product['minimum']; ?>');" class="quantity_<?php echo $product['product_id']; ?>_ar" />
		<?php } ?>
		<input type="button" value="<?php echo $button_cart; ?>" onclick="cart.add('<?php echo $product['product_id']; ?>', $(this).prev().val(), 1);" class="button" />
	<?php } else { ?>
		<input type="button" value="<?php echo $button_cart_disabled; ?>" class="button disabled" />
	<?php } ?>
    </div>
     <div class="wishlist"><a onclick="addToWishList('<?php echo $product['product_id']; ?>');" title="<?php echo $button_wishlist; ?>"><i class="fa fa-heart"></i></a></div>
      <div class="compare"><a onclick="addToCompare('<?php echo $product['product_id']; ?>');" title="<?php echo $button_compare; ?>"><i class="fa fa-bar-chart-o"></i></a></div></div>
    </div>
      <?php } ?>
    </div>
  </div>
  </div>
  <script type="text/javascript">
	$('.product_similar').owlCarousel({
		responsiveBaseWidth: '.product_similar',
		navigation: true,
		navigationText: ['<i class="fa fa-chevron-left"></i>', '<i class="fa fa-chevron-right"></i>'],
		pagination: false,
	});
</script>
<?php } ?>