<?php echo $header; ?><?php echo $column_left; ?>
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
  <h1><?php echo $heading_title; ?></h1>
  <div class="content_search">
    <p>
      <input type="text" name="search" style="width:100%; padding-left:10px;" value="<?php echo $search; ?>" placeholder="<?php echo $text_keyword; ?>" />
	</p>
	<p>
      <select name="filter_category_id">
        <option value="0"><?php echo $text_category; ?></option>
        <?php foreach ($categories as $category_1) { ?>
        <?php if ($category_1['category_id'] == $category_id) { ?>
        <option value="<?php echo $category_1['category_id']; ?>" selected="selected"><?php echo $category_1['name']; ?></option>
        <?php } else { ?>
        <option value="<?php echo $category_1['category_id']; ?>"><?php echo $category_1['name']; ?></option>
        <?php } ?>
        <?php foreach ($category_1['children'] as $category_2) { ?>
        <?php if ($category_2['category_id'] == $category_id) { ?>
        <option value="<?php echo $category_2['category_id']; ?>" selected="selected">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_2['name']; ?></option>
        <?php } else { ?>
        <option value="<?php echo $category_2['category_id']; ?>">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_2['name']; ?></option>
        <?php } ?>
        <?php foreach ($category_2['children'] as $category_3) { ?>
        <?php if ($category_3['category_id'] == $category_id) { ?>
        <option value="<?php echo $category_3['category_id']; ?>" selected="selected">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_3['name']; ?></option>
        <?php } else { ?>
        <option value="<?php echo $category_3['category_id']; ?>">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_3['name']; ?></option>
        <?php } ?>
        <?php } ?>
        <?php } ?>
        <?php } ?>
      </select>
      <?php if ($sub_category) { ?>
      <input type="checkbox" name="sub_category" value="1" id="sub_category" checked="checked" />
      <?php } else { ?>
      <input type="checkbox" name="sub_category" value="1" id="sub_category" />
      <?php } ?>
      <label for="sub_category"><?php echo $text_sub_category; ?></label>
	  
	  <?php if ($description) { ?>
    <input type="checkbox" name="description" value="1" id="description" checked="checked" />
    <?php } else { ?>
    <input type="checkbox" name="description" value="1" id="description" />
    <?php } ?>
    <label for="description"><?php echo $entry_description; ?></label>
    </p>
	<div class="buttons">
    <div class="center"><input type="button" value="<?php echo $button_search; ?>" id="button-search" class="button" /></div>
  </div>
  </div>
  <h2><?php echo $text_search; ?></h2>
  <?php if ($products) { ?>
  <div class="product-filter">
    <div class="display"> <?php echo $button_list; ?> <b>/</b> <a onclick="display('grid');"><?php echo $button_grid; ?></a></div>
    <div class="limit"><i class="fa fa-eye" title="<?php echo $text_limit; ?>"></i>
      <select onchange="location = this.value;">
        <?php foreach ($limits as $limits) { ?>
        <?php if ($limits['value'] == $limit) { ?>
        <option value="<?php echo $limits['href']; ?>" selected="selected"><?php echo $limits['text']; ?></option>
        <?php } else { ?>
        <option value="<?php echo $limits['href']; ?>"><?php echo $limits['text']; ?></option>
        <?php } ?>
        <?php } ?>
      </select>
    </div>
    <div class="sort"><i class="fa fa-sort" title="<?php echo $text_sort; ?>"></i>
      <select onchange="location = this.value;">
        <?php foreach ($sorts as $sorts) { ?>
        <?php if ($sorts['value'] == $sort . '-' . $order) { ?>
        <option value="<?php echo $sorts['href']; ?>" selected="selected"><?php echo $sorts['text']; ?></option>
        <?php } else { ?>
        <option value="<?php echo $sorts['href']; ?>"><?php echo $sorts['text']; ?></option>
        <?php } ?>
        <?php } ?>
      </select>
    </div>
	<div class="product-compare"><a href="<?php echo $compare; ?>" id="compare-total"><?php echo $text_compare; ?></a></div>
  </div>
<div class="row">
    <?php foreach ($products as $product) { ?>
    <div class="product-layout product-grid col-lg-4 col-md-6 col-sm-6 col-xs-12">
		<div class="product product_<?php echo $product['product_id']; ?>_sp product-thumb">
			<?php foreach($product['stickers'] as $sticker) { ?>
				<div class="sticker"><?php echo $sticker['text']; ?> <?php echo $sticker['value']; ?> <?php echo $sticker['text_after']; ?></div>
			<?php } ?>
			<?php if ($product['thumb']) { ?>
				<div class="image">
					<a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" data-id="<?php echo $product['product_id']; ?>" class="image<?php echo $product['product_id']; ?>" title="<?php echo $product['name']; ?>" alt="<?php echo $product['name']; ?>" /></a>
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
											<input type="checkbox" name="option[<?php echo $option['product_option_id']; ?>][]" value="<?php echo $option_value['product_option_value_id']; ?>" id="option-value-<?php echo $option_value['product_option_value_id']; ?>" data-price_prefix="<?php echo $option_value['price_prefix']; ?>" data-price="<?php if($option_value['price_value']) { echo $option_value['price_value']; } else { echo '0';} ?>" onchange="recalculateprice('<?php echo $product['product_id']; ?>_sp');" />
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
											<input type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" id="option-value-<?php echo $option_value['product_option_value_id']; ?>" data-price_prefix="<?php echo $option_value['price_prefix']; ?>" data-price="<?php if($option_value['price_value']) { echo $option_value['price_value']; } else { echo '0';} ?>" onchange="recalculateprice('<?php echo $product['product_id']; ?>_sp');" />
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
											<input type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" id="option-value-<?php echo $option_value['product_option_value_id']; ?>" data-price_prefix="<?php echo $option_value['price_prefix']; ?>" data-price="<?php if($option_value['price_value']) { echo $option_value['price_value']; } else { echo '0';} ?>" onchange="recalculateprice('<?php echo $product['product_id']; ?>_sp');" />
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
				<div class="weight weight_<?php echo $product['product_id']; ?>_sp" data-weight="<?php echo $product['weight_value']; ?>" data-weight-unit="<?php echo $product['weight_unit']; ?>"><?php echo $product['weight']; ?></div>
			<?php } ?>
			<?php if ($product['price']) { ?>
				<div class="price">
					<?php if (!$product['special']) { ?>
						<span class="price_<?php echo $product['product_id']; ?>_sp" data-price="<?php echo $product['price_value']; ?>"><?php echo $product['price']; ?></span>
					<?php } else { ?>
						<span class="price-old price_<?php echo $product['product_id']; ?>_sp" data-price="<?php echo $product['price_value']; ?>"><?php echo $product['price']; ?></span> 
						<span class="price-new special_<?php echo $product['product_id']; ?>_sp" data-price="<?php echo $product['special_value']; ?>"><?php echo $product['special']; ?></span>
					<?php } ?>
				</div>
			<?php } ?>
			<div class="cart">
				<?php if ($product['quantity'] > 0) { ?>
					<?php if ($show_quantity) { ?>
						<input type="tel" value="1" onchange="recalculateprice('<?php echo $product['product_id']; ?>_sp');" class="quantity_<?php echo $product['product_id']; ?>_sp" />
					<?php } ?>
						<input type="button" value="<?php echo $button_cart; ?>" onclick="cart.add('<?php echo $product['product_id']; ?>', $(this).prev().val());" class="button btn bt-primary" />
					<?php } else { ?>
						<input type="button" value="<?php echo $button_cart_disabled; ?>" class="button disabled" />
					<?php } ?>
			</div>
			<div class="wishlist"><a onclick="addToWishList('<?php echo $product['product_id']; ?>');" title="<?php echo $button_wishlist; ?>"><i class="fa fa-heart"></i></a></div>
			<div class="compare"><a onclick="addToCompare('<?php echo $product['product_id']; ?>');" title="<?php echo $button_compare; ?>"><i class="fa fa-bar-chart-o"></i></a></div></div>
		</div>
	</div>
    <?php } ?>
</div>
  <?php echo $pagination; ?>
  <?php } else { ?>
  <div class="content"><?php echo $text_empty; ?></div>
  <?php }?>
  <?php echo $content_bottom; ?></div>
  <?php echo $column_right; ?>
