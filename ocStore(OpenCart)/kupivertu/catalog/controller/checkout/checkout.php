<?php
/**
 * Easy checkout © Ruslan Shvarev (freelancer) ruslan.shv@gmail.com
 */
class ControllerCheckoutCheckout extends Controller {
	private $error = array();
	private $fields = array('firstname','lastname', 'city', 'country_id', 'zone_id', 'postcode', 'address_1', 'email', 'telephone', 'comment',);

	public function index() {
////////redirect block
		if ((!$this->cart->hasProducts() && (!isset($this->session->data['vouchers']) || !$this->session->data['vouchers'])) || (!$this->cart->hasStock() && !$this->config->get('config_stock_checkout'))) {
			$this->redirect($this->url->link('checkout/cart'));
		}

		$products = $this->cart->getProducts();

		foreach($products as $product) {
			$product_total = 0;

			foreach($products as $product_2) {
				if($product_2['product_id'] == $product['product_id']) {
					$product_total += $product_2['quantity'];
				}
			}

			if($product['minimum'] > $product_total) {
				$this->redirect($this->url->link('checkout/cart'));
			}
		}


/////////products data
		$product_data = array();
		$this->load->model('tool/image');
		if (version_compare(VERSION, '1.5.3.1') >= 0) {
			foreach ($this->cart->getProducts() as $product) {
				$option_data = array();

				foreach ($product['option'] as $option) {
					if ($option['type'] != 'file') {
						$value = $option['option_value'];
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

				if ($product['image']) {
					$image = $this->model_tool_image->resize($product['image'], $this->config->get('config_image_cart_width'), $this->config->get('config_image_cart_height'));
				} else {
					$image = '';
				}
				$product_data[] = array(
					'product_id' => $product['product_id'],
					'href'       => $this->url->link('product/product', 'product_id=' . $product['product_id']),
					'name'       => $product['name'],
					'thumb'      => $image,
					'model'      => $product['model'],
					'option'     => $option_data,
					'download'   => $product['download'],
					'quantity'   => $product['quantity'],
					'subtract'   => $product['subtract'],
					'price' => $product['price'],
					'total' => $product['total'],
					'price_text' => $this->currency->format($product['price']),
					'total_text' => $this->currency->format($product['total']),
					'tax'        => $this->tax->getTax($product['price'], $product['tax_class_id']),
					'reward'     => $product['reward']
				);
			}


	/////////////// Gift Voucher
			$voucher_data = array();
			$this->data['vouchers'] = array();

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

					$this->data['vouchers'][] = array(
						'description' => $voucher['description'],
						'amount'      => $this->currency->format($voucher['amount'])
					);
				}
			}
		} else {
			$this->load->library('encryption');

			foreach($this->cart->getProducts() as $product) {
				$option_data = array();

				foreach($product['option'] as $option) {
					if($option['type'] != 'file') {
						$option_data[] = array(
							'product_option_id' => $option['product_option_id'],
							'product_option_value_id' => $option['product_option_value_id'],
							'product_option_id' => $option['product_option_id'],
							'product_option_value_id' => $option['product_option_value_id'],
							'option_id' => $option['option_id'],
							'option_value_id' => $option['option_value_id'],
							'name' => $option['name'],
							'value' => $option['option_value'],
							'type' => $option['type']
						);
					} else {
						$encryption = new Encryption($this->config->get('config_encryption'));

						$option_data[] = array(
							'product_option_id' => $option['product_option_id'],
							'product_option_value_id' => $option['product_option_value_id'],
							'product_option_id' => $option['product_option_id'],
							'product_option_value_id' => $option['product_option_value_id'],
							'option_id' => $option['option_id'],
							'option_value_id' => $option['option_value_id'],
							'name' => $option['name'],
							'value' => $encryption->decrypt($option['option_value']),
							'type' => $option['type']
						);
					}
				}

				if ($product['image']) {
					$image = $this->model_tool_image->resize($product['image'], $this->config->get('config_image_cart_width'), $this->config->get('config_image_cart_height'));
				} else {
					$image = '';
				}

				$product_data[] = array(
					'product_id' => $product['product_id'],
					'name' => $product['name'],
					'thumb'      => $image,
					'model' => $product['model'],
					'option' => $option_data,
					'download' => $product['download'],
					'quantity' => $product['quantity'],
					'subtract' => $product['subtract'],
					'price' => $product['price'],
					'total' => $product['total'],
					'price_text' => $this->currency->format($product['price']),
					'total_text' => $this->currency->format($product['total']),
					'tax' => $this->tax->getTax($product['total'], $product['tax_class_id']),
					'href' => $this->url->link('product/product', 'product_id=' . $product['product_id']),
				);
			}


			////////Gift Voucher
			$this->data['vouchers'] = array();
			if(isset($this->session->data['vouchers']) && $this->session->data['vouchers']) {
				foreach($this->session->data['vouchers'] as $voucher) {
					$product_data[] = array(
						'product_id' => 0,
						'name' => $voucher['description'],
						'model' => '',
						'option' => array(),
						'download' => array(),
						'quantity' => 1,
						'subtract' => false,
						'price' => $voucher['amount'],
						'total' => $voucher['amount'],
						'price_text' => $this->currency->format($voucher['amount']),
						'total_text' => $this->currency->format($voucher['amount']),
						'tax' => 0
					);

					$this->data['vouchers'][] = array(
						'description' => $voucher['description'],
						'amount' => $this->currency->format($voucher['amount'])
					);
				}
			}
		}

		////////shipping
		$shipping_address = array('country_id' => $this->config->get('config_country_id'), 'zone_id' => $this->config->get('config_zone_id'));
		if($this->customer->isLogged() && isset($this->session->data['shipping_address_id'])) {
			$this->load->model('account/address');

			$shipping_address = $this->model_account_address->getAddress($this->session->data['shipping_address_id']);
		}

		$this->load->model('setting/extension');


		if(!isset($this->session->data['shipping_methods'])) {
			$quote_data = array();

			$results = $this->model_setting_extension->getExtensions('shipping');

			foreach($results as $result) {
				if($this->config->get($result['code'] . '_status')) {
					$this->load->model('shipping/' . $result['code']);

					$quote = $this->{'model_shipping_' . $result['code']}->getQuote($shipping_address);

					if($quote) {
						$quote_data[$result['code']] = array(
							'title' => $quote['title'],
							'quote' => $quote['quote'],
							'sort_order' => $quote['sort_order'],
							'error' => $quote['error']
						);
					}
				}
			}

			$sort_order = array();

			foreach($quote_data as $key => $value) {
				$sort_order[$key] = $value['sort_order'];
			}

			array_multisort($sort_order, SORT_ASC, $quote_data);

			$this->session->data['shipping_methods'] = $quote_data;

		}


		if (isset($this->session->data['shipping_methods']) && count($this->session->data['shipping_methods'])>0) {
			$this->data['shipping_methods'] = $this->session->data['shipping_methods'];
			if (!isset($this->session->data['shipping_method']['code'])) {
				$method_keys = array_keys($this->session->data['shipping_methods']);
				$first_method = array_shift($method_keys);
				$shipping_methods = $this->session->data['shipping_methods'][$first_method]['quote'];
				$this->session->data['shipping_method'] =array_shift($shipping_methods);
			}
			$this->data['shipping_code'] = $this->session->data['shipping_method']['code'];
		} else {
			$this->data['shipping_methods'] = array();
			$this->data['shipping_code'] = '';
		}

		$this->language->load('checkout/checkout');

		////////totals data
		$totalResult = $this->getTotal();
		$total = $totalResult['total'];
		$total_data = $totalResult['total_data'];

		////////payment
		$method_data = $this->getPaymentMethods($total);
		$this->session->data['payment_methods'] = $method_data;

		if(isset($this->session->data['payment_methods']) && count($this->session->data['payment_methods']) > 0) {
			$this->data['payment_methods'] = $this->session->data['payment_methods'];
			if(!isset($this->session->data['payment_code']) || !isset($this->session->data['payment_method'])) {
				$method_keys = array_keys($this->session->data['payment_methods']);
				$first_method = array_shift($method_keys);
				$payment_method = $this->session->data['payment_methods'][$first_method];
				$this->session->data['payment_code'] = $first_method;
				$this->session->data['payment_method'] = $payment_method['title'];
			}

			$this->data['payment_code'] = $this->session->data['payment_code'];
			$this->data['payment'] = $this->getChild('payment/' . $this->data['payment_code']);
		} else {
			$this->data['payment_methods'] = array();
			$this->data['payment_code'] = '';
			$this->data['payment'] = '';
		}


////////do checkout
		if(($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {

			if(isset($this->request->post['shipping_method'])) {
				$shipping = explode('.', $this->request->post['shipping_method']);
				$this->session->data['shipping_method'] = $this->session->data['shipping_methods'][$shipping[0]]['quote'][$shipping[1]];
			}

			$data = array();

			$data['invoice_prefix'] = $this->config->get('config_invoice_prefix');
			$data['store_id'] = $this->config->get('config_store_id');
			$data['store_name'] = $this->config->get('config_name');

			if($data['store_id']) {
				$data['store_url'] = $this->config->get('config_url');
			} else {
				$data['store_url'] = HTTP_SERVER;
			}
			$data['customer_id'] = 0;
			$data['customer_group_id'] = $this->config->get('config_customer_group_id');

			if($this->customer->isLogged()) {
				$data['customer_id'] = $this->customer->getId();
				$data['customer_group_id'] = $this->customer->getCustomerGroupId();
			}

			$data['firstname'] = $this->request->post['firstname'];
			$data['lastname'] = $this->request->post['lastname'];
			$data['email'] = $this->request->post['email'];
			$data['telephone'] = $this->request->post['telephone'];
			$data['fax'] = "";

			$data['payment_firstname'] = $this->request->post['firstname'];
			$data['payment_lastname'] = $this->request->post['lastname'];
			$data['payment_address_1'] = $this->request->post['address_1'];
			$data['shipping_address_1'] = $this->request->post['address_1'];

			$this->load->model('localisation/country');			
			$country_info = $this->model_localisation_country->getCountry($this->request->post['country_id']);
			
			$country_name = "";
			if ($country_info) {
				$country_name = $country_info['name'];
			}

			$data['payment_city'] = $this->request->post['city'];
			$data['payment_country'] = $country_name;
			$data['shipping_city'] = $this->request->post['city'];
			$data['shipping_country'] = $country_name;
			$data['shipping_country_id'] = $this->request->post['country_id'];
			$data['payment_country_id'] = $this->request->post['country_id'];
			$data['payment_postcode'] = $this->request->post['postcode'];
			$data['shipping_postcode'] = $this->request->post['postcode'];

			$zone_id = $this->request->post['zone_id'];
			$data['shipping_zone_id'] = $zone_id;
			$data['payment_zone_id'] = $zone_id;

			$data['payment_company'] = "";
			$data['shipping_company'] = "";
			$data['payment_address_2'] = "";
			$data['payment_address_format'] = "";

			$data['shipping_firstname'] = $this->request->post['firstname'];
			$data['shipping_lastname'] = $this->request->post['lastname'];
			$data['shipping_address_2'] = "";

			$this->load->model('localisation/zone');
			$zone_info = $this->model_localisation_zone->getZone($zone_id);
			$data['payment_zone'] = $zone_info['name'];
			$data['shipping_zone'] = $zone_info['name'];

	if (version_compare(VERSION, '1.5.3.1') >= 0) {
                $data['payment_company_id'] = "";
                $data['payment_tax_id'] = "";
                $data['payment_code'] = $this->request->post['payment_method'];
                $data['shipping_code'] = $this->session->data['shipping_method']['code'];
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
                $data['vouchers'] = $voucher_data;
			} else{
				$data['reward'] = $this->cart->getTotalRewardPoints();
			}

			if(isset($this->session->data['shipping_method']['title'])) {
				$data['shipping_method'] = $this->session->data['shipping_method']['title'];
			} else {
				$data['shipping_method'] = '';
			}
			$data['payment_method'] = $this->session->data['payment_method'];

			$data['shipping_address_format'] = '{firstname} {lastname} {address_1}';

			$data['products'] = $product_data;

			$data['totals'] = $total_data;
			$data['comment'] = $this->request->post['comment'];
			$data['total'] = $total;

			if(isset($this->request->cookie['tracking'])) {
				$this->load->model('affiliate/affiliate');

				$affiliate_info = $this->model_affiliate_affiliate->getAffiliateByCode($this->request->cookie['tracking']);

				if($affiliate_info) {
					$data['affiliate_id'] = $affiliate_info['affiliate_id'];
					$data['commission'] = ($total / 100) * $affiliate_info['commission'];
				} else {
					$data['affiliate_id'] = 0;
					$data['commission'] = 0;
				}
			} else {
				$data['affiliate_id'] = 0;
				$data['commission'] = 0;
			}

			$data['language_id'] = $this->config->get('config_language_id');
			$data['currency_id'] = $this->currency->getId();
			$data['currency_code'] = $this->currency->getCode();
			$data['currency_value'] = $this->currency->getValue($this->currency->getCode());
			$data['ip'] = $this->request->server['REMOTE_ADDR'];

			$this->load->model('checkout/order');

			if (version_compare(VERSION, '1.5.3.1') >= 0) {
			    $order_id = $this->model_checkout_order->addOrder($data);
			} else {
			    $order_id = $this->model_checkout_order->create($data);
			}
			$this->session->data['order_id'] = $order_id;
			$this->session->data['last_order_id'] = $order_id;

			$json["status"] = "success";
			$this->response->setOutput(json_encode($json));
			return;
		}


////////breadcrumbs block

		$this->data['breadcrumbs'] = array();

		$this->data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/home'),
			'separator' => false
		);

		$this->data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_cart'),
			'href' => $this->url->link('checkout/cart'),
			'separator' => $this->language->get('text_separator')
		);

		$this->data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('checkout/checkout', '', 'SSL'),
			'separator' => $this->language->get('text_separator')
		);

////////language block
		$this->document->setTitle($this->language->get('heading_title'));
		$this->data['heading_title'] = $this->language->get('heading_title');

