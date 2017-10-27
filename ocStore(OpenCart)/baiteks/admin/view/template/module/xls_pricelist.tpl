<?php echo $header; ?>
<style>
#sortable{
	padding:0;
}

#sortable li{
	list-style:none;
}
</style>
<div id="content">
<div class="breadcrumb">
  <?php foreach ($breadcrumbs as $breadcrumb) { ?>
  <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
  <?php } ?>
</div>
<?php if ($error_warning) { ?>
<div class="warning"><?php echo $error_warning; ?></div>
<?php } ?>
<div class="box">
  <div class="heading">
    <h1><img src="view/image/module.png" alt="" /> <?php echo $heading_title; ?></h1>
    <div class="buttons"><a onclick="$('#form').attr('target', '_self'); $('#form').attr('action', '<?php echo $action; ?>'); $('#form').submit();" class="button"><?php echo $button_save; ?></a><a onclick="location = '<?php echo $cancel; ?>';" class="button"><?php echo $button_cancel; ?></a></div>
  </div>
  <div class="content">
	<div id="tabs" class="htabs"><a href="#tab-general"><?php echo $tab_general; ?></a><a href="#tab-data"><?php echo $tab_data; ?></a><a href="#tab-option"><?php echo $tab_option; ?></a><a href="#tab-image"><?php echo $tab_image; ?></a><a href="#tab-design"><?php echo $tab_design; ?></a></div>
    <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
		<div id="tab-general">
		  
			<table class="form">
			
			
			<tr>
				  <td><span class="required">*</span><?php echo $entry_store; ?></td>
				  <td><div class="scrollbox">
					  <?php $class = 'even'; ?>
					  <div class="<?php echo $class; ?>">
						<?php if (in_array(0, $xls_pricelist_store)) { ?>
						<input type="checkbox" name="xls_pricelist_store[]" value="0" checked="checked" />
						<?php echo $text_default; ?>
						<?php } else { ?>
						<input type="checkbox" name="xls_pricelist_store[]" value="0" />
						<?php echo $text_default; ?>
						<?php } ?>
					  </div>
					  <?php foreach ($stores as $store) { ?>
					  <?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
					  <div class="<?php echo $class; ?>">
						<?php if (in_array($store['store_id'], $xls_pricelist_store)) { ?>
						<input type="checkbox" name="xls_pricelist_store[]" value="<?php echo $store['store_id']; ?>" checked="checked" />
						<?php echo $store['name']; ?>
						<?php } else { ?>
						<input type="checkbox" name="xls_pricelist_store[]" value="<?php echo $store['store_id']; ?>" />
						<?php echo $store['name']; ?>
						<?php } ?>
					  </div>
					  <?php } ?>
					</div>
					<?php if (isset($error_xls_pricelist_store)) { ?>
					  <span class="error"><?php echo $error_xls_pricelist_store; ?></span>
					  <?php } ?>
					</td>
				</tr>
			<tr>
				<td><span class="required">*</span> <?php echo $entry_category; ?></td>
				<td>
					<div class="scrollbox">
					<?php $class = 'odd'; ?>
					<?php foreach ($categories as $category) { ?>
					<?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
					<div class="<?php echo $class; ?>">
					  <?php if (in_array($category['category_id'], $xls_pricelist_category)) { ?>
					  <input class="xls_pricelist_category" type="checkbox" name="xls_pricelist_category[]" value="<?php echo $category['category_id']; ?>" checked="checked" />
					  <?php echo $category['name']; ?>
					  <?php } else { ?>
					  <input class="xls_pricelist_category" type="checkbox" name="xls_pricelist_category[]" value="<?php echo $category['category_id']; ?>" />
					  <?php echo $category['name']; ?>
					  <?php } ?>
					</div>
					<?php } ?>
				  </div>
				  <br>
				  <!--
				  <a href="#" onclick="$('.scrollbox .xls_pricelist_category').prop('checked', !($('.scrollbox .xls_pricelist_category').is(':checked'))); return false;"><?php echo $text_select_all; ?></a> 
				  -->
				  <?php if (isset($error_xls_pricelist_category)) { ?>
					  <span class="error"><?php echo $error_xls_pricelist_category; ?></span>
					  <?php } ?>
				</td>
			</tr>
			<tr>
				<td><?php echo $entry_nodubles; ?></td>
				<td>
				<select name="xls_pricelist_nodubles">
					<?php if($xls_pricelist_nodubles){ ?>
					<option value="0"><?php echo $text_no; ?></option>
					<option value="1" selected="selected"><?php echo $text_yes; ?></option>
					<?php }else{ ?>
					<option value="0" selected="selected"><?php echo $text_no; ?></option>
					<option value="1"><?php echo $text_yes; ?></option>
					<?php } ?>
				</select>
				</td>
			</tr>
			<tr>
				<td><?php echo $entry_sort_order; ?></td>
				<td>
				<select name="xls_pricelist_sort_order">
					<?php foreach ($sorts as $sorts) { ?>
						<?php if ($sorts['value'] == $xls_pricelist_sort_order) { ?>
						<option value="<?php echo $sorts['value']; ?>" selected="selected"><?php echo $sorts['text']; ?></option>
						<?php } else { ?>
						<option value="<?php echo $sorts['value']; ?>"><?php echo $sorts['text']; ?></option>
						<?php } ?>
					<?php } ?>
				</select>
				</td>
			</tr>
			
			
			<tr>
				<td><span class="required">*</span> <?php echo $entry_customer_group; ?></td>
				<td>
					<div class="scrollbox">
					<?php $class = 'odd'; ?>
					<?php foreach ($customer_groups as $customer_group) { ?>
					<?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
					<div class="<?php echo $class; ?>">
					  <?php if (in_array($customer_group['customer_group_id'], $xls_pricelist_customer_group)) { ?>
					  <input class="xls_pricelist_customer_group" type="checkbox" name="xls_pricelist_customer_group[]" value="<?php echo $customer_group['customer_group_id']; ?>" checked="checked" />
					  <?php echo $customer_group['name']; ?>
					  <?php } else { ?>
					  <input class="xls_pricelist_customer_group" type="checkbox" name="xls_pricelist_customer_group[]" value="<?php echo $customer_group['customer_group_id']; ?>" />
					  <?php echo $customer_group['name']; ?>
					  <?php } ?>
					</div>
					<?php } ?>
				  </div>
				  <br>
				  <!--
				  <a href="#" onclick="$('.scrollbox .xls_pricelist_customer_group').prop('checked', !($('.scrollbox .xls_pricelist_customer_group').is(':checked'))); return false;"><?php echo $text_select_all; ?></a> 
				  -->
				  <?php if (isset($error_xls_pricelist_customer_group)) { ?>
					  <span class="error"><?php echo $error_xls_pricelist_customer_group; ?></span>
					  <?php } ?>
				</td>
			</tr>
			<tr>
				<td><?php echo $entry_attribute_groups; ?></td>
				<td>
					<div class="scrollbox">
					<?php $class = 'odd'; ?>
					<?php foreach ($attribute_groups as $attribute_group) { ?>
					<?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
					<div class="<?php echo $class; ?>">
					  <?php if (in_array($attribute_group['attribute_group_id'], $xls_pricelist_attribute_group)) { ?>
					  <input class="xls_pricelist_attribute_group" type="checkbox" name="xls_pricelist_attribute_group[]" value="<?php echo $attribute_group['attribute_group_id']; ?>" checked="checked" />
					  <?php echo $attribute_group['name']; ?>
					  <?php } else { ?>
					  <input class="xls_pricelist_attribute_group" type="checkbox" name="xls_pricelist_attribute_group[]" value="<?php echo $attribute_group['attribute_group_id']; ?>" />
					  <?php echo $attribute_group['name']; ?>
					  <?php } ?>
					</div>
					<?php } ?>
				  </div>
				  <br>
				  <!--
				  <a href="#" onclick="$('.scrollbox .xls_pricelist_attribute_group').prop('checked', !($('.scrollbox .xls_pricelist_attribute_group').is(':checked'))); return false;"><?php echo $text_select_all; ?></a> 
				  -->
				</td>
			</tr>
			
			</table>
		</div>
		
		<div id="tab-data">
			
			<div id="languages" class="htabs">
				<?php foreach ($languages as $language) { ?>
				<a href="#language<?php echo $language['language_id']; ?>"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a>
				<?php } ?>
			  </div>
			  <?php foreach ($languages as $language) { ?>
			  <div id="language<?php echo $language['language_id']; ?>">
		  <table class="form">
			<tr >
				<td><?php echo $entry_title; ?></td>
				<td>
				<input type="text" name="xls_pricelist_description[<?php echo $language['language_id']; ?>][title]" value="<?php echo isset($xls_pricelist_description[$language['language_id']]) ? $xls_pricelist_description[$language['language_id']]['title'] : ''; ?>" size="67"/>
				&nbsp;&nbsp;&nbsp;
				<input type="hidden" class="jpicker"  name="xls_pricelist_description[<?php echo $language['language_id']; ?>][title_color]" value="<?php echo isset($xls_pricelist_description[$language['language_id']]['title_color'])&&$xls_pricelist_description[$language['language_id']]['title_color'] ? $xls_pricelist_description[$language['language_id']]['title_color'] : '000000'; ?>" />
				</td>
			</tr>
			<tr >
				<td><?php echo $entry_adress; ?></td>
				<td>
				<input type="text" name="xls_pricelist_description[<?php echo $language['language_id']; ?>][adress]" value="<?php echo isset($xls_pricelist_description[$language['language_id']]) ? $xls_pricelist_description[$language['language_id']]['adress'] : ''; ?>" size="67"/>
				&nbsp;&nbsp;&nbsp;
				<input type="hidden" class="jpicker"  name="xls_pricelist_description[<?php echo $language['language_id']; ?>][adress_color]" value="<?php echo isset($xls_pricelist_description[$language['language_id']]['adress_color'])&&$xls_pricelist_description[$language['language_id']]['adress_color'] ? $xls_pricelist_description[$language['language_id']]['adress_color'] : '000000'; ?>" />
				</td>
			</tr>
			<tr >
				<td><?php echo $entry_phone; ?></td>
				<td>
				<input type="text" name="xls_pricelist_description[<?php echo $language['language_id']; ?>][phone]" value="<?php echo isset($xls_pricelist_description[$language['language_id']]) ? $xls_pricelist_description[$language['language_id']]['phone'] : ''; ?>" size="67"/>
				&nbsp;&nbsp;&nbsp;
				<input type="hidden" class="jpicker"  name="xls_pricelist_description[<?php echo $language['language_id']; ?>][phone_color]" value="<?php echo isset($xls_pricelist_description[$language['language_id']]['phone_color'])&&$xls_pricelist_description[$language['language_id']]['phone_color'] ? $xls_pricelist_description[$language['language_id']]['phone_color'] : '000000'; ?>" />
				</td>
			</tr>
			<tr >
				<td><?php echo $entry_email; ?></td>
				<td>
				<input type="text" name="xls_pricelist_description[<?php echo $language['language_id']; ?>][email]" value="<?php echo isset($xls_pricelist_description[$language['language_id']]) ? $xls_pricelist_description[$language['language_id']]['email'] : ''; ?>" size="67"/>
				&nbsp;&nbsp;&nbsp;
				<input type="hidden" class="jpicker"  name="xls_pricelist_description[<?php echo $language['language_id']; ?>][email_color]" value="<?php echo isset($xls_pricelist_description[$language['language_id']]['email_color'])&&$xls_pricelist_description[$language['language_id']]['email_color'] ? $xls_pricelist_description[$language['language_id']]['email_color'] : '339966'; ?>" />
				</td>
			</tr>
			<tr >
				<td><?php echo $entry_link; ?></td>
				<td>
				<input type="text" name="xls_pricelist_description[<?php echo $language['language_id']; ?>][link]" value="<?php echo isset($xls_pricelist_description[$language['language_id']]) ? $xls_pricelist_description[$language['language_id']]['link'] : ''; ?>" size="67"/>
				&nbsp;&nbsp;&nbsp;
				<input type="hidden" class="jpicker"  name="xls_pricelist_description[<?php echo $language['language_id']; ?>][link_color]" value="<?php echo isset($xls_pricelist_description[$language['language_id']]['link_color'])&&$xls_pricelist_description[$language['language_id']]['link_color'] ? $xls_pricelist_description[$language['language_id']]['link_color'] : '0000FF'; ?>" />
				</td>
			</tr>
			<tr >
				<td><?php echo $entry_custom_text; ?></td>
				<td>
				<textarea name="xls_pricelist_description[<?php echo $language['language_id']; ?>][custom_text]" cols="67" rows="5"><?php echo isset($xls_pricelist_description[$language['language_id']]) ? $xls_pricelist_description[$language['language_id']]['custom_text'] : ''; ?></textarea>
				&nbsp;&nbsp;&nbsp;
				<input type="hidden" class="jpicker"  name="xls_pricelist_description[<?php echo $language['language_id']; ?>][custom_color]" value="<?php echo isset($xls_pricelist_description[$language['language_id']]['custom_color'])&&$xls_pricelist_description[$language['language_id']]['custom_color'] ? $xls_pricelist_description[$language['language_id']]['custom_color'] : '000000'; ?>" />
				</td>
			</tr>
			<tr >
				<td><?php echo $entry_text_list; ?></td>
				<td>
				<input type="text" name="xls_pricelist_description[<?php echo $language['language_id']; ?>][listname]" value="<?php echo isset($xls_pricelist_description[$language['language_id']]) ? $xls_pricelist_description[$language['language_id']]['listname'] : ''; ?>" size="30"/>
				</td>
			</tr>
			<tr>
				<td><?php echo $entry_currency; ?></td>
				<td>
				<select name="xls_pricelist_description[<?php echo $language['language_id']; ?>][currency]">
					<?php foreach ($currencies as $currency) { ?>
						<?php if ($currency['code'] == $xls_pricelist_description[$language['language_id']]['currency']) { ?>
						<option value="<?php echo $currency['code']; ?>" selected="selected"><?php echo $currency['title']; ?></option>
						<?php } else { ?>
						<option value="<?php echo $currency['code']; ?>"><?php echo $currency['title']; ?></option>
						<?php } ?>
					<?php } ?>
				</select>
				</td>
			</tr>
			</table>
			</div>
			<?php } ?>

		</div>
		<div id="tab-option">
			<table class="form">
			<tr>
				<td><?php echo $entry_use_attributes; ?></td>
				<td>
				<select name="xls_pricelist_use_attributes">
					<?php if($xls_pricelist_use_attributes){ ?>
					<option value="0"><?php echo $text_no; ?></option>
					<option value="1" selected="selected"><?php echo $text_yes; ?></option>
					<?php }else{ ?>
					<option value="0" selected="selected"><?php echo $text_no; ?></option>
					<option value="1"><?php echo $text_yes; ?></option>
					<?php } ?>
				</select>
				</td>
			</tr>
			<tr>
				<td><?php echo $entry_use_options; ?></td>
				<td>
				<select name="xls_pricelist_use_options">
					<?php if($xls_pricelist_use_options){ ?>
					<option value="0"><?php echo $text_no; ?></option>
					<option value="1" selected="selected"><?php echo $text_yes; ?></option>
					<?php }else{ ?>
					<option value="0" selected="selected"><?php echo $text_no; ?></option>
					<option value="1"><?php echo $text_yes; ?></option>
					<?php } ?>
				</select>
				</td>
			</tr>
			<tr>
				<td><?php echo $entry_use_notinstock; ?></td>
				<td>
				<select name="xls_pricelist_use_notinstock">
					<?php if($xls_pricelist_use_notinstock){ ?>
					<option value="0"><?php echo $text_no; ?></option>
					<option value="1" selected="selected"><?php echo $text_yes; ?></option>
					<?php }else{ ?>
					<option value="0" selected="selected"><?php echo $text_no; ?></option>
					<option value="1"><?php echo $text_yes; ?></option>
					<?php } ?>
				</select>
				</td>
			</tr>
			<tr>
				<td><?php echo $entry_use_quantity; ?></td>
				<td>
				<select name="xls_pricelist_use_quantity">
					<?php if($xls_pricelist_use_quantity){ ?>
					<option value="0"><?php echo $text_no; ?></option>
					<option value="1" selected="selected"><?php echo $text_yes; ?></option>
					<?php }else{ ?>
					<option value="0" selected="selected"><?php echo $text_no; ?></option>
					<option value="1"><?php echo $text_yes; ?></option>
					<?php } ?>
				</select>
				</td>
			</tr>
			<tr>
				<td><?php echo $entry_view; ?></td>
				<td>
				<select name="xls_pricelist_view">
					<?php if($xls_pricelist_view){ ?>
					<option value="0"><?php echo $text_no; ?></option>
					<option value="1" selected="selected"><?php echo $text_yes; ?></option>
					<?php }else{ ?>
					<option value="0" selected="selected"><?php echo $text_no; ?></option>
					<option value="1"><?php echo $text_yes; ?></option>
					<?php } ?>
				</select>
				</td>
			</tr>
			<tr>
				<td><?php echo $entry_category_link; ?></td>
				<td>
				<select name="xls_pricelist_category_link">
					<?php if($xls_pricelist_category_link){ ?>
					<option value="0"><?php echo $text_no; ?></option>
					<option value="1" selected="selected"><?php echo $text_yes; ?></option>
					<?php }else{ ?>
					<option value="0" selected="selected"><?php echo $text_no; ?></option>
					<option value="1"><?php echo $text_yes; ?></option>
					<?php } ?>
				</select>
				</td>
			</tr>
			<tr>
				<td><?php echo $entry_product_link; ?></td>
				<td>
				<select name="xls_pricelist_product_link">
					<?php if($xls_pricelist_product_link){ ?>
					<option value="0"><?php echo $text_no; ?></option>
					<option value="1" selected="selected"><?php echo $text_yes; ?></option>
					<?php }else{ ?>
					<option value="0" selected="selected"><?php echo $text_no; ?></option>
					<option value="1"><?php echo $text_yes; ?></option>
					<?php } ?>
				</select>
				</td>
			</tr>
			
			<tr>
				<td><?php echo $entry_use_cache; ?></td>
				<td>
				<select name="xls_pricelist_usecache">
					<option <?php if($xls_pricelist_usecache=="no")echo 'selected'; ?> value="no"><?php echo $text_no; ?></option>
					<option <?php if($xls_pricelist_usecache=="file")echo 'selected'; ?> value="file">file</option>
					<option <?php if($xls_pricelist_usecache=="memcache")echo 'selected'; ?> value="memcache">memcache *</option>
				</select>
				<div class="memcache_params"<?php if($xls_pricelist_usecache!='memcache')echo 'style="display:none;"'; ?>>
				<br />
				<?php echo $entry_memcache_warning; ?><br />
				memcacheServer: <input type="text" name="xls_pricelist_memcacheServer" value="<?php echo $xls_pricelist_memcacheServer; ?>" /><br />
				memcachePort: <input type="text" name="xls_pricelist_memcachePort" value="<?php echo $xls_pricelist_memcachePort; ?>" /><br />
				cacheTime: <input type="text" name="xls_pricelist_cacheTime" value="<?php echo $xls_pricelist_cacheTime; ?>" />
				
				</div>
				</td>
			</tr>
			
			</table>
		</div>
		<div id="tab-image">
			<table class="form">
				<tr>
					<td><?php echo $entry_logo; ?></td>
					<td>
						<div class="image"><img src="<?php echo $logo; ?>" alt="" id="thumb-logo" />
						  <input type="hidden" name="xls_pricelist_logo" value="<?php echo $xls_pricelist_logo; ?>" id="logo" />
						  <br />
						  <a onclick="image_upload('logo', 'thumb-logo');"><?php echo $text_browse; ?></a>&nbsp;&nbsp;|&nbsp;&nbsp;<a onclick="$('#thumb-logo').attr('src', '<?php echo $no_image; ?>'); $('#logo').attr('value', '');"><?php echo $text_clear; ?></a></div>
					</td>
				</tr>
				<tr>
					<td><?php echo $entry_logo_dimensions; ?></td>
					<td>
					<input type="text" name="xls_pricelist_logo_width" value="<?php echo $xls_pricelist_logo_width; ?>" size="3"/>
					 x 
					<input type="text" name="xls_pricelist_logo_height" value="<?php echo $xls_pricelist_logo_height; ?>" size="3"/>
					<?php if (isset($error_xls_pricelist_dimensions1)) { ?>
						  <span class="error"><?php echo $error_xls_pricelist_dimensions1; ?></span>
						  <?php } ?>
					</td>
				</tr>
				
				<tr >
					<td><?php echo $entry_image_dimensions; ?></td>
					<td>
					<input type="text" name="xls_pricelist_image_width" value="<?php echo $xls_pricelist_image_width; ?>" size="3"/>
					 x 
					<input type="text" name="xls_pricelist_image_height" value="<?php echo $xls_pricelist_image_height; ?>" size="3"/>
					<?php if (isset($error_xls_pricelist_dimensions)) { ?>
						  <span class="error"><?php echo $error_xls_pricelist_dimensions; ?></span>
						  <?php } ?>
					</td>
				</tr>
			</table>
		</div>
		<div id="tab-design">
			<table class="form">
			<tr>
				<td><?php echo $entry_poles; ?></td>
				<td>
					<ul id="sortable">
						<?php $pole_row = 0; ?>
							<?php foreach($xls_pricelist_poles as $pole){ ?>
							<li id="pole-row<?php echo $pole_row; ?>" class="ui-state-default"><span class="ui-icon ui-icon-arrowthick-2-n-s"></span>
								<table  class="list">
								<tbody >
								  <tr>
									<td class="left">
										<?php echo $entry_pole_type; ?><br />
										<select name="xls_pricelist_poles[<?php echo $pole_row; ?>][type]">
										<?php foreach ($poletypes as $poletype) { ?>
										<?php if ($poletype == $pole['type']) { ?>
										<option value="<?php echo $poletype; ?>" selected="selected"><?php echo $poletype; ?></option>
										<?php } else { ?>
										<option value="<?php echo $poletype; ?>"><?php echo $poletype; ?></option>
										<?php } ?>
										<?php } ?>
									  </select></td>
									<td class="left">
									<?php echo $entry_pole_name; ?><br />
									<?php foreach ($languages as $language) { ?>
									<input type="text" name="xls_pricelist_poles[<?php echo $pole_row; ?>][name][<?php echo $language['language_id']; ?>]" value="<?php echo $pole['name'][$language['language_id']]; ?>" size="20" />
									<img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /><br />
									<?php } ?>
									</td>
									<td class="left">
									<?php echo $entry_dimensions; ?><br />
									<input type="text" name="xls_pricelist_poles[<?php echo $pole_row; ?>][dlina]" value="<?php echo $pole['dlina']; ?>" size="3" />
									</td>
									<td class="left">
									<?php echo $entry_alignment; ?><br />
									<select name="xls_pricelist_poles[<?php echo $pole_row; ?>][alignment]">
										<?php foreach ($alignments as $key=>$alignment) { ?>
										<?php if ($key == $pole['alignment']) { ?>
										<option value="<?php echo $key; ?>" selected="selected"><?php echo $alignment; ?></option>
										<?php } else { ?>
										<option value="<?php echo $key; ?>"><?php echo $alignment; ?></option>
										<?php } ?>
										<?php } ?>
									  </select>
									</td>
									<td class="left">
										<?php echo $entry_color_text; ?>&nbsp;
										<input type="hidden" class="jpicker"  name="xls_pricelist_poles[<?php echo $pole_row; ?>][textcolor]" value="<?php echo $pole['textcolor']; ?>" />
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<?php echo $entry_color_bg; ?>&nbsp;
										<input type="hidden" class="jpicker"  name="xls_pricelist_poles[<?php echo $pole_row; ?>][bgcolor]" value="<?php echo $pole['bgcolor']; ?>" />
									</td>
									<td class="left"><a onclick="removePole(<?php echo $pole_row; ?>);" class="button"><?php echo $button_remove; ?></a></td>
								  </tr>
								</tbody>
								</table>
								</li>
							<?php $pole_row++; ?>
							<?php } ?>
						</ul>
							<table id="poles" class="list">
							
							  <tr>
								<td  class="right"><a onclick="addPole();" class="button"><?php echo $button_add; ?></a></td>
							  </tr>
							
							</table>
						
				</td>
			</tr>
			<tr>
				<td><?php echo $entry_use_collapse; ?></td>
				<td>
				<select name="xls_pricelist_use_collapse">
					<?php if($xls_pricelist_use_collapse){ ?>
					<option value="0"><?php echo $text_no; ?></option>
					<option value="1" selected="selected"><?php echo $text_yes; ?></option>
					<?php }else{ ?>
					<option value="0" selected="selected"><?php echo $text_no; ?></option>
					<option value="1"><?php echo $text_yes; ?></option>
					<?php } ?>
				</select>
				</td>
			</tr>
			<tr>
				<td><?php echo $entry_use_protection; ?></td>
				<td>
				<select name="xls_pricelist_use_protection" onchange="lavascript:if($(this).val()==1){$('#use_password').fadeIn('slow');}else{$('#use_password').fadeOut('slow');}">
					<?php if($xls_pricelist_use_protection){ ?>
					<option value="0"><?php echo $text_no; ?></option>
					<option value="1" selected="selected"><?php echo $text_yes; ?></option>
					<?php }else{ ?>
					<option value="0" selected="selected"><?php echo $text_no; ?></option>
					<option value="1"><?php echo $text_yes; ?></option>
					<?php } ?>
				</select>
				<span id="use_password" <?php if(!$xls_pricelist_use_protection) echo'style="display:none;"'; ?>>&nbsp;&nbsp;&nbsp;<?php echo $entry_use_password; ?>&nbsp;<input type="text" name="xls_pricelist_use_password" value="<?php echo $xls_pricelist_use_password; ?>" /></span>
				</td>
			</tr>
			<tr >
				<td colspan=2 align=center><?php echo $entry_colors; ?></td>
			</tr>
			<tr>
				<td><?php echo $entry_thead_color; ?></td>
				<td>
					<?php echo $entry_color_text; ?>&nbsp;
					<input type="hidden" class="jpicker"  name="xls_pricelist_colors[thead]" value="<?php echo $xls_pricelist_colors['thead']; ?>" />
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<?php echo $entry_color_bg; ?>&nbsp;
					<input type="hidden" class="jpicker"  name="xls_pricelist_colors[thead_bg]" value="<?php echo $xls_pricelist_colors['thead_bg']; ?>" />
				</td>
			</tr>
			<tr>
				<td><?php echo $entry_underthead_color; ?></td>
				<td>
					<?php echo $entry_color_bg; ?>&nbsp;
					<input type="hidden" class="jpicker"  name="xls_pricelist_colors[underthead_bg]" value="<?php echo $xls_pricelist_colors['underthead_bg']; ?>" />
				</td>
			</tr>
			<tr>
				<td><?php echo $entry_category0_color; ?></td>
				<td>
					<?php echo $entry_color_text; ?>&nbsp;
					<input type="hidden" class="jpicker"  name="xls_pricelist_colors[category0]" value="<?php echo $xls_pricelist_colors['category0']; ?>" />
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<?php echo $entry_color_bg; ?>&nbsp;
					<input type="hidden" class="jpicker"  name="xls_pricelist_colors[category0_bg]" value="<?php echo $xls_pricelist_colors['category0_bg']; ?>" />
				</td>
			</tr>
			<tr>
				<td><?php echo $entry_category1_color; ?></td>
				<td>
					<?php echo $entry_color_text; ?>&nbsp;
					<input type="hidden" class="jpicker"  name="xls_pricelist_colors[category1]" value="<?php echo $xls_pricelist_colors['category1']; ?>" />
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<?php echo $entry_color_bg; ?>&nbsp;
					<input type="hidden" class="jpicker"  name="xls_pricelist_colors[category1_bg]" value="<?php echo $xls_pricelist_colors['category1_bg']; ?>" />
				</td>
			</tr>
			<tr>
				<td><?php echo $entry_category2_color; ?></td>
				<td>
					<?php echo $entry_color_text; ?>&nbsp;
					<input type="hidden" class="jpicker"  name="xls_pricelist_colors[category2]" value="<?php echo $xls_pricelist_colors['category2']; ?>" />
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<?php echo $entry_color_bg; ?>&nbsp;
					<input type="hidden" class="jpicker"  name="xls_pricelist_colors[category2_bg]" value="<?php echo $xls_pricelist_colors['category2_bg']; ?>" />
				</td>
			</tr>
			
				
			</table>
		</div>
		<table class="form">
			<tr >
				<td></td>
				<td>
				<input type="hidden" name="action" value="generate" />
				<a onclick="$('#form').attr('target', '_blank'); $('#form').attr('action', '<?php echo $view; ?>'); $('#form').submit();" class="button"><?php echo $button_view; ?></a>
				</td>
			</tr>		
		</table>
	</form>	
	</div> 
    
  </div>
