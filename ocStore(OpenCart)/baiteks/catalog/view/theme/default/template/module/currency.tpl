<?php if (count($currencies) > 1) { ?>

<p><a class="menu_head2"></a><a class="menu_name2"><?php echo $text_currency; ?></a></p>
<div class="currency">
<ul class="menu_body2">

<form action="<?php echo str_replace('&', '&amp;', $action); ?>" method="post" enctype="multipart/form-data" id="currency_form">

  <div id="currency">

<?php foreach ($currencies as $currency) { ?>
  <?php if ($currency['code'] == $currency_code) { ?>
	<li><a href="javascript:;"><b><?php echo $currency['title']; ?></b></a></li>
		<?php } else { ?>
	<li><a href="javascript:;" onclick="$('input[name=\'currency_code\']').attr('value', '<?php echo $currency['code']; ?>'); $('#currency_form').submit();"><?php echo $currency['title']; ?></a></li>
  <?php } ?>
<?php } ?>

    <input type="hidden" name="currency_code" value="" />
    <input type="hidden" name="redirect" value="<?php echo $redirect; ?>" />
  </div>
</form>

</ul>
</div>

<?php } ?>