		$this->data['entry_telephone'] = $this->language->get('entry_telephone');
		$this->data['entry_email'] = $this->language->get('entry_email');
		$this->data['entry_company'] = $this->language->get('entry_company');
		$this->data['entry_address_1'] = $this->language->get('entry_address_1');

		$this->data['text_select'] = $this->language->get('text_select');
		$this->data['text_none'] = $this->language->get('text_none');
		$this->data['entry_country'] = $this->language->get('entry_country');
		$this->data['entry_city'] = $this->language->get('entry_city');
		$this->data['entry_postcode'] = $this->language->get('entry_postcode');
		$this->data['entry_zone'] = $this->language->get('entry_zone');

		$this->data['button_confirm'] = $this->language->get('button_confirm');
		$this->data['button_continue'] = $this->language->get('button_continue');

		$this->data['text_shipping_method'] = $this->language->get('text_shipping_method');

		$this->load->model('catalog/information');

		if ($this->config->get('config_checkout_id')) {
			$this->load->model('catalog/information');

			$information_info = $this->model_catalog_information->getInformation($this->config->get('config_checkout_id'));

			if ($information_info) {
				$this->data['text_agree'] = sprintf($this->language->get('text_agree'), $this->url->link('information/information/info', 'information_id=' . $this->config->get('config_checkout_id'), 'SSL'), $information_info['title'], $information_info['title']);
			} else {
				$this->data['text_agree'] = '';
			}
		} else {
			$this->data['text_agree'] = '';
		}

