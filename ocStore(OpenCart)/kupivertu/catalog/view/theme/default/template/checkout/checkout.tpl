<?php echo $header; ?><?php echo $column_left; ?><?php echo $column_right; ?>
<style type="text/css">
	.payment .buttons{
		display: none;
	}
</style>
<div id="content"><?php echo $content_top; ?>
	<div class="breadcrumb">
		<?php foreach($breadcrumbs as $breadcrumb) { ?>
		<?php echo $breadcrumb['separator']; ?><a
				href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
		<?php } ?>
	</div>
	

	<div class="checkout">
	<h1><?php echo $heading_title; ?></h1>
		<div id="checkout">
			
			<div class="checkout-content" style="display: block">
				<form id="checkout_form" onsubmit="return false;">
					<div class="left">
						<table class="form">
							<tr>
								<td><span class="required">*</span> <?php echo $entry_firstname; ?></td>
								<td><input type="text" name="firstname" value="<?php echo $firstname?>"
										   class="large-field"/></td>
							</tr>
							<tr class="display-none">
								<td><span class="required">*</span> <?php echo $entry_lastname; ?></td>
								<td><input type="text" name="lastname" value="none"
										   class="large-field"/></td>
							</tr>
							<tr>
								<td><span class="required">*</span> <?php echo $entry_address_1; ?></td>
								<td><input type="text" name="address_1" value="<?php echo $address_1?>"
										   class="large-field"/></td>
							</tr>
							<tr>
								<td><span class="required">*</span> <?php echo $entry_city; ?></td>
								<td><input type="text" name="city" value="<?php echo $city; ?>" class="large-field" /></td>  
  							</tr>
							<tr class="display-none">
								<td><span class="required">*</span> <?php echo $entry_postcode; ?></td>
								<td><input type="text" name="postcode" value="000000" class="large-field" /></td>
  							</tr>
							<tr class="display-none">
								<td><span class="required">*</span> <?php echo $entry_country; ?></td>
								<td>
								    <select name="country_id" class="large-field">
								      <option value=""><?php echo $text_select; ?></option>
								      <?php foreach ($countries as $country) { ?>
								      <?php if ($country['country_id'] == $country_id) { ?>
								      <option value="<?php echo $country['country_id']; ?>" selected="selected"><?php echo $country['name']; ?></option>
								      <?php } else { ?>
								      <option value="<?php echo $country['country_id']; ?>"><?php echo $country['name']; ?></option>
								      <?php } ?>
								      <?php } ?>
								    </select>
								  </td>
							</tr>
							<tr class="display-none">
							  <td><span class="required">*</span> <?php echo $entry_zone; ?></td>
							  <td><select name="zone_id" class="large-field">
							    </select></td>
							</tr>
							<tr class="display-none">
								<td><span class="required">*</span> <?php echo $entry_email; ?></td>
								<td><input type="text" name="email" value="none@none.ru" class="large-field"/>
								</td>
							</tr>
							<tr>
								<td><span class="required">*</span> <?php echo $entry_telephone; ?></td>
								<td><input type="text" name="telephone" value="<?php echo $telephone?>"
										   class="large-field"/></td>
							</tr>
							<tr>
								<td><?php echo $column_comment; ?>:</td>
								<td><textarea rows="8" style="width: 300px"
											  name="comment"><?php echo $comment?></textarea></td>
							</tr>
						</table>
					</div>
					<div class="right">
						<div class="shipping-content" style="display: none">
							<?php if(count($shipping_methods) > 1) { ?>
							<p><?php echo $text_shipping_method; ?></p>
							<table class="form">
								<?php foreach($shipping_methods as $shipping_method) { ?>
								<tr>
									<td colspan="3"><b><?php echo $shipping_method['title']; ?></b></td>
								</tr>
								<?php if(!$shipping_method['error']) { ?>
									<?php foreach($shipping_method['quote'] as $quote) { ?>
										<tr>
											<td style="width: 1px;"><?php if($quote['code'] == $shipping_code || !$shipping_code) { ?>
												<?php $shipping_code = $quote['code']; ?>
												<input type="radio" name="shipping_method"
													   value="<?php echo $quote['code']; ?>"
													   id="<?php echo $quote['code']; ?>" checked="checked"/>
												<?php } else { ?>
												<input type="radio" name="shipping_method"
													   value="<?php echo $quote['code']; ?>"
													   id="<?php echo $quote['code']; ?>"/>
												<?php } ?></td>
											<td><label
													for="<?php echo $quote['code']; ?>"><?php echo $quote['title']; ?></label>
											</td>
											<td style="text-align: right;"><label
													for="<?php echo $quote['code']; ?>"><?php echo $quote['text']; ?></label>
											</td>
										</tr>
										<?php } ?>
									<?php } else { ?>
									<tr>
										<td colspan="3">
											<div class="error"><?php echo $shipping_method['error']; ?></div>
										</td>
									</tr>
									<?php } ?>
								<?php } ?>
							</table>
							<?php } else if ($shipping_methods) { ?>
							<?php $shipping_method = array_shift($shipping_methods);?>
								<p><?php echo $text_shipping_method; ?></p>
							<table class="form">
								<tr>
									<td colspan="3"><b><?php echo $shipping_method['title']; ?></b></td>
								<?php foreach($shipping_method['quote'] as $quote) { ?>
									<td><label><?php echo $quote['title']; ?></label></td>
									<td style="text-align: right;"><label><?php echo $quote['text']; ?></label></td>
								<?php }?>
								</tr>
								</table>
							<?php } else { ?>
							
							<?php }?>
						</div>
						<div class="payment-content" style="display: none">
							<?php echo $payment_data?>
						</div>
					</div>
					<div style="clear: both;">

					<?php if ($text_agree) { ?>
					<div class="buttons">
					  <div class="right"><?php echo $text_agree; ?>
						<?php if ($agree) { ?>
						<input type="checkbox" name="agree" value="1" checked="checked" />
						<?php } else { ?>
						<input type="checkbox" name="agree" value="1" />
						<?php } ?>
					  </div>
					</div>
						<script type="text/javascript"><!--
							<?php if(in_array(substr(VERSION, 0, 5), array('1.5.3', '1.5.4'))) { ?>
								$('.colorbox').colorbox({
									width: 640,
									height: 480
								});
							<?php } else { ?>
								$('.fancybox').fancybox({
									width: 560,
									height: 560,
									autoDimensions: false
								});
							<?php }?>
						//--></script>
					<?php }?>

						<div class="checkout-product">
							<table>
								<thead>
								<tr>
									<td class="image"><?php echo $column_image; ?></td>
									<td class="name"><?php echo $column_name; ?></td>
									<td class="model"><?php echo $column_model; ?></td>
									<td class="quantity"><?php echo $column_quantity; ?></td>
									<td class="price"><?php echo $column_price; ?></td>
									<td class="total"><?php echo $column_total; ?></td>
								</tr>
								</thead>
								<tbody>
								<?php foreach($products as $product) { ?>
								<tr>
									<td class="image"><?php if ($product['thumb']) { ?>
									  <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" /></a>
									  <?php } ?>
									</td>
									<td class="name"><a
											href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
										<?php foreach($product['option'] as $option) { ?>
											<br/>
											&nbsp;
											<small> - <?php echo $option['name']; ?>
												: <?php echo $option['value']; ?></small>
											<?php } ?></td>
									<td class="model"><?php echo $product['model']; ?></td>
									<td class="quantity"><?php echo $product['quantity']; ?></td>
									<td class="price"><?php echo $product['price_text']; ?></td>
									<td class="total"><?php echo $product['total_text']; ?></td>
								</tr>
									<?php } ?>
								<?php foreach($vouchers as $voucher) { ?>
								<tr>
									<td class="image"></td>
									<td class="name"><?php echo $voucher['description']; ?></td>
									<td class="model"></td>
									<td class="quantity">1</td>
									<td class="price"><?php echo $voucher['amount']; ?></td>
									<td class="total"><?php echo $voucher['amount']; ?></td>
								</tr>
									<?php } ?>
								</tbody>
								<tbody id="total_data">
									<?php echo $total_data?>
								</tbody>
								<tfoot>
								    <tr>
								      <td colspan="6">
									<a id="confirm" class="button"><span><?php echo $button_confirm?></span></a>
								      </td>
								    </tr>
								</tfoot>
							</table>
						</div>						
					</div>
				</form>
			</div>
		</div>
	</div>

