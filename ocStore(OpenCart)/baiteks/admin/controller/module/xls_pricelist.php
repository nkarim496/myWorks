<?php
class ControllerModuleXlsPricelist extends Controller {
	private $error = array(); 
	
	public function index() {   
		$this->load->language('module/xls_pricelist');
		
		$this->document->addScript('view/javascript/jquery/jpicker/jpicker-1.1.6.min.js');
		$this->document->addStyle('view/javascript/jquery/jpicker/css/jPicker-1.1.6.min.css');
		$this->document->addStyle('view/javascript/jquery/jpicker/jPicker.css');
		
		$this->document->setTitle($this->language->get('heading_title'));
		
		$this->load->model('setting/setting');
		$this->load->model('catalog/category');
		$this->load->model('catalog/attribute_group');
		$this->load->model('sale/customer_group');
		$this->load->model('localisation/language');
				
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			
			if(isset($this->request->post['xls_pricelist_store'])){
				$this->request->post['xls_pricelist_store'] = implode("_", $this->request->post['xls_pricelist_store']);
			}else{
				$this->request->post['xls_pricelist_store'] = '';
			}
		
			if(isset($this->request->post['xls_pricelist_category'])){
				$this->request->post['xls_pricelist_category'] = implode("_", $this->request->post['xls_pricelist_category']);
			}else{
				$this->request->post['xls_pricelist_category'] = '';
			}
			
			if(isset($this->request->post['xls_pricelist_customer_group'])){
				$this->request->post['xls_pricelist_customer_group'] = implode("_", $this->request->post['xls_pricelist_customer_group']);
			}else{
				$this->request->post['xls_pricelist_customer_group'] = '';
			}
			
			if(isset($this->request->post['xls_pricelist_attribute_group'])){
				$this->request->post['xls_pricelist_attribute_group'] = implode("_", $this->request->post['xls_pricelist_attribute_group']);
			}else{
				$this->request->post['xls_pricelist_attribute_group'] = '';
			}
			
			
			
			$this->model_setting_setting->editSetting('xls_pricelist', $this->request->post);		
					
			$this->session->data['success'] = $this->language->get('text_success');
						
			$this->redirect($this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'));
		}
		
		$this->data['tab_general'] = $this->language->get('tab_general');
		$this->data['tab_data'] = $this->language->get('tab_data');
		$this->data['tab_option'] = $this->language->get('tab_option');
		$this->data['tab_image'] = $this->language->get('tab_image');
		$this->data['tab_design'] = $this->language->get('tab_design');
		
		$this->data['heading_title'] = $this->language->get('heading_title');

		$this->data['text_enabled'] = $this->language->get('text_enabled');
		$this->data['text_yes'] = $this->language->get('text_yes');
		$this->data['text_no'] = $this->language->get('text_no');
		$this->data['text_save'] = $this->language->get('text_save');
		$this->data['text_select_all'] = $this->language->get('text_select_all');
		$this->data['text_default'] = $this->language->get('text_default');
		$this->data['text_browse'] = $this->language->get('text_browse');
		$this->data['text_clear'] = $this->language->get('text_clear');	
		$this->data['text_image_manager'] = $this->language->get('text_image_manager');
		
		$this->data['entry_nodubles'] = $this->language->get('entry_nodubles');
		$this->data['entry_logo_dimensions'] = $this->language->get('entry_logo_dimensions');
		$this->data['entry_store'] = $this->language->get('entry_store');
		$this->data['entry_model'] = $this->language->get('entry_model');
		$this->data['entry_name'] = $this->language->get('entry_name');
		$this->data['entry_stock'] = $this->language->get('entry_stock');
		$this->data['entry_price'] = $this->language->get('entry_price');
		$this->data['entry_special'] = $this->language->get('entry_special');
		$this->data['entry_dimensions'] = $this->language->get('entry_dimensions');
		$this->data['entry_code'] = $this->language->get('entry_code');
		
		$this->data['entry_use_cache'] = $this->language->get('entry_use_cache');
		$this->data['entry_use_collapse'] = $this->language->get('entry_use_collapse');
		$this->data['entry_use_protection'] = $this->language->get('entry_use_protection');
		$this->data['entry_use_password'] = $this->language->get('entry_use_password');
		$this->data['entry_category'] = $this->language->get('entry_category');
		$this->data['entry_sort_order'] = $this->language->get('entry_sort_order');
		$this->data['entry_use_options'] = $this->language->get('entry_use_options');
		$this->data['entry_use_attributes'] = $this->language->get('entry_use_attributes');
		$this->data['entry_use_quantity'] = $this->language->get('entry_use_quantity');
		$this->data['entry_use_notinstock'] = $this->language->get('entry_use_notinstock');
		$this->data['entry_attribute_groups'] = $this->language->get('entry_attribute_groups');
		$this->data['entry_image_dimensions'] = $this->language->get('entry_image_dimensions');
		$this->data['entry_title'] = $this->language->get('entry_title');
		$this->data['entry_adress'] = $this->language->get('entry_adress');
		$this->data['entry_phone'] = $this->language->get('entry_phone');
		$this->data['entry_email'] = $this->language->get('entry_email');
		$this->data['entry_link'] = $this->language->get('entry_link');
		$this->data['entry_logo'] = $this->language->get('entry_logo');
		$this->data['entry_custom_text'] = $this->language->get('entry_custom_text');
		$this->data['entry_currency'] = $this->language->get('entry_currency');
		$this->data['entry_customer_group'] = $this->language->get('entry_customer_group');
		$this->data['entry_text_list'] = $this->language->get('entry_text_list');
		$this->data['entry_view'] = sprintf($this->language->get('entry_view'), HTTP_CATALOG.'index.php?route=product/xls_pricelist');
		$this->data['entry_for_all'] = $this->language->get('entry_for_all');
		$this->data['entry_memcache_warning'] = $this->language->get('entry_memcache_warning');
		$this->data['entry_colors'] = $this->language->get('entry_colors');
		$this->data['entry_color_text'] = $this->language->get('entry_color_text');
		$this->data['entry_color_bg'] = $this->language->get('entry_color_bg');
		$this->data['entry_thead_color'] = $this->language->get('entry_thead_color');
		$this->data['entry_underthead_color'] = $this->language->get('entry_underthead_color');
		$this->data['entry_category0_color'] = $this->language->get('entry_category0_color');
		$this->data['entry_category1_color'] = $this->language->get('entry_category1_color');
		$this->data['entry_category2_color'] = $this->language->get('entry_category2_color');
		$this->data['entry_image_color'] = $this->language->get('entry_image_color');
		$this->data['entry_model_color'] = $this->language->get('entry_model_color');
		$this->data['entry_name_color'] = $this->language->get('entry_name_color');
		$this->data['entry_stock_color'] = $this->language->get('entry_stock_color');
		$this->data['entry_price_color'] = $this->language->get('entry_price_color');
		$this->data['entry_special_color'] = $this->language->get('entry_special_color');
		
		$this->data['entry_poles'] = $this->language->get('entry_poles');
		$this->data['entry_pole_type'] = $this->language->get('entry_pole_type');
		$this->data['entry_pole_name'] = $this->language->get('entry_pole_name');
		$this->data['entry_category_link'] = $this->language->get('entry_category_link');
		$this->data['entry_product_link'] = $this->language->get('entry_product_link');
		$this->data['entry_alignment'] = $this->language->get('entry_alignment');
		
		
		
		$this->data['button_save'] = $this->language->get('button_save');
		$this->data['button_cancel'] = $this->language->get('button_cancel');
		$this->data['button_view'] = $this->language->get('button_view');
		$this->data['button_add'] = $this->language->get('button_add');
		$this->data['button_remove'] = $this->language->get('button_remove');
		
		$this->data['languages'] = $this->model_localisation_language->getLanguages();
		
		$this->load->model('setting/store');
		
		$this->data['stores'] = $this->model_setting_store->getStores();
		
		if (isset($this->request->post['product_store'])) {
			$this->data['product_store'] = $this->request->post['product_store'];
		} elseif (isset($this->request->get['product_id'])) {
			$this->data['product_store'] = $this->model_catalog_product->getProductStores($this->request->get['product_id']);
		} else {
			$this->data['product_store'] = array(0);
		}	
		
		$this->data['categories'] = $this->model_catalog_category->getCategories(0);
		
		$data = array(
			'start' => 0,
			'limit' => 100
		);
		$this->data['customer_groups'] = $this->model_sale_customer_group->getCustomerGroups($data);
		
		$this->data['attribute_groups'] = $this->model_catalog_attribute_group->getAttributeGroups(null);
		
		$this->data['poletypes'] = array(
			'name',
			'description',
			'model',
			'sku',
			'upc',
			'location',
			'quantity',
			'image',
			'manufacturer',
			'price',
			'special',
			'date_available',
			'weight',
			'length',
			'width',
			'height'
		);
		
		$this->data['alignments'] = array(
			'left'	=> $this->language->get('text_left'),
			'right'	=> $this->language->get('text_right'),
			'center'	=> $this->language->get('text_center'),
		);
		
		$this->data['sorts'] = array();
			
			$this->data['sorts'][] = array(
				'text'  => $this->language->get('text_default'),
				'value' => 'p.sort_order-ASC'
			);
			
			$this->data['sorts'][] = array(
				'text'  => $this->language->get('text_name_asc'),
				'value' => 'pd.name-ASC'
			);

			$this->data['sorts'][] = array(
				'text'  => $this->language->get('text_name_desc'),
				'value' => 'pd.name-DESC'
			);

			$this->data['sorts'][] = array(
				'text'  => $this->language->get('text_price_asc'),
				'value' => 'p.price-ASC'
			); 

			$this->data['sorts'][] = array(
				'text'  => $this->language->get('text_price_desc'),
				'value' => 'p.price-DESC'
			); 
			
			$this->data['sorts'][] = array(
				'text'  => $this->language->get('text_rating_desc'),
				'value' => 'rating-DESC'
			); 
			
			$this->data['sorts'][] = array(
				'text'  => $this->language->get('text_rating_asc'),
				'value' => 'rating-ASC'
			);
			
			$this->data['sorts'][] = array(
				'text'  => $this->language->get('text_model_asc'),
				'value' => 'p.model-ASC'
			);

			$this->data['sorts'][] = array(
				'text'  => $this->language->get('text_model_desc'),
				'value' => 'p.model-DESC'
			);
			
			$this->data['currencies']=array();
			$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "currency");
			