<script type="text/javascript"><!--
$('#content input[name=\'search\']').keydown(function(e) {
	if (e.keyCode == 13) {
		$('#button-search').trigger('click');
	}
});

$('select[name=\'filter_category_id\']').bind('change', function() {
	if (this.value == '0') {
		$('input[name=\'sub_category\']').attr('disabled', 'disabled');
		$('input[name=\'sub_category\']').removeAttr('checked');
	} else {
		$('input[name=\'sub_category\']').removeAttr('disabled');
	}
});

$('select[name=\'filter_category_id\']').trigger('change');

$('#button-search').bind('click', function() {
	url = 'index.php?route=product/search';
	
	var search = $('#content input[name=\'search\']').prop('value');
	
	if (search) {
		url += '&search=' + encodeURIComponent(search);
	}

	var filter_category_id = $('#content select[name=\'filter_category_id\']').prop('value');
	
	if (filter_category_id > 0) {
		url += '&category_id=' + encodeURIComponent(filter_category_id);
	}
	
	var sub_category = $('#content input[name=\'sub_category\']:checked').prop('value');
	
	if (sub_category) {
		url += '&sub_category=true';
	}
		
	var filter_description = $('#content input[name=\'description\']:checked').prop('value');
	
	if (filter_description) {
		url += '&description=true';
	}

	location = url;
});
//--></script> 
<?php echo $footer; ?>