<?php if($products || $vouchers) { ?>
<div class="table_wrap">
<table class="table table-bordered table-hover table-responsive">
<tr>
	<td class="image text-center"><?php echo $lang['text_image']; ?></td>
	<td class="text-left"><?php echo $column_name; ?></td>
	<td class="text-left hidden-xs"><?php echo $column_model; ?></td>
	<td class="quantity text-left hidden-xs"><?php echo $column_quantity; ?></td>
	<td class="text-right hidden-xs"><?php echo $column_price; ?></td>
	<td class="total text-right"><?php echo $column_total; ?></td>
	<td class="delete text-center"></td>
</tr>
<?php foreach ($products as $product) { ?>
<tr>
	<td class="image text-center"><img src="<?php echo $product['thumb']; ?>" class="img-thumbnail" title="<?php echo $product['name']; ?>" /></td>
	<td class="text-left"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
	<?php foreach ($product['option'] as $option) { ?>
		<br /><small><?php echo $option['name']; ?>: <?php if (isset($option['option_value']) && !empty($option['option_value'])) echo $option['option_value'];else if (isset($option['value'])) echo $option['value']; ?></small>
	<?php } ?>
	</td>
	<td class="text-left hidden-xs"><?php echo $product['model']; ?></td>
	<td class="quantity text-left hidden-xs">
		<div class="quantity input-group">
            <input type="text" name="quantity[<?php echo $product['cart_id']; ?>]" value="<?php echo $product['quantity']; ?>" onchange="cart_update('<?php echo $product['cart_id']; ?>', $(this).val());" size="1" class="form-control" />
			<span>
				<i class="fa fa-plus btn btn-default" onclick="cart_update('<?php echo $product['cart_id']; ?>', parseFloat($(this).parent().prev().val())+1);"></i>
				<i class="fa fa-minus btn btn-default" onclick="cart_update('<?php echo $product['cart_id']; ?>', parseFloat($(this).parent().prev().val())-1);"></i>
			</span>
        </div>
	</td>
  <td class="text-right hidden-xs"><?php echo $product['price']; ?></td>
  <td class="total text-right"><?php echo $product['total']; ?></td>
  <td class="delete text-center"><button type="button" onclick="cart.remove('<?php echo $product['cart_id']; ?>', <?php echo $product['product_id']; ?>);" title="<?php echo $button_remove; ?>" class=""><i class="fa fa-times"></i></button></td>
</tr>
<?php } ?>

<?php foreach ($vouchers as $voucher) { ?>
<tr>
	<td class="image text-center"></td>
	<td class="text-left"><?php echo $voucher['description']; ?></td>
	<td class="text-left hidden-xs"></td>
	<td class="text-center hidden-xs">1</td>
	<td class="text-right hidden-xs"><?php echo $voucher['amount']; ?></td>
	<td class="text-right"><?php echo $voucher['amount']; ?></td>
	<td class="delete text-center"><button type="button" onclick="voucher.remove('<?php echo $voucher['key']; ?>');" title="<?php echo $button_remove; ?>" class=""><i class="fa fa-times"></i></button></td>
</tr>
<?php } ?>
</table>
</div>

<?php if (($coupon || $voucher || $reward) && $products) { ?>
<table class="coupon_table">
<tr><td><p><?php echo $lang['text_additional']; ?></p></td></tr>
<?php if ($coupon) { ?>
<tr>
	<td>
        <div class="coupon input-group">
			<input type="text" name="coupon" value="" placeholder="<?php echo $lang['text_coupon']; ?>" id="input-coupon" class="form-control" />
			<span class="input-group-btn">
				<button id="button-coupon" data-loading-text="<?php echo $lang['text_loading']; ?>"  class="btn btn-primary"><?php echo $lang['button_apply']; ?></button>
			</span>
		</div>
	</td>
</tr>
<?php } ?>
<?php if ($reward) { ?>
<tr>
	<td>
		<div class="coupon input-group">
			<input type="text" name="reward" value="" placeholder="<?php echo $lang['text_reward']; ?>" id="input-reward" class="form-control" />
			<span class="input-group-btn">
				<button id="button-reward" data-loading-text="<?php echo $lang['text_loading']; ?>"  class="btn btn-primary"><?php echo $lang['button_apply']; ?></button>
			</span>
		</div>
	</td>
</tr>
<?php } ?>
<?php if ($voucher) { ?>
<tr>
	<td>
		<div class="coupon input-group">
			<input type="text" name="voucher" value="" placeholder="<?php echo $lang['text_voucher']; ?>" id="input-voucher" class="form-control" />
			<span class="input-group-btn">
				<button id="button-voucher" data-loading-text="<?php echo $lang['text_loading']; ?>"  class="btn btn-primary"><?php echo $lang['button_apply']; ?></button>
			</span>
		</div>
	</td>
</tr>
<?php } ?>
</table>
<?php } ?>

<table class="total_table">
<?php if ($weight && preg_replace('/[^\d.]/','',$weight) > 0) { ?>
<tr>
	<td colspan="6" class="text-right  hidden-xs"><?php echo $lang['text_product_weight']; ?></td>
	<td colspan="3" class="text-right  visible-xs"><?php echo $lang['text_product_weight']; ?></td>
	<td><?php echo $weight; ?></td>
</tr>
<?php } ?>
<?php foreach ($totals as $total) { ?>
<tr>
  <td colspan="6" class="text-right  hidden-xs"><?php echo $total['title']; ?>:</td>
  <td colspan="3" class="text-right  visible-xs"><?php echo $total['title']; ?>:</td>
  <td class="text-right"><?php echo $total['text']; ?></td>
</tr>
<?php } ?>
</table>

<?php if($related && isset($products_related)) { ?>
<div class="row product_carousel">
<h3 class="heading"><span><?php echo $checkout_related_text; ?></span></h3>
<div class="products product_related">
  <?php foreach ($products_related as $product) { ?>
  <div class="product-layout">
    <div class="product-thumb transition">
    <div class="image">
	<a href="<?php echo $product['href']; ?>">
		<img src="<?php echo $product['thumb']; ?>" <?php if ($product['quantity'] < 1 && $show_stock_status) { ?>data-status="<?php echo $product['stock_status']; ?>" data-status-id="<?php echo $product['stock_status_id']; ?>"<?php } ?> <?php if($product['additional_image']) { ?>data-additional="<?php echo $product['additional_image'];?>"<?php } ?> alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" />
	</a>
	</div>
      <div class="caption">
        <h4><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h4>
		<?php if ($show_options) { ?>
			<div id="option_<?php echo $product['product_id']; ?>" class="option">
				<?php foreach ($product['options'] as $key => $option) { ?>
				<?php if ($key < $show_options_item) { ?>
					<?php if ($option['type'] == 'checkbox') { ?>
						<div id="input-option<?php echo $option['product_option_id']; ?>">
							<?php if ($option['required']) { ?>*<?php } ?> <label><?php echo $option['name']; ?>:</label><br />
							<?php foreach ($option['product_option_value'] as $option_value) { ?>
								<input type="checkbox" name="option[<?php echo $option['product_option_id']; ?>][]" value="<?php echo $option_value['product_option_value_id']; ?>" id="option-value-<?php echo $option_value['product_option_value_id']; ?>" />
								<label for="option-value-<?php echo $option_value['product_option_value_id']; ?>">
									<span><?php echo $option_value['name']; ?></span>
									<?php if ($option_value['price']) { ?>
										<span>(<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)</span>
									<?php } ?>
								</label>
							<?php } ?>
						</div>
					<?php } ?>
					<?php if ($option['type'] == 'select' || $option['type'] == 'radio') { ?>
						<div id="input-option<?php echo $option['product_option_id']; ?>">
							<?php if ($option['required']) { ?>*<?php } ?> <label><?php echo $option['name']; ?>:</label><br />
							<?php foreach ($option['product_option_value'] as $option_value) { ?>
								<input type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" id="option-value-<?php echo $option_value['product_option_value_id']; ?>" />
								<label for="option-value-<?php echo $option_value['product_option_value_id']; ?>">
									<span><?php echo $option_value['name']; ?></span>
									<?php if ($option_value['price']) { ?>
										<span>(<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)</span>
									<?php } ?>
								</label>
							<?php } ?>
						</div>
					<?php } ?>
				<?php } ?>
				<?php } ?>
			</div>
		<?php } ?>
        <?php if ($product['rating'] >= 0) { ?>
        <div class="rating">
          <?php for ($i = 1; $i <= 5; $i++) { ?>
          <?php if ($product['rating'] < $i) { ?>
          <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span>
          <?php } else { ?>
          <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i></span>
          <?php } ?>
          <?php } ?>
        </div>
        <?php } ?>
        <?php if ($product['price']) { ?>
        <p class="price">
          <?php if (!$product['special']) { ?>
          <?php echo $product['price']; ?>
          <?php } else { ?>
          <span class="price-old"><?php echo $product['price']; ?></span> <span class="price-new"><?php echo $product['special']; ?></span> 
          <?php } ?>
          <?php if ($product['tax']) { ?>
          <span class="price-tax"><?php echo $text_tax; ?> <?php echo $product['tax']; ?></span>
          <?php } ?>
        </p>
        <?php } ?>
	<div class="cart">
		<?php if ($product['quantity'] <= 0 && $disabled_buy_button) { ?>
			<button type="button" class="button btn btn-default <?php echo $product['product_id']; ?>" data-toggle="tooltip" title="<?php echo $disabled_buy_button_text; ?>"><i class="<?php echo $disabled_buy_button_icon; ?> <?php if ($show_disabled_buy_button_icon) { ?>visible-sm visible-xs<?php } ?>"></i> <span class="hidden-xs hidden-sm"><?php echo $disabled_buy_button_text; ?></span></button>
		<?php } else { ?>
			<button type="button" class="button btn btn-default <?php echo $product['product_id']; ?>" data-toggle="tooltip" title="<?php echo $button_cart; ?>" onclick="cart.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-shopping-basket"></i> <span class="hidden-xs hidden-sm"><?php echo $button_cart; ?></span></button>
		<?php } ?>
	</div>
        <button type="button" class="wishlist btn btn-default" data-toggle="tooltip" title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-heart"></i></button>
        <button type="button" class="compare btn btn-default" data-toggle="tooltip" title="<?php echo $button_compare; ?>" onclick="compare.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-exchange"></i></button>
      </div>
    </div>
  </div>
  <?php } ?>
</div>
</div>
<script type="text/javascript">
	setTimeout(function () {
		max_height_div('.product-thumb h4');
		max_height_div('.product-thumb .option');
	}, 50);
	$('.product_related').owlCarousel({
		responsiveBaseWidth: '.product_related',
		itemsCustom: [[0, 1], [448, 1], [650, 2], [750, 2], [1000, 3]],
		autoPlay: false,
		mouseDrag:false,
		navigation: true,
		navigationText: ['<i class="fa fa-chevron-left"></i>', '<i class="fa fa-chevron-right"></i>'],
		pagination: false,
	});
</script>
<?php } ?>
<?php } else { ?>
<script type="text/javascript">
	$(document).ready(function() {
		window.location.reload();
	});
</script>
<?php } ?>