			foreach ($query->rows as $result) {
				$this->data['currencies'][] = array(
					'code'			=> $result['code'],
					'currency_id'   => $result['currency_id'],
					'title'         => $result['title'],
					'symbol_left'   => $result['symbol_left'],
					'symbol_right'  => $result['symbol_right'],
					'decimal_place' => $result['decimal_place'],
					'value'         => $result['value']
				); 
			}
			
			
		
 		if (isset($this->error['warning'])) {
			$this->data['error_warning'] = $this->error['warning'];
		} else {
			$this->data['error_warning'] = '';
		}
		
		if (isset($this->error['xls_pricelist_category'])) {
			$this->data['error_xls_pricelist_category'] = $this->error['xls_pricelist_category'];
		} else {
			$this->data['error_xls_pricelist_category'] = '';
		}
		
		if (isset($this->error['xls_pricelist_store'])) {
			$this->data['error_xls_pricelist_store'] = $this->error['xls_pricelist_store'];
		} else {
			$this->data['error_xls_pricelist_store'] = '';
		}
		
		if (isset($this->error['xls_pricelist_customer_group'])) {
			$this->data['error_xls_pricelist_customer_group'] = $this->error['xls_pricelist_customer_group'];
		} else {
			$this->data['error_xls_pricelist_customer_group'] = '';
		}
		