<?php echo $content_bottom; ?></div>
<script type="text/javascript"><!--
$('#checkout_form select[name=\'country_id\']').bind('change', function() {
	$.ajax({
		url: 'index.php?route=checkout/checkout/country&country_id=' + this.value,
		dataType: 'json',
		beforeSend: function() {
			$('#checkout_form select[name=\'country_id\']').after('<span class="wait">&nbsp;<img src="catalog/view/theme/default/image/loading.gif" alt="" /></span>');
		},
		complete: function() {
			$('.wait').remove();
		},			
		success: function(json) {
			if (json['postcode_required'] == '1') {
				$('#shipping-postcode-required').show();
			} else {
				$('#shipping-postcode-required').hide();
			}
			
			html = '<option value="2733"><?php echo $text_select; ?></option>';
			
			if (json['zone'] != undefined) {
				for (i = 0; i < json['zone'].length; i++) {
        			html += '<option value="' + json['zone'][i]['zone_id'] + '"';
	    			
					
	
	    			html += '>' + json['zone'][i]['name'] + '</option>';
				}
			} else {
				html += '<option value="0" selected="selected"><?php echo $text_none; ?></option>';
			}
			
			$('#checkout_form select[name=\'zone_id\']').html(html);
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});
});

$('#checkout_form select[name=\'country_id\']').trigger('change');


	$('#confirm').live('click', function() {
		$.ajax({
			url: 'index.php?route=checkout/checkout',
			type: 'post',
			data: $('#checkout_form').serialize(),
			dataType: 'json',
			beforeSend: function() {
				$('#confirm').bind('click', false);
				$('#confirm').after('<span class="wait">&nbsp;<img src="catalog/view/theme/default/image/loading.gif" alt="" /></span>');
			},
			complete: function() {
				$('#confirm').unbind('click', false);
				$('.wait').remove();
			},
			success: function(json) {
				$('.warning').remove();
				$('.error').remove();

				if (json['redirect']) {
					location = json['redirect'];
				}

				if (json.errors) {
					for (var key in json.errors) {
						$('#checkout .checkout-content :input[name=\'' + key + '\']').
								after('<span class="error" >' + json.errors[key] + '</span>');
					}
					var eTop = $('#checkout').offset().top;
					$('html, body').animate({scrollTop: eTop}, 'slow');
				} else {
					if (json.result = "success") {
						var confirm_btn = $('#button-confirm');
						if (!confirm_btn){
							confirm_btn =$('.payment . buttons input.button')
						}
						confirm_btn.trigger('click');
					}
				}
			}
		});
	});

	$('input[name=payment_method]').live('change', function() {
		$(".checkout-product").mask();
		$.ajax({
			url: 'index.php?route=checkout/checkout/change_payment',
			type: 'post',
			data: 'payment_code='+$("input[name=payment_method]:checked").val(),
			dataType: 'json',
			success: function(json) {
				 if (json.payment){
					 $(".payment").html(json.payment);
				 }
				 $(".checkout-product").unmask();
			}
		})
	});

	$('input[name=shipping_method]').live('change', function() {
		$(".checkout-product").mask();
		$.ajax({
			url: 'index.php?route=checkout/checkout/change_shipping',
			type: 'post',
			data: 'shipping_method='+$("input[name=shipping_method]:checked").val(),
			dataType: 'json',
			success: function(json) {
				 $('#total_data').html(json['totals_data']);
				 $('.payment-content').html(json['payment_data']);
				 $(".checkout-product").unmask();
			}
		})
	});

	//--></script>
<?php echo $footer; ?>
