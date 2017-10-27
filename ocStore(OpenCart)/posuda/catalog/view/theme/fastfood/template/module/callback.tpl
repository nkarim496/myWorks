<div id="callback">
<i class="fa fa-times close" onclick="$('#callback').popup('hide')"></i>
<div class="head box-heading">Заказ звонка</div>
<div class="callback">
<div><input type="text" name="customer_name" value="" placeholder="Ваше имя" /></div>
<div><input type="tel" name="customer_phone" class="customer_phone" value="" placeholder="Контактный телефон" /></div>
<div class="mail"><input type="email" name="customer_mail" value="" placeholder="Ваш e-mail" /></div>
<div class="comment"><textarea name="customer_comment" placeholder="Текст вопроса" /></textarea></div>
<div>
<!-- <div>Я хочу:</div> -->
<div>
<?php if ($show_reason1) { ?>
	<input type="radio" name="customer_reason" value="<?php echo $text_reason1; ?>" id="reason1" checked="checked" onchange="$('.callback .mail, .callback .comment').removeClass('show')" /><label for="reason1"></label><label for="reason1"><?php echo $text_reason1; ?></label><br />
<?php } ?>
<?php if ($show_reason2) { ?>
	<input type="radio" name="customer_reason" value="<?php echo $text_reason2; ?>" id="reason2" onchange="$('.callback .mail, .callback .comment').removeClass('show')" /><label for="reason2"></label><label for="reason2"><?php echo $text_reason2; ?></label><br />
<?php } ?>
<?php if ($show_reason3) { ?>
	<input type="radio" name="customer_reason" value="<?php echo $text_reason3; ?>" id="reason3" onchange="$('.callback .mail, .callback .comment').addClass('show')" /><label for="reason3"></label><label for="reason3"><?php echo $text_reason3; ?></label>
<?php } ?>
</div>
</div>
<div><input type="button" value="Отправить" class="button callback_button" onclick="send_callback();" /></div>
</div>
</div>