		if (isset($this->error['xls_pricelist_dimensions1'])) {
			$this->data['error_xls_pricelist_dimensions1'] = $this->error['xls_pricelist_dimensions1'];
		} else {
			$this->data['error_xls_pricelist_dimensions1'] = '';
		}
		
		if (isset($this->error['xls_pricelist_dimensions'])) {
			$this->data['error_xls_pricelist_dimensions'] = $this->error['xls_pricelist_dimensions'];
		} else {
			$this->data['error_xls_pricelist_dimensions'] = '';
		}
		
		
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
			'href'      => $this->url->link('module/xls_pricelist', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => ' :: '
   		);
		
		$this->data['action'] = $this->url->link('module/xls_pricelist', 'token=' . $this->session->data['token'], 'SSL');
		
		$this->data['view'] = HTTP_CATALOG.'index.php?route=product/xls_pricelist/view';
		
		$this->data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');
		
		$this->data['xls_pricelist_store'] = array();
		if (isset($this->request->post['xls_pricelist_store'])) {
			$this->data['xls_pricelist_store'] =  $this->request->post['xls_pricelist_store'];
		} else {
			$this->data['xls_pricelist_store'] = explode("_", $this->config->get('xls_pricelist_store'));
		}
		
		$this->data['xls_pricelist_category'] = array();
		if (isset($this->request->post['xls_pricelist_category'])) {
			$this->data['xls_pricelist_category'] =  $this->request->post['xls_pricelist_category'];
		} else {
			$this->data['xls_pricelist_category'] = explode("_", $this->config->get('xls_pricelist_category'));
		}

