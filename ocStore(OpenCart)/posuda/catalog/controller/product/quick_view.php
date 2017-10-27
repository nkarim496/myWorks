<?php  class ControllerProductQuickView extends Controller {

	public function index() {
	
		$this->language->load('product/product');
		$data['button_cart'] = $this->language->get('button_cart');
		$data['text_select'] = $this->language->get('text_select');
			
		$data['qw_title'] = $this->language->get('qw_title');
		$data['qw_model'] = $this->language->get('qw_model');
		$data['qw_manufacturer'] = $this->language->get('qw_manufacturer');
		$data['qw_status'] = $this->language->get('qw_status');
		$data['button_cart_disabled'] = $this->language->get('button_cart_disabled');
		$data['text_weight'] = $this->language->get('text_weight');
		$data['text_stock'] = $this->language->get('text_stock');
		$data['text_manufacturer'] = $this->language->get('text_manufacturer');
		
		$settings = $this->config->get('fastfood_settings');
		$settings = $settings[$this->config->get('config_store_id')];
		$language_id = $this->config->get('config_language_id');
		
		if (isset($settings['show_stock'])) {
			$data['show_stock'] = $settings['show_stock'];
		}
		
		$this->load->model('catalog/product');
		$product_id = $this->request->get['id'];
		$product_info = $this->model_catalog_product->getProduct($product_id);
		
		$this->load->model('tool/image');

		if ($product_info['image']) {
			$data['thumb'] = $this->model_tool_image->resize($product_info['image'], 480, 440);
			$data['small'] = $this->model_tool_image->resize($product_info['image'], 50, 50);
		} else {
			$data['thumb'] = $this->model_tool_image->resize('no_image.jpg', 480, 440);
			$data['small'] = $this->model_tool_image->resize('no_image.jpg', 50, 50);
		}
		
		$data['images'] = array();
			
		$results = $this->model_catalog_product->getProductImages($product_id);
			
		foreach ($results as $result) {
			$data['images'][] = array(
				'thumb' => $this->model_tool_image->resize($result['image'], 480, 440),
				'small' => $this->model_tool_image->resize($result['image'],50, 50)
			);
		}
		
		if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
			$data['price'] = $this->currency->format($this->tax->calculate($product_info['price'], $product_info['tax_class_id'], $this->config->get('config_tax')));
		} else {
			$data['price'] = false;
		}
						
		if ((float)$product_info['special']) {
			$data['special'] = $this->currency->format($this->tax->calculate($product_info['special'], $product_info['tax_class_id'], $this->config->get('config_tax')));
		} else {
			$data['special'] = false;
		}
			
		if ($product_info['quantity'] <= 0) {
			$data['stock'] = $product_info['stock_status'];
		} elseif ($this->config->get('config_stock_display')) {
			$data['stock'] = $product_info['quantity'];
		} else {
			$data['stock'] = $this->language->get('text_instock');
		}
		
		$data['quantity'] = $product_info['quantity'];
			
		$discounts = $this->model_catalog_product->getProductDiscounts($product_id);
		
		$data['price_value'] = $product_info['price']*$this->currency->getValue();
        $data['special_value'] = $product_info['special']*$this->currency->getValue();
        $data['tax_value'] = (float)$product_info['special'] ? $product_info['special'] : $product_info['price'];

        $data['dicounts_unf'] = $discounts;

        $data['tax_class_id'] = $product_info['tax_class_id'];
        $data['tax_rates'] = $this->tax->getRates(0, $product_info['tax_class_id']);
			
		$data['options'] = array();

			foreach ($this->model_catalog_product->getProductOptions($product_id) as $option) {
				$product_option_value_data = array();

				foreach ($option['product_option_value'] as $option_value) {
					if (!$option_value['subtract'] || ($option_value['quantity'] > 0)) {
						if ((($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) && (float)$option_value['price']) {
							$price = $this->currency->format($this->tax->calculate($option_value['price'], $product_info['tax_class_id'], $this->config->get('config_tax') ? 'P' : false));
						} else {
							$price = false;
						}

						$product_option_value_data[] = array(
							'product_option_value_id' => $option_value['product_option_value_id'],
							'price_value'                   => $option_value['price'],
							'points_value'                  => intval($option_value['points_prefix'].$option_value['points']),
							'weight'                        => $option_value['weight'],
							'weight_prefix'                 => $option_value['weight_prefix'],
							'option_value_id'         => $option_value['option_value_id'],
							'name'                    => $option_value['name'],
							'image'                   => $this->model_tool_image->resize($option_value['image'], 50, 50),
							'price'                   => $price,
							'price_prefix'            => $option_value['price_prefix']
						);
					}
				}

				$data['options'][] = array(
					'product_option_id'    => $option['product_option_id'],
					'product_option_value' => $product_option_value_data,
					'option_id'            => $option['option_id'],
					'name'                 => $option['name'],
					'type'                 => $option['type'],
					'value'                => $option['value'],
					'required'             => $option['required']
				);
			}
		
		$data['weight_value'] = $product_info['weight'];
		$data['weight_unit'] = $this->weight->getUnit($product_info['weight_class_id']);

		$data['product_id'] = $product_id;
		$data['name'] = $product_info['name'];
		$data['href'] = $this->url->link('product/product&product_id=' . $product_id);
		$data['model'] = $product_info['model'];
		$data['minimum'] = $product_info['minimum'];
		$data['manufacturer'] = $product_info['manufacturer'];
		$data['manufacturers'] = $this->url->link('product/manufacturer/info', 'manufacturer_id=' . $product_info['manufacturer_id']);
		$data['description'] = utf8_substr(strip_tags(html_entity_decode($product_info['description'], ENT_QUOTES, 'UTF-8')), 0, 250);
		
		if ($product_info['weight'] > 0) {
			$data['weight'] = $this->weight->format($product_info['weight'], $product_info['weight_class_id'], $this->language->get('decimal_point'), $this->language->get('thousand_point'));
		} else {
			$data['weight'] = '';
		}
		
		$data['rating'] = (int)$product_info['rating'];

		$bestseller = $this->model_catalog_product->getBestSellerProductsNew($product_id);
				
		if ($bestseller > $settings['sticker_bestseller_item'] && isset($settings['sticker_bestseller'])) {
			$data['bestseller_sticker'] = true;
			$data['bestseller_sticker_text'] = $settings[$language_id]['sticker_bestseller_text'];
		} else {
			$data['bestseller_sticker'] = '';
			$data['bestseller_sticker_text'] = '';
		}
				
        $timestamp = time();
        $date_time_array = getdate($timestamp);
        $hours = $date_time_array['hours'];
        $minutes = $date_time_array['minutes'];
        $seconds = $date_time_array['seconds'];
        $month = $date_time_array['mon'];
        $day = $date_time_array['mday'];
        $year = $date_time_array['year'];
		$timestamp = mktime($hours,$minutes,$seconds,$month,$day - $settings['sticker_new_date'],$year);
        $date_now = strftime('%Y-%m-%d',$timestamp);
		$date = $product_info['date_available'];
				
		if ($date > $date_now && isset($settings['sticker_new'])) {
			$data['new_sticker'] = true;
			$data['new_sticker_text'] = $settings[$language_id]['sticker_new_text'];
		} else {
			$data['new_sticker'] = '';
			$data['new_sticker_text'] = '';
		}	
				
		if ($product_info['special'] && isset($settings['sticker_special'])) {
			$data['special_sticker'] = round((($product_info['special'] - $product_info['price'])/$product_info['price'])*100, 0) . '%';
		} else {
			$data['special_sticker'] = '';
		}
		
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/product/quick_view.tpl')) {
			$this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/product/quick_view.tpl', $data));
		} else {
			$this->response->setOutput($this->load->view('default/template/product/quick_view.tpl', $data));
		}
	}
}
?>