		if (isset($this->session->data['agree'])) {
			$this->data['agree'] = $this->session->data['agree'];
		} else {
			$this->data['agree'] = '';
		}


		$this->data['column_name'] = $this->language->get('column_name');
		$this->data['column_image'] = $this->language->get('column_image');
		$this->data['column_model'] = $this->language->get('column_model');
		$this->data['column_quantity'] = $this->language->get('column_quantity');
		$this->data['column_price'] = $this->language->get('column_price');
		$this->data['column_total'] = $this->language->get('column_total');

		$this->data['total_data'] = $this->getTotalHtml($total_data);

		$this->data['payment_data'] = $this->getPaymentHtml($total);

		$this->data['products'] = $product_data;

		if($this->error) {
			$json['errors'] = $this->error;
			$this->response->setOutput(json_encode($json));
			return;
		}

		$this->data['firstname'] = "";
		$this->data['lastname'] = "";
		$this->data['email'] = "";
		$this->data['telephone'] = "";
		$this->data['company'] = "";
		$this->data['address_1'] = "";
		$this->data['postcode'] = "";

		$this->load->model('localisation/country');		
		$this->data['countries'] = $this->model_localisation_country->getCountries();
		$this->data['city'] = "";
		$this->data['country_id'] = $this->config->get('config_country_id');


