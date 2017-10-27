<?php
class ControllerCommonCart extends Controller {
	public function index() {
		$this->load->language('common/cart');

		// Totals
		$this->load->model('extension/extension');

		$total_data = array();
		$total = 0;
		$taxes = $this->cart->getTaxes();

		// Display prices
		if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
			$sort_order = array();

			$results = $this->model_extension_extension->getExtensions('total');

			foreach ($results as $key => $value) {
				$sort_order[$key] = $this->config->get($value['code'] . '_sort_order');
			}

			array_multisort($sort_order, SORT_ASC, $results);

			foreach ($results as $result) {
				if ($this->config->get($result['code'] . '_status')) {
					$this->load->model('total/' . $result['code']);

					$this->{'model_total_' . $result['code']}->getTotal($total_data, $total, $taxes);
				}
			}

			$sort_order = array();

			foreach ($total_data as $key => $value) {
				$sort_order[$key] = $value['sort_order'];
			}

			array_multisort($sort_order, SORT_ASC, $total_data);
		}

		$data['text_empty'] = $this->language->get('text_empty');
		$data['text_cart'] = $this->language->get('text_cart');
		$data['text_checkout'] = $this->language->get('text_checkout');
		$data['text_recurring'] = $this->language->get('text_recurring');
$data['items'] = $this->cart->countProducts();

			$settings = $this->config->get('fastfood_settings');
			$settings = $settings[$this->config->get('config_store_id')];
			$language_id = $this->config->get('config_language_id');
			
			$data['customer_name'] = $this->customer->getFirstName();
			$data['customer_phone'] = $this->customer->getTelephone();
			$data['customer_mail'] = $this->customer->getEmail();
			
			$data['text_your_cart'] = $this->language->get('text_your_cart');
			$data['text_total'] = $this->language->get('text_total');
			$data['text_quick_order'] = $this->language->get('text_quick_order');
			$data['text_continue_shopping'] = $this->language->get('text_continue_shopping');
			
			if (isset($settings['show_quick_order'])) {$data['show_quick_order'] = $settings['show_quick_order'];}
			if (isset($settings['quick_order_function'])) {$data['quick_order_function'] = $settings['quick_order_function'];}
			if (isset($settings['quick_order_phone_mask'])) {
				$data['quick_order_phone_mask'] = $settings['quick_order_phone_mask'];
			} else {
				$data['quick_order_phone_mask'] = '';
			}
			
			if (isset($settings[$language_id]['quick_order_name_text'])) {	
				$data['order_name_text'] = $settings[$language_id]['quick_order_name_text'];
			} else {
				$data['order_name_text'] = '';
			}
			if (isset($settings[$language_id]['quick_order_phone_text'])) {	
				$data['order_phone_text'] = $settings[$language_id]['quick_order_phone_text'];
			} else {
				$data['order_phone_text'] = '';
			}
			if (isset($settings['quick_order_mail'])) {	
				$data['order_mail'] = $settings['quick_order_mail'];
				$data['order_mail_text'] = $settings[$language_id]['quick_order_mail_text'];
			} else {
				$data['order_mail'] = '';
				$data['order_mail_text'] = '';
			}
			if (isset($settings['quick_order_delivery'])) {
				$data['order_delivery'] = $settings['quick_order_delivery'];
				$data['order_delivery_text'] = $settings[$language_id]['quick_order_delivery_text'];
			} else {
				$data['order_delivery'] = '';
				$data['order_delivery_text'] = '';
			}
			if (isset($settings['quick_order_comment'])) {
				$data['order_comment'] = $settings['quick_order_comment'];
				$data['order_comment_text'] = $settings[$language_id]['quick_order_comment_text'];
			} else {
				$data['order_comment'] = '';
				$data['order_comment_text'] = '';
			}
			
			$data['total_summ'] = $total_data[0]['value'];
			foreach ($total_data as $total) {
				if ($total['code'] == 'sub_total') {
					$data['total_summ'] = $this->currency->format($this->tax->calculate($total['value'], '', $this->config->get('config_tax')));
				}
			}
			
		$data['text_items'] = sprintf($this->language->get('text_items'), $this->cart->countProducts() + (isset($this->session->data['vouchers']) ? count($this->session->data['vouchers']) : 0), $this->currency->format($total));
		$data['text_loading'] = $this->language->get('text_loading');

		$data['button_remove'] = $this->language->get('button_remove');

		$this->load->model('tool/image');
		$this->load->model('tool/upload');

		$data['products'] = array();

		foreach ($this->cart->getProducts() as $product) {
			if ($product['image']) {
				$image = $this->model_tool_image->resize($product['image'], $this->config->get('config_image_cart_width'), $this->config->get('config_image_cart_height'));
			} else {
				$image = '';
			}

			$option_data = array();

			foreach ($product['option'] as $option) {
				if ($option['type'] != 'file') {
					$value = $option['value'];
				} else {
					$upload_info = $this->model_tool_upload->getUploadByCode($option['value']);

					if ($upload_info) {
						$value = $upload_info['name'];
					} else {
						$value = '';
					}
				}

				$option_data[] = array(
					'name'  => $option['name'],
					'value' => (utf8_strlen($value) > 20 ? utf8_substr($value, 0, 20) . '..' : $value),
					'type'  => $option['type']
				);
			}

			// Display prices
			if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
				$price = $this->currency->format($this->tax->calculate($product['price'], $product['tax_class_id'], $this->config->get('config_tax')));
			} else {
				$price = false;
			}

			// Display prices
			if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
				$total = $this->currency->format($this->tax->calculate($product['price'], $product['tax_class_id'], $this->config->get('config_tax')) * $product['quantity']);
			} else {
				$total = false;
			}

			$data['products'][] = array(
				'cart_id'   => $product['cart_id'],
				'thumb'     => $image,
				'name'      => $product['name'],
				'model'     => $product['model'],
				'option'    => $option_data,
				'recurring' => ($product['recurring'] ? $product['recurring']['name'] : ''),
				'quantity'  => $product['quantity'],
'minimum' => $product['minimum'],
				'price'     => $price,
				'total'     => $total,
				'href'      => $this->url->link('product/product', 'product_id=' . $product['product_id'])
			);
		}

		// Gift Voucher
		$data['vouchers'] = array();

		if (!empty($this->session->data['vouchers'])) {
			foreach ($this->session->data['vouchers'] as $key => $voucher) {
				$data['vouchers'][] = array(
					'key'         => $key,
					'description' => $voucher['description'],
					'amount'      => $this->currency->format($voucher['amount'])
				);
			}
		}

		$data['totals'] = array();

		foreach ($total_data as $result) {
			$data['totals'][] = array(
				'title' => $result['title'],
				'text'  => $this->currency->format($result['value']),
			);
		}

		$data['cart'] = $this->url->link('checkout/cart');
		$data['checkout'] = $this->url->link('checkout/checkout', '', 'SSL');

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/common/cart.tpl')) {
			return $this->load->view($this->config->get('config_template') . '/template/common/cart.tpl', $data);
		} else {
			return $this->load->view('default/template/common/cart.tpl', $data);
		}
	}

	public function info() {
		$this->response->setOutput($this->index());
	}
}
