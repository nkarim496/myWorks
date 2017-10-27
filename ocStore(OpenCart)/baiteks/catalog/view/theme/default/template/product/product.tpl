<?php echo $header; ?>

 <div class="breadcrumb-100">
  <div class="breadcrumb">
      <?php $w_bc_total = count($breadcrumbs); if ($w_bc_total > 0) {
		$w_bc_last = $w_bc_total - 1;
		foreach ($breadcrumbs as $i => $breadcrumb) { ?>
		<?php if ($i == $w_bc_last) { break; } ?>
		<i><span><?php echo $breadcrumb['separator']; ?></span></i><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
       <?php } ?>
       <i><span><?php echo $breadcrumbs[$w_bc_last]['separator']; ?></span></i><?php echo $breadcrumbs[$w_bc_last]['text']; ?><?php } ?>
  </div>
 </div>

<?php echo $column_left; ?><?php echo $column_right; ?>
<div id="content"><?php echo $content_top; ?>


<?php if ($this->config->get('themer_product_tabs') != 'on') { ?>

  <div id="tabs" class="htabs"><a href="#tab-description"><?php echo $tab_description; ?></a>
    <?php if ($attribute_groups) { ?>
    <a href="#tab-attribute"><?php echo $tab_attribute; ?></a>
    <?php } ?>
    <?php if ($review_status) { ?>
    <a href="#tab-review"><?php echo $tab_review; ?></a>
    <?php } ?>
    <?php if ($products) { ?>
    <a href="#tab-related"><?php echo $tab_related; ?> (<?php echo count($products); ?>)</a>
    <?php } ?>
  </div>

  <div id="tab-description" class="tab-content">

<?php } else { ?>

<div class="category-details">

<?php } ?>



  <div class="product-info">
    <h1><?php echo $heading_title; ?></h1>
    <?php if ($thumb || $images) { ?>
    <div class="left">

      <?php if ($thumb) { ?>
  <div class="image">

      <?php if ($price) { ?>
        <?php if (!$special) { ?>
        	<?php } else { ?>
	<span class="sale">-<?php echo $saving; ?>%</span>
        <?php } ?>
      <?php } ?>

 <a href="<?php echo $popup; ?>" class="colorbox" id="zoom_link1">
 <img id="zoom" 
      src="<?php echo $thumb; ?>" 
      title="<?php echo $heading_title; ?>" 
      alt="<?php echo $heading_title; ?>" 
      data-zoom-image="<?php echo $popup; ?>" />

      <span><?php echo $text_zoom; ?> <i class="fa fa-search-plus"></i></span>

 </a>

	<?php foreach ($images as $image) { ?>
    <a href="<?php echo $image['popup']; ?>" title="<?php echo $heading_title; ?>" class="colorbox"></a>
  <?php } ?>

  </div>

  <?php } ?>

      <?php if ($images) { ?>

      <div class="image-additional">

	    <div id="gallery">

	    <div id="owl-example-addimg" class="owl-carousel owl-theme" style="display: block; opacity: 1;">

        <a href="#" 
           class="zoom_additional"
           data-image="<?php echo $popup; ?>" 
           data-zoom-image="<?php echo $popup; ?>" />

	         <img id="zoom"  
                src="<?php echo $thumbadditional; ?>" 
                title="<?php echo $heading_title; ?>" 
                alt="<?php echo $heading_title; ?>" />
        
        </a>

        <?php foreach ($images as $image) { ?>
          <a href="#" 
             class="zoom_additional"
             data-image="<?php echo $image['popup']; ?>" 
             data-zoom-image="<?php echo $image['popup']; ?>" />

  	        <img id="zoom" 
                 src="<?php echo $image['thumb']; ?>" 
                 title="<?php echo $heading_title; ?>" 
                 alt="<?php echo $heading_title; ?>" />

          </a>
        <?php } ?>
	    </div>

	    </div>

      </div>

      <?php } ?>

<script>
$("#owl-example-addimg").owlCarousel({
    	itemsCustom : [[0, 3], [461, 3], [750, 3], [1000, 3], [1200, 3]],
		slideSpeed : 500,
		paginationSpeed : 800,
		rewindSpeed : 1000,
		autoPlay : true,
		stopOnHover : true,
		navigation : true,
		navigationText: ['<i class="fa fa-angle-left"></i>','<i class="fa fa-angle-right"></i>'],
		rewindNav : true,
		scrollPerPage : false,
});
</script>

    </div>
    <?php } ?>
    <div class="right">

      <div class="description">

	<div class="infoleft">
        <?php if ($manufacturer) { ?>
	<span><?php echo $text_manufacturer; ?></span> <a href="<?php echo $manufacturers; ?>"><?php echo $manufacturer; ?></a><br />
        <?php } ?>
        <span><?php echo $text_model; ?></span> <?php echo $model; ?><br />
        <?php if ($reward) { ?>
        <span><?php echo $text_reward; ?></span> <?php echo $reward; ?><br />
        <?php } ?>
        <span><?php echo $text_stock; ?></span> <?php echo $stock; ?><br>
	<?php if ($review_status) { ?>
	<span><?php echo $text_otzv; ?></span>
	<a onclick="$('a[href=\'#tab-review\']').trigger('click');" class="scroll-to-review-tab"><?php echo $reviews; ?></a> 
	<a onclick="$('a[href=\'#tab-review\']').trigger('click');" class="scroll-to-review-tab"><i style="margin: 0px 5px 0px 10px;" class="fa fa-pencil"></i><?php echo $text_write; ?></a><br>
	<?php } ?>
	</div>

	<div class="inforight">
	<?php if ($man_img) { ?>
	<p class="reiting"><a href="<?php echo $manufacturers; ?>"><img src="<?php echo $man_img; ?>" title="<?php echo $manufacturer; ?>" alt="<?php echo $manufacturer; ?>" /></a><br /></p>
	<?php } ?>
	<p class="reiting"><img src="catalog/view/theme/default/image/stars-<?php echo $rating; ?>.png" alt="<?php echo $reviews; ?>" /></p>
	</div>

      </div>


      <?php if ($price) { ?>
      <div class="price"><?php echo $text_price; ?>
        <?php if (!$special) { ?>
        <?php echo $price; ?>
        <?php } else { ?>
        <span class="price-old"><?php echo $price; ?></span> <span class="price-new"><?php echo $special; ?></span>
        <?php } ?>
        <br />
        <?php if ($tax) { ?>
        <span class="price-tax"><?php echo $text_tax; ?> <?php echo $tax; ?></span><br />
        <?php } ?>
        <?php if ($points) { ?>
        <span class="reward"><small><?php echo $text_points; ?> <?php echo $points; ?></small></span><br />
        <?php } ?>
        <?php if ($discounts) { ?>
        <br />
        <div class="discount">
          <?php foreach ($discounts as $discount) { ?>
          <?php echo sprintf($text_discount, $discount['quantity'], $discount['price']); ?><br />
          <?php } ?>
        </div>
        <?php } ?>
      </div>
      <?php } ?>
      <?php if ($options) { ?>
      <div class="options">
        <span class="variant"><?php echo $text_option; ?></span>
        <br />
        <?php foreach ($options as $option) { ?>
        <?php if ($option['type'] == 'select') { ?>
        <div id="option-<?php echo $option['product_option_id']; ?>" class="option">
          <?php if ($option['required']) { ?>
          <span class="required">*</span>
          <?php } ?>
          <b><?php echo $option['name']; ?>:</b><br />
          <select name="option[<?php echo $option['product_option_id']; ?>]">
            <option value=""><?php echo $text_select; ?></option>
            <?php foreach ($option['option_value'] as $option_value) { ?>
            <option value="<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['name']; ?>
            <?php if ($option_value['price']) { ?>
            (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
            <?php } ?>
            </option>
            <?php } ?>
          </select>
        </div>
        <br />
        <?php } ?>
        <?php if ($option['type'] == 'radio') { ?>
        <div id="option-<?php echo $option['product_option_id']; ?>" class="option">
          <?php if ($option['required']) { ?>
          <span class="required">*</span>
          <?php } ?>
          <b><?php echo $option['name']; ?>:</b><br />
          <?php foreach ($option['option_value'] as $option_value) { ?>
          <input type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" id="option-value-<?php echo $option_value['product_option_value_id']; ?>" />
          <label for="option-value-<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['name']; ?>
            <?php if ($option_value['price']) { ?>
            (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
            <?php } ?>
          </label>
          <br />
          <?php } ?>
        </div>
        <br />
        <?php } ?>
        <?php if ($option['type'] == 'checkbox') { ?>
        <div id="option-<?php echo $option['product_option_id']; ?>" class="option">
          <?php if ($option['required']) { ?>
          <span class="required">*</span>
          <?php } ?>
          <b><?php echo $option['name']; ?>:</b><br />
          <?php foreach ($option['option_value'] as $option_value) { ?>
          <input type="checkbox" name="option[<?php echo $option['product_option_id']; ?>][]" value="<?php echo $option_value['product_option_value_id']; ?>" id="option-value-<?php echo $option_value['product_option_value_id']; ?>" />
          <label for="option-value-<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['name']; ?>
            <?php if ($option_value['price']) { ?>
            (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
            <?php } ?>
          </label>
          <br />
          <?php } ?>
        </div>
        <br />
        <?php } ?>
        <?php if ($option['type'] == 'image') { ?>
        <div id="option-<?php echo $option['product_option_id']; ?>" class="option">
          <?php if ($option['required']) { ?>
          <span class="required">*</span>
          <?php } ?>
          <b><?php echo $option['name']; ?>:</b><br />
          <table class="option-image">
            <?php foreach ($option['option_value'] as $option_value) { ?>
            <tr>
              <td style="width: 1px;"><input type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" id="option-value-<?php echo $option_value['product_option_value_id']; ?>" /></td>
              <td><label for="option-value-<?php echo $option_value['product_option_value_id']; ?>"><a href="<?php echo $option_value['popup']; ?>" title="<?php echo $option['name'] . ': ' . $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>" class="colorbox" rel="colorbox-option-<?php echo $option['product_option_id']; ?>"><img src="<?php echo $option_value['image']; ?>" alt="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>" /></a></label></td>
              <td><label class="imagename" for="option-value-<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['name']; ?>
                  <?php if ($option_value['price']) { ?>
                  (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                  <?php } ?>
                </label></td>
            </tr>
            <?php } ?>
          </table>
        </div>
        <br />
        <?php } ?>
        <?php if ($option['type'] == 'text') { ?>
        <div id="option-<?php echo $option['product_option_id']; ?>" class="option">
          <?php if ($option['required']) { ?>
          <span class="required">*</span>
          <?php } ?>
          <b><?php echo $option['name']; ?>:</b><br />
          <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['option_value']; ?>" />
        </div>
        <br />
        <?php } ?>
        <?php if ($option['type'] == 'textarea') { ?>
        <div id="option-<?php echo $option['product_option_id']; ?>" class="option">
          <?php if ($option['required']) { ?>
          <span class="required">*</span>
          <?php } ?>
          <b><?php echo $option['name']; ?>:</b><br />
          <textarea name="option[<?php echo $option['product_option_id']; ?>]" cols="40" rows="5"><?php echo $option['option_value']; ?></textarea>
        </div>
        <br />
        <?php } ?>
        <?php if ($option['type'] == 'file') { ?>
        <div id="option-<?php echo $option['product_option_id']; ?>" class="option">
          <?php if ($option['required']) { ?>
          <span class="required">*</span>
          <?php } ?>
          <b><?php echo $option['name']; ?>:</b><br />
          <input type="button" value="<?php echo $button_upload; ?>" id="button-option-<?php echo $option['product_option_id']; ?>" class="button">
          <input type="hidden" name="option[<?php echo $option['product_option_id']; ?>]" value="" />
        </div>
        <br />
        <?php } ?>
        <?php if ($option['type'] == 'date') { ?>
        <div id="option-<?php echo $option['product_option_id']; ?>" class="option">
          <?php if ($option['required']) { ?>
          <span class="required">*</span>
          <?php } ?>
          <b><?php echo $option['name']; ?>:</b><br />
          <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['option_value']; ?>" class="date" />
        </div>
        <br />
        <?php } ?>
        <?php if ($option['type'] == 'datetime') { ?>
        <div id="option-<?php echo $option['product_option_id']; ?>" class="option">
          <?php if ($option['required']) { ?>
          <span class="required">*</span>
          <?php } ?>
          <b><?php echo $option['name']; ?>:</b><br />
          <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['option_value']; ?>" class="datetime" />
        </div>
        <br />
        <?php } ?>
        <?php if ($option['type'] == 'time') { ?>
        <div id="option-<?php echo $option['product_option_id']; ?>" class="option">
          <?php if ($option['required']) { ?>
          <span class="required">*</span>
          <?php } ?>
          <b><?php echo $option['name']; ?>:</b><br />
          <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['option_value']; ?>" class="time" />
        </div>
        <br />
        <?php } ?>
        <?php } ?>
      </div>
      <?php } ?>

      <div class="cart">
	  <div class="cart-inside">
         <?php if($this->config->get('themer_buttons') == 'on') { ?>
                <div class="wishlist">
                  <i class="w1"><?php echo $button_wishlist; ?></i>
                  <i class="w2"></i>
                  <a class="w3" title="<?php echo $button_wishlist; ?>" onclick="addToWishList('<?php echo $product_id; ?>');"></a>
               </div>
               <input type="button" title="<?php echo $button_cart; ?>" id="button-cart" class="button" />
               <div class="compare">
                  <i class="c1"><?php echo $button_compare; ?></i>
                  <i class="c2"></i>
                  <a class="c3" title="<?php echo $button_compare; ?>" onclick="addToCompare('<?php echo $product_id; ?>');"></a>
               </div>
         <?php } else if ($this->config->get('themer_buttons') == 'off') { ?>
               <div class="wishlist">
                 <a class="w3" title="<?php echo $button_wishlist; ?>" onclick="addToWishList('<?php echo $product_id; ?>');"><?php echo $button_wishlist; ?></a>
               </div>
               <div class="cartbutton">
                 <a><input type="button" value="<?php echo $button_cart; ?>" title="<?php echo $button_cart; ?>" id="button-cart" class="button" /></a>
               </div>
               <div class="compare">
                  <a class="c3" title="<?php echo $button_compare; ?>" onclick="addToCompare('<?php echo $product_id; ?>');"><?php echo $button_compare; ?></a>
               </div>
         <?php } else { ?>
                <div class="wishlist">
                  <a class="w3" title="<?php echo $button_wishlist; ?>" onclick="addToWishList('<?php echo $product_id; ?>');"></a>
                </div>
                <div class="cartbutton">
                  <a><input type="button" value="<?php echo $button_cart; ?>" title="<?php echo $button_cart; ?>" id="button-cart" class="button" /></a>
                </div>
                <div class="compare">
                  <a class="c3" title="<?php echo $button_compare; ?>" onclick="addToCompare('<?php echo $product_id; ?>');"></a>
                </div>
         <?php } ?>

           <br />
           <?php echo $text_qty; ?><br />
	         <span id="minus" class="quantity-operator">-</span>
           <input class="quantity-productcart" type="text" style="width:36px!important;" name="quantity" size="2" value="<?php echo $minimum; ?>" />
           <span id="plus" class="quantity-operator">+</span>
           <input type="hidden" name="product_id" size="2" value="<?php echo $product_id; ?>" />
         <?php if ($minimum > 1) { ?>
         <div class="minimum"><?php echo $text_minimum; ?></div>
         <?php } ?>
        </div>
      </div>

     <div style="text-align: center;"><?php echo htmlspecialchars_decode($this->config->get('themer_code')); ?></div>

    </div>
  </div>

<?php if ($this->config->get('themer_product_tabs') != 'on') { ?>
  <div class="product-description"><?php echo $description; ?></div>
<?php } ?>


<?php if ($this->config->get('themer_product_tabs') == 'on') { ?>

</div>

<div id="tabs" class="htabs"><a href="#tab-description"><?php echo $tab_description; ?></a>
<?php if ($attribute_groups) { ?>
<a href="#tab-attribute"><?php echo $tab_attribute; ?></a>
<?php } ?>
<?php if ($review_status) { ?>
<a href="#tab-review"><?php echo $tab_review; ?></a>
<?php } ?>
<?php if ($products) { ?>
<a href="#tab-related"><?php echo $tab_related; ?> (<?php echo count($products); ?>)</a>
<?php } ?>
</div>

<div id="tab-description" class="tab-content">
<div class="product-description"><?php echo $description; ?></div>

<?php } ?>


  </div>


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
    <div id="review"></div>
    <span class="variant" id="review-title"><i style="margin: 0px 5px 0px 10px;" class="fa fa-pencil"></i> <?php echo $text_write; ?></span>
    <b><?php echo $entry_name; ?></b><br />
    <input type="text" name="name" value="" />
    <br />
    <br />
    <b><?php echo $entry_review; ?></b>
    <textarea name="text" cols="40" rows="8" style="width: 98%;"></textarea>
    <span style="font-size: 11px;"><?php echo $text_note; ?></span><br />
    <br />
    <b><?php echo $entry_rating; ?></b><br /><br />
<span style="padding: 3px; background: #eee; border-radius: 5px;"><i style="font-size: 14px;" class="fa fa-thumbs-o-down"></i> <?php echo $entry_bad; ?></span>&nbsp;
    1<input type="radio" name="rating" value="1" />
    &nbsp;
    2<input type="radio" name="rating" value="2" />
    &nbsp;
    3<input type="radio" name="rating" value="3" />
    &nbsp;
    4<input type="radio" name="rating" value="4" />
    &nbsp;
    5<input type="radio" name="rating" value="5" />
    &nbsp;
<span style="padding: 3px; background: #eee; border-radius: 5px;"><i style="font-size: 14px;" class="fa fa-thumbs-o-up"></i> <?php echo $entry_good; ?></span><br />
    <br />
    <b><?php echo $entry_captcha; ?></b><br />
    <input style="height:36px;width: 150px;" type="text" name="captcha" value="" />&nbsp;&nbsp;
    <img style="vertical-align: middle;" src="index.php?route=product/product/captcha" alt="" id="captcha" /><br />
    <br />
    <div class="buttons">
      <div class="right"><a id="button-review" class="button"><i class="fa fa-share"></i><?php echo $entry_send; ?></a></div>
    </div>
  </div>
  <?php } ?>
  <?php if ($products) { ?>
  <div id="tab-related" class="tab-content">
    <div class="box-product">
      <?php foreach ($products as $product) { ?>
      <div>
        <?php if ($product['thumb']) { ?>
        <div class="image"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" /></a></div>
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
        <?php if ($product['rating']) { ?>
        <div class="rating"><img src="catalog/view/theme/default/image/stars-<?php echo $product['rating']; ?>.png" alt="<?php echo $product['reviews']; ?>" /></div>
        <?php } ?>
        <a onclick="addToCart('<?php echo $product['product_id']; ?>');" class="button"><?php echo $button_cart; ?></a></div>
      <?php } ?>
    </div>
  </div>
  <?php } ?>
  <?php if ($tags) { ?>
  <div class="tags"><i class="tags2"><?php echo $text_tags; ?></i>
    <?php for ($i = 0; $i < count($tags); $i++) { ?>
    <?php if ($i < (count($tags) - 1)) { ?>
    <a href="<?php echo $tags[$i]['href']; ?>"><i class="fa fa-tag"></i><?php echo $tags[$i]['tag']; ?></a>,
    <?php } else { ?>
    <a href="<?php echo $tags[$i]['href']; ?>"><i class="fa fa-tag"></i><?php echo $tags[$i]['tag']; ?></a>
    <?php } ?>
    <?php } ?>
  </div>
  <?php } ?>
  <?php echo $content_bottom; ?></div>

<script type="text/javascript"><!--
$('.scroll-to-review-tab').click( function() {
	$('html, body').animate({
		scrollTop: $("#tabs").offset().top
	}, 600);
});
//--></script>

<script type="text/javascript"><!--
$("#zoom").elevateZoom({
  gallery:'gallery',
  zoomType: "inner",
  cursor: "crosshair",
  galleryActiveClass: 'active',
  imageCrossfade: true,
  zoomWindowFadeIn: 500,
  zoomWindowFadeOut: 750,
  loadingIcon: 'catalog/view/theme/default/image/loader.gif'
}); 
//--></script>

<script type="text/javascript"><!--
$(document).ready(function() {
	$('.colorbox').colorbox({
		overlayClose: true,
		opacity: 0.5,
		rel: "colorbox"
	});
});
//--></script> 

    <script type="text/javascript">
        jQuery.colorbox.settings.maxWidth  = '95%';
        jQuery.colorbox.settings.maxHeight = '95%';

        var resizeTimer;
        function resizeColorBox()
        {
            if (resizeTimer) clearTimeout(resizeTimer);
            resizeTimer = setTimeout(function() {
                if (jQuery('#cboxOverlay').is(':visible')) {
                    jQuery.colorbox.load(true);
                }
            }, 300);
        }

        jQuery(window).resize(resizeColorBox);
        window.addEventListener("orientationchange", resizeColorBox, false);
    </script>

<script type="text/javascript"><!--
$('#button-cart').bind('click', function() {
	$.ajax({
		url: 'index.php?route=checkout/cart/add',
		type: 'post',
		data: $('.product-info input[type=\'text\'], .product-info input[type=\'hidden\'], .product-info input[type=\'radio\']:checked, .product-info input[type=\'checkbox\']:checked, .product-info select, .product-info textarea'),
		dataType: 'json',
		success: function(json) {
			$('.success, .warning, .attention, information, .error').remove();
			
			if (json['error']) {
				if (json['error']['option']) {
					for (i in json['error']['option']) {
						$('#option-' + i).after('<span class="error">' + json['error']['option'][i] + '</span>');
					}
				}
			} 
			
			if (json['success']) {
				$('#notification').html('<div class="success" style="display: none;">' + json['success'] + '<img src="catalog/view/theme/default/image/close.png" alt="" class="close" /></div>');
					
				$('.success').fadeIn('slow');
					
				$('#cart-total').html(json['total']);
				
				$('html, body').animate({ scrollTop: 0 }, 'slow'); 
			}	
		}
	});
});
//--></script>
<?php if ($options) { ?>
<script type="text/javascript" src="catalog/view/javascript/jquery/ajaxupload.js"></script>
<?php foreach ($options as $option) { ?>
<?php if ($option['type'] == 'file') { ?>
<script type="text/javascript"><!--
new AjaxUpload('#button-option-<?php echo $option['product_option_id']; ?>', {
	action: 'index.php?route=product/product/upload',
	name: 'file',
	autoSubmit: true,
	responseType: 'json',
	onSubmit: function(file, extension) {
		$('#button-option-<?php echo $option['product_option_id']; ?>').after('<img src="catalog/view/theme/default/image/loading.gif" class="loading" style="padding-left: 5px;" />');
		$('#button-option-<?php echo $option['product_option_id']; ?>').attr('disabled', true);
	},
	onComplete: function(file, json) {
		$('#button-option-<?php echo $option['product_option_id']; ?>').attr('disabled', false);
		
		$('.error').remove();
		
		if (json['success']) {
			alert(json['success']);
			
			$('input[name=\'option[<?php echo $option['product_option_id']; ?>]\']').attr('value', json['file']);
		}
		
		if (json['error']) {
			$('#option-<?php echo $option['product_option_id']; ?>').after('<span class="error">' + json['error'] + '</span>');
		}
		
		$('.loading').remove();	
	}
});
//--></script>
<?php } ?>
<?php } ?>
<?php } ?>
<script type="text/javascript"><!--
$('#review .pagination a').live('click', function() {
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
		data: 'name=' + encodeURIComponent($('input[name=\'name\']').val()) + '&text=' + encodeURIComponent($('textarea[name=\'text\']').val()) + '&rating=' + encodeURIComponent($('input[name=\'rating\']:checked').val() ? $('input[name=\'rating\']:checked').val() : '') + '&captcha=' + encodeURIComponent($('input[name=\'captcha\']').val()),
		beforeSend: function() {
			$('.success, .warning').remove();
			$('#button-review').attr('disabled', true);
			$('#review-title').after('<div class="attention"><img src="catalog/view/theme/default/image/loading.gif" alt="" /> <?php echo $text_wait; ?></div>');
		},
		complete: function() {
			$('#button-review').attr('disabled', false);
			$('.attention').remove();
		},
		success: function(data) {
			if (data['error']) {
				$('#review-title').after('<div class="warning"><img src="catalog/view/theme/default/image/close.png" alt="" class="close" />' + data['error'] + '</div>');
			}
			
			if (data['success']) {
				$('#review-title').after('<div class="success"><img src="catalog/view/theme/default/image/close.png" alt="" class="close" />' + data['success'] + '</div>');
								
				$('input[name=\'name\']').val('');
				$('textarea[name=\'text\']').val('');
				$('input[name=\'rating\']:checked').attr('checked', '');
				$('input[name=\'captcha\']').val('');
			}
		}
	});
});
//--></script> 
<script type="text/javascript"><!--
$('.zoom_additional').click( function() {
  $('#zoom_link1').attr('href',$(this).attr('data-zoom-image'));
});
//--></script>
<script type="text/javascript"><!--
$('#tabs a').tabs();
//--></script> 
<script type="text/javascript" src="catalog/view/javascript/jquery/ui/jquery-ui-timepicker-addon.js"></script> 
<script type="text/javascript"><!--
$(document).ready(function() {
	if ($.browser.msie && $.browser.version == 6) {
		$('.date, .datetime, .time').bgIframe();
	}

	$('.date').datepicker({dateFormat: 'yy-mm-dd'});
	$('.datetime').datetimepicker({
		dateFormat: 'yy-mm-dd',
		timeFormat: 'h:m'
	});
	$('.time').timepicker({timeFormat: 'h:m'});
});
//--></script>

<script> var counter = 1; 
 var min = <?php echo $minimum; ?>;
 $('input[name="quantity"]').change(function () {
    
    var value = parseInt($(this).val());
    var val = value % counter;
    if (val) {
      value = value - val;
    }
    $(this).val(value);
    
    if (isNaN(parseInt($(this).val()))) {
      $(this).val(min);
    } else {
      if ($(this).val() < min) {
        $(this).val(min);  
      }
    }
 });

 $('.quantity-operator').click (function () {
    
    if ($(this).attr('id') == 'minus') {
      if (parseInt($('input[name="quantity"]').val()) > min) {
        $('input[name="quantity"]').val(parseInt($('input[name="quantity"]').val()) - counter);
      }      
    } else {
      $('input[name="quantity"]').val(parseInt($('input[name="quantity"]').val()) + counter);  
    }
    if(typeof recalculateprice == 'function') { recalculateprice(); }
 });
			</script>

<?php echo $footer; ?>