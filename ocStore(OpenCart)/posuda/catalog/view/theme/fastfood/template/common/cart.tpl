<div id="cart"><i class="fa fa-shopping-basket"></i><span id="cart-total"><?php echo $items; ?></span></div>
<div id="cart_content">
	<div class="cart_content">
    <?php if ($products || $vouchers) { ?>
	<div class="box-heading"><?php echo $text_your_cart; ?></div>
    <div class="mini-cart-info">
      <table>
        <?php foreach ($products as $product) { ?>
        <tr>
			<td class="image"><?php if ($product['thumb']) { ?><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" /></a><?php } ?></td>
			<td class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
            <div><?php foreach ($product['option'] as $option) { ?> - <small><?php echo $option['name']; ?> <?php echo $option['value']; ?></small><br /><?php } ?></div>
			</td>
			<td class="quantity"><input type="text" value="<?php echo $product['quantity']; ?>" name="quantity[<?php echo $product['cart_id']; ?>]" oninput="cart.update('<?php echo $product['cart_id']; ?>', $(this).val(), '<?php echo $product['minimum']; ?>')" /></td>
			<td class="total"><?php echo $product['total']; ?></td>
			<td class="remove"><i class="fa fa-times" onclick="cart.remove('<?php echo $product['cart_id']; ?>')" ></i></td>
        </tr>
        <?php } ?>
        <?php foreach ($vouchers as $voucher) { ?>
        <tr>
          <td class="image"></td>
          <td class="name"><?php echo $voucher['description']; ?></td>
          <td class="quantity">x&nbsp;1</td>
          <td class="total"><?php echo $voucher['amount']; ?></td>
          <td class="remove"><img src="catalog/view/theme/default/image/remove-small.png" alt="<?php echo $button_remove; ?>" title="<?php echo $button_remove; ?>" onclick="(getURLVar('route') == 'checkout/cart' || getURLVar('route') == 'checkout/checkout') ? location = 'index.php?route=checkout/cart&remove=<?php echo $voucher['key']; ?>' : $('#cart_content').load('index.php?route=common/cart&remove=<?php echo $voucher['key']; ?>' + ' #cart > *');" /></td>
        </tr>
        <?php } ?>
      </table>
    </div>
    <div class="mini-cart-total">
	<div class="continue" onclick="$('#cart, #cart_content').removeClass('show');"><?php echo $text_continue_shopping; ?></div>
		<table>
		<!--
			<?php foreach ($totals as $total) { ?>
			<tr>
				<td class="right"><b><?php echo $total['title']; ?>:</b></td>
				<td class="right"><?php echo $total['text']; ?></td>
			</tr>
			<?php } ?>
		-->
		<tr><td><b><?php echo $text_total; ?></b></td> <td><b><?php echo $total_summ; ?></b></td></tr>
      </table>
    </div>
	<?php if(!isset($show_quick_order)) { ?>
    <div class="checkout">
		<input type="button" value="<?php echo $text_checkout; ?>" class="button" onclick="location='<?php echo $checkout; ?>'" />
	</div>	
	<?php } ?>
	<?php } else { ?>
    <div class="empty"><?php echo $text_empty; ?></div>
    <?php } ?>
	</div>
	<?php if(isset($show_quick_order)) { ?>
	<div class="quick_order">
		<div class="box-heading"><?php echo $text_quick_order; ?></div>
		<div><input type="text" value="<?php if($customer_name) { echo $customer_name; } ?>" placeholder="<?php echo $order_name_text; ?>" name="customer_name" /></div>
		<div><input type="tel" value="<?php if($customer_phone) { echo $customer_phone; } ?>" placeholder="<?php echo $order_phone_text; ?>" name="customer_phone" class="customer_phone" /></div>
	<?php if($order_mail) { ?>
		<div><input type="email" value="<?php if($customer_mail) { echo $customer_mail; } ?>" placeholder="<?php echo $order_mail_text; ?>" name="customer_mail" /></div>
	<?php } ?>
	<?php if($order_delivery) { ?>
		<div><textarea placeholder="<?php echo $order_delivery_text; ?>" name="customer_delivery"></textarea></div>
	<?php } ?>
	<?php if($order_comment) { ?>
		<div><textarea placeholder="<?php echo $order_comment_text; ?>" name="customer_comment"></textarea></div>
	<?php } ?>
		<div class="quick_order_button"><input type="button" value="Отправить заказ" class="button"	<?php if(!isset($quick_order_function)) { ?>onclick="send_quick_order();"<?php } else { ?>onclick="add_quick_order();"<?php } ?>/></div>
	</div>
	<?php } ?>
<script type="text/javascript" src="catalog/view/theme/fastfood/js/jquery.maskedinput.min.js"></script>
<script>
$('body').on('focus', '.customer_phone', function(){
	$(this).mask('<?php echo $quick_order_phone_mask; ?>');
});
</script>
</div>