		if($this->customer->isLogged()) {
			$this->data['firstname'] = $this->customer->getFirstName();
			$this->data['lastname'] = $this->customer->getLastName();
			$this->data['email'] = $this->customer->getEmail();
			$this->data['telephone'] = $this->customer->getTelephone();
			$this->data['fax'] = $this->customer->getFax();

			$this->load->model('account/address');
			$address = $this->model_account_address->getAddress($this->customer->getAddressId());
			$this->data['company'] = $address['company'];
			$this->data['address_1'] = $address['address_1'];
			$this->data['country_id'] = $address['country_id'];
			$this->data['zone_id'] = $address['zone_id'];
			$this->data['postcode'] = $address['postcode'];
			$this->data['city'] = $address['city'];
		}

		if(isset($this->session->data['firstname'])) {
			$this->data['firstname'] = $this->session->data['firstname'];
		}
		if(isset($this->session->data['lastname'])) {
			$this->data['lastname'] = $this->session->data['lastname'];
		}

		if(isset($this->session->data['email'])) {
			$this->data['email'] = $this->session->data['email'];
		}

		if(isset($this->session->data['telephone'])) {
			$this->data['telephone'] = $this->session->data['telephone'];
		}

		$this->data['comment'] = "";
		if(isset($this->session->data['comment'])) {
			$this->data['comment'] = $this->session->data['comment'];
		}

