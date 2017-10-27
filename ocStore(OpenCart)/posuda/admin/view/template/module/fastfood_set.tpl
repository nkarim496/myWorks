<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
<div class="page-header">
<div class="container-fluid">
<div class="pull-right">
<a onclick="$('#fastfood input[name=apply]').val(1); $('#fastfood').submit();" data-toggle="tooltip" class="btn btn-primary"><?php echo $lang['button_apply']; ?></a>
<button type="submit" form="fastfood" data-toggle="tooltip" title="<?php echo $lang['button_save']; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
<a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $lang['button_cancel']; ?>" class="btn btn-danger"><i class="fa fa-reply"></i></a></div>
<h1><?php echo $lang['heading_title']; ?></h1>
    <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
    </ul>
</div>
</div>
<div class="container-fluid">
<?php if ($success) { ?>
<div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?></div>
<?php } ?>
<?php if ($error_warning) { ?>
<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?></div>
<?php } ?>

<style>
#module > * {box-sizing:border-box;}
#module {width:100%; border:solid 1px #ddd;color:#333}
#module .tabrow {overflow:auto;margin:0 0 3px 0;}
#module .tabrow span {display:block;float:left;margin:2px 0 0 3px;padding:3px;font-size:11px;font-weight:700;color:#f00;cursor:pointer;}
#module .button {cursor:pointer}
#module tr:nth-child(2n) {background: #f4f4f4;}
#module tr + tr {border-top:solid 1px #ddd;}
#module tr td {padding:7px 10px 4px}
#module tr td:first-child {width:250px;max-width:250px;padding:7px 10px 6px}
#module tr td b {font-size:1.2em;}
#module tr td span {font-size:0.9em;color:#888}
#module tr td select {display:block;float:left;height:22px;margin:0 3px 0 0;}
#module tr td input[type='text'], #module tr td select {height:25px !important;}
#module tr td input[type='text'], #module tr td textarea {display:block;float:left;width:190px !important; padding:2px 5px}
#module tr td input[type='text'] + input[type='text'] {margin:0 0 0 3px !important; width:250px !important;}
#module tr td textarea + img{margin:0 0 0 3px}
#module tr td textarea {padding:2px 6px;width:200px !important; height:80px;}
#module img {display:block;float:left;border:solid 1px #aaa;border-right:none;background:#ddd;padding:6px 4px;border-radius: 2px 0 0 2px}
#module .header {background: linear-gradient(to bottom, #eeeeee 0%,#dddddd 100%);color:#eb4f1a;text-shadow:0 1px 0 #f5f5f5;padding:6px 10px !important;border-bottom:solid 1px #ccc !important;}
.content input[type='button'] {height:22px;}
#thumb-image img {width:100px;}
#copyright {clear:both;text-align:left;font-size:1.1em;border:solid 1px #ddd;background:#f4f4f4;margin:5px 0 10px; padding:7px 10px 10px;}
</style>

<ul class="nav nav-tabs">
<?php foreach ($stores as $store) { ?>
<li><a href="#tab-<?php echo $store['store_id']; ?>" data-toggle="tab" onclick="$('#tab-<?php echo $store['store_id']; ?> .nav-tabs a').first().trigger('click');"><?php echo $store['name']; ?></a></li>
<?php } ?>
</ul>


<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" class="fastfood_settings" id="fastfood">

<div class="tab-content">