		$this->data['xls_pricelist_customer_group'] = array();
		if (isset($this->request->post['xls_pricelist_customer_group'])) {
			$this->data['xls_pricelist_customer_group'] = $this->request->post['xls_pricelist_customer_group'];
		} else {
			$this->data['xls_pricelist_customer_group'] = explode("_", $this->config->get('xls_pricelist_customer_group'));
		}
		
		$this->data['xls_pricelist_attribute_group'] = array();
		if (isset($this->request->post['xls_pricelist_attribute_group'])) {
			$this->data['xls_pricelist_attribute_group'] = $this->request->post['xls_pricelist_attribute_group'];
		} else {
			$this->data['xls_pricelist_attribute_group'] = explode("_", $this->config->get('xls_pricelist_attribute_group'));
		}
		
		$this->data['xls_pricelist_poles'] = array();
		if (isset($this->request->post['xls_pricelist_poles'])) {
			$this->data['xls_pricelist_poles'] = $this->request->post['xls_pricelist_poles'];
		} else {
			$this->data['xls_pricelist_poles'] = is_array($this->config->get('xls_pricelist_poles'))?$this->config->get('xls_pricelist_poles'):array();
		}
		
		if(!$this->data['xls_pricelist_poles']){
			$arr1=array();
			$arr2=array();
			$arr3=array();
			$arr4=array();
			$arr5=array();
			$arr6=array();
		
			foreach ($this->data['languages'] as $language) {
				switch ($language['code']) {
					case 'ru':
						$arr1[$language['language_id']]='изображение';
						$arr2[$language['language_id']]='наименование';
						$arr3[$language['language_id']]='модель';
						$arr4[$language['language_id']]='кол-во';
						$arr5[$language['language_id']]='цена';
						$arr6[$language['language_id']]='акция';
						break;
					case 'en':
						$arr1[$language['language_id']]='image';
						$arr2[$language['language_id']]='name';
						$arr3[$language['language_id']]='model';
						$arr4[$language['language_id']]='quantity';
						$arr5[$language['language_id']]='price';
						$arr6[$language['language_id']]='special';
						break;
					 default:
						$arr1[$language['language_id']]='';
						$arr2[$language['language_id']]='';
						$arr3[$language['language_id']]='';
						$arr4[$language['language_id']]='';
						$arr5[$language['language_id']]='';
						$arr6[$language['language_id']]='';
				}
				
			}
			
		
			$this->data['xls_pricelist_poles'] = Array (
				Array ( 'type' => 'image', 'name' => $arr1, 'dlina' => 15, 'alignment' => 'left', 'textcolor' => '000000', 'bgcolor' => ''),
				Array ( 'type' => 'name', 'name' => $arr2, 'dlina' => 75, 'alignment' => 'left', 'textcolor' => '000000', 'bgcolor' => ''),
				Array ( 'type' => 'model', 'name' => $arr3, 'dlina' => 15, 'alignment' => 'center', 'textcolor' => '000000', 'bgcolor' => ''),
				Array ( 'type' => 'quantity', 'name' => $arr4, 'dlina' => 15, 'alignment' => 'center', 'textcolor' => '000000', 'bgcolor' => ''),
				Array ( 'type' => 'price', 'name' => $arr5, 'dlina' => 15, 'alignment' => 'right', 'textcolor' => '007f00', 'bgcolor' => ''),
				Array ( 'type' => 'special', 'name' => $arr6, 'dlina' => 15, 'alignment' => 'right', 'textcolor' => 'ff0000', 'bgcolor' => '')
			);
		}
	
		
		if (isset($this->request->post['xls_pricelist_sort_order'])) {
			$this->data['xls_pricelist_sort_order'] = $this->request->post['xls_pricelist_sort_order'];
		} else {
			$this->data['xls_pricelist_sort_order'] = $this->config->get('xls_pricelist_sort_order');
		}
		
		
		
