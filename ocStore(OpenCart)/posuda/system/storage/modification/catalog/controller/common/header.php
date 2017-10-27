<?php
class ControllerCommonHeader extends Controller {
	public function index() {
		// Analytics
		$this->load->model('extension/extension');

		$data['analytics'] = array();

		$analytics = $this->model_extension_extension->getExtensions('analytics');

		foreach ($analytics as $analytic) {
			if ($this->config->get($analytic['code'] . '_status')) {
				$data['analytics'][] = $this->load->controller('analytics/' . $analytic['code']);
			}
		}

		if ($this->request->server['HTTPS']) {
			$server = $this->config->get('config_ssl');
		} else {
			$server = $this->config->get('config_url');
		}

		if (is_file(DIR_IMAGE . $this->config->get('config_icon'))) {
			$this->document->addLink($server . 'image/' . $this->config->get('config_icon'), 'icon');
		}

		$data['title'] = $this->document->getTitle();

		$data['base'] = $server;
		$data['description'] = $this->document->getDescription();
		$data['keywords'] = $this->document->getKeywords();
		$data['links'] = $this->document->getLinks();
		$data['styles'] = $this->document->getStyles();
		$data['scripts'] = $this->document->getScripts();
		$data['lang'] = $this->language->get('code');
		$data['direction'] = $this->language->get('direction');

		$data['name'] = $this->config->get('config_name');

		if (is_file(DIR_IMAGE . $this->config->get('config_logo'))) {
			$data['logo'] = $server . 'image/' . $this->config->get('config_logo');
		} else {
			$data['logo'] = '';
		}

		$this->load->language('common/header');
		$data['og_url'] = (isset($this->request->server['HTTPS']) ? HTTPS_SERVER : HTTP_SERVER) . substr($this->request->server['REQUEST_URI'], 1, (strlen($this->request->server['REQUEST_URI'])-1));
		$data['og_image'] = $this->document->getOgImage();

		$data['text_home'] = $this->language->get('text_home');

		// Wishlist
		if ($this->customer->isLogged()) {
			$this->load->model('account/wishlist');

			$data['text_wishlist'] = sprintf($this->language->get('text_wishlist'), $this->model_account_wishlist->getTotalWishlist());
		} else {
			$data['text_wishlist'] = sprintf($this->language->get('text_wishlist'), (isset($this->session->data['wishlist']) ? count($this->session->data['wishlist']) : 0));
		}

		$data['text_shopping_cart'] = $this->language->get('text_shopping_cart');
		$data['text_logged'] = sprintf($this->language->get('text_logged'), $this->url->link('account/account', '', 'SSL'), $this->customer->getFirstName(), $this->url->link('account/logout', '', 'SSL'));

		$data['text_account'] = $this->language->get('text_account');
		$data['text_register'] = $this->language->get('text_register');
		$data['text_login'] = $this->language->get('text_login');
		$data['text_order'] = $this->language->get('text_order');
		$data['text_transaction'] = $this->language->get('text_transaction');
		$data['text_download'] = $this->language->get('text_download');
		$data['text_logout'] = $this->language->get('text_logout');
		$data['text_checkout'] = $this->language->get('text_checkout');
		$data['text_page'] = $this->language->get('text_page');
		$data['text_category'] = $this->language->get('text_category');
		$data['text_all'] = $this->language->get('text_all');

		$data['home'] = $this->url->link('common/home');
		$data['wishlist'] = $this->url->link('account/wishlist', '', 'SSL');
		$data['logged'] = $this->customer->isLogged();
		$data['account'] = $this->url->link('account/account', '', 'SSL');
		$data['register'] = $this->url->link('account/register', '', 'SSL');
		$data['login'] = $this->url->link('account/login', '', 'SSL');
		$data['order'] = $this->url->link('account/order', '', 'SSL');
		$data['transaction'] = $this->url->link('account/transaction', '', 'SSL');
		$data['download'] = $this->url->link('account/download', '', 'SSL');
		$data['logout'] = $this->url->link('account/logout', '', 'SSL');
		$data['shopping_cart'] = $this->url->link('checkout/cart');
		$data['checkout'] = $this->url->link('checkout/checkout', '', 'SSL');
		$data['contact'] = $this->url->link('information/contact');
		$data['telephone'] = $this->config->get('config_telephone');
			
			$data['gallery'] = $this->url->link('product/gallery');
			$data['special'] = $this->url->link('product/special');
			$data['contact'] = $this->url->link('information/contact');
			if(isset($this->request->get['route'])) {
				$data['route'] = $this->request->get['route']; 
			} else {
				$data['route'] = ''; 
			}
			$settings = $this->config->get('fastfood_settings');
			$settings = $settings[$this->config->get('config_store_id')];
			$language_id = $this->config->get('config_language_id');
			
			if (isset($settings['enable_bootstrap'])) {
				$data['bootstrap'] = true;
			} else {
				$data['bootstrap'] = false;
			}
			
			if (isset($settings['custom_style'])) {
				$data['custom_style'] = $settings['custom_style'];
			} else {
				$data['custom_style'] = '';
			}
			
			$data['headerlinks'] = array();
			if (isset($settings[$language_id]['headerlinks'])) {
				$data['headerlinks'] = $settings[$language_id]['headerlinks'];
			}
			
			if (isset($settings['show_search'])) {$data['show_search'] = $settings['show_search'];}
			if (isset($settings['show_account'])) {$data['show_account'] = $settings['show_account'];}
			if (isset($settings['show_callback'])) {$data['show_callback'] = $settings['show_callback'];}
			
			$data['phone1'] = $this->config->get('config_telephone');
			
			$data['phones'] = array();
			if (isset($settings['phones'])) {
				$data['phones'] = $settings['phones'];
			}
			
			$data['fax'] = $this->config->get('config_fax');
			$data['mail'] = $this->config->get('config_email');
			
			if (isset($settings[$language_id]['delivery_hours'])) {
				$data['delivery_hours'] = $settings[$language_id]['delivery_hours'];
			}
			if (isset($settings['background_image'])) {
				$data['background_image'] = $settings['background_image'];
			} else {
				$data['background_image'] = '';
			}
			if (isset($settings[$language_id]['text_menu'])) {
				$data['text_menu'] = $settings[$language_id]['text_menu'];
			}
			if (isset($settings['show_gallery'])) {
				$data['show_gallery'] = $settings['show_gallery'];
				$data['text_gallery'] = $settings[$language_id]['title_gallery'];
			}
			

		$status = true;

		if (isset($this->request->server['HTTP_USER_AGENT'])) {
			$robots = explode("\n", str_replace(array("\r\n", "\r"), "\n", trim($this->config->get('config_robots'))));

			foreach ($robots as $robot) {
				if ($robot && strpos($this->request->server['HTTP_USER_AGENT'], trim($robot)) !== false) {
					$status = false;

					break;
				}
			}
		}

		// Menu
		$this->load->model('catalog/category');

		$this->load->model('catalog/product');

		$data['categories'] = array();

		$categories = $this->model_catalog_category->getCategories(0);

		foreach ($categories as $category) {
			if ($category['top']) {
				// Level 2
				$children_data = array();

				$children = $this->model_catalog_category->getCategories($category['category_id']);

				foreach ($children as $child) {
					$filter_data = array(
						'filter_category_id'  => $child['category_id'],
						'filter_sub_category' => true
					);

						
			$children_level2 = $this->model_catalog_category->getCategories($child['category_id']);
			$children_data_level2 = array();
			
			foreach ($children_level2 as $child_level2) {
				$data_level2 = array(
					'filter_category_id'  => $child_level2['category_id'],
					'filter_sub_category' => true
				);
				
				$product_total_level2 = '';
			
				if ($this->config->get('config_product_count')) {
					$product_total_level2 = ' (' . $this->model_catalog_product->getTotalProducts($data_level2) . ')';
				}

				$children_data_level2[] = array(
					'name'  =>  $child_level2['name'],
					'category_id' => $child_level2['category_id'],
					'href'  => $this->url->link('product/category', 'path=' . $child['category_id'] . '_' . $child_level2['category_id']),
					
				);
			}

			$children_data[] = array(
				'name'        => $child['name'],
				'category_id' => $child['category_id'],
				'children'   => $children_data_level2,
				'href'        => $this->url->link('product/category', 'path=' . $category['category_id'] . '_' . $child['category_id'])	
			);
			
				}

				// Level 1
				$data['categories'][] = array(
					'name'     => $category['name'],
'category_id' => $category['category_id'],
					'children' => $children_data,
					'column'   => $category['column'] ? $category['column'] : 1,
					'href'     => $this->url->link('product/category', 'path=' . $category['category_id'])
				);
			}
		}

		$data['language'] = $this->load->controller('common/language');
		$data['currency'] = $this->load->controller('common/currency');
		$data['search'] = $this->load->controller('common/search');
		$data['cart'] = $this->load->controller('common/cart');

		// For page specific css
		if (isset($this->request->get['route'])) {
			if (isset($this->request->get['product_id'])) {
				$class = '-' . $this->request->get['product_id'];
			} elseif (isset($this->request->get['path'])) {
				$class = '-' . $this->request->get['path'];
			} elseif (isset($this->request->get['manufacturer_id'])) {
				$class = '-' . $this->request->get['manufacturer_id'];
			} else {
				$class = '';
			}

			$data['class'] = str_replace('/', '-', $this->request->get['route']) . $class;
		} else {
			$data['class'] = 'common-home';
		}

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/common/header.tpl')) {
			return $this->load->view($this->config->get('config_template') . '/template/common/header.tpl', $data);
		} else {
			return $this->load->view('default/template/common/header.tpl', $data);
		}
	}
}
