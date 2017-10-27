<div class="form-group">
  <?php if (substr($route, 0, 9) == 'checkout/') { ?>
  <label class="control-label" for="input-payment-captcha"><?php echo $entry_captcha; ?></label>
  <input type="text" name="captcha" id="input-payment-captcha" class="form-control" />
  <img src="index.php?route=captcha/basic_captcha/captcha" alt="" />
<?php } else { ?>
	<div>
    <b><?php echo $entry_captcha; ?></b>
    <input type="text" name="captcha" id="input-captcha" value="" />
    <img src="index.php?route=captcha/basic_captcha/captcha" alt="" id="captcha" />
	<?php if ($error_captcha) { ?>
		<div class="text-danger"><?php echo $error_captcha; ?></div>
    <?php } ?>
	</div>
<?php } ?>
</div>