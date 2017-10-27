<div class="quick_view">
<i class="fa fa-times close" onclick="$('.show_quick_view').popup('hide', function (){ $('.quick_view').remove()});"></i>
<div class="product_info">
<div class="image">
<?php if ($bestseller_sticker) { ?><div class="sticker st_bestseller"><?php echo $bestseller_sticker_text; ?></div><?php } ?>
<?php if ($new_sticker) { ?><div class="sticker st_new"><?php echo $new_sticker_text; ?></div><?php } ?>
<?php if ($special_sticker) { ?><div class="sticker st_special"><?php echo $special_sticker; ?></div><?php } ?>
<?php if ($thumb) { ?>
	<img src="<?php echo $thumb; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" />
	<div class="rating">
		<?php for ($i = 1; $i <= 5; $i++) { ?>
            <?php if ($rating < $i) { ?>
                <i class="fa fa-star-o"></i>
            <?php } else { ?>
                <i class="fa fa-star"></i>
            <?php } ?>
		<?php } ?>
	</div>	
<?php } ?>
<?php if ($images) { ?>
    <div class="image-additional">
	<img src="<?php echo $small; ?>" data-thumb="<?php echo $thumb; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" />
        <?php foreach ($images as $image) { ?>
			<img src="<?php echo $image['small']; ?>" data-thumb="<?php echo $image['thumb']; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" />
        <?php } ?>
	</div>
<?php } ?>
</div>
<div class="product_desc product_<?php echo $product_id; ?>">
<div>
<div class="name"><?php echo $name; ?></div>
<div class="stock">
<?php if ($manufacturer) { ?><span><span><?php echo $text_manufacturer; ?></span> <a href="<?php echo $manufacturers; ?>"><?php echo $manufacturer; ?></a></span><?php } ?>
<?php if (isset($show_stock)) { ?><span><span><?php echo $text_stock; ?></span> <?php echo $stock; ?></span><?php } ?>
<?php if ($weight) { ?><span><span><?php echo $text_weight; ?></span><span class="weight_<?php echo $product_id; ?>" data-weight="<?php echo $weight_value; ?>" data-weight-unit="<?php echo $weight_unit; ?>"><?php echo $weight; ?></span></span><?php } ?>
</div>
<div class="description"><?php echo strip_tags(html_entity_decode($description)); ?>... <a href="<?php echo $href; ?>" title="Смотреть полное описание <?php echo $name; ?>">Подробнее</a></div>
<div class="price-cart">
<div class="price">
<?php if (!$special) { ?>
	<span class="price_<?php echo $product_id; ?>" data-price="<?php echo $price_value; ?>"><?php echo $price; ?></span>
<?php } else { ?>
	<span class="price-old"><span class="price_<?php echo $product_id; ?>" data-price="<?php echo $price_value; ?>"><?php echo $price; ?></span></span> <span class="price-new"><span class="special_<?php echo $product_id; ?>" data-price="<?php echo $special_value; ?>"><?php echo $special; ?></span></span>
<?php } ?>
</div>
<div class="cart">
<div class="quantity quantity_<?php echo $product_id; ?>">
	<input type="text" name="quantity" value="<?php echo $minimum; ?>" oninput="recalculateprice('<?php echo $product_id; ?>', '<?php echo $minimum; ?>');"/>
	<span>
	<i class="fa fa-plus" onclick="quantity('<?php echo $product_id; ?>', '<?php echo $minimum; ?>', '+');"></i>
	<i class="fa fa-minus" onclick="quantity('<?php echo $product_id; ?>', '<?php echo $minimum; ?>', '-');"></i>
	</span>
