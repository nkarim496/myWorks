<?php echo $header; ?>
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
		<h1><img src="view/image/setting.png" alt="" /><?php echo $heading_title; ?></h1>
      		<div class="buttons">
      		   <a onclick="$('#form').submit();" class="button"><?php echo $button_save; ?></a>

             <a onclick="sav_con()" class="button"><span><?php echo $button_save_continue; ?></span></a>
             <script language="javascript">
                function sav_con(){
                    $('#form').append('<input type="hidden" id="save_continue" name="save_continue" value="1"  />');
                    $('#form').submit();
               }
             </script>

      		   <a href="<?php echo $cancel; ?>" class="button"><?php echo $button_cancel; ?></a>
      		</div>
    </div>

    <div class="content">

      <!-- Tabs -->
      <div id="tabs" class="htabs">
        <a href="#tab-design-settings">    <?php echo $tab_design_settings; ?></a>
        <a href="#tab-contact-information"><?php echo $tab_contact_information; ?></a>
        <a href="#tab-social-networks">    <?php echo $tab_social_networks; ?></a>
        <a href="#tab-payment-systems">    <?php echo $tab_payment_systems; ?></a>
        <a href="#tab-menu">               <?php echo $tab_menu; ?></a>
      </div>
      <!-- / Tabs -->

      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
        <!-- Внешний вид -->
        <div id="tab-design-settings">
        <!-- Настройка элементов темы -->
          <div id="vtab-option" class="vtabs">
            <a href="#tab-option-0" id="option-0" class=""><?php echo $entry_themer_elements_headline; ?></a>
            <a href="#tab-option-1" id="option-1" class="">
              <?php echo $entry_themer_main_color_headline; ?> &
              <?php echo $entry_themer_background_headline; ?>
            </a>
          </div>

          <div id="tab-option-0" class="vtabs-content">
          <table class="form">
            <tr>
                <td><?php echo $entry_themer_description; ?></td>
                <td>
                  <select name="themer_description">
                    <option value="on" <?php if ($themer_description == 'on') { echo 'selected=selected'; }?>><?php echo $text_on; ?></option>
                    <option value="off"<?php if ($themer_description != 'on') { echo 'selected=selected'; }?>><?php echo $text_off; ?></option>
                  </select>
		<img class="tooltip" id="tooltip1" src="view/image/info.png">
                </td>
            </tr>
            <tr>
                <td><?php echo $entry_themer_catdescription; ?></td>
                <td>
                  <select name="themer_category_desc">
                    <option value="on" <?php if ($themer_category_desc == 'on') { echo 'selected=selected'; }?>><?php echo $text_bottom; ?></option>
                    <option value="off"<?php if ($themer_category_desc != 'on') { echo 'selected=selected'; }?>><?php echo $text_header; ?></option>
                  </select>
		<img class="tooltip" id="tooltip2" src="view/image/info.png">
                </td>
            </tr>
            <tr>
                <td><?php echo $entry_themer_product_tabs; ?></td>
                <td>
                  <select name="themer_product_tabs">
                    <option value="on" <?php if ($themer_product_tabs == 'on') { echo 'selected=selected'; }?>><?php echo $text_bottom; ?></option>
                    <option value="off"<?php if ($themer_product_tabs != 'on') { echo 'selected=selected'; }?>><?php echo $text_header; ?></option>
                  </select>
		<img class="tooltip" id="tooltip3" src="view/image/info.png">
                </td>
            </tr>
            <tr>
                <td>
		<?php echo $entry_themer_products_view; ?>
		<span class="help">Результат можно увидеть после очистки кеша | Clear cache</span>
		</td>
                <td>
                  <select name="themer_products_view">
                    <option value="list" <?php if ($themer_products_view == 'list') { echo 'selected=selected'; }?>><?php echo $text_list; ?></option>
                    <option value="grid" <?php if ($themer_products_view != 'list') { echo 'selected=selected'; }?>><?php echo $text_grid; ?></option>
                  </select>
		<img class="tooltip" id="tooltip4" src="view/image/info.png">
                </td>
            </tr>
            <tr>
                <td><?php echo $entry_themer_cart_button; ?></td>
                <td>
                  <select name="themer_cart_button">
                    <option value="on" <?php if ($themer_cart_button == 'on') { echo 'selected=selected'; }?>><?php echo $text_on; ?></option>
                    <option value="off" <?php if ($themer_cart_button != 'on') { echo 'selected=selected'; }?>><?php echo $text_off; ?></option>
                  </select>
		<img class="tooltip" id="tooltip5" src="view/image/info.png">
                </td>
            </tr>
            <tr>
                <td><?php echo $entry_themer_subcategory_photo; ?></td>
                <td>
                  <select name="themer_subcategory_photo">
                    <option value="on" <?php if ($themer_subcategory_photo != 'off') { echo 'selected=selected'; }?>><?php echo $text_on; ?></option>
                    <option value="off" <?php if ($themer_subcategory_photo == 'off') { echo 'selected=selected'; }?>><?php echo $text_off; ?></option>
                  </select>
		<img class="tooltip" id="tooltip6" src="view/image/info.png">
                </td>
            </tr>
            <tr>
                <td><?php echo $entry_themer_menu_category_photo; ?></td>
                <td>
                  <select name="themer_menu_category_photo">
                    <option value="on" <?php if ($themer_menu_category_photo == 'on') { echo 'selected=selected'; }?>><?php echo $text_on; ?></option>
                    <option value="off" <?php if ($themer_menu_category_photo != 'on') { echo 'selected=selected'; }?>><?php echo $text_off; ?></option>
                  </select>
		<img class="tooltip" id="tooltip7" src="view/image/info.png">
                </td>
            </tr>
            <tr>
                <td><?php echo $entry_themer_buybuttons; ?></td>
                <td>
                  <select name="themer_buybuttons">
                    <option value="on" <?php if ($themer_buybuttons == 'on') { echo 'selected=selected'; }?>><?php echo $text_on; ?></option>
                    <option value="off"<?php if ($themer_buybuttons != 'on') { echo 'selected=selected'; }?>><?php echo $text_off; ?></option>
                  </select>
		<img class="tooltip" id="tooltip8" src="view/image/info.png">
                </td>
            </tr>

             <tr>
                <td><?php echo $entry_themer_left_right_column_categories_type; ?></td>
                <td>
                  <select name="themer_left_right_column_categories_type">
                    <option value="1" <?php if ($themer_left_right_column_categories_type == '1') { echo 'selected=selected'; }?>><?php echo $entry_themer_standart; ?></option>
                    <option value="0"<?php if ($themer_left_right_column_categories_type != '1') { echo 'selected=selected'; }?>><?php echo $entry_themer_accardeon; ?></option>
                  </select>
		<img class="tooltip" id="tooltip9" src="view/image/info.png">
                </td>
            </tr>


            <tr>
                <td><?php echo $entry_themer_buttons; ?></td>
                <td>
                  <select name="themer_buttons">
                    <option value="on" <?php if ($themer_buttons == 'on' and $themer_buttons != 'on') { echo 'selected=selected'; }?>><?php echo $text_on_1; ?></option>
                    <option value="off"<?php if ($themer_buttons == 'off') { echo 'selected=selected'; }?>><?php echo $text_off_1; ?></option>
                    <option value="off2"<?php if ($themer_buttons == 'off2') { echo 'selected=selected'; }?>><?php echo $text_off_2; ?></option>
                  </select>
		<img class="tooltip" id="tooltip10" src="view/image/info.png">
		</td>
	    </tr>
            <tr>
                <td><?php echo $entry_themer_searchview; ?></td>
                <td>
                  <select name="themer_search">
                    <option value="on" <?php if ($themer_search == 'on') { echo 'selected=selected'; }?>><?php echo $text_hidden; ?></option>
                    <option value="off"<?php if ($themer_search != 'on') { echo 'selected=selected'; }?>><?php echo $text_visible; ?></option>
                  </select>
		<img class="tooltip" id="tooltip11" src="view/image/info.png">
                </td>
            </tr>

            <!-- ДОБАВЛЕНИЕ ВОЗМОЖНОСТИ СКРЫТЬ ВЫБОР ВАЛЮТЫ -->
            <tr>
                <td><?php echo $entry_themer_hide_currency; ?></td>
                <td>
                  <select name="themer_hide_currency">
                    <option value="on" <?php if ($themer_hide_currency != 'off') { echo 'selected=selected'; }?>><?php echo $text_on; ?></option>
                    <option value="off"<?php if ($themer_hide_currency == 'off') { echo 'selected=selected'; }?>><?php echo $text_off; ?></option>
                  </select>
		<img class="tooltip" id="tooltip12" src="view/image/info.png">
                </td>
            </tr>

            <!-- ДОБАВЛЕНИЕ ВОЗМОЖНОСТИ СКРЫТЬ ВЫБОР ЯЗЫКА -->
            <tr>
                <td><?php echo $entry_themer_hide_language; ?></td>
                <td>
                  <select name="themer_hide_language">
                    <option value="on" <?php if ($themer_hide_language != 'off') { echo 'selected=selected'; }?>><?php echo $text_on; ?></option>
                    <option value="off"<?php if ($themer_hide_language =='off') { echo 'selected=selected'; }?>><?php echo $text_off; ?></option>
                  </select>
		<img class="tooltip" id="tooltip13" src="view/image/info.png">
                </td>
            </tr>

            <tr>
                <td><?php echo $text_csspole; ?></td>
                <td>
                    <textarea rows="10" cols="50" name="themer_css_block"><?php echo $themer_css_block; ?></textarea>
                </td>
            </tr>
      <tr>
              <td><?php echo $entry_themer_counters; ?></td>
              <td>
                <textarea rows="10" cols="50" name="themer_counters"><?php echo $themer_counters; ?></textarea>
              </td>
            </tr>
          </table>

          </div>

          <div id="tab-option-1" class="vtabs-content">

          <table class="form">
            <tr>
              <td><?php echo $entry_themer_main_color; ?></td>
              <td>
                <input type="text" name="themer_main_color" class="color" value="<?php echo $themer_main_color; ?>" />
              </td>
            </tr>
            <tr>
              <td></td>
              <td id="color">
                <?php
                foreach ($main_colors as $main_color) {
                  if ($themer_main_color == $main_color ) { $color = 'black'; } else { $color = 'white'; }
                  echo '<div id="'.$main_color.'" style="width: 50px; height: 50px; margin: 1px; display: inline-block; background-color: #'.$main_color.'; border: 1px solid '.$color.'"></div>';
                }
                ?>
              </td>
             <script type="text/javascript"><!--
              $(document).ready(function() {

                if ($('input[name="themer_main_color"]').attr('value') == '') {
                  $('input[name="themer_main_color"]').attr('value', '#22B699');
                }

                $('#color div').click(function() {
                  $('#color div').css('border','1px solid white');
                  $(this).css('border','1px solid black');

                  $('input[name="themer_main_color"]').attr('value', $(this).attr('id'));
                  $('input[name="themer_main_color"]').css('background-color','#'+$(this).attr('id'));
                });
              });
              --></script>
            </tr>
            <tr>
                <td><?php echo $entry_themer_shadow; ?></td>
                <td>
                  <select name="themer_shadow">
                    <option value="on" <?php if ($themer_shadow == 'on') { echo 'selected=selected'; }?>><?php echo $text_on; ?></option>
                    <option value="off"<?php if ($themer_shadow != 'on') { echo 'selected=selected'; }?>><?php echo $text_off; ?></option>
                  </select>
                </td>
            </tr>
            <tr>
                <td><?php echo $entry_themer_grid; ?></td>
                <td>
                  <select name="themer_grid">
                    <option value="980" <?php if ($themer_grid == '980') { echo 'selected=selected'; }?>>980</option>
                    <option value="1200"<?php if ($themer_grid != '980') { echo 'selected=selected'; }?>>1200</option>
                  </select>
                </td>
            </tr>
            </table>
            
            <table class="form">
            <tr>
              <td><?php echo $entry_themer_background_color; ?></td>
              <td>
                <input type="text" name="themer_background_color" class="color" value="<?php echo $themer_background_color; ?>" />
              </td>
            </tr>
            <!-- background image -->
            <tr>
              <td><?php echo $entry_themer_background_image; ?></td>
              <td>
                  <div class="image">
                    <img src="<?php echo $logo; ?>" alt="" id="themer_background_image" />
                    <input type="hidden" name="themer_background_image" value="<?php echo $themer_background_image; ?>" id="logo" />
                    <br />
                    <a onclick="image_upload('logo', 'themer_background_image');"><?php echo $text_browse; ?></a>&nbsp;&nbsp;|&nbsp;&nbsp;
                    <a onclick="$('#themer_background_image').attr('src', '<?php echo $no_image; ?>'); $('#logo').attr('value', '');"><?php echo $text_clear; ?></a>
                  </div>
              </td>
            </tr>
            <tr>
              <td></td>
              <td id="patterns">
                  <input type="hidden" name="themer_background_pattern" value="<?php echo $themer_background_pattern; ?>" />
                  <?php
                    for ($i = 1; $i <= 40 ; $i++) {
                      if ($themer_background_pattern == $i ) { $color = 'black'; } else { $color = 'white'; }
                      echo '<img src="view/image/background/bg'.$i.'.jpg" style="width: 100px; height: 100px; margin: 2px 2px 0 2px; border: 1px solid '.$color.';" id="'.$i.'"/>';
                    }
                  ?>
              </td>
              <script type="text/javascript"><!--
              $(document).ready(function() {
                $('#patterns img').click(function() {
                  $('#patterns img').css('border','1px solid white');
                  $(this).css('border','1px solid black');
 
                  $('input[name="themer_background_pattern"]').attr('value',$(this).attr('id'));
                });
                $('#patterns img').dblclick(function() {
                  $(this).css('border','1px solid white');
                  $('input[name="themer_background_pattern"]').attr('value','');
                });
              });
              --></script>
            </tr>
            <tr>
              <td>
                <?php echo $entry_themer_background_repeat; ?>
                <span class="help">background-repeat</span>
              </td>
              <td>
                <select name="themer_background_repeat">
                  <option value="repeat"    <?php if ($themer_background_repeat == 'repeat') { echo 'selected=selected'; }?>>repeat</option>
                  <option value="repeat-x"  <?php if ($themer_background_repeat == 'repeat-x') { echo 'selected=selected'; }?>>repeat-x</option>
                  <option value="repeat-y"  <?php if ($themer_background_repeat == 'repeat-y') { echo 'selected=selected'; }?>>repeat-y</option>
                  <option value="no-repeat" <?php if ($themer_background_repeat == 'no-repeat') { echo 'selected=selected'; }?>>no-repeat</option>
                </select>
              </td>
            </tr>
            <tr>
              <td>
                <?php echo $entry_themer_background_position; ?>
                <span class="help">background-position</span>
              </td>
              <td>
                <select name="themer_background_position">
                      <option value="left top"     <?php if ($themer_background_position == 'left top') { echo 'selected=selected'; }?>>left top</option>
                      <option value="left center"  <?php if ($themer_background_position == 'left center') { echo 'selected=selected'; }?>>left center</option>
                      <option value="left bottom"  <?php if ($themer_background_position == 'left bottom') { echo 'selected=selected'; }?>>left bottom</option>
                      <option value="center top"   <?php if ($themer_background_position == 'center top') { echo 'selected=selected'; }?>>center top</option>
                      <option value="center"       <?php if ($themer_background_position == 'center') { echo 'selected=selected'; }?>>center</option>
                      <option value="center bottom"<?php if ($themer_background_position == 'center bottom') { echo 'selected=selected'; }?>>center bottom</option>
                      <option value="right top"    <?php if ($themer_background_position == 'right top') { echo 'selected=selected'; }?>>right top</option>
                      <option value="right center" <?php if ($themer_background_position == 'right center') { echo 'selected=selected'; }?>>right center</option>
                      <option value="right bottom" <?php if ($themer_background_position == 'right bottom') { echo 'selected=selected'; }?>>right bottom</option>
                </select>
              </td>
            </tr>
            <tr>
              <td>
                <?php echo $entry_themer_background_attachment; ?>
                <span class="help">background-attachment</span>
              </td>
              <td>
                <select name="themer_background_attachment">
                  <option value="fixed"   <?php if ($themer_background_attachment == 'fixed') { echo 'selected=selected'; }?>>fixed</option>
                  <option value="scroll"  <?php if ($themer_background_attachment == 'scroll') { echo 'selected=selected'; }?>>scroll</option>
                </select>
              </td>
            </tr>
          </table>
          </div>

        </div>

                   
        <!-- Контактная информация -->
        <div id="tab-contact-information">
          <table class="form">
            <tr>
              <td><img src="view/image/icon/k-phone.jpg" style="vertical-align: middle;"/><?php echo $entry_themer_phone_number; ?></td>
              <td>
                <input type="text" name="themer_phone_number" value="<?php echo $themer_phone_number; ?>" />
              </td>
            </tr>
            <tr>
              <td><img src="view/image/icon/k-mob.jpg" style="vertical-align: middle;"/><?php echo $entry_themer_mobile_phone_number; ?></td>
              <td>
                <input type="text" name="themer_mobile_phone_number" value="<?php echo $themer_mobile_phone_number; ?>" />
              </td>
            </tr>
            <tr>
              <td><img src="view/image/icon/k-fax.jpg" style="vertical-align: middle;"/><?php echo $entry_themer_fax_number; ?></td>
              <td>
                <input type="text" name="themer_fax_number" value="<?php echo $themer_fax_number; ?>" />
              </td>
            </tr>
  
            <tr>
              <td><img src="view/image/icon/k-email.jpg" style="vertical-align: middle;"/><?php echo $entry_themer_email; ?></td>
              <td>
                <input type="text" name="themer_email" value="<?php echo $themer_email; ?>" />
              </td>
            </tr>
            <tr>
              <td><img src="view/image/icon/k-address.jpg" style="vertical-align: middle;"/><?php echo $entry_themer_address; ?></td>
              <td>
              <?php foreach ($languages as $language) { ?>
                  <img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" style="vertical-align: top;" />
                  <input type="text" name="<?php echo 'themer_address' . $language['code']; ?>" value="<?php echo ${'themer_address'.$language['code']}; ?>" />
                  <br>
              <?php } ?> 
              </td>
            </tr>
            <tr>
              <td><img src="view/image/icon/k-map.jpg" style="vertical-align: middle;"/><?php echo $entry_themer_map; ?></td>
              <td>
                <textarea rows="10" cols="50" name="themer_map"><?php echo $themer_map; ?></textarea>
              </td>
            </tr>
            <tr>
              <td><img src="view/image/icon/k-skype.jpg" style="vertical-align: middle;"/><?php echo $entry_themer_skype; ?></td>
              <td>
                <input type="text" name="themer_skype" value="<?php echo $themer_skype; ?>" />
              </td>
            </tr>
            <tr>
              <td><img src="view/image/icon/k-time.jpg" style="vertical-align: middle;"/><?php echo $entry_themer_working_hours; ?></td>
              <td>
              <?php foreach ($languages as $language) { ?>
                <img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" style="vertical-align: top;" />
                <input type="text" name="<?php echo 'themer_working_hours' . $language['code']; ?>" value="<?php echo ${'themer_working_hours'.$language['code']}; ?>" />
                <br>
              <?php } ?> 
              </td>
            </tr>
          </table>
        </div>

        <!-- Социальные сети -->
        <div id="tab-social-networks">
          <table class="form">
              <tr>
                <td><img src="view/image/icon/s-f.jpg" style="vertical-align: middle;"/>Facebook</td>
                <td>
                    <input type="text" name="themer_facebook" value="<?php echo $themer_facebook; ?>" />
                </td>
            </tr>
            <tr>
                <td><img src="view/image/icon/s-tw.jpg" style="vertical-align: middle;"/>Twitter</td>
                <td>
                    <input type="text" name="themer_twitter" value="<?php echo $themer_twitter; ?>" />
                </td>
            </tr>        
            <tr>
                <td><img src="view/image/icon/s-g.jpg" style="vertical-align: middle;"/>Google_plus</td>
                <td>
                    <input type="text" name="themer_google_plus" value="<?php echo $themer_google_plus; ?>" />
                </td>
            </tr>          
            <tr>
                <td><img src="view/image/icon/s-y.jpg" style="vertical-align: middle;"/>Youtube</td>
                <td>
                    <input type="text" name="themer_youtube" value="<?php echo $themer_youtube; ?>" />
                </td>
            </tr>         
            <tr>
                <td><img src="view/image/icon/s-v.jpg" style="vertical-align: middle;"/>Vimeo</td>
                <td>
                    <input type="text" name="themer_vimeo" value="<?php echo $themer_vimeo; ?>" />
                </td>
            </tr>         
            <tr>
                <td><img src="view/image/icon/s-vk.jpg" style="vertical-align: middle;"/>Vkontakte</td>
                <td>
                    <input type="text" name="themer_vk" value="<?php echo $themer_vk; ?>" />
                </td>
            </tr>
            <tr>
                <td><img src="view/image/icon/s-p.jpg" style="vertical-align: middle;"/>Pinterest</td>
                <td>
                    <input type="text" name="themer_pinterest" value="<?php echo $themer_pinterest; ?>" />
                </td>
            </tr>
            <tr>
                <td><img src="view/image/icon/s-th.jpg" style="vertical-align: middle;"/>Tumblr</td>
                <td>
                    <input type="text" name="themer_tumblr" value="<?php echo $themer_tumblr; ?>" />
                </td>
            </tr>
            <tr>
                <td><img src="view/image/icon/s-mw.jpg" style="vertical-align: middle;"/>MyWorld (mail.ru)</td>
                <td>
                    <input type="text" name="themer_myworld" value="<?php echo $themer_myworld; ?>" />
                </td>
            </tr>
            <tr>
                <td><img src="view/image/icon/s-o.jpg" style="vertical-align: middle;"/>Odnoklassniki</td>
                <td>
                    <input type="text" name="themer_odnoklassniki" value="<?php echo $themer_odnoklassniki; ?>" />
                </td>
            </tr>
            <tr>
                <td><img src="view/image/icon/s-i.jpg" style="vertical-align: middle;"/>Instagram</td>
                <td>
                    <input type="text" name="themer_instagram" value="<?php echo $themer_instagram; ?>" />
                </td>
            </tr>    
            <tr>
                <td><?php echo $entry_themer_socialcode; ?></td>
                <td>
                    <textarea rows="10" cols="50" name="themer_code"><?php echo $themer_code; ?></textarea>
                </td>
            </tr>
          </table>
        </div>

        <!-- Платежные системы -->
        <div id="tab-payment-systems">
          <table class="form">
            <tr>
                <td style="width: 100px;"><img src="view/image/payment/alfabank.png"/></td>
                <td style="width: 100px;"><span class="help">Alfabank</span></td>
                <td style="width: 100px;">
                      <input type="text" name="themer_custom_payment_s1_url" value="<?php echo $themer_custom_payment_s1_url; ?>" />
                      <span class="help"><?php echo $entry_themer_menulink; ?></span>
                </td>
                <td>
                <select name="themer_alfabank">
                <option value="on" <?php if ($themer_alfabank == 'on') { echo 'selected=selected'; }?>><?php echo $text_on; ?></option>
                <option value="off"<?php if ($themer_alfabank != 'on'){ echo 'selected=selected'; }?>><?php echo $text_off; ?></option>
                </select>
                </td>
            </tr>
            <tr>
                <td style="width: 100px;"><img src="view/image/payment/maestro.png"/></td>
                <td style="width: 100px;"><span class="help">Maestro</span></td>
                <td style="width: 100px;">
                      <input type="text" name="themer_custom_payment_s2_url" value="<?php echo $themer_custom_payment_s2_url; ?>" />
                      <span class="help"><?php echo $entry_themer_menulink; ?></span>
                </td>
                <td>
                <select name="themer_maestro">
                <option value="on" <?php if ($themer_maestro == 'on') { echo 'selected=selected'; }?>><?php echo $text_on; ?></option>
                <option value="off"<?php if ($themer_maestro != 'on'){ echo 'selected=selected'; }?>><?php echo $text_off; ?></option>
                </select>
                </td>
            </tr>
            <tr>
                <td style="width: 100px;"><img src="view/image/payment/robokassa2.png"/></td>
                <td style="width: 100px;"><span class="help">RoboKassa</span></td>
                <td style="width: 100px;">
                      <input type="text" name="themer_custom_payment_s3_url" value="<?php echo $themer_custom_payment_s3_url; ?>" />
                      <span class="help"><?php echo $entry_themer_menulink; ?></span>
                </td>
                <td>
                <select name="themer_robokassa2">
                <option value="on" <?php if ($themer_robokassa2 == 'on') { echo 'selected=selected'; }?>><?php echo $text_on; ?></option>
                <option value="off"<?php if ($themer_robokassa2 != 'on'){ echo 'selected=selected'; }?>><?php echo $text_off; ?></option>
                </select>
                </td>
            </tr>
            <tr>
                <td style="width: 100px;"><img src="view/image/payment/american_express.png"/></td>
                <td style="width: 100px;"><span class="help">American Express</span></td>
                <td style="width: 100px;">
                      <input type="text" name="themer_custom_payment_s4_url" value="<?php echo $themer_custom_payment_s4_url; ?>" />
                      <span class="help"><?php echo $entry_themer_menulink; ?></span>
                </td>
                <td>
                <select name="themer_american_express">
                <option value="on" <?php if ($themer_american_express == 'on') { echo 'selected=selected'; }?>><?php echo $text_on; ?></option>
                <option value="off"<?php if ($themer_american_express != 'on'){ echo 'selected=selected'; }?>><?php echo $text_off; ?></option>
                </select>
                </td>
            </tr>
            <tr>
                <td style="width: 100px;"><img src="view/image/payment/mail_money.png"/></td>
                <td style="width: 100px;"><span class="help">Mail money</span></td>
                <td style="width: 100px;">
                      <input type="text" name="themer_custom_payment_s5_url" value="<?php echo $themer_custom_payment_s5_url; ?>" />
                      <span class="help"><?php echo $entry_themer_menulink; ?></span>
                </td>
                <td>
                <select name="themer_mail_money">
                <option value="on" <?php if ($themer_mail_money == 'on') { echo 'selected=selected'; }?>><?php echo $text_on; ?></option>
                <option value="off"<?php if ($themer_mail_money != 'on'){ echo 'selected=selected'; }?>><?php echo $text_off; ?></option>
                </select>
                </td>
            </tr>
            <tr>
                <td style="width: 100px;"><img src="view/image/payment/robokassa.png"/></td>
                <td style="width: 100px;"><span class="help">Robokassa</span></td>
                <td style="width: 100px;">
                      <input type="text" name="themer_custom_payment_s6_url" value="<?php echo $themer_custom_payment_s6_url; ?>" />
                      <span class="help"><?php echo $entry_themer_menulink; ?></span>
                </td>
                <td>
                <select name="themer_robokassa">
                <option value="on" <?php if ($themer_robokassa == 'on') { echo 'selected=selected'; }?>><?php echo $text_on; ?></option>
                <option value="off"<?php if ($themer_robokassa != 'on'){ echo 'selected=selected'; }?>><?php echo $text_off; ?></option>
                </select>
                </td>
            </tr>
            <tr>
                <td style="width: 100px;"><img src="view/image/payment/assist.png"/></td>
                <td style="width: 100px;"><span class="help">Assist</span></td>
                <td style="width: 100px;">
                      <input type="text" name="themer_custom_payment_s7_url" value="<?php echo $themer_custom_payment_s7_url; ?>" />
                      <span class="help"><?php echo $entry_themer_menulink; ?></span>
                </td>
                <td>
                <select name="themer_assist">
                <option value="on" <?php if ($themer_assist == 'on') { echo 'selected=selected'; }?>><?php echo $text_on; ?></option>
                <option value="off"<?php if ($themer_assist != 'on'){ echo 'selected=selected'; }?>><?php echo $text_off; ?></option>
                </select>
                </td>
            </tr>
            <tr>
                <td style="width: 100px;"><img src="view/image/payment/mastercard.png"/></td>
                <td style="width: 100px;"><span class="help">Mastercard</span></td>
                <td style="width: 100px;">
                      <input type="text" name="themer_custom_payment_s8_url" value="<?php echo $themer_custom_payment_s8_url; ?>" />
                      <span class="help"><?php echo $entry_themer_menulink; ?></span>
                </td>
                <td>
                <select name="themer_mastercard">
                <option value="on" <?php if ($themer_mastercard == 'on') { echo 'selected=selected'; }?>><?php echo $text_on; ?></option>
                <option value="off"<?php if ($themer_mastercard != 'on'){ echo 'selected=selected'; }?>><?php echo $text_off; ?></option>
                </select>
                </td>
            </tr>
            <tr>
                <td style="width: 100px;"><img src="view/image/payment/sberbank.png"/></td>
                <td style="width: 100px;"><span class="help">Sberbank</span></td>
                <td style="width: 100px;">
                      <input type="text" name="themer_custom_payment_s9_url" value="<?php echo $themer_custom_payment_s9_url; ?>" />
                      <span class="help"><?php echo $entry_themer_menulink; ?></span>
                </td>
                <td>
                <select name="themer_sberbank">
                <option value="on" <?php if ($themer_sberbank == 'on') { echo 'selected=selected'; }?>><?php echo $text_on; ?></option>
                <option value="off"<?php if ($themer_sberbank != 'on'){ echo 'selected=selected'; }?>><?php echo $text_off; ?></option>
                </select>
                </td>
            </tr>
            <tr>
                <td style="width: 100px;"><img src="view/image/payment/chronopay.png"/></td>
                <td style="width: 100px;"><span class="help">Chronopay</span></td>
                <td style="width: 100px;">
                      <input type="text" name="themer_custom_payment_s10_url" value="<?php echo $themer_custom_payment_s10_url; ?>" />
                      <span class="help"><?php echo $entry_themer_menulink; ?></span>
                </td>
                <td>
                <select name="themer_chronopay">
                <option value="on" <?php if ($themer_chronopay == 'on') { echo 'selected=selected'; }?>><?php echo $text_on; ?></option>
                <option value="off"<?php if ($themer_chronopay != 'on'){ echo 'selected=selected'; }?>><?php echo $text_off; ?></option>
                </select>
                </td>
            </tr>
            <tr>
                <td style="width: 100px;"><img src="view/image/payment/migom.png"/></td>
                <td style="width: 100px;"><span class="help">Migom</span></td>
                <td style="width: 100px;">
                      <input type="text" name="themer_custom_payment_s11_url" value="<?php echo $themer_custom_payment_s11_url; ?>" />
                      <span class="help"><?php echo $entry_themer_menulink; ?></span>
                </td>
                <td>
                <select name="themer_migom">
                <option value="on" <?php if ($themer_migom == 'on') { echo 'selected=selected'; }?>><?php echo $text_on; ?></option>
                <option value="off"<?php if ($themer_migom != 'on'){ echo 'selected=selected'; }?>><?php echo $text_off; ?></option>
                </select>
                </td>
            </tr>
            <tr>
                <td style="width: 100px;"><img src="view/image/payment/skrill_moneybookers.png"/></td>
                <td style="width: 100px;"><span class="help">Skrill moneybookers</span></td>
                <td style="width: 100px;">
                      <input type="text" name="themer_custom_payment_s12_url" value="<?php echo $themer_custom_payment_s12_url; ?>" />
                      <span class="help"><?php echo $entry_themer_menulink; ?></span>
                </td>
                <td>
                <select name="themer_skrill_moneybookers">
                <option value="on" <?php if ($themer_skrill_moneybookers == 'on') { echo 'selected=selected'; }?>><?php echo $text_on; ?></option>
                <option value="off"<?php if ($themer_skrill_moneybookers != 'on'){ echo 'selected=selected'; }?>><?php echo $text_off; ?></option>
                </select>
                </td>
            </tr>
            <tr>
                <td style="width: 100px;"><img src="view/image/payment/cirrus.png"/></td>
                <td style="width: 100px;"><span class="help">Cirrus</span></td>
                <td style="width: 100px;">
                      <input type="text" name="themer_custom_payment_s13_url" value="<?php echo $themer_custom_payment_s13_url; ?>" />
                      <span class="help"><?php echo $entry_themer_menulink; ?></span>
                </td>
                <td>
                <select name="themer_cirrus">
                <option value="on" <?php if ($themer_cirrus == 'on') { echo 'selected=selected'; }?>><?php echo $text_on; ?></option>
                <option value="off"<?php if ($themer_cirrus != 'on'){ echo 'selected=selected'; }?>><?php echo $text_off; ?></option>
                </select>
                </td>
            </tr>
            <tr>
                <td style="width: 100px;"><img src="view/image/payment/moneymail.png"/></td>
                <td style="width: 100px;"><span class="help">Moneymail</span></td>
                <td style="width: 100px;">
                      <input type="text" name="themer_custom_payment_s14_url" value="<?php echo $themer_custom_payment_s14_url; ?>" />
                      <span class="help"><?php echo $entry_themer_menulink; ?></span>
                </td>
                <td>
                <select name="themer_moneymail">
                <option value="on" <?php if ($themer_moneymail == 'on') { echo 'selected=selected'; }?>><?php echo $text_on; ?></option>
                <option value="off"<?php if ($themer_moneymail != 'on'){ echo 'selected=selected'; }?>><?php echo $text_off; ?></option>
                </select>
                </td>
            </tr>
            <tr>
                <td style="width: 100px;"><img src="view/image/payment/telemoney.png"/></td>
                <td style="width: 100px;"><span class="help">Telemoney</span></td>
                <td style="width: 100px;">
                      <input type="text" name="themer_custom_payment_s15_url" value="<?php echo $themer_custom_payment_s15_url; ?>" />
                      <span class="help"><?php echo $entry_themer_menulink; ?></span>
                </td>
                <td>
                <select name="themer_telemoney">
                <option value="on" <?php if ($themer_telemoney == 'on') { echo 'selected=selected'; }?>><?php echo $text_on; ?></option>
                <option value="off"<?php if ($themer_telemoney != 'on'){ echo 'selected=selected'; }?>><?php echo $text_off; ?></option>
                </select>
                </td>
            </tr>
            <tr>
                <td style="width: 100px;"><img src="view/image/payment/contact.png"/></td>
                <td style="width: 100px;"><span class="help">Contact</span></td>
                <td style="width: 100px;">
                      <input type="text" name="themer_custom_payment_s16_url" value="<?php echo $themer_custom_payment_s16_url; ?>" />
                      <span class="help"><?php echo $entry_themer_menulink; ?></span>
                </td>
                <td>
                <select name="themer_contact">
                <option value="on" <?php if ($themer_contact == 'on') { echo 'selected=selected'; }?>><?php echo $text_on; ?></option>
                <option value="off"<?php if ($themer_contact != 'on'){ echo 'selected=selected'; }?>><?php echo $text_off; ?></option>
                </select>
                </td>
            </tr>
            <tr>
                <td style="width: 100px;"><img src="view/image/payment/mts_bank.png"/></td>
                <td style="width: 100px;"><span class="help">Mts Bank</span></td>
                <td style="width: 100px;">
                      <input type="text" name="themer_custom_payment_s17_url" value="<?php echo $themer_custom_payment_s17_url; ?>" />
                      <span class="help"><?php echo $entry_themer_menulink; ?></span>
                </td>
                <td>
                <select name="themer_mts_bank">
                <option value="on" <?php if ($themer_mts_bank == 'on') { echo 'selected=selected'; }?>><?php echo $text_on; ?></option>
                <option value="off"<?php if ($themer_mts_bank != 'on'){ echo 'selected=selected'; }?>><?php echo $text_off; ?></option>
                </select>
                </td>
            </tr>
            <tr>
                <td style="width: 100px;"><img src="view/image/payment/unistream.png"/></td>
                <td style="width: 100px;"><span class="help">Unistream</span></td>
                <td style="width: 100px;">
                      <input type="text" name="themer_custom_payment_s18_url" value="<?php echo $themer_custom_payment_s18_url; ?>" />
                      <span class="help"><?php echo $entry_themer_menulink; ?></span>
                </td>
                <td>
                <select name="themer_unistream">
                <option value="on" <?php if ($themer_unistream == 'on') { echo 'selected=selected'; }?>><?php echo $text_on; ?></option>
                <option value="off"<?php if ($themer_unistream != 'on'){ echo 'selected=selected'; }?>><?php echo $text_off; ?></option>
                </select>
                </td>
            </tr>
            <tr>
                <td style="width: 100px;"><img src="view/image/payment/diners_club.png"/></td>
                <td style="width: 100px;"><span class="help">Diners club</span></td>
                <td style="width: 100px;">
                      <input type="text" name="themer_custom_payment_s19_url" value="<?php echo $themer_custom_payment_s19_url; ?>" />
                      <span class="help"><?php echo $entry_themer_menulink; ?></span>
                </td>
                <td>
                <select name="themer_diners_club">
                <option value="on" <?php if ($themer_diners_club == 'on') { echo 'selected=selected'; }?>><?php echo $text_on; ?></option>
                <option value="off"<?php if ($themer_diners_club != 'on'){ echo 'selected=selected'; }?>><?php echo $text_off; ?></option>
                </select>
                </td>
            </tr>
            <tr>
                <td style="width: 100px;"><img src="view/image/payment/paypal.png"/></td>
                <td style="width: 100px;"><span class="help">Paypal</span></td>
                <td style="width: 100px;">
                      <input type="text" name="themer_custom_payment_s20_url" value="<?php echo $themer_custom_payment_s20_url; ?>" />
                      <span class="help"><?php echo $entry_themer_menulink; ?></span>
                </td>
                <td>
                <select name="themer_paypal">
                <option value="on" <?php if ($themer_paypal == 'on') { echo 'selected=selected'; }?>><?php echo $text_on; ?></option>
                <option value="off"<?php if ($themer_paypal != 'on'){ echo 'selected=selected'; }?>><?php echo $text_off; ?></option>
                </select>
                </td>
            </tr>
            <tr>
                <td style="width: 100px;"><img src="view/image/payment/visa.png"/></td>
                <td style="width: 100px;"><span class="help">Visa</span></td>
                <td style="width: 100px;">
                      <input type="text" name="themer_custom_payment_s21_url" value="<?php echo $themer_custom_payment_s21_url; ?>" />
                      <span class="help"><?php echo $entry_themer_menulink; ?></span>
                </td>
                <td>
                <select name="themer_visa">
                <option value="on" <?php if ($themer_visa == 'on') { echo 'selected=selected'; }?>><?php echo $text_on; ?></option>
                <option value="off"<?php if ($themer_visa != 'on'){ echo 'selected=selected'; }?>><?php echo $text_off; ?></option>
                </select>
                </td>
            </tr>
            <tr>
                <td style="width: 100px;"><img src="view/image/payment/elecsnet.png"/></td>
                <td style="width: 100px;"><span class="help">Elecsnet</span></td>
                <td style="width: 100px;">
                      <input type="text" name="themer_custom_payment_s22_url" value="<?php echo $themer_custom_payment_s22_url; ?>" />
                      <span class="help"><?php echo $entry_themer_menulink; ?></span>
                </td>
                <td>
                <select name="themer_elecsnet">
                <option value="on" <?php if ($themer_elecsnet == 'on') { echo 'selected=selected'; }?>><?php echo $text_on; ?></option>
                <option value="off"<?php if ($themer_elecsnet != 'on'){ echo 'selected=selected'; }?>><?php echo $text_off; ?></option>
                </select>
                </td>
            </tr>
            <tr>
                <td style="width: 100px;"><img src="view/image/payment/payu.png"/></td>
                <td style="width: 100px;"><span class="help">Payu</span></td>
                <td style="width: 100px;">
                      <input type="text" name="themer_custom_payment_s23_url" value="<?php echo $themer_custom_payment_s23_url; ?>" />
                      <span class="help"><?php echo $entry_themer_menulink; ?></span>
                </td>
                <td>
                <select name="themer_payu">
                <option value="on" <?php if ($themer_payu == 'on') { echo 'selected=selected'; }?>><?php echo $text_on; ?></option>
                <option value="off"<?php if ($themer_payu != 'on'){ echo 'selected=selected'; }?>><?php echo $text_off; ?></option>
                </select>
                </td>
            </tr>        
            <tr>
                <td style="width: 100px;"><img src="view/image/payment/webmoney.png"/></td>
                <td style="width: 100px;"><span class="help">Webmoney</span></td>
                <td style="width: 100px;">
                      <input type="text" name="themer_custom_payment_s24_url" value="<?php echo $themer_custom_payment_s24_url; ?>" />
                      <span class="help"><?php echo $entry_themer_menulink; ?></span>
                </td>
                <td>
                <select name="themer_webmoney">
                <option value="on" <?php if ($themer_webmoney == 'on') { echo 'selected=selected'; }?>><?php echo $text_on; ?></option>
                <option value="off"<?php if ($themer_webmoney != 'on'){ echo 'selected=selected'; }?>><?php echo $text_off; ?></option>
                </select>
                </td>
            </tr>
            <tr>
                <td style="width: 100px;"><img src="view/image/payment/Intellectmoney.png"/></td>
                <td style="width: 100px;"><span class="help">Intellectmoney</span></td>
                <td style="width: 100px;">
                      <input type="text" name="themer_custom_payment_s25_url" value="<?php echo $themer_custom_payment_s25_url; ?>" />
                      <span class="help"><?php echo $entry_themer_menulink; ?></span>
                </td>
                <td>
                <select name="themer_Intellectmoney">
                <option value="on" <?php if ($themer_Intellectmoney == 'on') { echo 'selected=selected'; }?>><?php echo $text_on; ?></option>
                <option value="off"<?php if ($themer_Intellectmoney != 'on'){ echo 'selected=selected'; }?>><?php echo $text_off; ?></option>
                </select>
                </td>
            </tr>
            <tr>
                <td style="width: 100px;"><img src="view/image/payment/qiwi.png"/></td>
                <td style="width: 100px;"><span class="help">Qiwi</span></td>
                <td style="width: 100px;">
                      <input type="text" name="themer_custom_payment_s26_url" value="<?php echo $themer_custom_payment_s26_url; ?>" />
                      <span class="help"><?php echo $entry_themer_menulink; ?></span>
                </td>
                <td>
                <select name="themer_qiwi">
                <option value="on" <?php if ($themer_qiwi == 'on') { echo 'selected=selected'; }?>><?php echo $text_on; ?></option>
                <option value="off"<?php if ($themer_qiwi != 'on'){ echo 'selected=selected'; }?>><?php echo $text_off; ?></option>
                </select>
                </td>
            </tr>
            <tr>
                <td style="width: 100px;"><img src="view/image/payment/western_union.png"/></td>
                <td style="width: 100px;"><span class="help">Western union</span></td>
                <td style="width: 100px;">
                      <input type="text" name="themer_custom_payment_s27_url" value="<?php echo $themer_custom_payment_s27_url; ?>" />
                      <span class="help"><?php echo $entry_themer_menulink; ?></span>
                </td>
                <td>
                <select name="themer_western_union">
                <option value="on" <?php if ($themer_western_union == 'on') { echo 'selected=selected'; }?>><?php echo $text_on; ?></option>
                <option value="off"<?php if ($themer_western_union != 'on'){ echo 'selected=selected'; }?>><?php echo $text_off; ?></option>
                </select>
                </td>
            </tr>
            <tr>
                <td style="width: 100px;"><img src="view/image/payment/jcb.png"/></td>
                <td style="width: 100px;"><span class="help">JCB</span></td>
                <td style="width: 100px;">
                      <input type="text" name="themer_custom_payment_s28_url" value="<?php echo $themer_custom_payment_s28_url; ?>" />
                      <span class="help"><?php echo $entry_themer_menulink; ?></span>
                </td>
                <td>
                <select name="themer_jcb">
                <option value="on" <?php if ($themer_jcb == 'on') { echo 'selected=selected'; }?>><?php echo $text_on; ?></option>
                <option value="off"<?php if ($themer_jcb != 'on'){ echo 'selected=selected'; }?>><?php echo $text_off; ?></option>
                </select>
                </td>
            </tr>    
            <tr>
                <td style="width: 100px;"><img src="view/image/payment/rbk_money.png"/></td>
                <td style="width: 100px;"><span class="help">RBK money</span></td>
                <td style="width: 100px;">
                      <input type="text" name="themer_custom_payment_s29_url" value="<?php echo $themer_custom_payment_s29_url; ?>" />
                      <span class="help"><?php echo $entry_themer_menulink; ?></span>
                </td>
                <td>
                <select name="themer_rbk_money">
                <option value="on" <?php if ($themer_rbk_money == 'on') { echo 'selected=selected'; }?>><?php echo $text_on; ?></option>
                <option value="off"<?php if ($themer_rbk_money != 'on'){ echo 'selected=selected'; }?>><?php echo $text_off; ?></option>
                </select>
                </td>
            </tr>          
            <tr>
                <td style="width: 100px;"><img src="view/image/payment/yandex_money.png"/></td>
                <td style="width: 100px;"><span class="help">Yandex money</span></td>
                <td style="width: 100px;">
                      <input type="text" name="themer_custom_payment_s30_url" value="<?php echo $themer_custom_payment_s30_url; ?>" />
                      <span class="help"><?php echo $entry_themer_menulink; ?></span>
                </td>
                <td>
                <select name="themer_yandex_money">
                <option value="on" <?php if ($themer_yandex_money == 'on') { echo 'selected=selected'; }?>><?php echo $text_on; ?></option>
                <option value="off"<?php if ($themer_yandex_money != 'on'){ echo 'selected=selected'; }?>><?php echo $text_off; ?></option>
                </select>
                </td>
            </tr>

	<!-- 10 custom -->

            <tr>
                <td style="width: 100px;">
                  <div class="image">
                      <img src="<?php echo $logo1; ?>" alt="" id="themer_custom_payment_image1" />
                      <input type="hidden" name="themer_custom_payment_image1" value="<?php echo $themer_custom_payment_image1; ?>" id="logo1" />
                      <br />
                      <a onclick="image_upload('logo1', 'themer_custom_payment_image1');"><?php echo $text_browse; ?></a>&nbsp;&nbsp;|&nbsp;&nbsp;
                      <a onclick="$('#themer_custom_payment_image1').attr('src', '<?php echo $no_image; ?>'); $('#logo1').attr('value', '');"><?php echo $text_clear; ?></a>
                  </div>
                </td>
                <td style="width: 100px;">
                      <input type="text" name="themer_custom_payment_1_name" value="<?php echo $themer_custom_payment_1_name; ?>" />
                      <span class="help"><?php echo $entry_themer_menutext; ?></span>
                </td>
                <td style="width: 100px;">
                      <input type="text" name="themer_custom_payment_1_url" value="<?php echo $themer_custom_payment_1_url; ?>" />
                      <span class="help"><?php echo $entry_themer_menulink; ?></span>
                </td>
                <td>
                    <select name="themer_custom_payment_1">
                    <option value="on" <?php if ($themer_custom_payment_1 == 'on') { echo 'selected=selected'; }?>><?php echo $text_on; ?></option>
                    <option value="off"<?php if ($themer_custom_payment_1 != 'on'){ echo 'selected=selected'; }?>><?php echo $text_off; ?></option>
                    </select>
                    <span class="help">&nbsp;</span>
                </td>
            </tr>
            <tr>
                <td style="width: 100px;">
                  <div class="image">
                      <img src="<?php echo $logo2; ?>" alt="" id="themer_custom_payment_image2" />
                      <input type="hidden" name="themer_custom_payment_image2" value="<?php echo $themer_custom_payment_image2; ?>" id="logo2" />
                      <br />
                      <a onclick="image_upload('logo2', 'themer_custom_payment_image2');"><?php echo $text_browse; ?></a>&nbsp;&nbsp;|&nbsp;&nbsp;
                      <a onclick="$('#themer_custom_payment_image2').attr('src', '<?php echo $no_image; ?>'); $('#logo2').attr('value', '');"><?php echo $text_clear; ?></a>
                  </div>
                </td>
                <td style="width: 100px;">
                      <input type="text" name="themer_custom_payment_2_name" value="<?php echo $themer_custom_payment_2_name; ?>" />
                      <span class="help"><?php echo $entry_themer_menutext; ?></span>
                </td>
                <td style="width: 100px;">
                      <input type="text" name="themer_custom_payment_2_url" value="<?php echo $themer_custom_payment_2_url; ?>" />
                      <span class="help"><?php echo $entry_themer_menulink; ?></span>
                </td>
                <td>
                    <select name="themer_custom_payment_2">
                    <option value="on" <?php if ($themer_custom_payment_2 == 'on') { echo 'selected=selected'; }?>><?php echo $text_on; ?></option>
                    <option value="off"<?php if ($themer_custom_payment_2 != 'on'){ echo 'selected=selected'; }?>><?php echo $text_off; ?></option>
                    </select>
                    <span class="help">&nbsp;</span>
                </td>
            </tr>
            <tr>
                <td style="width: 100px;">
                  <div class="image">
                      <img src="<?php echo $logo3; ?>" alt="" id="themer_custom_payment_image3" />
                      <input type="hidden" name="themer_custom_payment_image3" value="<?php echo $themer_custom_payment_image3; ?>" id="logo3" />
                      <br />
                      <a onclick="image_upload('logo3', 'themer_custom_payment_image3');"><?php echo $text_browse; ?></a>&nbsp;&nbsp;|&nbsp;&nbsp;
                      <a onclick="$('#themer_custom_payment_image3').attr('src', '<?php echo $no_image; ?>'); $('#logo3').attr('value', '');"><?php echo $text_clear; ?></a>
                  </div>
                </td>
                <td style="width: 100px;">
                      <input type="text" name="themer_custom_payment_3_name" value="<?php echo $themer_custom_payment_3_name; ?>" />
                      <span class="help"><?php echo $entry_themer_menutext; ?></span>
                </td>
                <td style="width: 100px;">
                      <input type="text" name="themer_custom_payment_3_url" value="<?php echo $themer_custom_payment_3_url; ?>" />
                      <span class="help"><?php echo $entry_themer_menulink; ?></span>
                </td>
                <td>
                    <select name="themer_custom_payment_3">
                    <option value="on" <?php if ($themer_custom_payment_3 == 'on') { echo 'selected=selected'; }?>><?php echo $text_on; ?></option>
                    <option value="off"<?php if ($themer_custom_payment_3 != 'on'){ echo 'selected=selected'; }?>><?php echo $text_off; ?></option>
                    </select>
                    <span class="help">&nbsp;</span>
                </td>
            </tr>
            <tr>
                <td style="width: 100px;">
                  <div class="image">
                      <img src="<?php echo $logo4; ?>" alt="" id="themer_custom_payment_image4" />
                      <input type="hidden" name="themer_custom_payment_image4" value="<?php echo $themer_custom_payment_image4; ?>" id="logo4" />
                      <br />
                      <a onclick="image_upload('logo4', 'themer_custom_payment_image4');"><?php echo $text_browse; ?></a>&nbsp;&nbsp;|&nbsp;&nbsp;
                      <a onclick="$('#themer_custom_payment_image4').attr('src', '<?php echo $no_image; ?>'); $('#logo4').attr('value', '');"><?php echo $text_clear; ?></a>
                  </div>
                </td>
                <td style="width: 100px;">
                      <input type="text" name="themer_custom_payment_4_name" value="<?php echo $themer_custom_payment_4_name; ?>" />
                      <span class="help"><?php echo $entry_themer_menutext; ?></span>
                </td>
                <td style="width: 100px;">
                      <input type="text" name="themer_custom_payment_4_url" value="<?php echo $themer_custom_payment_4_url; ?>" />
                      <span class="help"><?php echo $entry_themer_menulink; ?></span>
                </td>
                <td>
                    <select name="themer_custom_payment_4">
                    <option value="on" <?php if ($themer_custom_payment_4 == 'on') { echo 'selected=selected'; }?>><?php echo $text_on; ?></option>
                    <option value="off"<?php if ($themer_custom_payment_4 != 'on'){ echo 'selected=selected'; }?>><?php echo $text_off; ?></option>
                    </select>
                    <span class="help">&nbsp;</span>
                </td>
            </tr>
            <tr>
                <td style="width: 100px;">
                  <div class="image">
                      <img src="<?php echo $logo5; ?>" alt="" id="themer_custom_payment_image5" />
                      <input type="hidden" name="themer_custom_payment_image5" value="<?php echo $themer_custom_payment_image5; ?>" id="logo5" />
                      <br />
                      <a onclick="image_upload('logo5', 'themer_custom_payment_image5');"><?php echo $text_browse; ?></a>&nbsp;&nbsp;|&nbsp;&nbsp;
                      <a onclick="$('#themer_custom_payment_image5').attr('src', '<?php echo $no_image; ?>'); $('#logo5').attr('value', '');"><?php echo $text_clear; ?></a>
                  </div>
                </td>
                <td style="width: 100px;">
                      <input type="text" name="themer_custom_payment_5_name" value="<?php echo $themer_custom_payment_5_name; ?>" />
                      <span class="help"><?php echo $entry_themer_menutext; ?></span>
                </td>
                <td style="width: 100px;">
                      <input type="text" name="themer_custom_payment_5_url" value="<?php echo $themer_custom_payment_5_url; ?>" />
                      <span class="help"><?php echo $entry_themer_menulink; ?></span>
                </td>
                <td>
                    <select name="themer_custom_payment_5">
                    <option value="on" <?php if ($themer_custom_payment_5 == 'on') { echo 'selected=selected'; }?>><?php echo $text_on; ?></option>
                    <option value="off"<?php if ($themer_custom_payment_5 != 'on'){ echo 'selected=selected'; }?>><?php echo $text_off; ?></option>
                    </select>
                    <span class="help">&nbsp;</span>
                </td>
            </tr>
            <tr>
                <td style="width: 100px;">
                  <div class="image">
                      <img src="<?php echo $logo6; ?>" alt="" id="themer_custom_payment_image6" />
                      <input type="hidden" name="themer_custom_payment_image6" value="<?php echo $themer_custom_payment_image6; ?>" id="logo6" />
                      <br />
                      <a onclick="image_upload('logo6', 'themer_custom_payment_image6');"><?php echo $text_browse; ?></a>&nbsp;&nbsp;|&nbsp;&nbsp;
                      <a onclick="$('#themer_custom_payment_image6').attr('src', '<?php echo $no_image; ?>'); $('#logo6').attr('value', '');"><?php echo $text_clear; ?></a>
                  </div>
                </td>
                <td style="width: 100px;">
                      <input type="text" name="themer_custom_payment_6_name" value="<?php echo $themer_custom_payment_6_name; ?>" />
                      <span class="help"><?php echo $entry_themer_menutext; ?></span>
                </td>
                <td style="width: 100px;">
                      <input type="text" name="themer_custom_payment_6_url" value="<?php echo $themer_custom_payment_6_url; ?>" />
                      <span class="help"><?php echo $entry_themer_menulink; ?></span>
                </td>
                <td>
                    <select name="themer_custom_payment_6">
                    <option value="on" <?php if ($themer_custom_payment_6 == 'on') { echo 'selected=selected'; }?>><?php echo $text_on; ?></option>
                    <option value="off"<?php if ($themer_custom_payment_6 != 'on'){ echo 'selected=selected'; }?>><?php echo $text_off; ?></option>
                    </select>
                    <span class="help">&nbsp;</span>
                </td>
            </tr>
            <tr>
                <td style="width: 100px;">
                  <div class="image">
                      <img src="<?php echo $logo7; ?>" alt="" id="themer_custom_payment_image7" />
                      <input type="hidden" name="themer_custom_payment_image7" value="<?php echo $themer_custom_payment_image7; ?>" id="logo7" />
                      <br />
                      <a onclick="image_upload('logo7', 'themer_custom_payment_image7');"><?php echo $text_browse; ?></a>&nbsp;&nbsp;|&nbsp;&nbsp;
                      <a onclick="$('#themer_custom_payment_image7').attr('src', '<?php echo $no_image; ?>'); $('#logo7').attr('value', '');"><?php echo $text_clear; ?></a>
                  </div>
                </td>
                <td style="width: 100px;">
                      <input type="text" name="themer_custom_payment_7_name" value="<?php echo $themer_custom_payment_7_name; ?>" />
                      <span class="help"><?php echo $entry_themer_menutext; ?></span>
                </td>
                <td style="width: 100px;">
                      <input type="text" name="themer_custom_payment_7_url" value="<?php echo $themer_custom_payment_7_url; ?>" />
                      <span class="help"><?php echo $entry_themer_menulink; ?></span>
                </td>
                <td>
                    <select name="themer_custom_payment_7">
                    <option value="on" <?php if ($themer_custom_payment_7 == 'on') { echo 'selected=selected'; }?>><?php echo $text_on; ?></option>
                    <option value="off"<?php if ($themer_custom_payment_7 != 'on'){ echo 'selected=selected'; }?>><?php echo $text_off; ?></option>
                    </select>
                    <span class="help">&nbsp;</span>
                </td>
            </tr>
            <tr>
                <td style="width: 100px;">
                  <div class="image">
                      <img src="<?php echo $logo8; ?>" alt="" id="themer_custom_payment_image8" />
                      <input type="hidden" name="themer_custom_payment_image8" value="<?php echo $themer_custom_payment_image8; ?>" id="logo8" />
                      <br />
                      <a onclick="image_upload('logo8', 'themer_custom_payment_image8');"><?php echo $text_browse; ?></a>&nbsp;&nbsp;|&nbsp;&nbsp;
                      <a onclick="$('#themer_custom_payment_image8').attr('src', '<?php echo $no_image; ?>'); $('#logo8').attr('value', '');"><?php echo $text_clear; ?></a>
                  </div>
                </td>
                <td style="width: 100px;">
                      <input type="text" name="themer_custom_payment_8_name" value="<?php echo $themer_custom_payment_8_name; ?>" />
                      <span class="help"><?php echo $entry_themer_menutext; ?></span>
                </td>
                <td style="width: 100px;">
                      <input type="text" name="themer_custom_payment_8_url" value="<?php echo $themer_custom_payment_8_url; ?>" />
                      <span class="help"><?php echo $entry_themer_menulink; ?></span>
                </td>
                <td>
                    <select name="themer_custom_payment_8">
                    <option value="on" <?php if ($themer_custom_payment_8 == 'on') { echo 'selected=selected'; }?>><?php echo $text_on; ?></option>
                    <option value="off"<?php if ($themer_custom_payment_8 != 'on'){ echo 'selected=selected'; }?>><?php echo $text_off; ?></option>
                    </select>
                    <span class="help">&nbsp;</span>
                </td>
            </tr>
            <tr>
                <td style="width: 100px;">
                  <div class="image">
                      <img src="<?php echo $logo9; ?>" alt="" id="themer_custom_payment_image9" />
                      <input type="hidden" name="themer_custom_payment_image9" value="<?php echo $themer_custom_payment_image9; ?>" id="logo9" />
                      <br />
                      <a onclick="image_upload('logo9', 'themer_custom_payment_image9');"><?php echo $text_browse; ?></a>&nbsp;&nbsp;|&nbsp;&nbsp;
                      <a onclick="$('#themer_custom_payment_image9').attr('src', '<?php echo $no_image; ?>'); $('#logo9').attr('value', '');"><?php echo $text_clear; ?></a>
                  </div>
                </td>
                <td style="width: 100px;">
                      <input type="text" name="themer_custom_payment_9_name" value="<?php echo $themer_custom_payment_9_name; ?>" />
                      <span class="help"><?php echo $entry_themer_menutext; ?></span>
                </td>
                <td style="width: 100px;">
                      <input type="text" name="themer_custom_payment_9_url" value="<?php echo $themer_custom_payment_9_url; ?>" />
                      <span class="help"><?php echo $entry_themer_menulink; ?></span>
                </td>
                <td>
                    <select name="themer_custom_payment_9">
                    <option value="on" <?php if ($themer_custom_payment_9 == 'on') { echo 'selected=selected'; }?>><?php echo $text_on; ?></option>
                    <option value="off"<?php if ($themer_custom_payment_9 != 'on'){ echo 'selected=selected'; }?>><?php echo $text_off; ?></option>
                    </select>
                    <span class="help">&nbsp;</span>
                </td>
            </tr>
            <tr>
                <td style="width: 100px;">
                  <div class="image">
                      <img src="<?php echo $logo10; ?>" alt="" id="themer_custom_payment_image10" />
                      <input type="hidden" name="themer_custom_payment_image10" value="<?php echo $themer_custom_payment_image10; ?>" id="logo10" />
                      <br />
                      <a onclick="image_upload('logo10', 'themer_custom_payment_image10');"><?php echo $text_browse; ?></a>&nbsp;&nbsp;|&nbsp;&nbsp;
                      <a onclick="$('#themer_custom_payment_image10').attr('src', '<?php echo $no_image; ?>'); $('#logo10').attr('value', '');"><?php echo $text_clear; ?></a>
                  </div>
                </td>
                <td style="width: 100px;">
                      <input type="text" name="themer_custom_payment_10_name" value="<?php echo $themer_custom_payment_10_name; ?>" />
                      <span class="help"><?php echo $entry_themer_menutext; ?></span>
                </td>
                <td style="width: 100px;">
                      <input type="text" name="themer_custom_payment_10_url" value="<?php echo $themer_custom_payment_10_url; ?>" />
                      <span class="help"><?php echo $entry_themer_menulink; ?></span>
                </td>
                <td>
                    <select name="themer_custom_payment_10">
                    <option value="on" <?php if ($themer_custom_payment_10 == 'on') { echo 'selected=selected'; }?>><?php echo $text_on; ?></option>
                    <option value="off"<?php if ($themer_custom_payment_10 != 'on'){ echo 'selected=selected'; }?>><?php echo $text_off; ?></option>
                    </select>
                    <span class="help">&nbsp;</span>
                </td>
            </tr>
          </table>
        </div>

        <!-- меню -->
        <div id="tab-menu">
          <!-- language tabs -->
          <div id="language_tabs" class="htabs">
            <?php foreach ($languages as $language) { ?>
              <a href="#language-tab-<?php echo $language['name']; ?>">
                <img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" style="vertical-align: top;" />
                <?php echo $language['name']; ?>
              </a>
            <?php } ?> 
          </div>

          <!-- layers -->
          <?php foreach ($languages as $language) { ?>
              <div id="language-tab-<?php echo $language['name']; ?>">
                <table class="form">
                <?php for ($i=1; $i <=20 ; $i++) { ?>
                   <tr>
                      <td style="width:20px;"><?php echo $i; ?></td>
                      <td> 
                          <input type="text" name="<?php echo 'themer_menu'.$i.$language['code']; ?>" 
                                            value="<?php echo ${'themer_menu'.$i.$language['code']}; ?>" />

                          <span class="help"><?php echo $entry_themer_menutext; ?></span>
                      </td>
                      <td>
                          <input type="text" name="<?php echo 'themer_link' . $i . $language['code']; ?>" 
                                            value="<?php echo ${'themer_link'.$i.$language['code']}; ?>" />

                          <span class="help"><?php echo $entry_themer_menulink; ?></span> 
                      </td>
                  </tr>
                <?php } ?>
                </table>

              </div>
          <?php } ?> 
        </div>

      </form>
    </div>
  </div>