<?php foreach ($stores as $store) { ?>
<div id="tab-<?php echo $store['store_id']; ?>" class="tab-pane">
<?php $store_id = $store['store_id']; ?>


<ul class="nav nav-tabs">
<li><a href="#tab-header-<?php echo $store['store_id']; ?>" data-toggle="tab">Шапка</a></li>
<li><a href="#tab-footer-<?php echo $store['store_id']; ?>" data-toggle="tab">Подвал</a></li>
<li><a href="#tab-home-<?php echo $store['store_id']; ?>" data-toggle="tab">Главная</a></li>
<li><a href="#tab-product-<?php echo $store['store_id']; ?>" data-toggle="tab">Карточка товара</a></li>
<li><a href="#tab-order-<?php echo $store['store_id']; ?>" data-toggle="tab">Быстрый заказ</a></li>
<li><a href="#tab-callback-<?php echo $store['store_id']; ?>" data-toggle="tab">Заказ звонка</a></li>
<li><a href="#tab-contact-<?php echo $store['store_id']; ?>" data-toggle="tab">Контакты</a></li>
<li><a href="#tab-other-<?php echo $store['store_id']; ?>" data-toggle="tab">Стикеры и прочие полезности</a></li>
</ul>

<div class="tab-content">
<div id="tab-header-<?php echo $store['store_id']; ?>" class="tab-pane">
<table id="module" class="list">
	<tr><td colspan="2" class="header"><b>Настройки хедера</b></td></tr>
	<tr>
		<td><?php echo $lang['entry_fixheader']; ?></td>
		<td><input type="checkbox" name="fastfood_settings[<?php echo $store_id; ?>][fixheader]" value="1" <?php if (isset($fastfood_settings[$store_id]['fixheader'])) { echo 'checked="checked"'; } ?> /></td>
	</tr>
	<tr>
		<td>Ссылки в самом верхнем меню:<br /><span>Это то, которое над меню с категориями :)</span></td>
		<td style="padding:7px 10px 0;">
		<?php foreach ($languages as $key => $language) { ?>
		<?php $headerlinks_num = 1; ?>
		<div class="headerlinks_<?php echo $language['language_id']; ?>">
		<?php if (isset($fastfood_settings[$store_id][$language['language_id']]['headerlinks'])) { ?>
        <?php foreach ($fastfood_settings[$store_id][$language['language_id']]['headerlinks'] as $headerlinks) { ?>
		<div class="tabrow">
			<img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" alt=""  />
			<input type="text" name="fastfood_settings[<?php echo $store_id; ?>][<?php echo $language['language_id']; ?>][headerlinks][<?php echo $headerlinks_num; ?>][title]" value="<?php if(isset($headerlinks['title'])) { ?><?php echo $headerlinks['title']; ?><?php } ?>" placeholder="Тут заголовок #<?php echo $headerlinks_num; ?>" />
			<input type="text" name="fastfood_settings[<?php echo $store_id; ?>][<?php echo $language['language_id']; ?>][headerlinks][<?php echo $headerlinks_num; ?>][link]" value="<?php if(isset($headerlinks['link'])) { ?><?php echo $headerlinks['link']; ?><?php } ?>" placeholder="А тут ссылка #<?php echo $headerlinks_num; ?>" />
			<span onclick="$(this).parent().remove()" title="Удалить">Х</span>
		</div>
		<?php $headerlinks_num++; ?>
		<?php } ?>
		<?php } ?>
		</div>
		<div style="margin:0 0 3px"><input type="button" value="Добавить" onclick="addHeaderLinks('<?php echo $store_id; ?>', '<?php echo $language['language_id']; ?>', '<?php echo $language['image']; ?>');" class="button" /></div>
		<div style="height:4px;"></div>
		<?php } ?>		
		</td>
	</tr>
	<tr>
		<td><?php echo $lang['entry_show_search']; ?></td>
		<td><input type="checkbox" name="fastfood_settings[<?php echo $store_id; ?>][show_search]" value="1" <?php if (isset($fastfood_settings[$store_id]['show_search'])) { echo 'checked="checked"'; } ?> /></td>
	</tr>
	<tr>
		<td><?php echo $lang['entry_show_account']; ?></td>
		<td><input type="checkbox" name="fastfood_settings[<?php echo $store_id; ?>][show_account]" value="1" <?php if (isset($fastfood_settings[$store_id]['show_account'])) { echo 'checked="checked"'; } ?> /></td>
	</tr>		
	<tr>
		<td>Дополнительные телефоны:<br /><span>Показываются в блоке, появляющемся при наведении на основной телефон</span></td>
		<td>
		<?php $phones_num = 1; ?>
		<div class="phones">
		<?php if (isset($fastfood_settings[$store_id]['phones'])) { ?>
        <?php foreach ($fastfood_settings[$store_id]['phones'] as $phones) { ?>
		<div class="tabrow">
			<select name="fastfood_settings[<?php echo $store_id; ?>][phones][<?php echo $phones_num; ?>][icon]">
				<option value="fa-phone" <?php if($phones['icon'] == 'fa-phone') { echo 'selected="selected"'; } ?>>Стационарный</option>
				<option value="fa-mobile" <?php if($phones['icon'] == 'fa-mobile') { echo 'selected="selected"'; } ?>>Сотовый</option>
				<option value="fa-skype" <?php if($phones['icon'] == 'fa-skype') { echo 'selected="selected"'; } ?>>Скайп</option>
				<option value="fa-whatsapp" <?php if($phones['icon'] == 'fa-whatsapp') { echo 'selected="selected"'; } ?>>Ватсапп</option>
				<option value="fa-fax" <?php if($phones['icon'] == 'fa-fax') { echo 'selected="selected"'; } ?>>Факс</option>
			</select>
			<input type="text" name="fastfood_settings[<?php echo $store_id; ?>][phones][<?php echo $phones_num; ?>][number]" value="<?php if(isset($phones['number'])) { ?><?php echo $phones['number']; ?><?php } ?>" placeholder="Телефон #<?php echo $phones_num; ?>" />
			<span onclick="$(this).parent().remove()" title="Удалить">Х</span>
		</div>
		<?php $phones_num++; ?>
		<?php } ?>
		<?php } ?>
		</div>
		<div style="margin:0 0 3px"><input type="button" value="Добавить" onclick="addPhones('<?php echo $store_id; ?>');" class="button" /></div>
		<div style="height:4px;"></div>
		</td>
	</tr>
	<tr>
		<td><?php echo $lang['entry_delivery_hours']; ?></td>
		<td>
		<?php foreach ($languages as $language) { ?>
			<img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" alt=""  />
			<div class="tabrow">
				<input type="text" name="fastfood_settings[<?php echo $store_id; ?>][<?php echo $language['language_id']; ?>][delivery_hours]" value="<?php if(isset($fastfood_settings[$store_id][$language['language_id']]['delivery_hours'])) { ?><?php echo $fastfood_settings[$store_id][$language['language_id']]['delivery_hours']; ?><?php } else { ?>24/7 с 10:00 до 23:00<?php } ?>" size="40" />
			</div>
		<?php } ?>	
		</td>
    </tr>
	<tr>
		<td><?php echo $lang['entry_text_menu']; ?></td>
		<td>
		<?php foreach ($languages as $language) { ?>
			<div class="tabrow">
			<img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" alt=""  />
			<input type="text" name="fastfood_settings[<?php echo $store_id; ?>][<?php echo $language['language_id']; ?>][text_menu]" value="<?php if(isset($fastfood_settings[$store_id][$language['language_id']]['text_menu'])) { ?><?php echo $fastfood_settings[$store_id][$language['language_id']]['text_menu']; ?><?php } else { ?>Наше меню<?php } ?>" size="40" />
			</div>
		<?php } ?>	
		</td>
    </tr>
	<tr>
		<td><?php echo $lang['entry_show_gallery']; ?></td>
		<td><input type="checkbox" name="fastfood_settings[<?php echo $store_id; ?>][show_gallery]" value="1" <?php if (isset($fastfood_settings[$store_id]['show_gallery'])) { echo 'checked="checked"'; } ?> /></td>
	</tr>
	<tr>
		<td><?php echo $lang['entry_title_gallery']; ?></td>
		<td>
		<?php foreach ($languages as $language) { ?>
			<div class="tabrow">
			<img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" alt=""  />
			<input type="text" name="fastfood_settings[<?php echo $store_id; ?>][<?php echo $language['language_id']; ?>][title_gallery]" value="<?php if(isset($fastfood_settings[$store_id][$language['language_id']]['title_gallery'])) { ?><?php echo $fastfood_settings[$store_id][$language['language_id']]['title_gallery']; ?><?php } else { ?>Фотогалерея<?php } ?>" size="40" />
			</div>
		<?php } ?>	
		</td>
    </tr>
</table>
</div>

