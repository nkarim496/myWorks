<?php if($payment_methods) { ?>
<p><?php echo $text_payment_method; ?></p>
<table class="radio">
	<?php foreach($payment_methods as $payment_method) { ?>
	<tr class="highlight">
		<td><?php if($payment_method['code'] == $payment_code || !$payment_code) { ?>
			<?php $code = $payment_method['code']; ?>
			<input type="radio" name="payment_method" value="<?php echo $payment_method['code']; ?>" id="<?php echo $payment_method['code']; ?>"
				   checked="checked"/>
			<?php } else { ?>
			<input type="radio" name="payment_method" value="<?php echo $payment_method['code']; ?>" id="<?php echo $payment_method['code']; ?>"/>
			<?php } ?></td>
		<td><label for="<?php echo $payment_method['code']; ?>"><?php echo $payment_method['title']; ?></label></td>
	</tr>
	<?php } ?>
</table>
<br/>
<?php } ?>
<div class="payment">
	<?php echo $payment?>
</div>