		$this->data['entry_firstname'] = $this->language->get('entry_firstname');
		$this->data['entry_lastname'] = $this->language->get('entry_lastname');

		if(isset($this->session->data['address_1'])) {
			$this->data['address_1'] = $this->session->data['address_1'];
		}
		if(isset($this->session->data['country_id'])) {
			$this->data['country_id'] = $this->session->data['country_id'];
		}
		if(isset($this->session->data['zone_id'])) {
			$this->data['zone_id'] = $this->session->data['zone_id'];
		}
		if(isset($this->session->data['postcode'])) {
			$this->data['postcode'] = $this->session->data['postcode'];
		}
		if(isset($this->session->data['city'])) {
			$this->data['city'] = $this->session->data['city'];
		}

		$this->language->load('account/order');
		$this->data['column_comment'] = $this->language->get('column_comment');


		$this->document->addScript('catalog/view/javascript/jquery/jquery.loadmask.min.js');
		$this->document->addStyle('catalog/view/theme/default/stylesheet/jquery.loadmask.css');

		if(file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/checkout/checkout.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/checkout/checkout.tpl';
		} else {
			$this->template = 'default/template/checkout/checkout.tpl';
		}

		$this->children = array(
			'common/column_left',
			'common/column_right',
			'common/content_top',
			'common/content_bottom',
			'common/footer',
			'common/header'
		);