<div id="tab-footer-<?php echo $store['store_id']; ?>" class="tab-pane">
<table id="module" class="list">
	<tr><td colspan="2" class="header"><b>Настройки футера</b></td></tr>
	<tr>
		<td>Ссылки в футере:<br /></td>
		<td style="padding:7px 10px 0;">
		<?php foreach ($languages as $key => $language) { ?>
		<?php $footerlinks_num = 1; ?>
		<div class="footerlinks_<?php echo $language['language_id']; ?>">
		<?php if (isset($fastfood_settings[$store_id][$language['language_id']]['footerlinks'])) { ?>
        <?php foreach ($fastfood_settings[$store_id][$language['language_id']]['footerlinks'] as $footerlinks) { ?>
		<div class="tabrow">
			<img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" alt=""  />
			<input type="text" name="fastfood_settings[<?php echo $store_id; ?>][<?php echo $language['language_id']; ?>][footerlinks][<?php echo $footerlinks_num; ?>][title]" value="<?php if(isset($footerlinks['title'])) { ?><?php echo $footerlinks['title']; ?><?php } ?>" placeholder="Тут заголовок #<?php echo $footerlinks_num; ?>" />
			<input type="text" name="fastfood_settings[<?php echo $store_id; ?>][<?php echo $language['language_id']; ?>][footerlinks][<?php echo $footerlinks_num; ?>][link]" value="<?php if(isset($footerlinks['link'])) { ?><?php echo $footerlinks['link']; ?><?php } ?>" placeholder="А тут ссылка #<?php echo $footerlinks_num; ?>" />
			<span onclick="$(this).parent().remove()" title="Удалить">Х</span>
		</div>
		<?php $footerlinks_num++; ?>
		<?php } ?>
		<?php } ?>
		</div>
		<div style="margin:0 0 3px"><input type="button" value="Добавить" onclick="addFooterLinks('<?php echo $store_id; ?>', '<?php echo $language['language_id']; ?>', '<?php echo $language['image']; ?>');" class="button" /></div>
		<div style="height:4px;"></div>
		<?php } ?>
		</td>
	</tr>
	<tr>
		<td><?php echo $lang['entry_store_hours']; ?></td>
		<td>
		<?php foreach ($languages as $language) { ?>
			<div class="tabrow">
			<img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" alt=""  />
			<input type="text" name="fastfood_settings[<?php echo $store_id; ?>][<?php echo $language['language_id']; ?>][store_hours]" value="<?php if(isset($fastfood_settings[$store_id][$language['language_id']]['store_hours'])) { ?><?php echo $fastfood_settings[$store_id][$language['language_id']]['store_hours']; ?><?php } else { ?>Работаем с 10:00 до 23:00<?php } ?>" size="40" />
			</div>
		<?php } ?>	
		</td>
    </tr>
	<tr>
		<td><?php echo $lang['entry_footer_socials']; ?></td>
		<td>
		<?php $socials_num = 1; ?>
		<div class="socials">
		<?php if (isset($fastfood_settings[$store_id]['socials'])) { ?>
        <?php foreach ($fastfood_settings[$store_id]['socials'] as $socials) { ?>
		<div class="tabrow">
			<select name="fastfood_settings[<?php echo $store_id; ?>][socials][<?php echo $socials_num; ?>][icon]">
				<option value="fa-odnoklassniki" <?php if($socials['icon'] == 'fa-odnoklassniki') { echo 'selected="selected"'; } ?>>Одноклассники</option>
				<option value="fa-vk" <?php if($socials['icon'] == 'fa-vk') { echo 'selected="selected"'; } ?>>ВКонтакте</option>
				<option value="fa-facebook" <?php if($socials['icon'] == 'fa-facebook') { echo 'selected="selected"'; } ?>>Фейсбук</option>
				<option value="fa-twitter" <?php if($socials['icon'] == 'fa-twitter') { echo 'selected="selected"'; } ?>>Твиттер</option>
				<option value="fa-google-plus" <?php if($socials['icon'] == 'fa-google-plus') { echo 'selected="selected"'; } ?>>Гугл+</option>
				<option value="fa-instagram" <?php if($socials['icon'] == 'fa-instagram') { echo 'selected="selected"'; } ?>>Инстаграм</option>
				<option value="fa-youtube" <?php if($socials['icon'] == 'fa-youtube') { echo 'selected="selected"'; } ?>>Ютуб</option>
				<option value="fa-pinterest" <?php if($socials['icon'] == 'fa-pinterest') { echo 'selected="selected"'; } ?>>Пинтерест</option>
			</select>
			<input type="text" name="fastfood_settings[<?php echo $store_id; ?>][socials][<?php echo $socials_num; ?>][link]" value="<?php if(isset($socials['link'])) { ?><?php echo $socials['link']; ?><?php } ?>" placeholder="Ссылка" />
			<span onclick="$(this).parent().remove()" title="Удалить">Х</span>
		</div>
		<?php $socials_num++; ?>
		<?php } ?>
		<?php } ?>
		</div>
		<div style="margin:0 0 3px"><input type="button" value="Добавить" onclick="addSocials('<?php echo $store_id; ?>');" class="button" /></div>
		<div style="height:4px;"></div>
		</td>
	</tr>
	<tr>
		<td><?php echo $lang['entry_footer_payment']; ?></td>
		<td>
			<input type="checkbox" name="fastfood_settings[<?php echo $store_id; ?>][footer_visa]" value="1" id="visa" <?php if (isset($fastfood_settings[$store_id]['footer_visa'])) { echo 'checked="checked"'; } ?> /><label for="#visa">Visa</label>
			<input type="checkbox" name="fastfood_settings[<?php echo $store_id; ?>][footer_master]" value="1" id="master" <?php if (isset($fastfood_settings[$store_id]['footer_master'])) { echo 'checked="checked"'; } ?> /><label for="#master">MasterCard</label>
		</td>
	</tr>
</table>
</div>