		if (isset($this->request->post['xls_pricelist_use_options'])) {
			$this->data['xls_pricelist_use_options'] = $this->request->post['xls_pricelist_use_options'];
		} else {
			$this->data['xls_pricelist_use_options'] = $this->config->get('xls_pricelist_use_options');
		}

		if (isset($this->request->post['xls_pricelist_use_attributes'])) {
			$this->data['xls_pricelist_use_attributes'] = $this->request->post['xls_pricelist_use_attributes'];
		} else {
			$this->data['xls_pricelist_use_attributes'] = $this->config->get('xls_pricelist_use_attributes');
		}
		
		if (isset($this->request->post['xls_pricelist_nodubles'])) {
			$this->data['xls_pricelist_nodubles'] = $this->request->post['xls_pricelist_nodubles'];
		} else {
			$this->data['xls_pricelist_nodubles'] = $this->config->get('xls_pricelist_nodubles');
		}
		
		if (isset($this->request->post['xls_pricelist_use_quantity'])) {
			$this->data['xls_pricelist_use_quantity'] = $this->request->post['xls_pricelist_use_quantity'];
		} else {
			$this->data['xls_pricelist_use_quantity'] = $this->config->get('xls_pricelist_use_quantity');
		}
		
		if (isset($this->request->post['xls_pricelist_use_notinstock'])) {
			$this->data['xls_pricelist_use_notinstock'] = $this->request->post['xls_pricelist_use_notinstock'];
		} else {
			$this->data['xls_pricelist_use_notinstock'] = $this->config->get('xls_pricelist_use_notinstock');
		}
		
		if (isset($this->request->post['xls_pricelist_image_width'])) {
			$this->data['xls_pricelist_image_width'] = $this->request->post['xls_pricelist_image_width'];
		} else {
			$this->data['xls_pricelist_image_width'] = $this->config->get('xls_pricelist_image_width');
		}
		
		if (isset($this->request->post['xls_pricelist_image_height'])) {
			$this->data['xls_pricelist_image_height'] = $this->request->post['xls_pricelist_image_height'];
		} else {
			$this->data['xls_pricelist_image_height'] = $this->config->get('xls_pricelist_image_height');
		}
		
		if (isset($this->request->post['xls_pricelist_logo_width'])) {
			$this->data['xls_pricelist_logo_width'] = $this->request->post['xls_pricelist_logo_width'];
		} else {
			$this->data['xls_pricelist_logo_width'] = $this->config->get('xls_pricelist_logo_width');
		}
		
		if (isset($this->request->post['xls_pricelist_logo_height'])) {
			$this->data['xls_pricelist_logo_height'] = $this->request->post['xls_pricelist_logo_height'];
		} else {
			$this->data['xls_pricelist_logo_height'] = $this->config->get('xls_pricelist_logo_height');
		}
		
