<?php  
class ControllerModuleQuickOrder extends Controller {
	public function index() {
			$text = '';
			$text .= '<div style="font-family:Verdana;font-size:12px;color:#444;">';
			$text .= '<b>Имя</b>: ' . $this->request->post['customer_name'] . '<br />';
			$text .= '<b>Телефон</b>: ' . $this->request->post['customer_phone'] . '<br />';
			if (isset($this->request->post['customer_mail'])) {
				$text .= '<b>E-mail</b>: ' . $this->request->post['customer_mail'] . '<br />';
			}
			if (isset($this->request->post['customer_comment'])) {
				$text .= '<b>Комментарий</b>: ' . $this->request->post['customer_comment'] . '<br />';
			}
			$text .= '<br />';
			
			$data['products'] = array();
			$text .= '<table style="min-width:400px;">';
			$text .= '<tr><td style="background:#ddd; padding:4px 10px 5px; font-weight:700;">Наименование</td><td style="background:#ddd; padding:4px 10px 5px; font-weight:700;">Кол-во</td><td style="background:#ddd; padding:4px 10px 5px;font-weight:700;">Сумма</td></tr>';
			
			foreach ($this->cart->getProducts() as $product) {
							
				$option_data = array();
			
				foreach ($product['option'] as $option) {
					if ($option['type'] != 'file') {
						$value = $option['option_value'];	
					} else {
						$filename = $this->encryption->decrypt($option['option_value']);
						$value = utf8_substr($filename, 0, utf8_strrpos($filename, '.'));
					}				
				
					$option_data[] = array(								   
						'name'  => $option['name'],
						'value' => (utf8_strlen($value) > 20 ? utf8_substr($value, 0, 20) . '..' : $value),
						'type'  => $option['type']
					);
				}
			
				if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
					$price = $this->currency->format($this->tax->calculate($product['price'], $product['tax_class_id'], $this->config->get('config_tax')));
				} else {
					$price = false;
				}
			
				if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
					$total = $this->currency->format($this->tax->calculate($product['price'], $product['tax_class_id'], $this->config->get('config_tax')) * $product['quantity']);
				} else {
					$total = false;
				}
													