</div>

<script type="text/javascript"><!--

function a_jpicker(){
	
	$('.jpicker').jPicker({
			window:
			{
				expandable: true,
				position:
				{
					x: 'center', // acceptable values "left", "center", "right", "screenCenter", or relative px value
					y: 'center', // acceptable values "top", "bottom", "center", or relative px value
				}
			},
			images:
			{
				clientPath: 'view/javascript/jquery/jpicker/images/' // Path to image files
			},
			
		});
}


var pole_row = <?php echo $pole_row; ?>;

function addPole() {	
	html  = '<li id="pole-row' + pole_row + '" class="ui-state-default"><span class="ui-icon ui-icon-arrowthick-2-n-s"></span>';
	html += '<table  class="list">';
	html += '<tbody >';
	html += '  <tr>';
	html += '    <td class="left"><?php echo $entry_pole_type; ?><br /><select name="xls_pricelist_poles[' + pole_row + '][type]">';
	<?php foreach ($poletypes as $poletype) { ?>
	html += '      <option value="<?php echo $poletype; ?>"><?php echo $poletype; ?></option>';
	<?php } ?>
	html += '    </select></td>';
	html += '    <td class="left"><?php echo $entry_pole_name; ?><br />';
	<?php foreach ($languages as $language) { ?>
	html += '<input type="text" name="xls_pricelist_poles[' + pole_row + '][name][<?php echo $language['language_id']; ?>]" value="" size="20" />';
	html += '<img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /><br />';
	<?php } ?>
	html += '</td>';
	html += '<td class="left"><?php echo $entry_dimensions; ?><br />';
	html += '<input type="text" name="xls_pricelist_poles[' + pole_row + '][dlina]" value="15" size="3" />';
	html += '</td>';
	html += '<td class="left">';
	html += '<?php echo $entry_alignment; ?><br />';
	html += '<select name="xls_pricelist_poles[' + pole_row + '][alignment]">';
	<?php foreach ($alignments as $key=>$alignment) { ?>
	html += '<option value="<?php echo $key; ?>"><?php echo $alignment; ?></option>';
	<?php } ?>
	html += '</select>';
	html += '</td>';
	html += '	 <td class="left">';
	html += '	<?php echo $entry_color_text; ?>&nbsp;';
	html += '	<input type="hidden" class="jpicker"  name="xls_pricelist_poles[' + pole_row + '][textcolor]" value="000000" />';
	html += '	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;';
	html += '	<?php echo $entry_color_bg; ?>&nbsp;';
	html += '		<input type="hidden" class="jpicker"  name="xls_pricelist_poles[' + pole_row + '][bgcolor]" value="" />';
	html += '	</td>';
	html += '    <td class="left"><a onclick="removePole('+pole_row+');" class="button"><?php echo $button_remove; ?></a></td>';
	html += '  </tr>';
	html += '</tbody>';
	html += '</table>';
	html += '</li>';
	
	
	$('#sortable').append(html);
	
	$.each($.jPicker.List, function(index, value) {
		$.jPicker.List[0].destroy(); //destroying the instance in the jPicker List
	});
	$('span.jPicker').each(function(){
		$(this).remove();
	});
	a_jpicker();
	
	pole_row++;
}

