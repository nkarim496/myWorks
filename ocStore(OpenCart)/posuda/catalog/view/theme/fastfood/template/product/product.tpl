<?php echo $header; ?><?php echo $column_left; ?><?php echo $column_right; ?>
<?php if ($column_left && $column_right) { ?>
	<?php $class = 'col-sm-4 col-md-4 col-lg-6'; ?>
<?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-8 col-md-8 col-lg-9'; ?>
<?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
<?php } ?>
<div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
  <div class="product-info product_<?php echo $product_id; ?>">
    <?php if ($thumb || $images) { ?>
    <div class="left">
	<?php if ($bestseller_sticker) { ?><div class="sticker st_bestseller"><?php echo $bestseller_sticker_text; ?></div><?php } ?>
	<?php if ($new_sticker) { ?><div class="sticker st_new"><?php echo $new_sticker_text; ?></div><?php } ?>
	<?php if ($special_sticker) { ?><div class="sticker st_special"><?php echo $special_sticker; ?></div><?php } ?>
      <?php if ($thumb) { ?>
      <div class="image"><a href="<?php echo $popup; ?>" title="<?php echo $heading_title; ?>"><img src="<?php echo $thumb; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" id="image" /></a></div>
      <?php } ?>
      <?php if ($images) { ?>
      <div class="image-additional">
	<!--  <img src="<?php echo $small; ?>" data-thumb="<?php echo $thumb; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" /> -->
        <?php foreach ($images as $image) { ?>
        <a href="<?php echo $image['popup']; ?>" title="<?php echo $heading_title; ?>"><img src="<?php echo $image['thumb']; ?>" data-popup="<?php echo $image['popup']; ?>" data-thumb="<?php echo $image['small']; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" /></a>
        <?php } ?>
      </div>
      <?php } ?>
    </div>
    <?php } ?>
    <div class="right">
	<h1><?php echo $heading_title; ?></h1>
	<div>
		<div class="description">
			<div><span><?php echo $text_description; ?></span><?php echo utf8_substr(strip_tags(html_entity_decode($description, ENT_QUOTES, 'UTF-8')), 0, 199); ?>... <?php if(mb_strlen($description,'utf-8') > 199) { ?><a onclick="scroll_to('#tabs')">Подробнее</a><?php } ?></div>
			<?php if ($weight) { ?><div><span><?php echo $text_weight; ?></span><span class="weight_<?php echo $product_id; ?>" data-weight="<?php echo $weight_value; ?>" data-weight-unit="<?php echo $weight_unit; ?>"><?php echo $weight; ?></span></div><?php } ?>
		</div>
	<?php if ($options) { ?>
      <div class="options">
        <?php foreach ($options as $option) { ?>
        <?php if ($option['type'] == 'select') { ?>
        <div id="input-option<?php echo $option['product_option_id']; ?>" class="option form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
          <b><?php if ($option['required']) { ?>* <?php } ?><?php echo $option['name']; ?>:</b>
          <select name="option[<?php echo $option['product_option_id']; ?>]">
            <option value=""><?php echo $text_select; ?></option>
            <?php foreach ($option['product_option_value'] as $option_value) { ?>
            <option value="<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['name']; ?>
            <?php if ($option_value['price']) { ?>
            (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
            <?php } ?>
            </option>
            <?php } ?>
          </select>
        </div>
        <?php } ?>
        <?php if ($option['type'] == 'radio') { ?>
        <div id="input-option<?php echo $option['product_option_id']; ?>" class="option form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
          <b><?php if ($option['required']) { ?>* <?php } ?><?php echo $option['name']; ?>:</b>
          <?php foreach ($option['product_option_value'] as $option_value) { ?>
		  <div class="option_radio">
          <input type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" id="option-value-<?php echo $option_value['product_option_value_id']; ?>" />
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
        <div id="input-option<?php echo $option['product_option_id']; ?>" class="option form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
        <b><?php if ($option['required']) { ?>* <?php } ?><?php echo $option['name']; ?>:</b>
          <?php foreach ($option['product_option_value'] as $option_value) { ?>
		  <div class="option_radio">
          <input type="checkbox" name="option[<?php echo $option['product_option_id']; ?>][]" value="<?php echo $option_value['product_option_value_id']; ?>" id="option-value-<?php echo $option_value['product_option_value_id']; ?>" />
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
        <?php if ($option['type'] == 'image') { ?>
        <div id="input-option<?php echo $option['product_option_id']; ?>" class="option form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
          <b><?php if ($option['required']) { ?>*<?php } ?><?php echo $option['name']; ?>:</b>
          <div class="option-image">
            <?php foreach ($option['product_option_value'] as $option_value) { ?>
			<div>
              <input type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" id="option-value-<?php echo $option_value['product_option_value_id']; ?>" />
              <label for="option-value-<?php echo $option_value['product_option_value_id']; ?>">
				<img src="<?php echo $option_value['image']; ?>" alt="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>" />
				<span><?php echo $option_value['name']; ?></span>
				<?php if ($option_value['price']) { ?><br /><span>(<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)</span><?php } ?>
			  </label>
			</div>
            <?php } ?>
        </div>
		</div>
        <?php } ?>
        <?php if ($option['type'] == 'text') { ?>
		<div id="input-option<?php echo $option['product_option_id']; ?>" class="option form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
		<b><?php if ($option['required']) { ?>* <?php } ?><?php echo $option['name']; ?>:</b>
		<input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" placeholder="<?php echo $option['name']; ?>" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
        </div>
        <?php } ?>
        <?php if ($option['type'] == 'textarea') { ?>
        <div id="input-option<?php echo $option['product_option_id']; ?>" class="option form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
		<b><?php if ($option['required']) { ?>* <?php } ?><?php echo $option['name']; ?>:</b>
        <textarea name="option[<?php echo $option['product_option_id']; ?>]" rows="5" placeholder="<?php echo $option['name']; ?>" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control"><?php echo $option['value']; ?></textarea>
        </div>
        <?php } ?>
        <?php if ($option['type'] == 'file') { ?>
		<div id="input-option<?php echo $option['product_option_id']; ?>" class="option form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
        <b><?php if ($option['required']) { ?>* <?php } ?><?php echo $option['name']; ?>:</b>
        <input type="button" value="<?php echo $button_upload; ?>" id="button-option-<?php echo $option['product_option_id']; ?>" class="button">
        <input type="hidden" name="option[<?php echo $option['product_option_id']; ?>]" value="" />
        </div>
        <?php } ?>
        <?php if ($option['type'] == 'date') { ?>
        <div id="input-option<?php echo $option['product_option_id']; ?>" class="option form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
        <b><?php if ($option['required']) { ?>* <?php } ?><?php echo $option['name']; ?>:</b>
        <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" class="date" data-date-format="YYYY-MM-DD" />
        </div>
        <?php } ?>
        <?php if ($option['type'] == 'datetime') { ?>
        <div id="input-option<?php echo $option['product_option_id']; ?>" class="option form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
        <b><?php if ($option['required']) { ?>* <?php } ?><?php echo $option['name']; ?>:</b>
        <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" class="datetime" />
        </div>
        <?php } ?>
        <?php if ($option['type'] == 'time') { ?>
        <div id="input-option<?php echo $option['product_option_id']; ?>" class="option form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
        <b><?php if ($option['required']) { ?>* <?php } ?><?php echo $option['name']; ?>:</b>
        <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" class="time" />
        </div>
        <?php } ?>
        <?php } ?>
      </div>
      <?php } ?>
		
	</div>
	<div class="product_description">
	<div class="price_cart">
		<div class="stock">
		<?php if ($show_model) { ?><span><?php echo $text_model; ?></span> <?php echo $model; ?><br /><?php } ?>
		<?php if ($manufacturer) { ?><span><?php echo $text_manufacturer; ?></span> <a href="<?php echo $manufacturers; ?>"><?php echo $manufacturer; ?></a><br /><?php } ?>
        <?php if ($reward) { ?><span><?php echo $text_reward; ?></span><?php echo $reward; ?><br /><?php } ?>
		<?php if ($show_stock) { ?><span><?php echo $text_stock; ?></span> <?php echo $stock; ?><?php } ?>
		</div>
	  <?php if ($price) { ?>
      <div class="price">
        <?php if (!$special) { ?>
			<span class="price_<?php echo $product_id; ?>" data-price="<?php echo $price_value; ?>"><?php echo $price; ?></span>
		<?php } else { ?>
			<span class="price-old"><span class="price_<?php echo $product_id; ?>" data-price="<?php echo $price_value; ?>"><?php echo $price; ?></span></span> <span class="price-new"><span class="special_<?php echo $product_id; ?>" data-price="<?php echo $special_value; ?>"><?php echo $special; ?></span></span>
		<?php } ?>
        <?php if ($tax) { ?>
        <span class="price-tax"><?php echo $text_tax; ?> <span id="formated_tax" data-price="<?php echo $tax_value; ?>"><?php echo $tax; ?></span></span>
        <?php } ?>
        <?php if ($points) { ?>
        <div class="reward"><?php echo $text_points; ?> <span class="points_<?php echo $product_id; ?>" data-points="<?php echo $points; ?>"><?php echo $points; ?></span></div>
        <?php } ?>
        <?php if ($discounts) { ?>
        <div class="discount">
          <?php foreach ($discounts as $discount) { ?>
		  <?php echo $discount['quantity']; ?>
          <?php echo $text_discount; ?>
		  <?php echo $discount['price']; ?>
		  <br />
          <?php } ?>
        </div>
        <?php } ?>
      </div>
      <?php } ?>
      <div class="cart">
        <div>
		<div class="quantity quantity_<?php echo $product_id; ?>">
			<input type="text" name="quantity" value="<?php echo $minimum; ?>" oninput="recalculateprice(<?php echo $product_id; ?>, <?php echo $minimum; ?>);"/>
			<span>
			<i class="fa fa-plus" onclick="quantity('<?php echo $product_id; ?>', '<?php echo $minimum; ?>', '+');"></i>
			<i class="fa fa-minus" onclick="quantity('<?php echo $product_id; ?>', '<?php echo $minimum; ?>', '-');"></i>
			</span>
		</div>
          <input type="hidden" name="product_id" value="<?php echo $product_id; ?>" />
    <?php if ($quantity > 0) { ?>
        <input type="button" value="<?php echo $button_cart; ?>" id="button-cart"  onclick="cart.add('<?php echo $product_id; ?>', $(this).parent().parent().find('.quantity input').val())" class="button" />
	<?php } else { ?>
		<input type="button" value="<?php echo $button_cart_disabled; ?>" id="button-cart" class="button disabled" />
	<?php } ?>
		</div>
        <?php if ($minimum > 1) { ?>
        <div class="minimum"><?php echo $text_minimum; ?></div>
        <?php } ?>
      </div>
	  </div>
      <?php if ($review_status) { ?>
      <div class="review">
        <div>
			<div class="rating">
			<?php for ($i = 1; $i <= 5; $i++) { ?>
            <?php if ($rating < $i) { ?>
                <i class="fa fa-star-o"></i>
            <?php } else { ?>
                <i class="fa fa-star"></i>
            <?php } ?>
			<?php } ?>
			</div>
			<a onclick="$('a[href=\'#tab-review\']').trigger('click'); scroll_to('#tab-review');"><?php echo $text_write; ?></a>
		</div>
        <div class="share">
			<div class="share42init" data-image="<?php echo $thumb; ?>"></div>
			<script type="text/javascript" src="catalog/view/theme/fastfood/js/share42.js"></script> 
        </div>
      </div>
      <?php } ?>
	  </div>
	  <div class="product_banners">
	  <div><?php echo $product_banner1; ?></div>
	  <div><?php echo $product_banner2; ?></div>
	  <div><?php echo $product_banner3; ?></div>
	  </div>
    </div>
  </div>
  
	<div id="tabs" class="htabs">
	<?php if(mb_strlen($description,'utf-8') > 200) { ?> 
		<a href="#tab-description"><?php echo $tab_description; ?></a>
	<?php } ?>
	<?php if ($attribute_groups) { ?>
		<a href="#tab-attribute"><?php echo $tab_attribute; ?></a>
	<?php } ?>
	<?php if ($review_status) { ?>
		<a href="#tab-review"><?php echo $tab_review; ?></a>
	<?php } ?>
	</div>

  <?php if(mb_strlen($description,'utf-8') > 200) { ?> 
  <div id="tab-description" class="tab-content">
	<?php echo $description; ?> 
  </div>
  <?php } ?>
  
  <?php if ($attribute_groups) { ?>
  <div id="tab-attribute" class="tab-content">
    <table class="attribute">
      <?php foreach ($attribute_groups as $attribute_group) { ?>
      <thead>
        <tr>
          <td colspan="2"><?php echo $attribute_group['name']; ?></td>
        </tr>
      </thead>
      <tbody>
        <?php foreach ($attribute_group['attribute'] as $attribute) { ?>
        <tr>
          <td><?php echo $attribute['name']; ?></td>
          <td><?php echo $attribute['text']; ?></td>
        </tr>
        <?php } ?>
      </tbody>
      <?php } ?>
    </table>
  </div>
  <?php } ?>
  <?php if ($review_status) { ?>
  <div id="tab-review" class="tab-content">
  <div id="review_content">
    <div id="review"></div>
    <div id="review-title"><a class="button"><span><?php echo $text_write; ?></span><i class="fa fa-pencil"></i></a></div>
	<div class="left_right">
	<div id="form-review">
	<div class="left">
    <b><?php echo $entry_review; ?></b>
    <textarea name="text" cols="40" rows="8" style="width: 98%;"></textarea>
    <span style="font-size: 11px;"><?php echo $text_note; ?></span>
    </div>
	<div class="right">
	<div>
	<div>
		<b><?php echo $entry_name; ?></b>
		<input type="text" name="name" value="" />
	</div>
	<div>
    <b><?php echo $entry_rating; ?></b>
    <div class="radio">
		<input type="radio" name="rating" value="1" /><input type="radio" name="rating" value="2" /><input type="radio" name="rating" value="3" /><input type="radio" name="rating" value="4" /><input type="radio" name="rating" value="5" />
	<div class="stars">
		<i class="fa fa-star-o"></i><i class="fa fa-star-o"></i><i class="fa fa-star-o"></i><i class="fa fa-star-o"></i><i class="fa fa-star-o"></i>
	</div>
	</div>
    </div>
	</div>
	<?php echo $captcha; ?>
	</div>
	</div>
	<a id="button-review" class="button"><?php echo $button_continue; ?></a>
	</div>
  </div>
  </div>
  <?php } ?>
  <?php if ($products) { ?>
  <div class="box box_carousel">
  <div class="box-heading"><?php echo $tab_related; ?></div>
  <div class="box-content">
    <div class="box-product product_related">
    <?php foreach ($products as $product) { ?>
    <div class="product product_<?php echo $product['product_id']; ?>_rm">
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
									<input type="checkbox" name="option[<?php echo $option['product_option_id']; ?>][]" value="<?php echo $option_value['product_option_value_id']; ?>" id="option-value-<?php echo $option_value['product_option_value_id']; ?>" data-price_prefix="<?php echo $option_value['price_prefix']; ?>" data-price="<?php if($option_value['price_value']) { echo $option_value['price_value']; } else { echo '0';} ?>" onchange="recalculateprice('<?php echo $product['product_id']; ?>_rm');" />
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
									<input type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" id="option-value-<?php echo $option_value['product_option_value_id']; ?>" data-price_prefix="<?php echo $option_value['price_prefix']; ?>" data-price="<?php if($option_value['price_value']) { echo $option_value['price_value']; } else { echo '0';} ?>" onchange="recalculateprice('<?php echo $product['product_id']; ?>_rm');" />
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
									<input type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" id="option-value-<?php echo $option_value['product_option_value_id']; ?>" data-price_prefix="<?php echo $option_value['price_prefix']; ?>" data-price="<?php if($option_value['price_value']) { echo $option_value['price_value']; } else { echo '0';} ?>" onchange="recalculateprice('<?php echo $product['product_id']; ?>_rm');" />
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
		<div class="weight weight_<?php echo $product['product_id']; ?>_rm" data-weight="<?php echo $product['weight_value']; ?>" data-weight-unit="<?php echo $product['weight_unit']; ?>"><?php echo $product['weight']; ?></div>
    <?php } ?>
	<?php if ($product['price']) { ?>
      <div class="price">
        <?php if (!$product['special']) { ?>
        <span class="price_<?php echo $product['product_id']; ?>_rm" data-price="<?php echo $product['price_value']; ?>"><?php echo $product['price']; ?></span>
        <?php } else { ?>
        <span class="price-old price_<?php echo $product['product_id']; ?>_rm" data-price="<?php echo $product['price_value']; ?>"><?php echo $product['price']; ?></span> 
		<span class="price-new special_<?php echo $product['product_id']; ?>_rm" data-price="<?php echo $product['special_value']; ?>"><?php echo $product['special']; ?></span>
        <?php } ?>
      </div>
      <?php } ?>
    <div class="cart">
    <?php if ($product['quantity'] > 0) { ?>
		<?php if ($show_quantity) { ?>
			<input type="tel" value="<?php echo $product['minimum']; ?>" onchange="recalculateprice('<?php echo $product['product_id']; ?>_rm', '<?php echo $product['minimum']; ?>');" class="quantity_<?php echo $product['product_id']; ?>_rm" />
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
	$('.product_related').owlCarousel({
		responsiveBaseWidth: '.product_related',
		navigation: true,
		navigationText: ['<i class="fa fa-chevron-left"></i>', '<i class="fa fa-chevron-right"></i>'],
		pagination: false,
	});
</script>
<?php } ?>

<?php if(isset($auto_related)) {echo $auto_related;} ?>

  <?php if ($tags) { ?>
  <div class="tags"><b><?php echo $text_tags; ?></b>
    <?php for ($i = 0; $i < count($tags); $i++) { ?>
    <?php if ($i < (count($tags) - 1)) { ?>
    <a href="<?php echo $tags[$i]['href']; ?>"><?php echo $tags[$i]['tag']; ?></a>,
    <?php } else { ?>
    <a href="<?php echo $tags[$i]['href']; ?>"><?php echo $tags[$i]['tag']; ?></a>
    <?php } ?>
    <?php } ?>
  </div>
  <?php } ?>
  <?php echo $content_bottom; ?></div>
<script type="text/javascript" src="catalog/view/theme/fastfood/js/jquery.lightbox.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$('.left a').lightbox();
		var hash = window.location.hash;
		$("#tabs a").each(function() {
			var href = $(this).attr('href');	
			if (hash == href) {
				$($(this)).trigger('click');
				scroll_to(hash);
			}
		});
	});
</script>


<script type="text/javascript"><!--
$(document).ready(function() {
	$('#review-title .button').bind('click', function() {
		$('.left_right').slideToggle();
	});
	$('.radio input').hover(function(){
		var stars = $(this).val();
		$('.stars i').addClass('fa-star-o');
		$('.stars i:lt('+stars+')').addClass('fa-star').removeClass('fa-star-o');
	},
	function(){
		var start = $('input:radio[name=rating]:checked').val()
		if(start == 'undefined' ){start = 0; } 
		$('.stars i').addClass('fa-star-o');
		$('.stars i:lt('+start+')').addClass('fa-star').removeClass('fa-star-o');
	});
	
	$('.radio input').click(function(){	
		$('.radio input').each(function(){
			$('.radio input').not($(this)).attr('checked', false);
		});
		$(this).attr('checked', true).prop('checked', true);

	});
});
//--></script>

<script type="text/javascript"><!--
$('#review .pagination a').on('click', function() {
	$('#review').fadeOut('slow');	
	$('#review').load(this.href);
	$('#review').fadeIn('slow');
	return false;
});			

$('#review').load('index.php?route=product/product/review&product_id=<?php echo $product_id; ?>');

$('#button-review').bind('click', function() {
	$.ajax({
		url: 'index.php?route=product/product/write&product_id=<?php echo $product_id; ?>',
		type: 'post',
		dataType: 'json',
		data: $('#form-review input, #form-review textarea').serialize(),
		beforeSend: function() {
			$('.success, .warning').remove();
			$('#button-review').attr('disabled', true);
		},
		complete: function() {
			$('#button-review').attr('disabled', false);
			$('.attention').remove();
		},
		success: function(data) {
			if (data['error']) {
				$('.left_right').prepend('<div class="warning" style="padding: 10px 10px 10px 33px;">' + data['error'] + '</div>');
			}
			
			if (data['success']) {
				$('.left_right').prepend('<div class="success" style="padding: 10px 10px 10px 33px;">' + data['success'] + '</div>');
								
				$('input[name=\'name\']').val('');
				$('textarea[name=\'text\']').val('');
				$('input[name=\'rating\']:checked').attr('checked', '');
				$('input[name=\'captcha\']').val('');
			}
		}
	});
});
//--></script>
<script type="text/javascript" src="catalog/view/theme/fastfood/js/tabs.js"></script>
<script type="text/javascript">
$('#tabs a').tabs();

$(document).ready(function() {
	$('.product_<?php echo $product_id; ?> .option input[type="checkbox"]').on('change', function() {recalculateprice(<?php echo $product_id; ?>)});
    $('.product_<?php echo $product_id; ?> .option input[type="radio"]').on('change', function() {recalculateprice(<?php echo $product_id; ?>)});
    $('.product_<?php echo $product_id; ?> .option select').on('change', function() {recalculateprice(<?php echo $product_id; ?>)});
});
</script>
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
<script type="text/javascript"><!--
$('.date').datetimepicker({
	pickTime: false
});

$('.datetime').datetimepicker({
	pickDate: true,
	pickTime: true
});

$('.time').datetimepicker({
	pickDate: false
});

$('button[id^=\'button-upload\']').on('click', function() {
	var node = this;

	$('#form-upload').remove();

	$('body').prepend('<form enctype="multipart/form-data" id="form-upload" style="display: none;"><input type="file" name="file" /></form>');

	$('#form-upload input[name=\'file\']').trigger('click');

	if (typeof timer != 'undefined') {
    	clearInterval(timer);
	}

	timer = setInterval(function() {
		if ($('#form-upload input[name=\'file\']').val() != '') {
			clearInterval(timer);

			$.ajax({
				url: 'index.php?route=tool/upload',
				type: 'post',
				dataType: 'json',
				data: new FormData($('#form-upload')[0]),
				cache: false,
				contentType: false,
				processData: false,
				beforeSend: function() {
					$(node).button('loading');
				},
				complete: function() {
					$(node).button('reset');
				},
				success: function(json) {
					$('.text-danger').remove();

					if (json['error']) {
						$(node).parent().find('input').after('<div class="text-danger">' + json['error'] + '</div>');
					}

					if (json['success']) {
						alert(json['success']);

						$(node).parent().find('input').attr('value', json['code']);
					}
				},
				error: function(xhr, ajaxOptions, thrownError) {
					alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
				}
			});
		}
	}, 500);
});
//--></script> 
<?php echo $footer; ?>