<div id="tab-home-<?php echo $store['store_id']; ?>" class="tab-pane">
<table id="module" class="list">
	<tr><td colspan="2" class="header"><b>Настройки главной страницы</b></td></tr>
	<tr>
		<td><?php echo $lang['entry_slideshow_effect']; ?></td>
		<td>
			<select name="fastfood_settings[<?php echo $store_id; ?>][slideshow_effect]">
			<option value="">Стандартный</option>
			<option value="fade" <?php if(isset($fastfood_settings[$store_id]['slideshow_effect']) && $fastfood_settings[$store_id]['slideshow_effect'] == 'fade'){ ?>selected="selected"<?php } ?>>Fade</option>
			<option value="fadeUp" <?php if(isset($fastfood_settings[$store_id]['slideshow_effect']) && $fastfood_settings[$store_id]['slideshow_effect'] == 'fadeUp'){ ?>selected="selected"<?php } ?>>FadeUp</option>
			<option value="backSlide" <?php if(isset($fastfood_settings[$store_id]['slideshow_effect']) && $fastfood_settings[$store_id]['slideshow_effect'] == 'backSlide'){ ?>selected="selected"<?php } ?>>BackSlide</option>
			<option value="goDown" <?php if(isset($fastfood_settings[$store_id]['slideshow_effect']) && $fastfood_settings[$store_id]['slideshow_effect'] == 'goDown'){ ?>selected="selected"<?php } ?>>GoDown</option>
			</select>
		</td>
	</tr>
	<tr>
		<td><?php echo $lang['entry_home_banner']; ?></td>
		<td>
		<?php foreach ($languages as $language) { ?>
			<div class="tabrow">
			<img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" alt=""  />
			<textarea type="text" name="fastfood_settings[<?php echo $store_id; ?>][<?php echo $language['language_id']; ?>][home_banner1]" ><?php if(isset($fastfood_settings[$store_id][$language['language_id']]['home_banner1'])) { ?><?php echo $fastfood_settings[$store_id][$language['language_id']]['home_banner1']; ?><?php } else { ?><i class="fa fa-gift"></i><strong>ИМЕНИННИКАМ СКИДКА 15%</strong>За 3 дня до и после дня рождения.<?php } ?></textarea>
			<img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" alt=""  />
			<textarea type="text" name="fastfood_settings[<?php echo $store_id; ?>][<?php echo $language['language_id']; ?>][home_banner2]" ><?php if(isset($fastfood_settings[$store_id][$language['language_id']]['home_banner2'])) { ?><?php echo $fastfood_settings[$store_id][$language['language_id']]['home_banner2']; ?><?php } else { ?><i class="fa fa-clock-o"></i><strong>СКИДКА 10% НА ОБЕДЫ В ОФИС</strong>По будням, с 10:00 до 16:00<?php } ?></textarea>
			<img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" alt=""  />
			<textarea type="text" name="fastfood_settings[<?php echo $store_id; ?>][<?php echo $language['language_id']; ?>][home_banner3]" ><?php if(isset($fastfood_settings[$store_id][$language['language_id']]['home_banner3'])) { ?><?php echo $fastfood_settings[$store_id][$language['language_id']]['home_banner3']; ?><?php } else { ?><i class="fa fa-coffee"></i><strong>КОФЕ БЕСПЛАТНО</strong>При заказе на сумму от 1000руб<?php } ?></textarea>
			</div>
		<?php } ?>
		</td>
	</tr>
</table>
</div>

<div id="tab-product-<?php echo $store['store_id']; ?>" class="tab-pane">
<table id="module" class="list">
	<tr><td colspan="2" class="header"><b>Настройки карточки товара</b></td></tr>
	<tr>
		<td><?php echo $lang['entry_show_stock']; ?></td>
		<td><input type="checkbox" name="fastfood_settings[<?php echo $store_id; ?>][show_stock]" value="1" <?php if (isset($fastfood_settings[$store_id]['show_stock'])) { echo 'checked="checked"'; } ?> /></td>
	</tr>
	<tr>
		<td><?php echo $lang['entry_show_model']; ?></td>
		<td><input type="checkbox" name="fastfood_settings[<?php echo $store_id; ?>][show_model]" value="1" <?php if (isset($fastfood_settings[$store_id]['show_model'])) { echo 'checked="checked"'; } ?> /></td>
	</tr>
	<tr>
		<td><?php echo $lang['entry_product_banner']; ?></td>
		<td>
		<?php foreach ($languages as $language) { ?>
			<div class="tabrow">
			<img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" alt=""  />
			<textarea type="text" name="fastfood_settings[<?php echo $store_id; ?>][<?php echo $language['language_id']; ?>][product_banner1]" ><?php if(isset($fastfood_settings[$store_id][$language['language_id']]['product_banner1'])) { ?><?php echo $fastfood_settings[$store_id][$language['language_id']]['product_banner1']; ?><?php } else { ?><i class="fa fa-rocket"></i><span>Доставим за 30 минут</span><?php } ?></textarea>
			<img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" alt=""  />
			<textarea type="text" name="fastfood_settings[<?php echo $store_id; ?>][<?php echo $language['language_id']; ?>][product_banner2]" ><?php if(isset($fastfood_settings[$store_id][$language['language_id']]['product_banner2'])) { ?><?php echo $fastfood_settings[$store_id][$language['language_id']]['product_banner2']; ?><?php } else { ?><i class="fa fa-rub"></i><span>Любой вариант оплаты</span><?php } ?></textarea>
			<img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" alt=""  />
			<textarea type="text" name="fastfood_settings[<?php echo $store_id; ?>][<?php echo $language['language_id']; ?>][product_banner3]" ><?php if(isset($fastfood_settings[$store_id][$language['language_id']]['product_banner3'])) { ?><?php echo $fastfood_settings[$store_id][$language['language_id']]['product_banner3']; ?><?php } else { ?><i class="fa fa-beer"></i><span>Напиток в подарок!</span><?php } ?></textarea>
			</div>
		<?php } ?>
		</td>
	</tr>
	<tr>
		<td><?php echo $lang['entry_title_related']; ?></td>
		<td>
		<?php foreach ($languages as $language) { ?>
			<div class="tabrow">
			<img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" alt=""  />
			<input type="text" name="fastfood_settings[<?php echo $store_id; ?>][<?php echo $language['language_id']; ?>][title_related]" value="<?php if(isset($fastfood_settings[$store_id][$language['language_id']]['title_related'])) { ?><?php echo $fastfood_settings[$store_id][$language['language_id']]['title_related']; ?><?php } else { ?>Рекомендуем посмотреть<?php } ?>" size="40" />
			</div>
		<?php } ?>	
		</td>
    </tr>
	<tr>
		<td><?php echo $lang['entry_show_similar']; ?></td>
		<td><input type="checkbox" name="fastfood_settings[<?php echo $store_id; ?>][show_similar]" value="1" <?php if (isset($fastfood_settings[$store_id]['show_similar'])) { echo 'checked="checked"'; } ?> /></td>
	</tr>
	<tr>
		<td><?php echo $lang['entry_title_similar']; ?></td>
		<td>
		<?php foreach ($languages as $language) { ?>
			<div class="tabrow">
			<img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" alt=""  />
			<input type="text" name="fastfood_settings[<?php echo $store_id; ?>][<?php echo $language['language_id']; ?>][title_similar]" value="<?php if(isset($fastfood_settings[$store_id][$language['language_id']]['title_similar'])) { ?><?php echo $fastfood_settings[$store_id][$language['language_id']]['title_similar']; ?><?php } else { ?>Похожие товары<?php } ?>" size="40" />
			</div>
		<?php } ?>	
		</td>
    </tr>
	<tr>
		<td><?php echo $lang['entry_product_similar']; ?></td>
		<td>
			<input type="text" name="fastfood_settings[<?php echo $store_id; ?>][product_similar]" value="<?php if(isset($fastfood_settings[$store_id]['product_similar'])) { ?><?php echo $fastfood_settings[$store_id]['product_similar']; ?><?php } else { ?>4<?php } ?>" size="4" style="width:30px !important; text-align:center;" />
		</td>
    </tr>