		if (isset($this->request->post['xls_pricelist_description'])) {
			$this->data['xls_pricelist_description'] = $this->request->post['xls_pricelist_description'];
		} else {
			$this->data['xls_pricelist_description'] = $this->config->get('xls_pricelist_description');
		}
		
		if (isset($this->request->post['xls_pricelist_category_link'])) {
			$this->data['xls_pricelist_category_link'] = $this->request->post['xls_pricelist_category_link'];
		} else {
			$this->data['xls_pricelist_category_link'] = $this->config->get('xls_pricelist_category_link');
		}
		if (isset($this->request->post['xls_pricelist_product_link'])) {
			$this->data['xls_pricelist_product_link'] = $this->request->post['xls_pricelist_product_link'];
		} else {
			$this->data['xls_pricelist_product_link'] = $this->config->get('xls_pricelist_product_link');
		}
		
		if (isset($this->request->post['xls_pricelist_view'])) {
			$this->data['xls_pricelist_view'] = $this->request->post['xls_pricelist_view'];
		} else {
			$this->data['xls_pricelist_view'] = $this->config->get('xls_pricelist_view');
		}
		
		if (isset($this->request->post['xls_pricelist_usecache'])) {
			$this->data['xls_pricelist_usecache'] = $this->request->post['xls_pricelist_usecache'];
		} else {
			$this->data['xls_pricelist_usecache'] = $this->config->get('xls_pricelist_usecache');
		}
		
		if (isset($this->request->post['xls_pricelist_memcacheServer'])) {
			$this->data['xls_pricelist_memcacheServer'] = $this->request->post['xls_pricelist_memcacheServer'];
		} else {
			$this->data['xls_pricelist_memcacheServer'] = $this->config->get('xls_pricelist_memcacheServer')?$this->config->get('xls_pricelist_memcacheServer'):'localhost';
		}
		
		if (isset($this->request->post['xls_pricelist_memcachePort'])) {
			$this->data['xls_pricelist_memcachePort'] = (int)$this->request->post['xls_pricelist_memcachePort'];
		} else {
			$this->data['xls_pricelist_memcachePort'] = $this->config->get('xls_pricelist_memcachePort')?$this->config->get('xls_pricelist_memcachePort'):'11211';
		}
		
		if (isset($this->request->post['xls_pricelist_cacheTime'])) {
			$this->data['xls_pricelist_cacheTime'] = (int)$this->request->post['xls_pricelist_cacheTime'];
		} else {
			$this->data['xls_pricelist_cacheTime'] = $this->config->get('xls_pricelist_cacheTime')?$this->config->get('xls_pricelist_cacheTime'):'600';
		}
		
		
		
		if (isset($this->request->post['xls_pricelist_use_collapse'])) {
			$this->data['xls_pricelist_use_collapse'] = $this->request->post['xls_pricelist_use_collapse'];
		} else {
			$this->data['xls_pricelist_use_collapse'] = $this->config->get('xls_pricelist_use_collapse');
		}
		if (isset($this->request->post['xls_pricelist_use_protection'])) {
			$this->data['xls_pricelist_use_protection'] = $this->request->post['xls_pricelist_use_protection'];
		} else {
			$this->data['xls_pricelist_use_protection'] = $this->config->get('xls_pricelist_use_protection');
		}
		if (isset($this->request->post['xls_pricelist_use_password'])) {
			$this->data['xls_pricelist_use_password'] = $this->request->post['xls_pricelist_use_password'];
		} else {
			$this->data['xls_pricelist_use_password'] = $this->config->get('xls_pricelist_use_password');
		}
		if (isset($this->request->post['xls_pricelist_code'])) {
			$this->data['xls_pricelist_code'] = $this->request->post['xls_pricelist_code'];
		} else {
			$this->data['xls_pricelist_code'] = $this->config->get('xls_pricelist_code');
		}
		
		
		