				$text .= '<tr>';
				$text .= '<td style="padding:4px 10px 5px;";>' . $product['name'];
				$text .= '<small>';
				foreach ($product['option'] as $option) {
					$text .= $option['name'] . ': '; 
					$text .= $option['option_value']; 
				}
				$text .= '</small></td>';
				$text .= '<td style="padding:4px 10px 5px;">' . $product['quantity'] . '</td>';
				$text .= '<td style="padding:4px 10px 5px;">' . $total . '</td>';
				$text .= '</tr>';
			}
		$this->load->model('extension/extension');
		
		$text .= '<tr><td colspan="3" style="padding:4px 10px 5px;text-align:right; border-top:solid 1px #ccc;"><b>Итого: ' . $this->currency->format($this->cart->getTotal()) . '</b></td></tr>';	
		$text .= '</table>';
		$text .= '</div>';
		
		$subject = 'Быстрый заказ';
		
		$mail = new Mail(); 
		$mail->protocol = $this->config->get('config_mail_protocol');
		$mail->parameter = $this->config->get('config_mail_parameter');
		$mail->hostname = $this->config->get('config_smtp_host');
		$mail->username = $this->config->get('config_smtp_username');
		$mail->password = $this->config->get('config_smtp_password');
		$mail->port = $this->config->get('config_smtp_port');
		$mail->timeout = $this->config->get('config_smtp_timeout');
		$mail->setTo($this->config->get('config_email'));
		$mail->setFrom($this->config->get('config_email'));
		$mail->setSender($this->config->get('config_name'));
		$mail->setSubject(html_entity_decode($subject, ENT_QUOTES, 'UTF-8'));
		$mail->setHtml(html_entity_decode($text, ENT_QUOTES, 'UTF-8'));
		
		$json = array();
		
		if($this->request->post['customer_name'] && $this->request->post['customer_phone']) {
			$mail->send();
			$this->cart->clear();
			$json['success'] = 'Спасибо за Ваш заказ. Мы свяжемся с вами через несколько минут.';
		} else {
			$json['error'] = 'Обязательно укажите своё имя и контактный телефон.';
		}
		
		$this->response->setOutput(json_encode($json));
	}
	
	public function add_order() {
		$total_data = array();
			$total = 0;
			$taxes = $this->cart->getTaxes();
			 
			$this->load->model('extension/extension');
			
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
	
		$this->language->load('checkout/checkout');
	
		$data = array();
			
		$data['invoice_prefix'] = $this->config->get('config_invoice_prefix');
		$data['store_id'] = $this->config->get('config_store_id');
		$data['store_name'] = $this->config->get('config_name');
			
		if ($data['store_id']) {
			$data['store_url'] = $this->config->get('config_url');		
		} else {
			$data['store_url'] = HTTP_SERVER;	
		}
			
		if ($this->customer->isLogged()) {
			$this->load->model('account/address');
			$this->load->model('localisation/country');
			$this->load->model('account/customer');
			$this->load->model('account/customer_group');
		
			$data['customer_id'] = $this->customer->getId();
			$data['customer_group_id'] = $this->customer->getGroupId();
			$data['firstname'] = $this->customer->getFirstName();
			$data['lastname'] = $this->customer->getLastName();
			$data['email'] = $this->customer->getEmail();
			$data['telephone'] = $this->customer->getTelephone();
			$data['fax'] = '';
			
			if (isset($this->request->post['customer_delivery']) && $this->request->post['customer_delivery'] != '') {
				$data['payment_address_1'] = $this->request->post['customer_delivery'];
				$data['shipping_address_1'] = $this->request->post['customer_delivery'];
			} else {
				$data['payment_address_1'] = '';
				$data['shipping_address_1'] = '';
			}
			
			//$payment_address = $this->model_account_address->getAddress($this->session->data['payment_address_id']);
			echo $payment_address = '';
		} else {
			$data['customer_id'] = 0;
			$data['customer_group_id'] = '';
			$data['firstname'] = $this->request->post['customer_name'];
			$data['lastname'] = '';
			if (isset($this->request->post['customer_mail']) && $this->request->post['customer_mail'] != '') {
				$data['email'] = $this->request->post['customer_mail'];
			} else {
				$data['email'] = 'Покупатель не указал e-mail';
			}
			$data['telephone'] = $this->request->post['customer_phone'];
			$data['fax'] = '';
			
			if (isset($this->request->post['customer_delivery']) && $this->request->post['customer_delivery'] != '') {
				$data['payment_address_1'] = $this->request->post['customer_delivery'];
				$data['shipping_address_1'] = $this->request->post['customer_delivery'];
			} else {
				$data['payment_address_1'] = '';
				$data['shipping_address_1'] = '';
			}
		}
			
			$data['payment_firstname'] = $this->request->post['customer_name'];;
			$data['payment_lastname'] = '';	
			$data['payment_company'] = '';	
			$data['payment_company_id'] = '';	
			$data['payment_tax_id'] = '';	
			$data['payment_address_2'] = '';
			$data['payment_city'] = '';
			$data['payment_postcode'] = '';
			$data['payment_zone'] = '';
			$data['payment_zone_id'] = '';
			$data['payment_country'] = '';
			$data['payment_country_id'] = $this->config->get('config_country_id');
			$data['payment_address_format'] = '';
			$data['payment_method'] = 'Быстрый заказ';
			$data['payment_code'] = 'cod';
						
			$data['shipping_firstname'] = '';
			$data['shipping_lastname'] = '';	
			$data['shipping_company'] = '';	
			$data['shipping_address_2'] = '';
			$data['shipping_city'] = '';
			$data['shipping_postcode'] = '';
			$data['shipping_zone'] = '';
			$data['shipping_zone_id'] = '';
			$data['shipping_country'] = '';
			$data['shipping_country_id'] = $this->config->get('config_country_id');
			$data['shipping_address_format'] = '';
			$data['shipping_method'] = '';
			$data['shipping_code'] = '';
			
			$data['custom_field'] = array();
			$data['payment_custom_field'] = array();
			$data['shipping_custom_field'] = array();
			
			$product_data = array();
		
			foreach ($this->cart->getProducts() as $product) {
				$option_data = array();
	
				foreach ($product['option'] as $option) {
					if ($option['type'] != 'file') {
						$value = $option['value'];	
					} else {
						$value = $this->encryption->decrypt($option['option_value']);
					}	
					
					$option_data[] = array(
						'product_option_id'       => $option['product_option_id'],
						'product_option_value_id' => $option['product_option_value_id'],
						'option_id'               => $option['option_id'],
						'option_value_id'         => $option['option_value_id'],								   
						'name'                    => $option['name'],
						'value'                   => $value,
						'type'                    => $option['type']
					);					
				}
	 
				$product_data[] = array(
					'product_id' => $product['product_id'],
					'name'       => $product['name'],
					'model'      => $product['model'],
					'option'     => $option_data,
					'download'   => $product['download'],
					'quantity'   => $product['quantity'],
					'subtract'   => $product['subtract'],
					'price'      => $product['price'],
					'total'      => $product['total'],
					'tax'        => $this->tax->getTax($product['price'], $product['tax_class_id']),
					'reward'     => $product['reward']
				); 
			}
			
			// Gift Voucher
			$voucher_data = array();
			
			if (!empty($this->session->data['vouchers'])) {
				foreach ($this->session->data['vouchers'] as $voucher) {
					$voucher_data[] = array(
						'description'      => $voucher['description'],
						'code'             => substr(md5(mt_rand()), 0, 10),
						'to_name'          => $voucher['to_name'],
						'to_email'         => $voucher['to_email'],
						'from_name'        => $voucher['from_name'],
						'from_email'       => $voucher['from_email'],
						'voucher_theme_id' => $voucher['voucher_theme_id'],
						'message'          => $voucher['message'],						
						'amount'           => $voucher['amount']
					);
				}
			}  
						
			$data['products'] = $product_data;
			$data['vouchers'] = $voucher_data;
			$data['totals'] = $total_data;
			if (isset($this->request->post['customer_comment'])) {
				$data['comment'] = $this->request->post['customer_comment'];
			} else {
				$data['comment'] ='';
			}
			$data['total'] = $total;
			
			if (isset($this->request->post['affiliate_id'])) {
				$subtotal = $this->cart->getSubTotal();
				$this->load->model('affiliate/affiliate');

				$affiliate_info = $this->model_affiliate_affiliate->getAffiliate($this->request->post['affiliate_id']);

				if ($affiliate_info) {
					$data['affiliate_id'] = $affiliate_info['affiliate_id'];
					$data['commission'] = ($subtotal / 100) * $affiliate_info['commission'];
				} else {
					$data['affiliate_id'] = 0;
					$data['commission'] = 0;
				}

				$data['marketing_id'] = 0;
				$data['tracking'] = '';
			} else {
				$data['affiliate_id'] = '';
				$data['commission'] = '';
				$data['marketing_id'] = '';
				$data['tracking'] = '';
			}
			
			$data['language_id'] = $this->config->get('config_language_id');
			$data['currency_id'] = $this->currency->getId();
			$data['currency_code'] = $this->currency->getCode();
			$data['currency_value'] = $this->currency->getValue($this->currency->getCode());
			$data['ip'] = $this->request->server['REMOTE_ADDR'];
			
			if (!empty($this->request->server['HTTP_X_FORWARDED_FOR'])) {
				$data['forwarded_ip'] = $this->request->server['HTTP_X_FORWARDED_FOR'];	
			} elseif(!empty($this->request->server['HTTP_CLIENT_IP'])) {
				$data['forwarded_ip'] = $this->request->server['HTTP_CLIENT_IP'];	
			} else {
				$data['forwarded_ip'] = '';
			}
			
			if (isset($this->request->server['HTTP_USER_AGENT'])) {
				$data['user_agent'] = $this->request->server['HTTP_USER_AGENT'];	
			} else {
				$data['user_agent'] = '';
			}
			
			if (isset($this->request->server['HTTP_ACCEPT_LANGUAGE'])) {
				$data['accept_language'] = $this->request->server['HTTP_ACCEPT_LANGUAGE'];	
			} else {
				$data['accept_language'] = '';
			}
			
			$this->load->model('checkout/order');
			
			$json = array();
		
		if($this->request->post['customer_name'] && $this->request->post['customer_phone']) {
			if (isset($this->request->post['order_status_id'])) {
				$order_status_id = $this->request->post['order_status_id'];
			} else {
				$order_status_id = $this->config->get('config_order_status_id');
			}

			$this->session->data['order_id'] = $this->model_checkout_order->addOrder($data);
			$order_id = $this->session->data['order_id'];
			$this->model_checkout_order->addOrderHistory($order_id, $order_status_id);
			$this->cart->clear();
			$json['success'] = 'Спасибо за Ваш заказ. Мы свяжемся с вами через несколько минут.';
		} else {
			$json['error'] = 'Обязательно укажите своё имя и контактный телефон.';
		}
		
		$this->response->setOutput(json_encode($json));
	}
}
?>