function removePole(i){
	
	$.each($.jPicker.List, function(index, value) {
		$.jPicker.List[0].destroy(); //destroying the instance in the jPicker List
	});
	$('span.jPicker').each(function(){
		$(this).remove();
	});
	$('#pole-row' + i).remove();
	a_jpicker();
}

//--></script>

<script type="text/javascript"><!--
$.fn.tabs1 = function() {
	var selector = this;
	
	this.each(function() {
		var obj = $(this); 
		
		$(obj.attr('href')).hide();
		
		$(obj).click(function() {
			$(selector).removeClass('selected');
			
			$(selector).each(function(i, element) {
				$($(element).attr('href')).hide('slow');
			});
			
			$(this).addClass('selected');
			
			$($(this).attr('href')).show('slow',function(){
				$.each($.jPicker.List, function(index, value) {
					$.jPicker.List[0].destroy(); //destroying the instance in the jPicker List
				});
				$('span.jPicker').each(function(){
					$(this).remove();
				});
				a_jpicker();
			});
			
			return false;
		});
	});

	$(this).show();
	
	$(this).first().click();
	
};
	$(document).ready(function(){
		
	
		 $( "#sortable" ).sortable();
	
		//a_jpicker();
	});
	
	
//--></script> 
<script type="text/javascript"><!--
$('input, select').change(function(){
	$('#xls_pricelist').html('<a class="top" style="color:red;" ><?php echo $text_save; ?></a>');
								
});