		$this->response->setOutput($this->render());
	}

	private function getTotal() {
		$total_data = array();
		$total = 0;
		$taxes = $this->cart->getTaxes();
		$sort_order = array();

		$this->load->model('setting/extension');

		$results = $this->model_setting_extension->getExtensions('total');
		foreach($results as $key => $value) {
			$sort_order[$key] = $this->config->get($value['code'] . '_sort_order');
		}
		array_multisort($sort_order, SORT_ASC, $results);

		foreach($results as $result) {
			if($this->config->get($result['code'] . '_status')) {
				$this->load->model('total/' . $result['code']);

				$this->{'model_total_' . $result['code']}->getTotal($total_data, $total, $taxes);
			}
		}
		$sort_order = array();
		foreach($total_data as $key => $value) {
			$sort_order[$key] = $value['sort_order'];
		}
		array_multisort($sort_order, SORT_ASC, $total_data);
		return array('total' => $total, 'total_data' => $total_data);
	}

	public function change_payment() {
		$json = array();
		$payment_code = $this->request->post['payment_code'];
		if(isset($payment_code)) {
			$this->session->data['payment_method'] = $this->session->data['payment_methods'][$payment_code]['title'];
			$this->session->data['payment_code'] = $payment_code;
			$json['payment'] = $this->getChild('payment/' . $payment_code);
		}

		$this->response->setOutput(json_encode($json));
	}

	public function change_shipping() {
		$json = array();
		$this->language->load('checkout/checkout');
		if(isset($this->request->post['shipping_method'])) {
			$shipping = explode('.', $this->request->post['shipping_method']);
			$this->session->data['shipping_method'] = $this->session->data['shipping_methods'][$shipping[0]]['quote'][$shipping[1]];
		}

		$totalResult = $this->getTotal();

		$total_data = $totalResult['total_data'];
		$total = $totalResult['total'];

		$json['payment_data'] = $this->getPaymentHtml($total);
		$json['totals_data'] = $this->getTotalHtml($total_data);

		$this->response->setOutput(json_encode($json));
	}

	private function getPaymentHtml($total) {

		$payment_template = new Template();

		$method_data = $this->getPaymentMethods($total);
		$this->session->data['payment_methods'] = $method_data;

		if(isset($this->session->data['payment_methods']) && count($this->session->data['payment_methods']) > 0) {
			$payment_template->data['payment_methods'] = $this->session->data['payment_methods'];


			$payment_set = isset($this->session->data['payment_code']) && isset($this->session->data['payment_method']);
			if(!$payment_set || !in_array($this->session->data['payment_code'], array_keys($this->session->data['payment_methods']))) {
				$method_keys = array_keys($this->session->data['payment_methods']);
				$first_method = array_shift($method_keys);
				$payment_method = $this->session->data['payment_methods'][$first_method];

				$this->session->data['payment_code'] = $first_method;
				$this->session->data['payment_method'] = $payment_method['title'];
			}

			$payment_template->data['payment_code'] = $this->session->data['payment_code'];
			$payment_template->data['payment'] = $this->getChild('payment/' . $payment_template->data['payment_code']);
		} else {
			$payment_template->data['payment_methods'] = array();
			$payment_template->data['payment_code'] = '';
			$payment_template->data['payment'] = '';
		}

		$payment_template->data['text_payment_method'] = $this->language->get('text_payment_method');
		$template_path = 'default/template/checkout/payment_data.tpl';
		if(file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/checkout/payment_data.tpl')) {
			$template_path = $this->config->get('config_template') . '/template/checkout/payment_data.tpl';
		}
		return $payment_template->fetch($template_path);
	}

	private function getTotalHtml($total_data ) {
		$total_template = new Template();
		$total_template->data['totals'] = $total_data;
		$template_path = 'default/template/checkout/total_data.tpl';
		if(file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/checkout/total_data.tpl')) {
			$template_path = $this->config->get('config_template') . '/template/checkout/total_data.tpl';
		}
		return $total_template->fetch($template_path);
	}

	private function getPaymentMethods($total) {
		$payment_address = array('country_id' => $this->config->get('config_country_id'), 'zone_id' => $this->config->get('config_zone_id'));
		if($this->customer->isLogged() && isset($this->session->data['payment_address_id'])) {
			$this->load->model('account/address');
			$payment_address = $this->model_account_address->getAddress($this->session->data['payment_address_id']);
		}

		$method_data = array();

		$this->load->model('setting/extension');

		$results = $this->model_setting_extension->getExtensions('payment');

		foreach($results as $result) {
			if($this->config->get($result['code'] . '_status')) {
				$this->load->model('payment/' . $result['code']);

				$method = $this->{'model_payment_' . $result['code']}->getMethod($payment_address, $total);

				if($method) {
					$method_data[$result['code']] = $method;
				}
			}
		}

		$sort_order = array();

		foreach($method_data as $key => $value) {
			$sort_order[$key] = $value['sort_order'];
		}

		array_multisort($sort_order, SORT_ASC, $method_data);

		return $method_data;
	}


	private function validate() {

		if((utf8_strlen($this->request->post['firstname']) < 1) || (utf8_strlen($this->request->post['firstname']) > 64)) {
			$this->error['firstname'] = $this->language->get('error_firstname');
		}

		if((utf8_strlen($this->request->post['lastname']) < 1) || (utf8_strlen($this->request->post['lastname']) > 64)) {
			$this->error['lastname'] = $this->language->get('error_lastname');
		}

		if((utf8_strlen($this->request->post['address_1']) < 3) || (utf8_strlen($this->request->post['address_1']) > 128)) {
			$this->error['address_1'] = $this->language->get('error_address_1');
		}

		if((utf8_strlen($this->request->post['email']) > 96) || !preg_match('/^[^\@]+@.*\.[a-z]{2,6}$/i', $this->request->post['email'])) {
			$this->error['email'] = $this->language->get('error_email');
		}

		if((utf8_strlen($this->request->post['telephone']) < 3) || (utf8_strlen($this->request->post['telephone']) > 32)) {
			$this->error['telephone'] = $this->language->get('error_telephone');
		}

		if ((utf8_strlen($this->request->post['city']) < 2) || (utf8_strlen($this->request->post['city']) > 128)) {
			$this->error['city'] = $this->language->get('error_city');
		}

		if ($this->request->post['country_id'] == '') {
			$this->error['country_id'] = $this->language->get('error_country');
		}

		if ($this->request->post['zone_id'] == '') {
			$this->error['zone_id'] = $this->language->get('error_zone');
		}

		if ((utf8_strlen($this->request->post['postcode']) < 2) || (utf8_strlen($this->request->post['postcode']) > 10)) {
			$this->error['postcode'] = $this->language->get('error_postcode');
		}

		if ($this->config->get('config_checkout_id')) {
			$this->load->model('catalog/information');
			$information_info = $this->model_catalog_information->getInformation($this->config->get('config_checkout_id'));
			if ($information_info && !isset($this->request->post['agree'])) {
				$this->error['agree'] = sprintf($this->language->get('error_agree'), $information_info['title']);
			}
		}

		if(!$this->error) {
			return true;
		} else {
			return false;
		}
	}

	public function country() {
		$json = array();

		$this->load->model('localisation/country');

		$country_info = $this->model_localisation_country->getCountry($this->request->get['country_id']);

		if ($country_info) {
			$this->load->model('localisation/zone');

			$json = array(
				'country_id'        => $country_info['country_id'],
				'name'              => $country_info['name'],
				'iso_code_2'        => $country_info['iso_code_2'],
				'iso_code_3'        => $country_info['iso_code_3'],
				'address_format'    => $country_info['address_format'],
				'postcode_required' => $country_info['postcode_required'],
				'zone'              => $this->model_localisation_zone->getZonesByCountryId($this->request->get['country_id']),
				'status'            => $country_info['status']
			);
		}

		$this->response->setOutput(json_encode($json));
	}
}
?>