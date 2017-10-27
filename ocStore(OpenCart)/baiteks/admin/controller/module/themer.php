<?php
class ControllerModuleThemer extends Controller {
	private $error = array(); 

	public function index() {   
		$this->language->load('module/themer');

		$this->document->setTitle(strip_tags($this->language->get('heading_title')));

		$this->load->model('setting/setting');
		$this->document->addScript('view/javascript/jscolor/jscolor.js');

		// Обработка изображений 
		$this->load->model('tool/image');

		if (isset($this->request->post['themer_background_image'])) {
			$this->data['themer_background_image'] = $this->request->post['themer_background_image'];
		} else {
			$this->data['themer_background_image'] = $this->config->get('themer_background_image');			
		}

		if ($this->config->get('themer_background_image') && file_exists(DIR_IMAGE . $this->config->get('themer_background_image')) && is_file(DIR_IMAGE . $this->config->get('themer_background_image'))) {
			$this->data['logo'] = $this->model_tool_image->resize($this->config->get('themer_background_image'), 100, 100);		
		} else {
			$this->data['logo'] = $this->model_tool_image->resize('no_image.jpg', 100, 100);
		}

		// Обработка изображений платежной системы

		if (isset($this->request->post['themer_custom_payment_image1'])) {
			$this->data['themer_custom_payment_image1'] = $this->request->post['themer_custom_payment_image1'];
		} else {
			$this->data['themer_custom_payment_image1'] = $this->config->get('themer_custom_payment_image1');			
		}

		if ($this->config->get('themer_custom_payment_image1') && file_exists(DIR_IMAGE . $this->config->get('themer_custom_payment_image1')) && is_file(DIR_IMAGE . $this->config->get('themer_custom_payment_image1'))) {
			$this->data['logo1'] = $this->model_tool_image->resize($this->config->get('themer_custom_payment_image1'), 100, 100);		
		} else {
			$this->data['logo1'] = $this->model_tool_image->resize('no_image.jpg', 100, 100);
		}

		if (isset($this->request->post['themer_custom_payment_image2'])) {
			$this->data['themer_custom_payment_image2'] = $this->request->post['themer_custom_payment_image2'];
		} else {
			$this->data['themer_custom_payment_image2'] = $this->config->get('themer_custom_payment_image2');			
		}

		if ($this->config->get('themer_custom_payment_image2') && file_exists(DIR_IMAGE . $this->config->get('themer_custom_payment_image2')) && is_file(DIR_IMAGE . $this->config->get('themer_custom_payment_image2'))) {
			$this->data['logo2'] = $this->model_tool_image->resize($this->config->get('themer_custom_payment_image2'), 100, 100);		
		} else {
			$this->data['logo2'] = $this->model_tool_image->resize('no_image.jpg', 100, 100);
		}

		if (isset($this->request->post['themer_custom_payment_image3'])) {
			$this->data['themer_custom_payment_image3'] = $this->request->post['themer_custom_payment_image3'];
		} else {
			$this->data['themer_custom_payment_image3'] = $this->config->get('themer_custom_payment_image3');			
		}

		if ($this->config->get('themer_custom_payment_image3') && file_exists(DIR_IMAGE . $this->config->get('themer_custom_payment_image3')) && is_file(DIR_IMAGE . $this->config->get('themer_custom_payment_image3'))) {
			$this->data['logo3'] = $this->model_tool_image->resize($this->config->get('themer_custom_payment_image3'), 100, 100);		
		} else {
			$this->data['logo3'] = $this->model_tool_image->resize('no_image.jpg', 100, 100);
		}

		if (isset($this->request->post['themer_custom_payment_image4'])) {
			$this->data['themer_custom_payment_image4'] = $this->request->post['themer_custom_payment_image4'];
		} else {
			$this->data['themer_custom_payment_image4'] = $this->config->get('themer_custom_payment_image4');			
		}

		if ($this->config->get('themer_custom_payment_image4') && file_exists(DIR_IMAGE . $this->config->get('themer_custom_payment_image4')) && is_file(DIR_IMAGE . $this->config->get('themer_custom_payment_image4'))) {
			$this->data['logo4'] = $this->model_tool_image->resize($this->config->get('themer_custom_payment_image4'), 100, 100);		
		} else {
			$this->data['logo4'] = $this->model_tool_image->resize('no_image.jpg', 100, 100);
		}

		if (isset($this->request->post['themer_custom_payment_image5'])) {
			$this->data['themer_custom_payment_image5'] = $this->request->post['themer_custom_payment_image5'];
		} else {
			$this->data['themer_custom_payment_image5'] = $this->config->get('themer_custom_payment_image5');			
		}

		if ($this->config->get('themer_custom_payment_image5') && file_exists(DIR_IMAGE . $this->config->get('themer_custom_payment_image5')) && is_file(DIR_IMAGE . $this->config->get('themer_custom_payment_image5'))) {
			$this->data['logo5'] = $this->model_tool_image->resize($this->config->get('themer_custom_payment_image5'), 100, 100);		
		} else {
			$this->data['logo5'] = $this->model_tool_image->resize('no_image.jpg', 100, 100);
		}

		if (isset($this->request->post['themer_custom_payment_image6'])) {
			$this->data['themer_custom_payment_image6'] = $this->request->post['themer_custom_payment_image6'];
		} else {
			$this->data['themer_custom_payment_image6'] = $this->config->get('themer_custom_payment_image6');			
		}

		if ($this->config->get('themer_custom_payment_image6') && file_exists(DIR_IMAGE . $this->config->get('themer_custom_payment_image6')) && is_file(DIR_IMAGE . $this->config->get('themer_custom_payment_image6'))) {
			$this->data['logo6'] = $this->model_tool_image->resize($this->config->get('themer_custom_payment_image6'), 100, 100);		
		} else {
			$this->data['logo6'] = $this->model_tool_image->resize('no_image.jpg', 100, 100);
		}

		if (isset($this->request->post['themer_custom_payment_image7'])) {
			$this->data['themer_custom_payment_image7'] = $this->request->post['themer_custom_payment_image7'];
		} else {
			$this->data['themer_custom_payment_image7'] = $this->config->get('themer_custom_payment_image7');			
		}

		if ($this->config->get('themer_custom_payment_image7') && file_exists(DIR_IMAGE . $this->config->get('themer_custom_payment_image7')) && is_file(DIR_IMAGE . $this->config->get('themer_custom_payment_image7'))) {
			$this->data['logo7'] = $this->model_tool_image->resize($this->config->get('themer_custom_payment_image7'), 100, 100);		
		} else {
			$this->data['logo7'] = $this->model_tool_image->resize('no_image.jpg', 100, 100);
		}

		if (isset($this->request->post['themer_custom_payment_image8'])) {
			$this->data['themer_custom_payment_image8'] = $this->request->post['themer_custom_payment_image8'];
		} else {
			$this->data['themer_custom_payment_image8'] = $this->config->get('themer_custom_payment_image8');			
		}

		if ($this->config->get('themer_custom_payment_image8') && file_exists(DIR_IMAGE . $this->config->get('themer_custom_payment_image8')) && is_file(DIR_IMAGE . $this->config->get('themer_custom_payment_image8'))) {
			$this->data['logo8'] = $this->model_tool_image->resize($this->config->get('themer_custom_payment_image8'), 100, 100);		
		} else {
			$this->data['logo8'] = $this->model_tool_image->resize('no_image.jpg', 100, 100);
		}

		if (isset($this->request->post['themer_custom_payment_image9'])) {
			$this->data['themer_custom_payment_image9'] = $this->request->post['themer_custom_payment_image9'];
		} else {
			$this->data['themer_custom_payment_image9'] = $this->config->get('themer_custom_payment_image9');			
		}

		if ($this->config->get('themer_custom_payment_image9') && file_exists(DIR_IMAGE . $this->config->get('themer_custom_payment_image9')) && is_file(DIR_IMAGE . $this->config->get('themer_custom_payment_image9'))) {
			$this->data['logo9'] = $this->model_tool_image->resize($this->config->get('themer_custom_payment_image9'), 100, 100);		
		} else {
			$this->data['logo9'] = $this->model_tool_image->resize('no_image.jpg', 100, 100);
		}

		if (isset($this->request->post['themer_custom_payment_image10'])) {
			$this->data['themer_custom_payment_image10'] = $this->request->post['themer_custom_payment_image10'];
		} else {
			$this->data['themer_custom_payment_image10'] = $this->config->get('themer_custom_payment_image10');			
		}

		if ($this->config->get('themer_custom_payment_image10') && file_exists(DIR_IMAGE . $this->config->get('themer_custom_payment_image10')) && is_file(DIR_IMAGE . $this->config->get('themer_custom_payment_image10'))) {
			$this->data['logo10'] = $this->model_tool_image->resize($this->config->get('themer_custom_payment_image10'), 100, 100);		
		} else {
			$this->data['logo10'] = $this->model_tool_image->resize('no_image.jpg', 100, 100);
		}

		$this->data['no_image'] = $this->model_tool_image->resize('no_image.jpg', 100, 100);

		$this->data['token'] = $this->session->data['token'];
		
		// Обработка формы
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			$this->model_setting_setting->editSetting('themer', $this->request->post);		

			$this->session->data['success'] = $this->language->get('text_success');

			if(isset($this->request->post['save_continue']) and $this->request->post['save_continue']) {
				$this->redirect($this->url->link('module/themer', 'token=' . $this->session->data['token'], 'SSL'));
			} else {
				$this->redirect($this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'));
			}
		}



		// Свойства внешнего вида
		$design_settings = array(
			'themer_main_color',
	        'themer_background_color',
	        'themer_background_image',
	        'themer_custom_payment_image1',
          	'themer_custom_payment_image2',
          	'themer_custom_payment_image3',
	        'themer_custom_payment_image4',
          	'themer_custom_payment_image5',
          	'themer_custom_payment_image6',
	        'themer_custom_payment_image7',
          	'themer_custom_payment_image8',
          	'themer_custom_payment_image9',
	        'themer_custom_payment_image10',
	        'themer_background_pattern',
	        'themer_background_repeat',
	        'themer_background_position',
	        'themer_background_attachment',
	        'themer_shadow',
	        'themer_grid',
	        'themer_description',
	        'themer_buybuttons',
	        'themer_buttons',
	        'themer_css_block',
	        'themer_counters',
	        'themer_js_block',
	        'themer_search',
	        'themer_category_desc',
	        'themer_hide_currency',
	        'themer_hide_language',
	        'themer_product_tabs',
	        'themer_products_view',
	        'themer_cart_button',
	        'themer_subcategory_photo',
	        'themer_menu_category_photo',
	        'themer_left_right_column_categories_type'
        );

		// Свойства контактной информации
        $contact_information = array(
	        'themer_phone_number',
	        'themer_mobile_phone_number',
	        'themer_fax_number',
			'themer_email',
			'themer_map',
			'themer_skype',
			'themer_working_hours',
			'themer_copyright'
        );

        // Свойства социальных сетей
        $social_networks = array(
			'themer_facebook',
			'themer_twitter',
			'themer_google_plus',
			'themer_youtube',
			'themer_vimeo',
			'themer_vk',
			'themer_code',
			'themer_pinterest',
			'themer_tumblr',
			'themer_myworld',
			'themer_odnoklassniki',
			'themer_instagram'
        );

        $payment_systems = array(
			'themer_alfabank', 
			'themer_maestro',
			'themer_robokassa2',
			'themer_american_express',
			'themer_mail_money',
			'themer_robokassa',
			'themer_assist',
			'themer_mastercard',
			'themer_sberbank',
			'themer_chronopay',
			'themer_migom',
			'themer_skrill_moneybookers',
			'themer_cirrus',
			'themer_moneymail',
			'themer_telemoney',
			'themer_contact',
			'themer_mts_bank',
			'themer_unistream',
			'themer_diners_club',
			'themer_paypal',
			'themer_visa',
			'themer_elecsnet',
			'themer_payu',
			'themer_webmoney',
			'themer_Intellectmoney',
			'themer_qiwi',
			'themer_western_union',
			'themer_jcb',
			'themer_rbk_money',
			'themer_yandex_money',
      'themer_custom_payment_s1_url',
      'themer_custom_payment_s2_url',
      'themer_custom_payment_s3_url',
      'themer_custom_payment_s4_url',
      'themer_custom_payment_s5_url',
      'themer_custom_payment_s6_url',
      'themer_custom_payment_s7_url',
      'themer_custom_payment_s8_url',
      'themer_custom_payment_s9_url',
      'themer_custom_payment_s10_url',
      'themer_custom_payment_s11_url',
      'themer_custom_payment_s12_url',
      'themer_custom_payment_s13_url',
      'themer_custom_payment_s14_url',
      'themer_custom_payment_s15_url',
      'themer_custom_payment_s16_url',
      'themer_custom_payment_s17_url',
      'themer_custom_payment_s18_url',
      'themer_custom_payment_s19_url',
      'themer_custom_payment_s20_url',
      'themer_custom_payment_s21_url',
      'themer_custom_payment_s22_url',
      'themer_custom_payment_s23_url',
      'themer_custom_payment_s24_url',
      'themer_custom_payment_s25_url',
      'themer_custom_payment_s26_url',
      'themer_custom_payment_s27_url',
      'themer_custom_payment_s28_url',
      'themer_custom_payment_s29_url',
      'themer_custom_payment_s30_url',
			'themer_custom_payment_1',
			'themer_custom_payment_1_name',
			'themer_custom_payment_1_url',
			'themer_custom_payment_2',
			'themer_custom_payment_2_name',
			'themer_custom_payment_2_url',
			'themer_custom_payment_3',
			'themer_custom_payment_3_name',
			'themer_custom_payment_3_url',
			'themer_custom_payment_4',
			'themer_custom_payment_4_name',
			'themer_custom_payment_4_url',
			'themer_custom_payment_5',
			'themer_custom_payment_5_name',
			'themer_custom_payment_5_url',
			'themer_custom_payment_6',
			'themer_custom_payment_6_name',
			'themer_custom_payment_6_url',
      'themer_custom_payment_7',
			'themer_custom_payment_7_name',
			'themer_custom_payment_7_url',
			'themer_custom_payment_8',
			'themer_custom_payment_8_name',
			'themer_custom_payment_8_url',
			'themer_custom_payment_9',
			'themer_custom_payment_9_name',
			'themer_custom_payment_9_url',
			'themer_custom_payment_10',
			'themer_custom_payment_10_name',
			'themer_custom_payment_10_url'
        );
        
         $menu = array(
			'themer_menu1', 'themer_link1',
			'themer_menu2', 'themer_link2',
			'themer_menu3', 'themer_link3',
			'themer_menu4', 'themer_link4',
			'themer_menu5', 'themer_link5',
			'themer_menu6', 'themer_link6',
			'themer_menu7', 'themer_link7',
			'themer_menu8', 'themer_link8',
			'themer_menu9', 'themer_link9',
			'themer_menu10', 'themer_link10',
			'themer_menu11', 'themer_link11',
			'themer_menu12', 'themer_link12',
			'themer_menu13', 'themer_link13',
			'themer_menu14', 'themer_link14',
			'themer_menu15', 'themer_link15',
			'themer_menu16', 'themer_link16',
			'themer_menu17', 'themer_link17',
			'themer_menu18', 'themer_link18',
			'themer_menu19', 'themer_link19',
			'themer_menu20', 'themer_link20'
        );

        // Соединяем массивы
        $config_data = array_merge($design_settings, $contact_information, $social_networks, $payment_systems);

        // Основные цветовые схемы
        $this->data['main_colors'] = array('FF6666', 'CC3333', 'FFCC66', 'FF9933', '666699', '3399CC', '22B699', '20b2aa', 'FF9999', '999999'); 

        // Платежные системы
        $this->data['payment_systems'] = $payment_systems;

        // Обрабатываем свойства
        foreach ($config_data as $conf) {
            if (isset($this->request->post[$conf])) {
                $this->data[$conf] = $this->request->post[$conf];
            } else {
                $this->data[$conf] = $this->config->get($conf);
            }
        }

        // localisation

        $this->load->model('localisation/language');
		$languages = $this->model_localisation_language->getLanguages();

        foreach ($languages as $language) {
        	foreach ($menu as $item) {
        		if (isset($this->request->post[$item . $language['code']])) {
                	$this->data[$item . $language['code']] = $this->request->post[$item . $language['code']];
            	} else {
                	$this->data[$item . $language['code']] = $this->config->get($item . $language['code']);
            	}
        	}
        }

        // themer address

         foreach ($languages as $language) {
        	if (isset($this->request->post['themer_address' . $language['code']])) {
                $this->data['themer_address' . $language['code']] = $this->request->post['themer_address' . $language['code']];
            } else {
                $this->data['themer_address' . $language['code']] = $this->config->get('themer_address' . $language['code']);
            }

            if (isset($this->request->post['themer_working_hours' . $language['code']])) {
                $this->data['themer_working_hours' . $language['code']] = $this->request->post['themer_working_hours' . $language['code']];
            } else {
                $this->data['themer_working_hours' . $language['code']] = $this->config->get('themer_working_hours' . $language['code']);
            }
        }
    
		$this->data['languages'] = $languages;
        
        // Загрузка языковых значений
		$this->data['heading_title'] = $this->language->get('heading_title');
		$this->data['text_enabled'] = $this->language->get('text_enabled');
		$this->data['text_disabled'] = $this->language->get('text_disabled');
		$this->data['text_content_top'] = $this->language->get('text_content_top');
		$this->data['text_content_bottom'] = $this->language->get('text_content_bottom');
		$this->data['text_column_left'] = $this->language->get('text_column_left');
		$this->data['text_column_right'] = $this->language->get('text_column_right');
		$this->data['text_image_manager'] = $this->language->get('text_image_manager');
		$this->data['text_browse'] = $this->language->get('text_browse');
		$this->data['text_clear'] = $this->language->get('text_clear');
		$this->data['text_on'] = $this->language->get('text_on');
		$this->data['text_off'] = $this->language->get('text_off');
		$this->data['text_list'] = $this->language->get('text_list');
		$this->data['text_grid'] = $this->language->get('text_grid');
		$this->data['text_on_1'] = $this->language->get('text_on_1');
		$this->data['text_off_1'] = $this->language->get('text_off_1');
		$this->data['text_off_2'] = $this->language->get('text_off_2');
		$this->data['text_header'] = $this->language->get('text_header');
		$this->data['text_bottom'] = $this->language->get('text_bottom');
		$this->data['text_hidden'] = $this->language->get('text_hidden');
		$this->data['text_visible'] = $this->language->get('text_visible');
		$this->data['text_csspole'] = $this->language->get('text_csspole'); 

		// Tabs
		$this->data['tab_general_settings'] = $this->language->get('tab_general_settings');
		$this->data['tab_design_settings'] = $this->language->get('tab_design_settings');
		$this->data['tab_contact_information'] = $this->language->get('tab_contact_information');
		$this->data['tab_social_networks'] = $this->language->get('tab_social_networks');
		$this->data['tab_payment_systems'] = $this->language->get('tab_payment_systems');
		$this->data['tab_menu'] = $this->language->get('tab_menu');

		// Headlines
		$this->data['entry_themer_elements_headline'] 	= $this->language->get('entry_themer_elements_headline');
		$this->data['entry_themer_main_color_headline'] = $this->language->get('entry_themer_main_color_headline');
		$this->data['entry_themer_background_headline'] = $this->language->get('entry_themer_background_headline');

		// Design
		$this->data['entry_themer_main_color'] 	 		 = $this->language->get('entry_themer_main_color');
		$this->data['entry_themer_background_color'] 	 = $this->language->get('entry_themer_background_color');
		$this->data['entry_themer_background_image'] 	 = $this->language->get('entry_themer_background_image');
		$this->data['entry_themer_background_repeat'] 	 = $this->language->get('entry_themer_background_repeat');
		$this->data['entry_themer_background_position']	 = $this->language->get('entry_themer_background_position');
		$this->data['entry_themer_background_attachment']= $this->language->get('entry_themer_background_attachment');

		$this->data['entry_themer_shadow'] 	 		 	 = $this->language->get('entry_themer_shadow');
		$this->data['entry_themer_grid'] 	 		 	 = $this->language->get('entry_themer_grid');
		$this->data['entry_themer_buttons'] 	 		 = $this->language->get('entry_themer_buttons');
		$this->data['entry_themer_product_tabs'] 	     = $this->language->get('entry_themer_product_tabs');
		$this->data['entry_themer_products_view'] 	     = $this->language->get('entry_themer_products_view');
		$this->data['entry_themer_cart_button'] 	     = $this->language->get('entry_themer_cart_button');
		$this->data['entry_themer_css_block'] 	 		 = $this->language->get('entry_themer_css_block'); 
		$this->data['entry_themer_subcategory_photo'] 	 = $this->language->get('entry_themer_subcategory_photo'); 
		$this->data['entry_themer_menu_category_photo']  = $this->language->get('entry_themer_menu_category_photo');
		$this->data['entry_themer_counters'] 	 		 = $this->language->get('entry_themer_counters');
		$this->data['entry_themer_js_block'] 	 		 = $this->language->get('entry_themer_js_block');

		$this->data['entry_themer_left_right_column_categories_type'] = $this->language->get('entry_themer_left_right_column_categories_type');
		

		$this->data['entry_themer_hide_currency'] 	     = $this->language->get('entry_themer_hide_currency');
		$this->data['entry_themer_hide_language'] 	     = $this->language->get('entry_themer_hide_language');

		// Contacts
		$this->data['entry_themer_phone_number'] 	= $this->language->get('entry_themer_phone_number');
		$this->data['entry_themer_mobile_phone_number'] = $this->language->get('entry_themer_mobile_phone_number');
		$this->data['entry_themer_fax_number'] 		= $this->language->get('entry_themer_fax_number');
		$this->data['entry_themer_email'] 	 		= $this->language->get('entry_themer_email');
		$this->data['entry_themer_address'] 	 	= $this->language->get('entry_themer_address');
		$this->data['entry_themer_map'] 	 		= $this->language->get('entry_themer_map');
		$this->data['entry_themer_skype'] 	 		= $this->language->get('entry_themer_skype');
		$this->data['entry_themer_working_hours'] 	= $this->language->get('entry_themer_working_hours');
		$this->data['entry_themer_description'] 	= $this->language->get('entry_themer_description');
		$this->data['entry_themer_catdescription'] 	= $this->language->get('entry_themer_catdescription');
		$this->data['entry_themer_buybuttons'] 		= $this->language->get('entry_themer_buybuttons');
		$this->data['entry_themer_searchview'] 		= $this->language->get('entry_themer_searchview');
		$this->data['entry_themer_copyright'] 	 	= $this->language->get('entry_themer_copyright');

		// Social networks
		$this->data['entry_themer_facebook'] 		= $this->language->get('entry_themer_facebook');
		$this->data['entry_themer_twitter'] 		= $this->language->get('entry_themer_twitter');
		$this->data['entry_themer_google_plus']		= $this->language->get('entry_themer_google_plus');
		$this->data['entry_themer_flickr'] 			= $this->language->get('entry_themer_flickr');
		$this->data['entry_themer_linkedin'] 		= $this->language->get('entry_themer_linkedin');
		$this->data['entry_themer_myspace'] 		= $this->language->get('entry_themer_myspace');
		$this->data['entry_themer_youtube'] 		= $this->language->get('entry_themer_youtube');
		$this->data['entry_themer_vk'] 				= $this->language->get('entry_themer_vk');
		$this->data['entry_themer_pinterest'] 		= $this->language->get('entry_themer_pinterest');
		$this->data['entry_themer_tumblr'] 			= $this->language->get('entry_themer_tumblr');
		$this->data['entry_themer_myworld'] 		= $this->language->get('entry_themer_myworld');
		$this->data['entry_themer_odnoklassniki'] 	= $this->language->get('entry_themer_odnoklassniki');
		$this->data['entry_themer_socialcode'] 	 	= $this->language->get('entry_themer_socialcode');
		$this->data['entry_themer_instagram']		= $this->language->get('entry_themer_instagram');

		$this->data['entry_themer_accardeon']		= $this->language->get('entry_themer_accardeon');
		$this->data['entry_themer_standart']		= $this->language->get('entry_themer_standart');

		// Menu
		$this->data['entry_themer_menutext'] 		= $this->language->get('entry_themer_menutext');
		$this->data['entry_themer_menulink'] 		= $this->language->get('entry_themer_menulink');

		$this->data['entry_banner'] = $this->language->get('entry_banner');
		$this->data['entry_limit'] = $this->language->get('entry_limit');
		$this->data['entry_scroll'] = $this->language->get('entry_scroll');
		$this->data['entry_image'] = $this->language->get('entry_image');
		$this->data['entry_layout'] = $this->language->get('entry_layout');
		$this->data['entry_position'] = $this->language->get('entry_position');
		$this->data['entry_status'] = $this->language->get('entry_status');
		$this->data['entry_sort_order'] = $this->language->get('entry_sort_order');

		$this->data['button_save'] = $this->language->get('button_save');
		$this->data['button_save_continue'] = $this->language->get('button_save_continue');

		$this->data['button_cancel'] = $this->language->get('button_cancel');
		$this->data['button_add_module'] = $this->language->get('button_add_module');
		$this->data['button_remove'] = $this->language->get('button_remove');

 		if (isset($this->error['warning'])) {
			$this->data['error_warning'] = $this->error['warning'];
		} else {
			$this->data['error_warning'] = '';
		}

		// Устанавливаем хлебные крошки
  		$this->data['breadcrumbs'] = array();

   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => false
   		);

   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_module'),
			'href'      => $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => ' :: '
   		);

   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('module/themer', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => ' :: '
   		);

		$this->data['action'] = $this->url->link('module/themer', 'token=' . $this->session->data['token'], 'SSL');

		$this->data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');

		$this->data['modules'] = array();

		if (isset($this->request->post['themer_module'])) {
			$this->data['modules'] = $this->request->post['themer_module'];
		} elseif ($this->config->get('themer_module')) { 
			$this->data['modules'] = $this->config->get('themer_module');
		}

		$this->load->model('design/layout');

		$this->data['layouts'] = $this->model_design_layout->getLayouts();

		$this->load->model('design/banner');

		$this->data['banners'] = $this->model_design_banner->getBanners();

		$this->template = 'module/themer.tpl';
		$this->children = array(
			'common/header',
			'common/footer'
		);

		$this->response->setOutput($this->render());
	}

	protected function validate() {
		if (!$this->user->hasPermission('modify', 'module/themer')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		if (!$this->error) {
			return true;
		} else {
			return false;
		}	
	}
}
?>