</table>
</div>

<div id="tab-order-<?php echo $store['store_id']; ?>" class="tab-pane">
<table id="module" class="list">
	<tr><td colspan="2" class="header"><b>Настройки модуля быстрого заказа</b></td></tr>
	<tr>
		<td><?php echo $lang['entry_show_quick_order']; ?></td>
		<td><input type="checkbox" name="fastfood_settings[<?php echo $store_id; ?>][show_quick_order]" value="1" <?php if (isset($fastfood_settings[$store_id]['show_quick_order'])) { echo 'checked="checked"'; } ?> /></td>
	</tr>
	<tr>
		<td><?php echo $lang['entry_quick_order_function']; ?></td>
		<td><input type="checkbox" name="fastfood_settings[<?php echo $store_id; ?>][quick_order_function]" value="1" <?php if (isset($fastfood_settings[$store_id]['quick_order_function'])) { echo 'checked="checked"'; } ?> /></td>
	</tr>
	<tr>
		<td><?php echo $lang['entry_quick_order_phone_mask']; ?></td>
		<td><input type="text" name="fastfood_settings[<?php echo $store_id; ?>][quick_order_phone_mask]" value="<?php if(isset($fastfood_settings[$store_id]['quick_order_phone_mask'])) { ?><?php echo $fastfood_settings[$store_id]['quick_order_phone_mask']; ?><?php } else { ?>+7 (999) 999-99-99<?php } ?>" /></td>
	</tr>
	<tr>
		<td><?php echo $lang['entry_quick_order_name_text']; ?></td>
		<td>
		<?php foreach ($languages as $language) { ?>
			<div class="tabrow">
			<img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" alt=""  />
			<input type="text" name="fastfood_settings[<?php echo $store_id; ?>][<?php echo $language['language_id']; ?>][quick_order_name_text]" value="<?php if(isset($fastfood_settings[$store_id][$language['language_id']]['quick_order_name_text'])) { ?><?php echo $fastfood_settings[$store_id][$language['language_id']]['quick_order_name_text']; ?><?php } else { ?>Ваше имя<?php } ?>" />
			</div>
		<?php } ?>	
		</td>
	</tr>
	<tr>
		<td><?php echo $lang['entry_quick_order_phone_text']; ?></td>
		<td>
		<?php foreach ($languages as $language) { ?>
			<div class="tabrow">
			<img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" alt=""  />
			<input type="text" name="fastfood_settings[<?php echo $store_id; ?>][<?php echo $language['language_id']; ?>][quick_order_phone_text]" value="<?php if(isset($fastfood_settings[$store_id][$language['language_id']]['quick_order_phone_text'])) { ?><?php echo $fastfood_settings[$store_id][$language['language_id']]['quick_order_phone_text']; ?><?php } else { ?>Контактный телефон<?php } ?>" />
			</div>
		<?php } ?>
		</td>
	</tr>
	<tr>
		<td><?php echo $lang['entry_quick_order_mail']; ?></td>
		<td><input type="checkbox" name="fastfood_settings[<?php echo $store_id; ?>][quick_order_mail]" value="1" <?php if (isset($fastfood_settings[$store_id]['quick_order_mail'])) { echo 'checked="checked"'; } ?> /></td>
	</tr>
	<tr>
		<td><?php echo $lang['entry_quick_order_mail_text']; ?></td>
		<td>
		<?php foreach ($languages as $language) { ?>
			<div class="tabrow">
			<img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" alt=""  />
			<input type="text" name="fastfood_settings[<?php echo $store_id; ?>][<?php echo $language['language_id']; ?>][quick_order_mail_text]" value="<?php if(isset($fastfood_settings[$store_id][$language['language_id']]['quick_order_mail_text'])) { ?><?php echo $fastfood_settings[$store_id][$language['language_id']]['quick_order_mail_text']; ?><?php } else { ?>Ваш e-mail<?php } ?>" />
			</div>
		<?php } ?>
		</td>
	</tr>
	<tr>
		<td><?php echo $lang['entry_quick_order_delivery']; ?></td>
		<td><input type="checkbox" name="fastfood_settings[<?php echo $store_id; ?>][quick_order_delivery]" value="1" <?php if (isset($fastfood_settings[$store_id]['quick_order_delivery'])) { echo 'checked="checked"'; } ?> /></td>
	</tr>
	<tr>
		<td><?php echo $lang['entry_quick_order_delivery_text']; ?></td>
		<td>
		<?php foreach ($languages as $language) { ?>
			<div class="tabrow">
			<img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" alt=""  />
			<input type="text" name="fastfood_settings[<?php echo $store_id; ?>][<?php echo $language['language_id']; ?>][quick_order_delivery_text]" value="<?php if(isset($fastfood_settings[$store_id][$language['language_id']]['quick_order_delivery_text'])) { ?><?php echo $fastfood_settings[$store_id][$language['language_id']]['quick_order_delivery_text']; ?><?php } else { ?>Адрес доставки<?php } ?>" />
			</div>
		<?php } ?>
		</td>
	</tr>
	<tr>
		<td><?php echo $lang['entry_quick_order_comment']; ?></td>
		<td><input type="checkbox" name="fastfood_settings[<?php echo $store_id; ?>][quick_order_comment]" value="1" <?php if (isset($fastfood_settings[$store_id]['quick_order_comment'])) { echo 'checked="checked"'; } ?> /></td>
	</tr>
	<tr>
		<td><?php echo $lang['entry_quick_order_comment_text']; ?></td>
		<td>
		<?php foreach ($languages as $language) { ?>
			<div class="tabrow">
			<img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" alt=""  />
			<input type="text" name="fastfood_settings[<?php echo $store_id; ?>][<?php echo $language['language_id']; ?>][quick_order_comment_text]" value="<?php if(isset($fastfood_settings[$store_id][$language['language_id']]['quick_order_comment_text'])) { ?><?php echo $fastfood_settings[$store_id][$language['language_id']]['quick_order_comment_text']; ?><?php } else { ?>Комментарий<?php } ?>" />
			</div>
		<?php } ?>
		</td>
	</tr>