		if (isset($this->request->post['xls_pricelist_model_width'])) {
			$this->data['xls_pricelist_model_width'] = $this->request->post['xls_pricelist_model_width'];
		} else {
			$this->data['xls_pricelist_model_width'] = ($this->config->get('xls_pricelist_model_width')!='')?$this->config->get('xls_pricelist_model_width'):15;
		}
		
		if (isset($this->request->post['xls_pricelist_name_width'])) {
			$this->data['xls_pricelist_name_width'] = $this->request->post['xls_pricelist_name_width'];
		} else {
			$this->data['xls_pricelist_name_width'] = ($this->config->get('xls_pricelist_name_width')!='')?$this->config->get('xls_pricelist_name_width'):75;
		}
		
		if (isset($this->request->post['xls_pricelist_stock_width'])) {
			$this->data['xls_pricelist_stock_width'] = $this->request->post['xls_pricelist_stock_width'];
		} else {
			$this->data['xls_pricelist_stock_width'] = ($this->config->get('xls_pricelist_stock_width')!='')?$this->config->get('xls_pricelist_stock_width'):15;
		}
		
		if (isset($this->request->post['xls_pricelist_price_width'])) {
			$this->data['xls_pricelist_price_width'] = $this->request->post['xls_pricelist_price_width'];
		} else {
			$this->data['xls_pricelist_price_width'] = ($this->config->get('xls_pricelist_price_width')!='')?$this->config->get('xls_pricelist_price_width'):15;
		}
		
		if (isset($this->request->post['xls_pricelist_special_width'])) {
			$this->data['xls_pricelist_special_width'] = $this->request->post['xls_pricelist_special_width'];
		} else {
			$this->data['xls_pricelist_special_width'] = ($this->config->get('xls_pricelist_special_width')!='')?$this->config->get('xls_pricelist_special_width'):15;
		}
		
		if (isset($this->request->post['xls_pricelist_thead_color'])) {
			$this->data['xls_pricelist_thead_color'] = $this->request->post['xls_pricelist_thead_color'];
		} else {
			$this->data['xls_pricelist_thead_color'] = $this->config->get('xls_pricelist_thead_color');
		}
		if (isset($this->request->post['xls_pricelist_colors'])) {
			$this->data['xls_pricelist_colors'] = $this->request->post['xls_pricelist_colors'];
		} else {
			$this->data['xls_pricelist_colors'] = $this->config->get('xls_pricelist_colors');
		}
		if(!$this->data['xls_pricelist_colors']){
			$this->data['xls_pricelist_colors'] = array(
				'thead'			=> '000000',
				'thead_bg'		=> '',
				'underthead_bg'	=> '808080',
				'category0'		=> 'FFFFFF',
				'category0_bg'	=> '000000',
				'category1'		=> '000000',
				'category1_bg'	=> 'CCFFCC',
				'category2'		=> '000000',
				'category2_bg'	=> 'FFFF99',
				'image_bg'		=> '',
				'model'		=> '000000',
				'model_bg'		=> '',
				'name'		=> '000000',
				'name_bg'		=> '',
				'stock'		=> '000000',
				'stock_bg'		=> '',
				'price'		=> '000000',
				'price_bg'		=> '',
				'special'		=> 'FF0000',
				'special_bg'		=> ''
			);
		}
		
		
		$this->load->model('tool/image');
		
		if (isset($this->request->post['xls_pricelist_logo'])) {
			$this->data['xls_pricelist_logo'] = $this->request->post['xls_pricelist_logo'];
		} else {
			$this->data['xls_pricelist_logo'] = $this->config->get('xls_pricelist_logo');			
		}

		if ($this->config->get('xls_pricelist_logo') && file_exists(DIR_IMAGE . $this->config->get('xls_pricelist_logo')) && is_file(DIR_IMAGE . $this->config->get('config_logo'))) {
			$this->data['logo'] = $this->model_tool_image->resize($this->config->get('xls_pricelist_logo'), 100, 100);		
		} else {
			$this->data['logo'] = $this->model_tool_image->resize('no_image.jpg', 100, 100);
		}
		
