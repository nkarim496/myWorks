<?php
class ControllerModuleBestSeller extends Controller {
	public function index($setting) {
		$this->load->language('module/bestseller');

		$data['heading_title'] = $this->language->get('heading_title');

			$this->language->load('product/product');
			$data['button_wishlist'] = $this->language->get('button_wishlist');
			$data['button_compare'] = $this->language->get('button_compare');
			

		$data['text_tax'] = $this->language->get('text_tax');

		$data['button_cart'] = $this->language->get('button_cart');
		$data['button_wishlist'] = $this->language->get('button_wishlist');
		$data['button_compare'] = $this->language->get('button_compare');

		$this->load->model('catalog/product');

		$this->load->model('tool/image');

		$data['products'] = array();

		$results = $this->model_catalog_product->getBestSellerProducts($setting['limit']);

		if ($results) {
			foreach ($results as $result) {
				if ($result['image']) {
					$image = $this->model_tool_image->resize($result['image'], $setting['width'], $setting['height']);
				} else {
					$image = $this->model_tool_image->resize('placeholder.png', $setting['width'], $setting['height']);
				}

				if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
					$price = $this->currency->format($this->tax->calculate($result['price'], $result['tax_class_id'], $this->config->get('config_tax')));
				} else {
					$price = false;
				}

				if ((float)$result['special']) {
					$special = $this->currency->format($this->tax->calculate($result['special'], $result['tax_class_id'], $this->config->get('config_tax')));
				} else {
					$special = false;
				}

				if ($this->config->get('config_tax')) {
					$tax = $this->currency->format((float)$result['special'] ? $result['special'] : $result['price']);
				} else {
					$tax = false;
				}

				if ($this->config->get('config_review_status')) {
					$rating = $result['rating'];
				} else {
					$rating = false;
				}


			$settings = $this->config->get('fastfood_settings');
			$settings = $settings[$this->config->get('config_store_id')];
			$language_id = $this->config->get('config_language_id');
			
			if (VERSION <= 2.2) {
				$currency = $this->session->data['currency'];
			} else {
				$currency = '';
			}
			
			$data['button_cart_disabled'] = $this->language->get('button_cart_disabled');
			
			if (isset($product_info)) {
				$result = $product_info;
			} else {
				$result = $result;
			}
			
			if (isset($settings['show_quantity'])) {
				$data['show_quantity'] = $settings['show_quantity'];
			} else {
				$data['show_quantity'] = '';
			}
			
			if ($result['weight'] > 0) {
				$weight = $this->weight->format($result['weight'], $result['weight_class_id'], $this->language->get('decimal_point'), $this->language->get('thousand_point'));
			} else {
				$weight = '';
			}
			
			$data['show_options'] = '';
			$options = array();
			if (isset($settings['show_options'])) {
				$data['show_options'] = $settings['show_options'];
				$data['show_options_item'] = $settings['show_options_item'];

			foreach ($this->model_catalog_product->getProductOptions($result['product_id']) as $option) {
				$product_option_value_data = array();

				foreach ($option['product_option_value'] as $option_value) {
					if (!$option_value['subtract'] || ($option_value['quantity'] > 0)) {
						if ((($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) && (float)$option_value['price']) {
							$option_price = $this->currency->format($this->tax->calculate($option_value['price'], $result['tax_class_id'], $this->config->get('config_tax') ? 'P' : false), $currency);
						} else {
							$option_price = false;
						}

						$product_option_value_data[] = array(
							'product_option_value_id' => $option_value['product_option_value_id'],
							'option_value_id'         => $option_value['option_value_id'],
							'name'                    => $option_value['name'],
							'image'                   => $this->model_tool_image->resize($option_value['image'], 50, 50),
							'price'                   => $option_price,
							'price_value'			  => $option_value['price'],
							'price_prefix'            => $option_value['price_prefix']
						);
					}
				}
				if(isset($settings['show_options_req'])) {
					if($option['required']) {
						$options[] = array(
							'product_option_id'    => $option['product_option_id'],
							'product_option_value' => $product_option_value_data,
							'option_id'            => $option['option_id'],
							'name'                 => $option['name'],
							'type'                 => $option['type'],
							'value'                => $option['value'],
							'required'             => $option['required']
						);
					}
				} else {
					$options[] = array(
						'product_option_id'    => $option['product_option_id'],
						'product_option_value' => $product_option_value_data,
						'option_id'            => $option['option_id'],
						'name'                 => $option['name'],
						'type'                 => $option['type'],
						'value'                => $option['value'],
						'required'             => $option['required']
					);
				}
			}
			}
			
			$stickers = array();
			
			$bestseller = $this->model_catalog_product->getBestSellerProductsNew($result['product_id']);
				
			if ($bestseller > $settings['sticker_bestseller_item'] && isset($settings['sticker_bestseller'])) {
				$stickers['bestseller'] = array(
					'text' => $settings[$language_id]['sticker_bestseller_text'],
					'text_after' => '',
					'value' => '',
				);
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
			$date = $result['date_available'];
				
			if ($date > $date_now && isset($settings['sticker_new'])) {
				$stickers['latest'] = array(
					'text' => $settings[$language_id]['sticker_new_text'],
					'text_after' => '',
					'value' => '',
				);		
			}	
				
			if ($result['special'] && isset($settings['sticker_special'])) {
				$stickers['special'] = array(
					'text' => '',
					'text_after' => '',
					'value' => round((($result['special'] - $result['price'])/$result['price'])*100, 0) . '%',
				);
			}
			
				$data['products'][] = array(

			'short_description' 		=> utf8_substr(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')), 0, 90),
			'weight' 					=> $weight,
			'options'					=> $options,
			'num_reviews' 				=> $result['reviews'],
			'quantity' 					=> $result['quantity'],
			'minimum' 					=> $result['minimum'],
			'stickers' 					=> $stickers,
			'price_value' 				=> $this->tax->calculate($result['price'], $result['tax_class_id'], $this->config->get('config_tax'))*$this->currency->getValue(),
			'special_value' 			=> $this->tax->calculate($result['special'], $result['tax_class_id'], $this->config->get('config_tax'))*$this->currency->getValue(),
			'weight_value'				=> $result['weight'],
			'weight_unit' 				=> $this->weight->getUnit($result['weight_class_id']),
			
					'product_id'  => $result['product_id'],
					'thumb'       => $image,
					'name'        => $result['name'],
					'description' => utf8_substr(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')), 0, $this->config->get('config_product_description_length')) . '..',
					'price'       => $price,
					'special'     => $special,
					'tax'         => $tax,
					'rating'      => $rating,
					'href'        => $this->url->link('product/product', 'product_id=' . $result['product_id'])
				);
			}

			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/bestseller.tpl')) {
				return $this->load->view($this->config->get('config_template') . '/template/module/bestseller.tpl', $data);
			} else {
				return $this->load->view('default/template/module/bestseller.tpl', $data);
			}
		}
	}
}