</table>
</div>

<div id="tab-callback-<?php echo $store['store_id']; ?>" class="tab-pane">
<table id="module" class="list">
	<tr><td colspan="2" class="header"><b>Настройки модуля заказа звонка</b></td></tr>
	<tr>
		<td><?php echo $lang['entry_show_callback']; ?></td>
		<td><input type="checkbox" name="fastfood_settings[<?php echo $store_id; ?>][show_callback]" value="1" <?php if (isset($fastfood_settings[$store_id]['show_callback'])) { echo 'checked="checked"'; } ?> /></td>
	</tr>
	<tr>
		<td><?php echo $lang['entry_callback_phone_mask']; ?></td>
		<td><input type="text" name="fastfood_settings[<?php echo $store_id; ?>][callback_phone_mask]" value="<?php if(isset($fastfood_settings[$store_id]['callback_phone_mask'])) { ?><?php echo $fastfood_settings[$store_id]['callback_phone_mask']; ?><?php } else { ?>+7 (999) 999-99-99<?php } ?>" /></td>
	</tr>
	<tr>
		<td><?php echo $lang['entry_show_reason1']; ?></td>
		<td><input type="checkbox" name="fastfood_settings[<?php echo $store_id; ?>][show_reason1]" value="1" <?php if (isset($fastfood_settings[$store_id]['show_reason1'])) { echo 'checked="checked"'; } ?> /></td>
	</tr>
	<tr>
		<td><?php echo $lang['entry_text_reason1']; ?></td>
		<td>
		<?php foreach ($languages as $language) { ?>
			<div class="tabrow">
			<img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" alt=""  />
			<input type="text" name="fastfood_settings[<?php echo $store_id; ?>][<?php echo $language['language_id']; ?>][text_reason1]" value="<?php if(isset($fastfood_settings[$store_id][$language['language_id']]['text_reason1'])) { ?><?php echo $fastfood_settings[$store_id][$language['language_id']]['text_reason1']; ?><?php } else { ?>Сделать заказ<?php } ?>" size="40" />
			</div>
		<?php } ?>
		</td>	
	</tr>
	<tr>
		<td><?php echo $lang['entry_show_reason2']; ?></td>
		<td><input type="checkbox" name="fastfood_settings[<?php echo $store_id; ?>][show_reason2]" value="1" <?php if (isset($fastfood_settings[$store_id]['show_reason2'])) { echo 'checked="checked"'; } ?> /></td>
	</tr>
	<tr>
		<td><?php echo $lang['entry_text_reason2']; ?></td>
		<td>
		<?php foreach ($languages as $language) { ?>
			<div class="tabrow">
			<img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" alt=""  />
			<input type="text" name="fastfood_settings[<?php echo $store_id; ?>][<?php echo $language['language_id']; ?>][text_reason2]" value="<?php if(isset($fastfood_settings[$store_id][$language['language_id']]['text_reason2'])) { ?><?php echo $fastfood_settings[$store_id][$language['language_id']]['text_reason2']; ?><?php } else { ?>Отменить заказ<?php } ?>" size="40" />
			</div>
		<?php } ?>
		</td>	
	</tr>
	<tr>
		<td><?php echo $lang['entry_show_reason3']; ?></td>
		<td><input type="checkbox" name="fastfood_settings[<?php echo $store_id; ?>][show_reason3]" value="1" <?php if (isset($fastfood_settings[$store_id]['show_reason3'])) { echo 'checked="checked"'; } ?> /></td>
	</tr>
	<tr>
		<td><?php echo $lang['entry_text_reason3']; ?></td>
		<td>
		<?php foreach ($languages as $language) { ?>
			<div class="tabrow">
			<img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" alt=""  />
			<input type="text" name="fastfood_settings[<?php echo $store_id; ?>][<?php echo $language['language_id']; ?>][text_reason3]" value="<?php if(isset($fastfood_settings[$store_id][$language['language_id']]['text_reason3'])) { ?><?php echo $fastfood_settings[$store_id][$language['language_id']]['text_reason3']; ?><?php } else { ?>Задать вопрос<?php } ?>" size="40" />
			</div>
		<?php } ?>
		</td>	
	</tr>
</table>
</div>

<div id="tab-contact-<?php echo $store['store_id']; ?>" class="tab-pane">
<table id="module" class="list">
	<tr>
		<td colspan="2" class="header"><b>Карта на странице контактов</b></td>
	</tr>
	<tr>
		<td><?php echo $lang['entry_maps']; ?></td>
		<td><textarea type="text" name="fastfood_settings[<?php echo $store_id; ?>][map]" cols="50" rows="6"><?php if(isset($fastfood_settings[$store_id]['map'])) { ?><?php echo $fastfood_settings[$store_id]['map']; ?><?php } else { ?><script type="text/javascript" charset="utf-8" src="https://api-maps.yandex.ru/services/constructor/1.0/js/?sid=0-UEqyhQjzOUNY4v2mkEt21fwIDcbzO3&width=600&height=450"></script><?php } ?></textarea></td>
	</tr>
</table>
</div>