<div style="color: #D43D3D;float: right;font-size: 14px;font-weight: 700;">AVA STORE v4.2 from <a target="_blank" href="https://opencartforum.com/user/18250-oldaine/">OldAine Design</a></div>

</div>

<!-- Загрузка изображений -->
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

<!-- Селектор -->
<script type="text/javascript">
<!--
$(document).ready(function() {
  $('#main_colors div').click(function() {
    $('#main_colors div').css('border','1px solid white');
    $(this).css('border','1px solid black');
    $('#main_colors input').attr('value', $(this).attr('id') );
  })
});
//-->
</script> 

<!-- Управление вкладками -->
<script type="text/javascript">
<!--
$('#tabs a').tabs();
$('#vtab-option a').tabs();
$('#language_tabs a').tabs();
//-->
</script> 

<!-- подсказки -->
<script type="text/javascript" src="view/javascript/jquery/easyTooltip.js"></script>

<style type="text/css">
  #easyTooltip{
   padding:5px;
   border:1px solid #ccc;
   background:#f1f1f1;
   box-shadow: 0px 0px 0px 10000px rgba(0, 0, 0, 0.4);
   z-index: 999;
}
.tooltip {
   vertical-align: middle;
}
</style>

<script type="text/javascript">
$(document).ready(function(){ 
  $("#tooltip1").easyTooltip({
    tooltipId: "easyTooltip",
    content: '<img src="view/image/ava-help/help-3.png">'
  });
});
$(document).ready(function(){ 
  $("#tooltip2").easyTooltip({
    tooltipId: "easyTooltip",
    content: '<img src="view/image/ava-help/help-13.png">'
  });
});
$(document).ready(function(){ 
  $("#tooltip3").easyTooltip({
    tooltipId: "easyTooltip",
    content: '<img src="view/image/ava-help/help-2.png">'
  });
});
$(document).ready(function(){ 
  $("#tooltip4").easyTooltip({
    tooltipId: "easyTooltip",
    content: '<img src="view/image/ava-help/help-5.png">'
  });
});
$(document).ready(function(){ 
  $("#tooltip5").easyTooltip({
    tooltipId: "easyTooltip",
    content: '<img src="view/image/ava-help/help-8.png">'
  });
});
$(document).ready(function(){ 
  $("#tooltip6").easyTooltip({
    tooltipId: "easyTooltip",
    content: '<img src="view/image/ava-help/help-4.png">'
  });
});
$(document).ready(function(){ 
  $("#tooltip7").easyTooltip({
    tooltipId: "easyTooltip",
    content: '<img src="view/image/ava-help/help-6.png">'
  });
});
$(document).ready(function(){ 
  $("#tooltip8").easyTooltip({
    tooltipId: "easyTooltip",
    content: '<img src="view/image/ava-help/help-9.png">'
  });
});
$(document).ready(function(){ 
  $("#tooltip9").easyTooltip({
    tooltipId: "easyTooltip",
    content: '<img src="view/image/ava-help/help-10.png">'
  });
});
$(document).ready(function(){ 
  $("#tooltip10").easyTooltip({
    tooltipId: "easyTooltip",
    content: '<img src="view/image/ava-help/help-1.png">'
  });
});
$(document).ready(function(){ 
  $("#tooltip11").easyTooltip({
    tooltipId: "easyTooltip",
    content: '<img src="view/image/ava-help/help-7.png">'
  });
});
$(document).ready(function(){ 
  $("#tooltip12").easyTooltip({
    tooltipId: "easyTooltip",
    content: '<img src="view/image/ava-help/help-12.png">'
  });
});
$(document).ready(function(){ 
  $("#tooltip13").easyTooltip({
    tooltipId: "easyTooltip",
    content: '<img src="view/image/ava-help/help-11.png">'
  });
});
</script>


<?php echo $footer; ?>