		$this->data['no_image'] = $this->model_tool_image->resize('no_image.jpg', 100, 100);
		
		$this->data['token'] = $this->session->data['token'];
		
		
		
		
		$this->template = 'module/xls_pricelist.tpl';
		$this->children = array(
			'common/header',
			'common/footer'
		);
				
		$this->response->setOutput($this->render());
	}
	
	private function validate() {
		if (!$this->user->hasPermission('modify', 'module/xls_pricelist')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}
		
		if (!isset($this->request->post['xls_pricelist_store'])||!$this->request->post['xls_pricelist_store']) {
			$this->error['xls_pricelist_store'] = $this->language->get('error_xls_pricelist_store');
		}
		
		if (!isset($this->request->post['xls_pricelist_category'])||!$this->request->post['xls_pricelist_category']) {
			$this->error['xls_pricelist_category'] = $this->language->get('error_xls_pricelist_category');
		}
		
		if (!isset($this->request->post['xls_pricelist_customer_group'])||!$this->request->post['xls_pricelist_customer_group']) {
			$this->error['xls_pricelist_customer_group'] = $this->language->get('error_xls_pricelist_customer_group');
		}
		
		if(isset($this->request->post['xls_pricelist_image_width'])&&(int)$this->request->post['xls_pricelist_image_width']>200){
			$this->error['xls_pricelist_dimensions'] = $this->language->get('error_xls_pricelist_dimensions');
		}
		
		if(isset($this->request->post['xls_pricelist_image_height'])&&(int)$this->request->post['xls_pricelist_image_height']>200){
			$this->error['xls_pricelist_dimensions'] = $this->language->get('error_xls_pricelist_dimensions');
		}
		
		if(isset($this->request->post['xls_pricelist_logo_width'])&&(int)$this->request->post['xls_pricelist_logo_width']>200){
			$this->error['xls_pricelist_dimensions1'] = $this->language->get('error_xls_pricelist_dimensions');
		}
		
		if(isset($this->request->post['xls_pricelist_logo_height'])&&(int)$this->request->post['xls_pricelist_logo_height']>200){
			$this->error['xls_pricelist_dimensions1'] = $this->language->get('error_xls_pricelist_dimensions');
		}
		
		if (isset($this->request->post['xls_pricelist_memcacheServer'])&&$this->request->post['xls_pricelist_memcacheServer']=='') {
			$this->request->post['xls_pricelist_memcacheServer'] = 'localhost';
		} 
		
		if (isset($this->request->post['xls_pricelist_memcachePort'])&&(int)$this->request->post['xls_pricelist_memcachePort']==0) {
			$this->request->post['xls_pricelist_memcachePort'] = 11211;
		}
		
		if (isset($this->request->post['xls_pricelist_cacheTime'])&&(int)$this->request->post['xls_pricelist_cacheTime']==0) {
			$this->request->post['xls_pricelist_cacheTime'] = 600;
		}
		
		if (isset($this->request->post['xls_pricelist_model_width'])&&(int)$this->request->post['xls_pricelist_model_width']<0) {
			$this->request->post['xls_pricelist_model_width'] = 15;
		}
		
		if (isset($this->request->post['xls_pricelist_name_width'])&&(int)$this->request->post['xls_pricelist_name_width']<0) {
			$this->request->post['xls_pricelist_name_width'] = 75;
		}
		
		if (isset($this->request->post['xls_pricelist_stock_width'])&&(int)$this->request->post['xls_pricelist_stock_width']<0) {
			$this->request->post['xls_pricelist_stock_width'] = 15;
		}
		
		if (isset($this->request->post['xls_pricelist_price_width'])&&(int)$this->request->post['xls_pricelist_price_width']<0) {
			$this->request->post['xls_pricelist_price_width'] = 15;
		}
		
		if (isset($this->request->post['xls_pricelist_special_width'])&&(int)$this->request->post['xls_pricelist_special_width']<0) {
			$this->request->post['xls_pricelist_special_width'] = 15;
		}
		
		if (!$this->error) {
			return true;
		} else {
			return false;
		}	
	}
}
?>