<div id="tab-other-<?php echo $store['store_id']; ?>" class="tab-pane">
<table id="module" class="list">
	<tr>
		<td colspan="2" class="header"><b>Прочие настройки</b></td>
	</tr>
	<tr>
		<td><?php echo $lang['entry_enable_bootstrap']; ?></td>
		<td><input type="checkbox" name="fastfood_settings[<?php echo $store_id; ?>][enable_bootstrap]" value="1" <?php if (isset($fastfood_settings[$store_id]['enable_bootstrap'])) { echo 'checked="checked"'; } ?> /></td>
	</tr>
	<tr>
		<td><?php echo $lang['entry_custom_style']; ?></td>
		<td><input type="text" name="fastfood_settings[<?php echo $store_id; ?>][custom_style]" value="<?php if(isset($fastfood_settings[$store_id]['custom_style'])) { ?><?php echo $fastfood_settings[$store_id]['custom_style']; ?><?php } ?>" placeholder="Пример: my_mega_style.css"/></td>
	</tr>
	<tr>
		<td><?php echo $lang['entry_show_cat_items']; ?></td>
		<td><input type="text" name="fastfood_settings[<?php echo $store_id; ?>][show_cat_items]" value="<?php if(isset($fastfood_settings[$store_id]['show_cat_items'])) { ?><?php echo $fastfood_settings[$store_id]['show_cat_items']; ?><?php } else { ?>4<?php } ?>" style="width:30px !important; text-align:center;" /></td>
	</tr>
	<tr>
		<td><?php echo $lang['entry_show_quantity']; ?></td>
		<td><input type="checkbox" name="fastfood_settings[<?php echo $store_id; ?>][show_quantity]" value="1" <?php if (isset($fastfood_settings[$store_id]['show_quantity'])) { echo 'checked="checked"'; } ?> /></td>
	</tr>
	<tr>
		<td><?php echo $lang['entry_show_quickview']; ?></td>
		<td><input type="checkbox" name="fastfood_settings[<?php echo $store_id; ?>][show_quickview]" value="1" <?php if (isset($fastfood_settings[$store_id]['show_quickview'])) { echo 'checked="checked"'; } ?> /></td>
	</tr>
	<tr><td colspan="2" class="header"><b>Настройки опций в категориях, модулях и т.д.</b></td></tr>
	<tr>
		<td>Показывать блок с опциями товара в модулях, категориях и пр.?</td>
		<td><input type="checkbox" name="fastfood_settings[<?php echo $store_id; ?>][show_options]" value="1" <?php if (isset($fastfood_settings[$store_id]['show_options'])) { echo 'checked="checked"'; } ?> /></td>
	</tr>
	<tr>
		<td>Показывать только обязательные опции?</td>
		<td><input type="checkbox" name="fastfood_settings[<?php echo $store_id; ?>][show_options_req]" value="1" <?php if (isset($fastfood_settings[$store_id]['show_options_req'])) { echo 'checked="checked"'; } ?> /></td>
	</tr>
	<tr>
		<td>Количество опций для показа</td>
		<td><input type="text" name="fastfood_settings[<?php echo $store_id; ?>][show_options_item]" value="<?php if(isset($fastfood_settings[$store_id]['show_options_item'])) { ?><?php echo $fastfood_settings[$store_id]['show_options_item']; ?><?php } else { ?>3<?php } ?>" size="4" style="width:30px !important; text-align:center;" /></td>
	</tr>
	<tr>
		<td colspan="2" class="header"><b>Стикеры</b></td>
	</tr>
	<tr>
		<td><?php echo $lang['entry_show_sticker_special']; ?></td>
		<td><input type="checkbox" name="fastfood_settings[<?php echo $store_id; ?>][sticker_special]" value="1" <?php if (isset($fastfood_settings[$store_id]['sticker_special'])) { echo 'checked="checked"'; } ?> /></td>
	</tr>
	<tr>
		<td><?php echo $lang['entry_show_sticker_new']; ?></td>
		<td><input type="checkbox" name="fastfood_settings[<?php echo $store_id; ?>][sticker_new]" value="1" <?php if (isset($fastfood_settings[$store_id]['sticker_new'])) { echo 'checked="checked"'; } ?> /></td>
	</tr>
	<tr>
		<td><?php echo $lang['entry_sticker_new_date']; ?></td>
		<td><input type="text" name="fastfood_settings[<?php echo $store_id; ?>][sticker_new_date]" value="<?php if(isset($fastfood_settings[$store_id]['sticker_new_date'])) { ?><?php echo $fastfood_settings[$store_id]['sticker_new_date']; ?><?php } else { ?>30<?php } ?>" style="width:30px !important; text-align:center;" /></td>
	</tr>
	<tr>
		<td><?php echo $lang['entry_sticker_new_text']; ?></td>
		<td>
		<?php foreach ($languages as $language) { ?>
		<div class="tabrow">
		<img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" alt=""  />
		<input type="text" name="fastfood_settings[<?php echo $store_id; ?>][<?php echo $language['language_id']; ?>][sticker_new_text]" value="<?php if(isset($fastfood_settings[$store_id][$language['language_id']]['sticker_new_text'])) { ?><?php echo $fastfood_settings[$store_id][$language['language_id']]['sticker_new_text']; ?><?php } else { ?>Новинка<?php } ?>" />
		</div>
		<?php } ?>
		</td>		
	</tr>
	<tr>
		<td><?php echo $lang['entry_show_sticker_bestseller']; ?></td>
		<td><input type="checkbox" name="fastfood_settings[<?php echo $store_id; ?>][sticker_bestseller]" value="1" <?php if (isset($fastfood_settings[$store_id]['sticker_bestseller'])) { echo 'checked="checked"'; } ?> /></td>
	</tr>
	<tr>
		<td><?php echo $lang['entry_sticker_bestseller_item']; ?></td>
		<td><input type="text" name="fastfood_settings[<?php echo $store_id; ?>][sticker_bestseller_item]" value="<?php if(isset($fastfood_settings[$store_id]['sticker_bestseller_item'])) { ?><?php echo $fastfood_settings[$store_id]['sticker_bestseller_item']; ?><?php } else { ?>5<?php } ?>" style="width:30px !important; text-align:center;" /></td>
	</tr>
	<tr>
		<td><?php echo $lang['entry_sticker_bestseller_text']; ?></td>
		<td>
		<?php foreach ($languages as $language) { ?>
		<div class="tabrow">
		<img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" alt=""  />
		<input type="text" name="fastfood_settings[<?php echo $store_id; ?>][<?php echo $language['language_id']; ?>][sticker_bestseller_text]" value="<?php if(isset($fastfood_settings[$store_id][$language['language_id']]['sticker_bestseller_text'])) { ?><?php echo $fastfood_settings[$store_id][$language['language_id']]['sticker_bestseller_text']; ?><?php } else { ?>Лидер продаж<?php } ?>" />
		</div>
		<?php } ?>	
		</td>
	</tr>
	<tr>
		<td colspan="2" class="header"><b>Фоновое изображение</b></td>
	</tr>
	<tr>
		<td><?php echo $lang['entry_background_image']; ?></td>
		<td>
		<a href="" id="thumb-image" data-toggle="image" class="img-thumbnail"><img src="<?php if($fastfood_settings[$store_id]['background_image']) { echo HTTPS_CATALOG.'image/'.$fastfood_settings[$store_id]['background_image']; } else { echo $placeholder; } ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a>
		<input type="hidden" name="fastfood_settings[<?php echo $store_id; ?>][background_image]" value="<?php if(isset($fastfood_settings[$store_id]['background_image'])) { echo $fastfood_settings[$store_id]['background_image']; } else { echo $placeholder; } ?>" id="image" />
		</td>
	</tr>