</div>
<?php if ($quantity > 0) { ?>
<span class="button2"><input type="button" onclick="cart.add('<?php echo $product_id; ?>', $(this).parent().parent().find('.quantity input').val())" value="<?php echo $button_cart; ?>" class="button button2 btn">
<?php } else { ?>
<span class="button2"><input type="button" value="<?php echo $button_cart_disabled; ?>" class="button button2 btn disabled">
<?php } ?>
</div>
</div>
 <?php if ($options) { ?>
    <div id="option_<?php echo $product_id; ?>" class="options">
        <?php foreach ($options as $option) { ?>
		<?php if ($option['type'] == 'select' || $option['type'] == 'image') { ?>
        <div id="option-<?php echo $option['product_option_id']; ?>" class="option option-select">
		<?php if ($option['required']) { ?><span class="required">*</span><?php } ?>
          <select name="option[<?php echo $option['product_option_id']; ?>]">
            <option value=""><?php echo $option['name']; ?></option>
            <?php foreach ($option['product_option_value'] as $option_value) { ?>
            <option value="<?php echo $option_value['product_option_value_id']; ?>" data-weight="<?php echo (float)($option_value['weight_prefix'].$option_value['weight']); ?>" data-points="<?php echo (isset($option_value['points_value']) ? $option_value['points_value'] : 0); ?>" data-price_prefix="<?php echo $option_value['price_prefix']; ?>" data-price="<?php echo $option_value['price_value']; ?>"><?php echo $option_value['name']; ?>
            <?php if ($option_value['price']) { ?>
            (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
            <?php } ?>
            </option>
            <?php } ?>
          </select>
        </div>
        <?php } ?>
        <?php if ($option['type'] == 'radio') { ?>
        <div id="option-<?php echo $option['product_option_id']; ?>" class="option">
          <b><?php if ($option['required']) { ?>*<?php } ?><?php echo $option['name']; ?>:</b>
          <?php foreach ($option['product_option_value'] as $option_value) { ?>
		  <div class="option_radio">
          <input type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" data-weight="<?php echo (float)($option_value['weight_prefix'].$option_value['weight']); ?>" data-points="<?php echo (isset($option_value['points_value']) ? $option_value['points_value'] : 0); ?>" data-price_prefix="<?php echo $option_value['price_prefix']; ?>" data-price="<?php echo $option_value['price_value']; ?>" id="option-value-<?php echo $option_value['product_option_value_id']; ?>" />
          <label for="option-value-<?php echo $option_value['product_option_value_id']; ?>"></label>
		  <label for="option-value-<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['name']; ?>
            <?php if ($option_value['price']) { ?>
            (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
            <?php } ?>
          </label>
          </div>
          <?php } ?>
        </div>
        <?php } ?>
        <?php if ($option['type'] == 'checkbox') { ?>
        <div id="option-<?php echo $option['product_option_id']; ?>" class="option">
          <?php if ($option['required']) { ?>
          <?php } ?>
          <b><?php if ($option['required']) { ?>*<?php } ?><?php echo $option['name']; ?>:</b>
          <?php foreach ($option['product_option_value'] as $option_value) { ?>
		  <div class="option_radio">
          <input type="checkbox" name="option[<?php echo $option['product_option_id']; ?>][]" value="<?php echo $option_value['product_option_value_id']; ?>" data-weight="<?php echo (float)($option_value['weight_prefix'].$option_value['weight']); ?>" data-points="<?php echo (isset($option_value['points_value']) ? $option_value['points_value'] : 0); ?>" data-price_prefix="<?php echo $option_value['price_prefix']; ?>" data-price="<?php echo $option_value['price_value']; ?>" id="option-value-<?php echo $option_value['product_option_value_id']; ?>" />
          <label for="option-value-<?php echo $option_value['product_option_value_id']; ?>"></label>
		  <label for="option-value-<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['name']; ?>
            <?php if ($option_value['price']) { ?>
            (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
            <?php } ?>
          </label>
          </div>
          <?php } ?>
        </div>
        <?php } ?>
	<?php } ?>
	</div>
	<?php } ?>
</div>
</div>
</div>
<script type="text/javascript">
function process_discounts(price, quantity) {
<?php
    foreach ($dicounts_unf as $discount) {
        echo 'if ((quantity >= '.$discount['quantity'].') && ('.$discount['price'].' < price)) price = '.$discount['price'].';'."\n";
    }
?>
    return price;
}
</script> 
</div>