$('select[name="xls_pricelist_usecache"]').change(function(){
	if($(this).val()=='memcache')$('div.memcache_params').fadeIn('slow');
	else $('div.memcache_params').fadeOut('slow');							
});



//--></script> 
<script type="text/javascript"><!--
function image_upload(field, thumb) {
	$('#dialog').remove();
	
	$('#content').prepend('<div id="dialog" style="padding: 3px 0px 0px 0px;"><iframe src="index.php?route=common/filemanager&token=<?php echo $token; ?>&field=' + encodeURIComponent(field) + '" style="padding:0; margin: 0; display: block; width: 100%; height: 100%;" frameborder="no" scrolling="auto"></iframe></div>');
	
	$('#dialog').dialog({
		title: '<?php echo $text_image_manager; ?>',
		close: function (event, ui) {
			if ($('#' + field).attr('value')) {
				$.ajax({
					url: 'index.php?route=common/filemanager/image&token=<?php echo $token; ?>&image=' + encodeURIComponent($('#' + field).val()),
					dataType: 'text',
					success: function(data) {
						$('#' + thumb).replaceWith('<img src="' + data + '" alt="" id="' + thumb + '" />');
					}
				});
			}
		},	
		bgiframe: false,
		width: 800,
		height: 400,
		resizable: false,
		modal: false
	});
};
//--></script> 
<script type="text/javascript"><!--
$('#tabs a').tabs1(); 
$('#languages a').tabs();
//--></script> 
<?php echo $footer; ?>