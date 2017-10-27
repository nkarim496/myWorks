<?php echo $header;?>
<style>
	#menu_wrap {display:none !important}
	#cart.fly{position:relative;top:auto;right:auto;margin-top:0;}
	#cart > .btn {border-radius:100% !important;}
	#cart .dropdown-menu {display:none !important}
</style>
<div id="unicheckout" class="checkout_form container">        
		<div class="row">
		    <div class="col-md-12">
			    <div class="breadcrumbs">
				  <ul class="breadcrumb">
					<?php foreach ($breadcrumbs as $breadcrumb) { ?>
					<li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
					<?php } ?>
				  </ul>
				</div>
			</div>
		</div>
		<div class="error"></div>
		<h1 class="heading"><span><?php echo $lang['text_checkout']; ?></span></h1>
		<div class="row">
			<div class="col-xs-12">
				<div id="unicart">
<?php if($products || $vouchers) { ?>
<div class="table_wrap">
<table class="table table-bordered table-hover table-responsive">
<tr>
	<td class="image text-center"><?php echo $lang['text_image']; ?></td>
	<td class="text-left"><?php echo $column_name; ?></td>
	<td class="text-left hidden-xs"><?php echo $column_model; ?></td>
	<td class="quantity text-left hidden-xs"><?php echo $column_quantity; ?></td>
	<td class="text-right hidden-xs"><?php echo $column_price; ?></td>
	<td class="text-right"><?php echo $column_total; ?></td>
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
<tr>
	<td><p><?php echo $lang['text_additional']; ?></p></td>
</tr>
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
		<button type="button" class="button btn btn-default <?php echo $product['product_id']; ?>" data-toggle="tooltip" title="<?php echo $button_cart; ?>" onclick="cart.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-shopping-basket"></i> <span class="hidden-xs hidden-sm"><?php echo $button_cart; ?></span></button>
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
	$(document).ready(function() {
		max_height_div('.product-thumb h4');
		max_height_div('.product-thumb .option');
	});
	$('.product_related').owlCarousel({
		responsiveBaseWidth: '.product_related',
		itemsCustom: [[0, 1], [448, 2], [650, 2], [750, 3], [1000, 3]],
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
<!-- /related -->
</div>
			</div>
		</div>
		<?php if (!isset($address)) {?>
		<div class="row">
			<div class="col-md-12">
			    <div class="well">Уже зарегистрировались ранее? &nbsp;<a href="#" onclick="login(); return false;">Войти под своим логином и паролем</a></div>
		    </div>
		</div>
		<?php }?>
<div id="checkout_data">		
		<div id="user" class="row">
		    <div class="col-md-6">
			<div class="row">
				<div class="col-md-12">
					<h3 class="heading"><span><?php echo $text_your_details; ?></span></h3>
				</div>			  
				<div class="form-group required col-xs-6">
				    <input type="text" name="firstname" value="<?php if (isset($address['firstname'])) echo $address['firstname']; elseif (isset($firstname)) echo $firstname; ?>" placeholder="<?php echo $name_text; ?>" id="input-payment-firstname" class="form-control" />
				</div>
				<div class="form-group required col-xs-6">
				    <input type="text" name="lastname" value="<?php if (isset($lastname)) echo $lastname;?>" placeholder="<?php echo $lastname_text; ?>" id="input-payment-lastname" class="form-control" />
				</div>
				<div class="form-group required col-xs-6">
				    <input type="text" name="email" value="<?php if (isset($email)) echo $email;?>" placeholder="<?php echo $mail_text; ?>" id="input-payment-email" class="form-control" />
				</div>
				<div class="form-group required  col-xs-6">
				    <input type="text" name="telephone" value="<?php if (isset($telephone)) echo $telephone;?>" placeholder="<?php echo $phone_text; ?>" id="input-payment-telephone" class="form-control" />
				</div>
				<input type="hidden" name="fax" value="" />
				<?php if (!isset($customer_id)) {?>	
				<div class="form-group col-md-12">
					<input type="checkbox" name="register" onclick="$('.register-form').toggle()" id="register_user">
					<label for="register_user"></label>
					<label for="register_user">Зарегистрироваться</label>
				</div>    
				<div class="register-form col-xs-12" style="display:none">
				  <?php //if (!isset($address)) {?>
					<div class="form-group" >
						<label class="control-label"><?php echo $entry_customer_group; ?>:</label> &nbsp;&nbsp;&nbsp;
						<?php foreach ($customer_groups as $customer_group) { ?>
						<div class="radio">
						<?php if ($customer_group['customer_group_id'] == $customer_group_id) { ?>
							<input type="radio" name="customer_group_id" value="<?php echo $customer_group['customer_group_id']; ?>" id="<?php echo $customer_group['customer_group_id']; ?>" checked="checked" />
						<?php } else { ?>
							<input type="radio" name="customer_group_id" value="<?php echo $customer_group['customer_group_id']; ?>" id="<?php echo $customer_group['customer_group_id']; ?>" />
						<?php } ?>
							<label for="<?php echo $customer_group['customer_group_id']; ?>"></label>
							<label for="<?php echo $customer_group['customer_group_id']; ?>"><?php echo $customer_group['name']; ?></label>
						</div>
						<?php } ?>
					</div>
				    <div class="form-group required">
						<input type="password" name="password" value="" placeholder="Придумайте пароль" id="input-payment-password" class="form-control" />
				    </div>
					<?php if ($password_confirm) {?>	
				    <div class="form-group required">
						<input type="password" name="confirm" value="" placeholder="Подтвердите пароль" id="input-payment-confirm" class="form-control" />
				    </div>
					<?php } ?>
				</div>
				<?php } ?>
			</div>
			<div class="row">
				<div class="payment_address col-xs-12"><h3 class="heading"><span>Адрес доставки</span></h3>
				<?php if ($addresses) { ?>
					<?php if (isset($customer_id)) {?>	  
						<div class="radio">
							<input type="radio" name="payment_address" value="existing" checked="checked" onclick="$('#payment-address-new').hide()" id="payment_address" />
							<label for="payment_address"></label>
							<label for="payment_address"><?php echo $text_address_existing; ?></label>
						</div>
						<div id="payment-existing">
							<select name="payment_address_id" class="form-control">
							<?php foreach ($addresses as $address) { ?>
								<?php if (isset($payment_address_id) && $address['address_id'] == $payment_address_id) { ?>
									<option value="<?php echo $address['address_id']; ?>" selected="selected"><?php echo $address['firstname']; ?> <?php echo $address['lastname']; ?>, <?php echo $address['address_1']; ?>, <?php echo $address['city']; ?>, <?php echo $address['zone']; ?>, <?php echo $address['country']; ?></option>
								<?php } else { ?>
									<option value="<?php echo $address['address_id']; ?>"><?php echo $address['firstname']; ?> <?php echo $address['lastname']; ?>, <?php echo $address['address_1']; ?>, <?php echo $address['city']; ?>, <?php echo $address['zone']; ?>, <?php echo $address['country']; ?></option>
								<?php } ?>
							<?php } ?>
							</select>
						</div>
					<?php } ?>
					<?php if (isset($customer_id)) { ?>
						<div class="radio">
							<input type="radio" name="payment_address" value="new" onclick="$('#payment-address-new').show();" id="new_payment_address"/>
							<label for="new_payment_address"></label>
							<label for="new_payment_address"><?php echo $text_address_new; ?></label>
						</div>
					<?php } ?>
			    <?php } ?>
				<div class="row">
				<div id="payment-address-new" <?php if (isset($customer_id) && $addresses) {?>	style="display:none"<?php }?>>
					<input type="hidden" name="company" value="" />
					<input type="hidden" name="company_id" value="" />
					<input type="hidden" name="tax_id" value="" />
					<div class="form-group required col-md-6">
						<select name="country_id" id="input-payment-country" class="form-control">
							<option value="">Выберите область</option>
								<?php foreach ($countries as $country) { ?>
									<?php if ($country['country_id'] == $country_id) { ?>
										<option value="<?php echo $country['country_id']; ?>" selected="selected"><?php echo $country['name']; ?></option>
									<?php } else { ?>
										<option value="<?php echo $country['country_id']; ?>"><?php echo $country['name']; ?></option>
									<?php } ?>
								<?php } ?>
						</select>
					</div>
					<div class="form-group required col-md-6">
						<select name="zone_id" id="input-payment-zone" class="form-control"></select>
					</div>
					<div class="form-group required col-xs-6">
						<input type="text" name="city" value="<?php if (isset($city)) echo $city;?>" placeholder="<?php echo $city_text; ?>" id="input-payment-city" class="form-control" />
					</div>
					<div class="form-group required col-xs-6">
						<input type="text" name="postcode" value="<?php if (isset($postcode)) echo $postcode;?>" placeholder="<?php echo $postcode_text; ?>" id="input-payment-postcode" class="form-control" />
					</div>
					<div class="address form-group required col-xs-12">
						<input type="text" name="address_1" value="<?php if (isset($address_1)) echo $address_1;?>" placeholder="<?php echo $address_text; ?>" id="input-payment-address-1" class="form-control" />
					</div>
					<?php if ($address2) { ?>
					<div class="form-group col-xs-12">
						<input type="text" name="address_2" value="<?php if (isset($address_2)) echo $address_2;?>" placeholder="<?php echo $address2_text; ?>" id="input-payment-address-2" class="form-control" />
					</div>
					<?php } else { ?>
						<input type="hidden" name="address_2" value="" />
					<?php } ?>
				</div>
				</div>				
		      </div>
			</div>
		</div>
		<div class="col-md-6">
			<div class="shipping-address" <?php if (isset($shipping_address_id) || isset($customer_id)) echo 'style="display:block"'; else echo 'style="display:none"'; ?>>
				<div id="shipping-new" style="display: <?php echo (($addresses && isset($customer_id)) ? 'none' : 'block'); ?>;">
					<div class="form-group required">
						<label class="control-label" for="input-shipping-firstname"><?php echo $entry_firstname; ?></label>
						<div class="">
							<input type="text" name="shipping_firstname" value="" placeholder="<?php echo str_replace(':','',$entry_firstname); ?>" id="input-shipping-firstname" class="form-control" />
						</div>
					</div>
					<div class="form-group required">
						<label class="control-label" for="input-shipping-lastname"><?php echo $entry_lastname; ?></label>
						<div class="">
							<input type="text" name="shipping_lastname" value="" placeholder="<?php echo str_replace(':','',$entry_lastname); ?>" id="input-shipping-lastname" class="form-control" />
						</div>
					</div>
					<div class="form-group">
						<label class="control-label" for="input-shipping-company"><?php echo $entry_company; ?></label>
							<div class="">
								<input type="text" name="shipping_company" value="" placeholder="<?php echo str_replace(':','',$entry_company); ?>" id="input-shipping-company" class="form-control" />
							</div>
					</div>
				<input type="hidden" name="shipping_company" value="" />
				<div class="form-group required">
					<label class="control-label" for="input-shipping-address-1"><?php echo $entry_address_1; ?></label>
					<div class="">
						<input type="text" name="shipping_address_1" value="" placeholder="<?php echo str_replace(':','',$entry_address_1); ?>" id="input-shipping-address-1" class="form-control" />
					</div>
				</div>
				<div class="form-group">
				  <label class="control-label" for="input-shipping-address-2"><?php echo $entry_address_2; ?></label>
				  <div class="">
				    <input type="text" name="shipping_address_2" value="" placeholder="<?php echo str_replace(':','',$entry_address_2); ?>" id="input-shipping-address-2" class="form-control" />
				  </div>
				</div>
				<div class="form-group required">
				  <label class="control-label" for="input-shipping-city"><?php echo $entry_city; ?></label>
				  <div class="">
				    <input type="text" name="shipping_city" value="" placeholder="<?php echo str_replace(':','',$entry_city); ?>" id="input-shipping-city" class="form-control" />
				  </div>
				</div>
				<div class="form-group required">
				  <label class="control-label" for="input-shipping-postcode"><?php echo $entry_postcode; ?></label>
				  <div class="">
				    <input type="text" name="shipping_postcode" value="<?php echo $postcode; ?>" placeholder="<?php echo str_replace(':','',$entry_postcode); ?>" id="input-shipping-postcode" class="form-control" />
				  </div>
				</div>
				<div class="form-group required">
				  <label class="control-label" for="input-shipping-country"><?php echo $entry_country; ?></label>
				  <div class="">
				    <select name="shipping_country_id" id="input-shipping-country" class="form-control">
				      <option value=""><?php echo $text_select; ?></option>
				      <?php foreach ($countries as $country) { ?>
				      <?php if ($country['country_id'] == $country_id) { ?>
				      <option value="<?php echo $country['country_id']; ?>" selected="selected"><?php echo $country['name']; ?></option>
				      <?php } else { ?>
				      <option value="<?php echo $country['country_id']; ?>"><?php echo $country['name']; ?></option>
				      <?php } ?>
				      <?php } ?>
				    </select>
				  </div>
				</div>
				<div class="form-group required">
				  <label class="control-label" for="input-shipping-zone"><?php echo $entry_zone; ?></label>
				  <div class="">
				    <select name="shipping_zone_id" id="input-shipping-zone" class="form-control">
				    </select>
				  </div>
				</div>
				<?php if (isset($custom_fields)) foreach ($custom_fields as $custom_field) { ?>
				<?php if ($custom_field['type'] == 'select') { ?>
				<div class="form-group<?php echo ($custom_field['required'] ? ' required' : ''); ?> custom-field">
				  <label class="control-label" for="input-shipping-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
				  <div class="">
				    <select name="shipping_custom_field[<?php echo $custom_field['custom_field_id']; ?>]" id="input-shipping-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control">
				      <option value=""><?php echo $text_select; ?></option>
				      <?php foreach ($custom_field['custom_field_value'] as $custom_field_value) { ?>
				      <option value="<?php echo $custom_field_value['custom_field_value_id']; ?>"><?php echo $custom_field_value['name']; ?></option>
				      <?php } ?>
				    </select>
				  </div>
				</div>
				<?php } ?>
				<?php if ($custom_field['type'] == 'radio') { ?>
				<div class="form-group<?php echo ($custom_field['required'] ? ' required' : ''); ?> custom-field">
				  <label class="control-label"><?php echo $custom_field['name']; ?></label>
				  <div class="">
				    <div id="input-shipping-custom-field<?php echo $custom_field['custom_field_id']; ?>">
				      <?php foreach ($custom_field['custom_field_value'] as $custom_field_value) { ?>
				      <div class="radio">
					<label>
					  <input type="radio" name="shipping_custom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo $custom_field_value['custom_field_value_id']; ?>" />
					  <?php echo $custom_field_value['name']; ?></label>
				      </div>
				      <?php } ?>
				    </div>
				  </div>
				</div>
				<?php } ?>
				<?php if ($custom_field['type'] == 'checkbox') { ?>
				<div class="form-group<?php echo ($custom_field['required'] ? ' required' : ''); ?> custom-field">
				  <label class="control-label"><?php echo $custom_field['name']; ?></label>
				  <div class="">
				    <div id="input-shipping-custom-field<?php echo $custom_field['custom_field_id']; ?>">
				      <?php foreach ($custom_field['custom_field_value'] as $custom_field_value) { ?>
				      <div class="checkbox">
					<label>
					  <input type="checkbox" name="shipping_custom_field[<?php echo $custom_field['custom_field_id']; ?>][]" value="<?php echo $custom_field_value['custom_field_value_id']; ?>" />
					  <?php echo $custom_field_value['name']; ?></label>
				      </div>
				      <?php } ?>
				    </div>
				  </div>
				</div>
				<?php } ?>
				<?php if ($custom_field['type'] == 'text') { ?>
				<div class="form-group<?php echo ($custom_field['required'] ? ' required' : ''); ?> custom-field">
				  <label class="control-label" for="input-shipping-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
				  <div class="">
				    <input type="text" name="shipping_custom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo $custom_field['value']; ?>" placeholder="<?php echo str_replace(':','',$custom_field['name']); ?>" id="input-shipping-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control" />
				  </div>
				</div>
				<?php } ?>
				<?php if ($custom_field['type'] == 'textarea') { ?>
				<div class="form-group<?php echo ($custom_field['required'] ? ' required' : ''); ?> custom-field">
				  <label class="control-label" for="input-shipping-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
				  <div class="">
				    <textarea name="shipping_custom_field[<?php echo $custom_field['custom_field_id']; ?>]" rows="5" placeholder="<?php echo str_replace(':','',$custom_field['name']); ?>" id="input-shipping-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control"><?php echo $custom_field['value']; ?></textarea>
				  </div>
				</div>
				<?php } ?>
				<?php if ($custom_field['type'] == 'file') { ?>
				<div class="form-group<?php echo ($custom_field['required'] ? ' required' : ''); ?> custom-field">
				  <label class="control-label"><?php echo $custom_field['name']; ?></label>
				  <div class="">
				    <button type="button" id="button-shipping-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="btn btn-default"><i class="fa fa-upload"></i> <?php echo $button_upload; ?></button>
				    <input type="hidden" name="shipping_custom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo $custom_field['value']; ?>" id="input-shipping-custom-field<?php echo $custom_field['custom_field_id']; ?>" />
				  </div>
				</div>
				<?php } ?>
				<?php if ($custom_field['type'] == 'date') { ?>
				<div class="form-group<?php echo ($custom_field['required'] ? ' required' : ''); ?> custom-field">
				  <label class="control-label" for="input-shipping-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
				  <div class="">
				    <input type="date" name="shipping_custom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo $custom_field['value']; ?>" placeholder="<?php echo str_replace(':','',$custom_field['name']); ?>" id="input-shipping-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control" />
				  </div>
				</div>
				<?php } ?>
				<?php if ($custom_field['type'] == 'datetime') { ?>
				<div class="form-group<?php echo ($custom_field['required'] ? ' required' : ''); ?> custom-field">
				  <label class="control-label" for="input-shipping-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
				  <div class="">
				    <input type="datetime-local" name="shipping_custom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo $custom_field['value']; ?>" placeholder="<?php echo str_replace(':','',$custom_field['name']); ?>" id="input-shipping-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control" />
				  </div>
				</div>
				<?php } ?>
				<?php if ($custom_field['type'] == 'time') { ?>
				<div class="form-group<?php echo ($custom_field['required'] ? ' required' : ''); ?> custom-field">
				  <label class="control-label" for="input-shipping-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
				  <div class="">
				    <input type="time" name="shipping_custom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo $custom_field['value']; ?>" placeholder="<?php echo str_replace(':','',$custom_field['name']); ?>" id="input-shipping-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control" />
				  </div>
				</div>
				<?php } ?>
				<?php } ?>
			      </div>
			</div>
			<h3 class="heading"><span>Cпособы доставки</span></h3>
			<div class="shipping-method">
				<?php if ($error_warning) { ?>
					<div class="alert alert-warning"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?></div>
				<?php } ?>
				<?php if ($shipping_methods) { ?>
					<?php foreach ($shipping_methods as $shipping_method) { ?>
						<?php if (!$shipping_method['error']) { ?>
							<?php foreach ($shipping_method['quote'] as $quote) { ?>
								<div class="radio">
									<?php if ($quote['code'] == $code || !$code) { ?>
										<?php $code = $quote['code']; ?>
										<input type="radio" name="shipping_method" value="<?php echo $quote['code']; ?>"  title="<?php echo $quote['title']; ?>" id="<?php echo $quote['code']; ?>" checked="checked" />
									<?php } else { ?>
										<input type="radio" name="shipping_method" value="<?php echo $quote['code']; ?>"  title="<?php echo $quote['title']; ?>" id="<?php echo $quote['code']; ?>" />
									<?php } ?>
									<label for="<?php echo $quote['code']; ?>"></label>
									<label for="<?php echo $quote['code']; ?>"><?php echo $quote['title']; ?> - <?php echo $quote['text']; ?></label>
								</div>
							<?php } ?>
						<?php } else { ?>
							<div class="alert alert-danger"><?php echo $shipping_method['error']; ?></div>
						<?php } ?>
					<?php } ?>
				<?php } ?>
			</div>
			<h3 class="heading"><span>Cпособы оплаты</span></h3>
			<div class="your_order">									
				<div class="payment-method">						    
					<?php if ($error_warning) { ?>
						<div class="alert alert-warning"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?></div>
					<?php } ?>
					<?php if ($payment_methods) { ?>
						<?php foreach ($payment_methods as $payment_method) { ?>
							<div class="radio">
								<?php if ($payment_method['code'] == $code || !$code) { ?>
									<?php $code = $payment_method['code']; ?>
									<input type="radio" name="payment_method" value="<?php echo $payment_method['code']; ?>" title="<?php echo $payment_method['title']; ?>" id="<?php echo $payment_method['code']; ?>" checked="checked" />
								<?php } else { ?>
									<input type="radio" name="payment_method" value="<?php echo $payment_method['code']; ?>" title="<?php echo $payment_method['title']; ?>" id="<?php echo $payment_method['code']; ?>" />
								<?php } ?>
								<label for="<?php echo $payment_method['code']; ?>"></label>
								<label for="<?php echo $payment_method['code']; ?>"><?php echo $payment_method['title']; ?></label>
							</div>
						<?php } ?>
					<?php } ?>
				</div>
				<h3 class="heading"><span>Комментарий</span></h3>
					<p><textarea name="comment" rows="3" class="form-control"><?php echo $comment; ?></textarea></p>
			</div>
			</div>
			</div>
			<div id="confirm" class="row">
				<div class="total_checkout col-md-12 text-right"><h3 style="margin:10px 0;"><span style="padding:0;color:#777;"><?php echo $lang['text_total_checkout']; ?><span style="padding:0;color:#D9534F;"><span/><span/></h3></div>
				<div class="col-md-12">
					<?php if ($text_agree) { ?>
					<div class="buttons clearfix">
						<div class="radio pull-left hidden-xs">
							<?php if ($agree) { ?>
								<input type="checkbox" name="agree" value="1" checked="checked" id="agree" />
								<label for="agree"></label>
							<?php } else { ?>
								<input type="checkbox" name="agree" value="1" id="agree" />
								<label for="agree"></label>
							<?php } ?>
							<label for="agree"><?php echo $text_agree; ?></label>
						</div>
						<div class="radio pull-right text-right visible-xs">
							<?php if ($agree) { ?>
								<input type="checkbox" name="agree" value="1" checked="checked" id="agree1" />
								<label for="agree1"></label>
							<?php } else { ?>
								<input type="checkbox" name="agree" value="1" id="agree1" />
								<label for="agree1"></label>
							<?php } ?>
							<label for="agree1"><?php echo $text_agree; ?></label>
							<hr />
						</div>
						<div class="pull-right">
							<?php if ($payment) echo $payment; else { ?>
								<button data-loading-text="<?php echo $lang['text_loading']; ?>" id="confirm_checkout" class="btn btn-primary"><?php echo $lang['button_confirm_checkout'];?></button>
							<?php } ?>
						</div>
					</div>
					<?php } else { ?>
						<div class="buttons">
							<div class="pull-right">
								<button data-loading-text="<?php echo $lang['text_loading']; ?>" id="confirm_checkout" class="btn btn-primary"><?php echo $button_continue; ?></button>
							</div>
						</div>
					<?php } ?>
					<div class="payment" style="display:none;"></div>
				</div>
			</div>
</div>			
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<script type="text/javascript" src="catalog/view/theme/unishop/js/jquery.maskedinput.min.js"></script>
<script type="text/javascript"><!--
var error = true;

$('body').on('click', '#confirm_checkout', function() {
	
	var data = $('.checkout_form input[type=\'text\'], .checkout_form input[type=\'date\'], .checkout_form input[type=\'datetime-local\'], .checkout_form input[type=\'time\'], .checkout_form input[type=\'password\'], .checkout_form input[type=\'hidden\'], .checkout_form input[type=\'checkbox\']:checked, .checkout_form input[type=\'radio\']:checked, .checkout_form textarea, .checkout_form select').serialize();
	data += '&_shipping_method='+ $('.checkout_form input[name=\'shipping_method\']:checked').prop('title') + '&_payment_method=' + $('.checkout_form input[name=\'payment_method\']:checked').prop('title');
	
    $.ajax({
        url: 'index.php?route=checkout/unicheckout/validate',
        type: 'post',
        data: data,
        dataType: 'json',
        beforeSend: function() {
			$('#confirm_checkout').button('loading');
		},  
        complete: function() {
            $('#confirm_checkout').button('reset');
        },          
        success: function(json) {
            $('.alert, .text-danger').remove();
                        
            if (json['redirect']) {
                location = json['redirect'];                
            } else if (json['error']) {
				error = true;
                if (json['error']['warning']) {
                    $('.error').prepend('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error']['warning'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');
                }
                
				for (i in json['error']) {
                    //$('[name="' + i + '"]').after('<div class="text-danger">' + json['error'][i] + '</div>');
					$('#unicheckout').append('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' +json['error'][i]+ ' <button type="button" class="close" data-dismiss="alert">&times;</button></div>');
				}
            } else  {
				error = false;
				$('[name=\'payment_method\']:checked').click();
            }    
        },
        error: function(xhr, ajaxOptions, thrownError) {
            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
    }); 
});

$('select[name=\'country_id\']').on('change', function() {
	$.ajax({
        url: 'index.php?route=checkout/unicheckout/country&country_id=' + this.value,
        dataType: 'json',
        beforeSend: function() {
			$('select[name=\'country_id\']').after(' <i class="fa fa-spinner fa-spin"></i>');
        },
        complete: function() {
			$('.fa-spinner').remove();
        },          
        success: function(json) {
			if (json['postcode_required'] == '1') {
				$('input[name=\'postcode\']').parent().parent().addClass('required');
			} else {
				$('input[name=\'postcode\']').parent().parent().removeClass('required');
			}
			            
            html = '<option value=""><?php echo $text_select; ?></option>';
            
            if (json['zone'] && json['zone'] != '') {
                for (i = 0; i < json['zone'].length; i++) {
                    html += '<option value="' + json['zone'][i]['zone_id'] + '"';
                    
                    if (json['zone'][i]['zone_id'] == '<?php echo $zone_id; ?>') {
                        html += ' selected="selected"';
                    }
    
                    html += '>' + json['zone'][i]['name'] + '</option>';
                }
            } else {
                html += '<option value="0" selected="selected"><?php echo $text_none; ?></option>';
            }
            
            $('select[name=\'zone_id\']').html(html).val("");
        },
        error: function(xhr, ajaxOptions, thrownError) {
            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
    });
});


$('select[name=\'shipping_country_id\']').on('change', function() {
	$.ajax({
        url: 'index.php?route=checkout/unicheckout/country&country_id=' + this.value,
        dataType: 'json',
        beforeSend: function() {
			$('select[name=\'country_id\']').after(' <i class="fa fa-spinner fa-spin"></i>');
        },
        complete: function() {
			$('.fa-spinner').remove();
        },          
        success: function(json) {
			if (json['postcode_required'] == '1') {
				$('input[name=\'postcode\']').parent().parent().addClass('required');
			} else {
				$('input[name=\'postcode\']').parent().parent().removeClass('required');
			}
			            
            html = '<option value=""><?php echo $text_select; ?></option>';
            
            if (json['zone'] && json['zone'] != '') {
                for (i = 0; i < json['zone'].length; i++) {
                    html += '<option value="' + json['zone'][i]['zone_id'] + '"';
                    
                    if (json['zone'][i]['zone_id'] == '<?php echo $zone_id; ?>') {
                        html += ' selected="selected"';
                    }
    
                    html += '>' + json['zone'][i]['name'] + '</option>';
                }
            } else {
                html += '<option value="0" selected="selected"><?php echo $text_none; ?></option>';
            }
            
            $('select[name=\'shipping_zone_id\']').html(html).val("");
        },
        error: function(xhr, ajaxOptions, thrownError) {
            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
    });
});

$('select[name=\'country_id\'], select[name=\'zone_id\'], select[name=\'shipping_country_id\'], select[name=\'shipping_zone_id\'], input[type=\'radio\'][name=\'payment_address\'], input[type=\'radio\'][name=\'shipping_address\']').on('change', function() {
	if (this.name == 'contry_id') $("select[name=\'zone_id\']").val("");
	if (this.name == 'shipping_country_id') $("select[name=\'shipping_zone_id\']").val("");
	
    $(".shipping-method").load('index.php?route=checkout/unicheckout/shipping_method', $('.checkout_form input[type=\'text\'], .checkout_form input[type=\'date\'], .checkout_form input[type=\'datetime-local\'], .checkout_form input[type=\'time\'], .checkout_form input[type=\'password\'], .checkout_form input[type=\'hidden\'], .checkout_form input[type=\'checkbox\']:checked, .checkout_form input[type=\'radio\']:checked,input[name=\'shipping_method\']:first, .checkout_form textarea, .checkout_form select'), function() {
		if ($("input[name=\'shipping_method\']:first").length) {
			$("input[name=\'shipping_method\']:first").attr('checked', 'checked').prop('checked', true).click();
		} else {
			$("#unicart").load('index.php?route=checkout/unicheckout/cart', $('.checkout_form input[type=\'text\'], .checkout_form input[type=\'date\'], .checkout_form input[type=\'datetime-local\'], .checkout_form input[type=\'time\'], .checkout_form input[type=\'password\'], .checkout_form input[type=\'hidden\'], .checkout_form input[type=\'checkbox\']:checked, .checkout_form input[type=\'radio\']:checked, .checkout_form textarea, .checkout_form select'));	
		}
    });

	$(".payment-method").load('index.php?route=checkout/unicheckout/payment_method', $('.checkout_form input[type=\'text\'], .checkout_form input[type=\'date\'], .checkout_form input[type=\'datetime-local\'], .checkout_form input[type=\'time\'], .checkout_form input[type=\'password\'], .checkout_form input[type=\'hidden\'], .checkout_form input[type=\'checkbox\']:checked, .checkout_form input[type=\'radio\']:checked,input[name=\'shipping_method\']:first, .checkout_form textarea, .checkout_form select'), function() {
		//$("[name=\'payment_method\']").removeAttr("checked").prop('checked', false);
	});
});    


$('body').on('click', 'input[name=\'shipping_method\'], input[name=\'payment_method\']', function() {
   update_checkout();
}); 

$('body').on('change', '.payment_address input', function() {
   update_checkout();
});  

$('body').on('click', '[name=\'payment_method\']', function() {
	var data = $('.checkout_form input[type=\'text\'], .checkout_form input[type=\'date\'], .checkout_form input[type=\'datetime-local\'], .checkout_form input[type=\'time\'], .checkout_form input[type=\'password\'], .checkout_form input[type=\'hidden\'], .checkout_form input[type=\'checkbox\']:checked, .checkout_form input[type=\'radio\']:checked, .checkout_form textarea, .checkout_form select').serialize();
	data += '&_shipping_method='+ $('.checkout_form input[name=\'shipping_method\']:checked').prop('title') + '&_payment_method=' + $('.checkout_form input[name=\'payment_method\']:checked').prop('title');

	if (!error) {
		$.ajax({
			url: 'index.php?route=checkout/unicheckout/confirm',
			type: 'post',
			data: data,
			success: function(html) {
				$('.payment').html(html);
				if ($('.payment h2, .payment p').size()) {
					$('.payment').css('display', 'block');
				} else {
					$('.payment').css('display', 'none');
					$("#button-confirm").click();
				}
			},
			error: function(xhr, ajaxOptions, thrownError) {
				alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
			}
		});
	}
});

$('select[name=\'country_id\']').trigger('change');

$(document).ready(function() {
	$('input:radio[name=\'payment_method\']:first').trigger('click');
	//$('#unicart').load('index.php?route=checkout/unicheckout/cart', function() {});
	//console.log($('input:radio[name=\'payment_method\']:first').val())
});

$('body').on('focus', '#input-payment-telephone', function(){
	$(this).mask('<?php echo $checkout_phone_mask; ?>');
});

$('body').on('click', '#button-coupon', function() {
	$.ajax({
		url: 'index.php?route=total/coupon/coupon',
		type: 'post',
		data: 'coupon=' + encodeURIComponent($('input[name=\'coupon\']').val()),
		dataType: 'json',
		beforeSend: function() {
			$('#button-coupon').button('loading');
		},
		complete: function() {
			$('#button-coupon').button('reset');
		},
		success: function(json) {
			$('.alert').remove();

			if (json['error']) {
				$('#unicheckout').append('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');
			}

			if (json['redirect']) {
				update_checkout();
			}
		}
	});
});
$('body').on('click', '#button-reward', function() {
	$.ajax({
		url: 'index.php?route=total/reward/reward',
		type: 'post',
		data: 'reward=' + encodeURIComponent($('input[name=\'reward\']').val()),
		dataType: 'json',
		beforeSend: function() {
			$('#button-reward').button('loading');
		},
		complete: function() {
			$('#button-reward').button('reset');
		},
		success: function(json) {
			$('.alert').remove();

			if (json['error']) {
				$('#unicheckout').append('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');
			}

			if (json['redirect']) {
				update_checkout();
			}
		}
	});
});
$('body').on('click', '#button-voucher', function() {
  $.ajax({
    url: 'index.php?route=total/voucher/voucher',
    type: 'post',
    data: 'voucher=' + encodeURIComponent($('input[name=\'voucher\']').val()),
    dataType: 'json',
    beforeSend: function() {
      $('#button-voucher').button('loading');
    },
    complete: function() {
      $('#button-voucher').button('reset');
    },
    success: function(json) {
		$('.alert').remove();

		if (json['error']) {
			$('#unicheckout').append('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');
		}

		if (json['redirect']) {
			update_checkout();
		}
    }
  });
});

function cart_update(key, quantity) {
	$.ajax({
		url: 'index.php?route=checkout/unicheckout/cart_edit',
		type: 'post',
		data: 'quantity[' + key + ']='+quantity,
		dataType: 'html',
		success: function(data) {
			$('#cart').load('index.php?route=common/cart/info #cart > *');
			update_checkout();
			p_array();
		},
	       error: function(xhr, ajaxOptions, thrownError) {
	           alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
	       }
	});
}

function update_checkout() {
	var data = $('.checkout_form input[type=\'radio\']:checked, .checkout_form select')
	$('#unicart').load('index.php?route=checkout/unicheckout/cart', data, function() {
		update_shipping();
		update_payment();
		$('.total_checkout h3 span span').html($('.total_table td:last').html())
	});
	
}

function update_shipping() {
	var data = $('.checkout_form input[type=\'radio\']:checked, .checkout_form select').serialize();
	$.ajax({
		url: 'index.php?route=checkout/unicheckout/shipping_method',
		type: 'post',
		data: data,
		dataType: 'html',
		success: function(html) {
			$('.shipping-method').html(html);
		}
	});
}

function update_payment() {
	var data = $('.checkout_form input[type=\'radio\']:checked, .checkout_form select').serialize();
	$.ajax({
		url: 'index.php?route=checkout/unicheckout/payment_method',
		type: 'post',
		data: data,
		dataType: 'html',
		success: function(html) {
			$('.payment-method').html(html);
		}
	});
}

//--></script>

<?php echo $footer;?>