</table>
</div>

</div>
</div>
<?php } ?>
<input type="hidden" name="apply" value="0" />
</div>
</form>
<div id="copyright"><?php echo $lang['text_copyright']; ?></div>
</div>

<script type="text/javascript"><!--
$('.nav-tabs a:first').tab('show');
$('#tab-0 .nav-tabs a:first').tab('show');
//--></script> 
 
<script>
	function addHeaderLinks(store_id, lang_id, lang_img) {
		var headerlinks_num = $('#tab-header-'+store_id+' .headerlinks_'+lang_id+' .tabrow').size()+1;
		if (headerlinks_num > 4) {
			if (!confirm('Внимание! Большое количество ссылок может некорректно отображаться в данном меню.')) {
				return false;
			}
		}
		html  = '';
		html += '<div class="tabrow">';
		html += '<img src="view/image/flags/'+lang_img+'" title="" alt=""  />';
		html += '<input type="text" name="fastfood_settings['+store_id+']['+lang_id+'][headerlinks]['+headerlinks_num+'][title]" value="" placeholder="Тут заголовок #'+headerlinks_num+'" />';
		html += '<input type="text" name="fastfood_settings['+store_id+']['+lang_id+'][headerlinks]['+headerlinks_num+'][link]" value="" placeholder="А тут ссылка #'+headerlinks_num+'" />';
		html += '<span onclick="$(this).parent().remove()" title="Удалить">Х</span>';
		html += '</div>';
			
		$('#tab-header-'+store_id+' .headerlinks_'+lang_id).append(html);
	}

	function addPhones(store_id) {
		var phones_num = $('#tab-header-'+store_id+' .phones .tabrow').size()+1;
		if (phones_num > 8) {
			if (!confirm('Внимание! Большое количество номеров телефонов может некорректно отображаться в данном меню.')) {
				return false;
			}
		}
		html  = '';
		html += '<div class="tabrow">';
		html += '<select name="fastfood_settings['+store_id+'][phones]['+phones_num+'][icon]">';
		html += '<option value="fa-phone" selected="selected">Стационарный</option>';
		html += '<option value="fa-mobile">Сотовый</option>';
		html += '<option value="fa-skype">Скайп</option>';
		html += '<option value="fa-whatsapp">Ватсапп</option>';
		html += '<option value="fa-fax">Факс</option>';
		html += '</select>';
		html += '<input type="text" name="fastfood_settings['+store_id+'][phones]['+phones_num+'][number]" value="" placeholder="Телефон #'+phones_num+'" />';
		html += '<span onclick="$(this).parent().remove()" title="Удалить">Х</span>';
		html += '</div>';
			
		$('#tab-header-'+store_id+' .phones').append(html);
	}

	function addFooterLinks(store_id, lang_id, lang_img) {
		var footerlinks_num = $('#tab-footer-'+store_id+' .footerlinks_'+lang_id+' .tabrow').size()+1;
		if (footerlinks_num > 6) {
			if (!confirm('Внимание! Большое количество ссылок может некорректно отображаться в данном меню.')) {
				return false;
			}
		}
		html  = '';
		html += '<div class="tabrow">';
		html += '<img src="view/image/flags/'+lang_img+'" title="" alt=""  />';
		html += '<input type="text" name="fastfood_settings['+store_id+']['+lang_id+'][footerlinks]['+footerlinks_num+'][title]" value="" placeholder="Тут заголовок #'+footerlinks_num+'" />';
		html += '<input type="text" name="fastfood_settings['+store_id+']['+lang_id+'][footerlinks]['+footerlinks_num+'][link]" value="" placeholder="А тут ссылка #'+footerlinks_num+'" />';
		html += '<span onclick="$(this).parent().remove()" title="Удалить">Х</span>';
		html += '</div>';
			
		$('#tab-footer-'+store_id+' .footerlinks_'+lang_id).append(html);
	}

	function addSocials(store_id) {
		var socials_num = $('#tab-footer-'+store_id+' .socials .tabrow').size()+1;
		if (socials_num > 8) {
			if (!confirm('Внимание! Большое количество иконок соцсетей может некорректно отображаться в данном меню.')) {
				return false;
			}
		}
		html  = '';
		html += '<div class="tabrow">';
		html += '<select name="fastfood_settings['+store_id+'][socials]['+socials_num+'][icon]">';
		html += '<option value="fa-odnoklassniki" selected="selected">Одноклассники</option>';
		html += '<option value="fa-vk">ВКонтакте</option>';
		html += '<option value="fa-facebook">Фейсбук</option>';
		html += '<option value="fa-twitter">Твиттер</option>';
		html += '<option value="fa-google-plus">Гугл+</option>';
		html += '<option value="fa-instagram">Инстаграм</option>';
		html += '<option value="fa-youtube">Ютуб</option>';
		html += '<option value="fa-pinterest">Пинтерест</option>';
		html += '</select>';
		html += '<input type="text" name="fastfood_settings['+store_id+'][socials]['+socials_num+'][link]" value="" placeholder="Ссылка" />';
		html += '<span onclick="$(this).parent().remove()" title="Удалить">Х</span>';
		html += '</div>';
			
		$('#tab-footer-'+store_id+' .socials').append(html);
	}
</script>
<?php echo $footer; ?>