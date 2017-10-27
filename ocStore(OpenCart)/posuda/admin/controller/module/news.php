<?php
class ControllerModuleNews extends Controller {
	private $error = array();
	private $_name = 'news';
	private $_version = '1.5.6 v2.0';

	public function index() {
		if ((substr(VERSION, 0, 5) == '1.5.5') || (substr(VERSION, 0, 5) == '1.5.6') || (substr(VERSION, 0, 5) == '1.6.0') || (substr(VERSION, 0, 5) == '1.6.1')) {
			$this->language->load('module/' . $this->_name);
		} else {
			$this->load->language('module/' . $this->_name);
		}

		$data[$this->_name . '_version'] = $this->_version;

		$this->load->model('catalog/news');

		$this->model_catalog_news->checkNews();

		$this->document->setTitle(strip_tags($this->language->get('heading_title')));

		$this->getModule();
	}

	public function insert() {
		if ((substr(VERSION, 0, 5) == '1.5.5') || (substr(VERSION, 0, 5) == '1.5.6') || (substr(VERSION, 0, 5) == '1.6.0') || (substr(VERSION, 0, 5) == '1.6.1')) {
			$this->language->load('module/' . $this->_name);
		} else {
			$this->load->language('module/' . $this->_name);
		}

		$this->load->model('catalog/news');

		$this->document->setTitle(strip_tags($this->language->get('heading_title')));
	
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && ($this->validateForm())) {
			$this->model_catalog_news->addNews($this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');

			$url = '';

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}

			$this->response->redirect($this->url->link('module/news/listing', 'token=' . $this->session->data['token'] . $url, 'SSL'));
		}

		$this->getForm();
	}

	public function update() {
		if ((substr(VERSION, 0, 5) == '1.5.5') || (substr(VERSION, 0, 5) == '1.5.6') || (substr(VERSION, 0, 5) == '1.6.0') || (substr(VERSION, 0, 5) == '1.6.1')) {
			$this->language->load('module/' . $this->_name);
		} else {
			$this->load->language('module/' . $this->_name);
		}

		$this->load->model('catalog/news');

		$this->document->setTitle(strip_tags($this->language->get('heading_title')));

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && ($this->validateForm())) {
			$this->model_catalog_news->editNews($this->request->get['news_id'], $this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');

			$url = '';

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}

			$this->response->redirect($this->url->link('module/news/listing', 'token=' . $this->session->data['token'] . $url, 'SSL'));
		}

		$this->getForm();
	}

	public function delete() {
		if ((substr(VERSION, 0, 5) == '1.5.5') || (substr(VERSION, 0, 5) == '1.5.6') || (substr(VERSION, 0, 5) == '1.6.0') || (substr(VERSION, 0, 5) == '1.6.1')) {
			$this->language->load('module/' . $this->_name);
		} else {
			$this->load->language('module/' . $this->_name);
		}

		$this->load->model('catalog/news');

		$this->document->setTitle(strip_tags($this->language->get('heading_title')));

		if (isset($this->request->post['selected']) && $this->validateDelete()) {
			foreach ($this->request->post['selected'] as $news_id) {
				$this->model_catalog_news->deleteNews($news_id);
			}

			$this->session->data['success'] = $this->language->get('text_success');

			$url = '';

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}

			$this->response->redirect($this->url->link('module/news/listing', 'token=' . $this->session->data['token'] . $url, 'SSL'));
		}

		$this->getList();
	}

	public function reset() {
		if ((substr(VERSION, 0, 5) == '1.5.5') || (substr(VERSION, 0, 5) == '1.5.6') || (substr(VERSION, 0, 5) == '1.6.0') || (substr(VERSION, 0, 5) == '1.6.1')) {
			$this->language->load('module/' . $this->_name);
		} else {
			$this->load->language('module/' . $this->_name);
		}

		$this->load->model('catalog/news');

		$this->document->setTitle(strip_tags($this->language->get('heading_title')));

		if (isset($this->request->post['selected']) && $this->validateReset()) {
			foreach ($this->request->post['selected'] as $news_id) {
				$news_info = $this->model_catalog_news->getNewsStory($news_id);

				if ($news_info && ($news_info['viewed'] > 0)) {
					$this->model_catalog_news->resetViews($news_id);
				}
			}

			$this->session->data['success'] = $this->language->get('text_success');

			$url = '';

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}

			$this->response->redirect($this->url->link('module/news/listing', 'token=' . $this->session->data['token'] . $url, 'SSL'));
		}

		$this->getList();
	}

	public function listing() {
		if ((substr(VERSION, 0, 5) == '1.5.5') || (substr(VERSION, 0, 5) == '1.5.6') || (substr(VERSION, 0, 5) == '1.6.0') || (substr(VERSION, 0, 5) == '1.6.1')) {
			$this->language->load('module/' . $this->_name);
		} else {
			$this->load->language('module/' . $this->_name);
		}

		$this->document->setTitle(strip_tags($this->language->get('heading_title')));
		$this->install();
		$this->getList();
	}

	private function getModule() {
		
		$this->load->model('localisation/language');
		$data['languages'] = $this->model_localisation_language->getLanguages();
		
		$data['lang'] = array_merge($data, $this->language->load('module/news'));

		$this->load->model('catalog/news');
		
		$this->load->model('setting/setting');
		$this->load->model('extension/module');
				
		if (($this->request->server['REQUEST_METHOD'] == 'POST')) {
			if (!isset($this->request->get['module_id'])) {
				if (isset($this->request->post['add_module'])) {
					$this->model_extension_module->addModule('news', $this->request->post);
				}
				$this->model_setting_setting->editSetting('news', $this->request->post);
			} else {
				$this->model_extension_module->editModule($this->request->get['module_id'], $this->request->post);
			}
		
			$this->session->data['success'] = $this->language->get('text_success');
			$this->response->redirect($this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'));
		}

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

 		if (isset($this->error['numchars'])) {
			$data['error_numchars'] = $this->error['numchars'];
		} else {
			$data['error_numchars'] = '';
		}

		if (isset($this->error['newspage_thumb'])) {
			$data['error_newspage_thumb'] = $this->error['newspage_thumb'];
		} else {
			$data['error_newspage_thumb'] = '';
		}

		if (isset($this->error['newspage_popup'])) {
			$data['error_newspage_popup'] = $this->error['newspage_popup'];
		} else {
			$data['error_newspage_popup'] = '';
		}

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
       		'text'		=> $this->language->get('text_home'),
			'href'		=> $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => false
   		);

   		$data['breadcrumbs'][] = array(
       		'text'		=> $this->language->get('text_module'),
			'href'		=> $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => ' :: '
   		);

		$data['breadcrumbs'][] = array(
       		'text'		=> $this->language->get('heading_title'),
			'href'		=> $this->url->link('module/' . $this->_name, 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => ' :: '
   		);

		//$data['news'] = $this->url->link('module/news/listing', 'token=' . $this->session->data['token'], 'SSL');
		
		if (!isset($this->request->get['module_id'])) {
			$data['action'] = $this->url->link('module/news', 'token=' . $this->session->data['token'], 'SSL');
		} else {
			$data['action'] = $this->url->link('module/news', 'token=' . $this->session->data['token'] . '&module_id=' . $this->request->get['module_id'], 'SSL');
		}

		$data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');
		
		if (isset($this->request->get['module_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
			$module_info = $this->model_extension_module->getModule($this->request->get['module_id']);
		}
		
		if (isset($this->request->get['module_id'])) {
			$data['module_id'] = $this->request->get['module_id'];
		} else {
			$data['module_id'] = '';
		}
		
		if (isset($this->request->post['name'])) {
			$data['name'] = $this->request->post['name'];
		} elseif (!empty($module_info)) {
			$data['name'] = $module_info['name'];
		} else {
			$data['name'] = '';
		}
		
		if (isset($this->request->post['status'])) {
			$data['status'] = $this->request->post['status'];
		} elseif (!empty($module_info)) {
			$data['status'] = $module_info['status'];
		} else {
			$data['status'] = '';
		}
		
		$data['news_module'] = array();
		
		if (isset($this->request->post['news_module'])) {
			$data['news_module'] = $this->request->post['news_module'];
		} elseif (!empty($module_info)) {
			$data['news_module'] = $module_info['news_module'];
		}
		
		if ($this->config->get('news')) {
			$data['news'] = $this->config->get('news');
		} else {
			$data['news'] = array();
		}

		$this->load->model('design/layout');

		$data['layouts'] = $this->model_design_layout->getLayouts();

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('module/news.tpl', $data));
	}

	private function getList() {
		if ((substr(VERSION, 0, 5) == '1.5.5') || (substr(VERSION, 0, 5) == '1.5.6') || (substr(VERSION, 0, 5) == '1.6.0') || (substr(VERSION, 0, 5) == '1.6.1')) {
			$this->language->load('module/' . $this->_name);
		} else {
			$this->load->language('module/' . $this->_name);
		}

		if (isset($this->request->get['sort'])) {
			$sort = $this->request->get['sort'];
		} else {
			$sort = 'nd.title';
		}

		if (isset($this->request->get['order'])) {
			$order = $this->request->get['order'];
		} else {
			$order = 'ASC';
		}

		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else {
			$page = 1;
		}

		$url = '';

		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}

		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}

		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'href'		=> $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
			'text'		=> $this->language->get('text_home'),
			'separator' => false
		);

		$data['breadcrumbs'][] = array(
			'href'		=> $this->url->link('module/news/listing', 'token=' . $this->session->data['token'] . $url, 'SSL'),
			'text'		=> $this->language->get('heading_title'),
			'separator' => ' :: '
		);

		$data['module'] = $this->url->link('module/news', 'token=' . $this->session->data['token'], 'SSL');

		$data['insert'] = $this->url->link('module/news/insert', 'token=' . $this->session->data['token'] . $url, 'SSL');
		$data['reset'] = $this->url->link('module/news/reset', 'token=' . $this->session->data['token'] . $url, 'SSL');
		$data['delete'] = $this->url->link('module/news/delete', 'token=' . $this->session->data['token'] . $url, 'SSL');

		$this->load->model('catalog/news');
		$this->load->model('tool/image');

		$data['news'] = array();

		$filter_data = array(
			'sort'  	=> $sort,
			'order' 	=> $order,
			'start' 	=> ($page - 1) * $this->config->get('config_admin_limit'),
			'limit' 		=> $this->config->get('config_admin_limit')
		);

		$news_total = $this->model_catalog_news->getTotalNews();

		$data['totalnews'] = $news_total;

		$results = $this->model_catalog_news->getNews($filter_data);

		foreach ($results as $result) {
			$action = array();

			$action[] = array(
				'text'	=> $this->language->get('text_edit'),
				'href'	=> $this->url->link('module/news/update', 'token=' . $this->session->data['token'] . '&news_id=' . $result['news_id'], 'SSL')
			);

			if ($result['image'] && file_exists(DIR_IMAGE . $result['image'])) {
				$image = $this->model_tool_image->resize($result['image'], 40, 40);
			} else {
				$image = $this->model_tool_image->resize('no_image.jpg', 40, 40);
			}

			$data['news'][] = array(
				'news_id'		=> $result['news_id'],
				'title'				=> $result['title'],
				'image'			=> $image,
				'date_added'	=> date($this->language->get('date_format_short'), strtotime($result['date_added'])),
				'viewed'			=> $result['viewed'],
				'status'			=> $result['status'] ? $this->language->get('text_enabled') : $this->language->get('text_disabled'),
				'selected'		=> isset($this->request->post['selected']) && in_array($result['news_id'], $this->request->post['selected']),
				'action'			=> $action
			);
		}

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_no_results'] = $this->language->get('text_no_results');

		$data['column_image'] = $this->language->get('column_image');
		$data['column_title'] = $this->language->get('column_title');
		$data['column_date_added'] = $this->language->get('column_date_added');
		$data['column_viewed'] = $this->language->get('column_viewed');
		$data['column_status'] = $this->language->get('column_status');
		$data['column_action'] = $this->language->get('column_action');

		$data['button_module'] = $this->language->get('button_module');
		$data['button_reset'] = $this->language->get('button_reset');
		$data['button_insert'] = $this->language->get('button_add');
		$data['button_delete'] = $this->language->get('button_delete');
		
		$data['button_add'] = $this->language->get('button_add');
		$data['button_edit'] = $this->language->get('button_edit');
		$data['button_delete'] = $this->language->get('button_delete');

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		if (isset($this->session->data['success'])) {
			$data['success'] = $this->session->data['success'];

			unset($this->session->data['success']);
		} else {
			$data['success'] = '';
		}

		$url = '';

		if ($order == 'ASC') {
			$url .= '&order=DESC';
		} else {
			$url .= '&order=ASC';
		}

		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}

		$data['sort_title'] = $this->url->link('module/news/listing', 'token=' . $this->session->data['token'] . '&sort=nd.title' . $url, 'SSL');
		$data['sort_date_added'] = $this->url->link('module/news/listing', 'token=' . $this->session->data['token'] . '&sort=n.date_added' . $url, 'SSL');
		$data['sort_viewed'] = $this->url->link('module/news/listing', 'token=' . $this->session->data['token'] . '&sort=n.viewed' . $url, 'SSL');
		$data['sort_status'] = $this->url->link('module/news/listing', 'token=' . $this->session->data['token'] . '&sort=n.status' . $url, 'SSL');

		$url = '';

		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}

		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}

		$pagination = new Pagination();
		$pagination->total = $news_total;
		$pagination->page = $page;
		$pagination->limit = $this->config->get('config_admin_limit');
		$pagination->text = $this->language->get('text_pagination');
		$pagination->url = $this->url->link('module/news/listing', 'token=' . $this->session->data['token'] . $url . '&page={page}', 'SSL');

		$data['pagination'] = $pagination->render();

		$data['sort'] = $sort;
		$data['order'] = $order;

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('module/news_list.tpl', $data));
	}

	private function getForm() {
		if ((substr(VERSION, 0, 5) == '1.5.5') || (substr(VERSION, 0, 5) == '1.5.6') || (substr(VERSION, 0, 5) == '1.6.0') || (substr(VERSION, 0, 5) == '1.6.1')) {
			$this->language->load('module/' . $this->_name);
		} else {
			$this->load->language('module/' . $this->_name);
		}

		$this->load->model('catalog/news');

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');
		$data['text_default'] = $this->language->get('text_default');
		$data['text_image_manager'] = $this->language->get('text_image_manager');
		$data['text_browse'] = $this->language->get('text_browse');
		$data['text_clear'] = $this->language->get('text_clear');
		$data['text_check_all'] = $this->language->get('text_check_all');
		$data['text_uncheck_all'] = $this->language->get('text_uncheck_all');

		$data['entry_title'] = $this->language->get('entry_title');
		$data['entry_meta_description'] = $this->language->get('entry_meta_description');
		$data['entry_description'] = $this->language->get('entry_description');
		$data['entry_store'] = $this->language->get('entry_store');
		$data['entry_keyword'] = $this->language->get('entry_keyword');
		$data['entry_image'] = $this->language->get('entry_image');
		$data['entry_status'] = $this->language->get('entry_status');

		$data['button_save'] = $this->language->get('button_save');
		$data['button_cancel'] = $this->language->get('button_cancel');
		
		$data['button_add'] = $this->language->get('button_add');
		$data['button_edit'] = $this->language->get('button_edit');
		$data['button_delete'] = $this->language->get('button_delete');

		$data['tab_language'] = $this->language->get('tab_language');
		$data['tab_setting'] = $this->language->get('tab_setting');

		$data['token'] = $this->session->data['token'];
		$data['ckeditor'] = $this->config->get('config_editor_default');
		$data['lang'] = $this->language->get('lang');
		
		$this->load->model('tool/image');
		$data['placeholder'] = $this->model_tool_image->resize('no_image.png', 100, 100);

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		if (isset($this->error['title'])) {
			$data['error_title'] = $this->error['title'];
		} else {
			$data['error_title'] = '';
		}

		if (isset($this->error['description'])) {
			$data['error_description'] = $this->error['description'];
		} else {
			$data['error_description'] = '';
		}

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'href'		=> $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
			'text'		=> $this->language->get('text_home'),
			'separator' => false
		);

		$data['breadcrumbs'][] = array(
			'href'		=> $this->url->link('module/news/listing', 'token=' . $this->session->data['token'], 'SSL'),
			'text'		=> $this->language->get('heading_title'),
			'separator' => ' :: '
		);

		if (!isset($this->request->get['news_id'])) {
			$data['action'] = $this->url->link('module/news/insert', 'token=' . $this->session->data['token'], 'SSL');
		} else {
			$data['action'] = $this->url->link('module/news/update', 'token=' . $this->session->data['token'] . '&news_id=' . $this->request->get['news_id'], 'SSL');
		}

		$data['cancel'] = $this->url->link('module/news/listing', 'token=' . $this->session->data['token'], 'SSL');

		if ((isset($this->request->get['news_id'])) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
			$news_info = $this->model_catalog_news->getNewsStory($this->request->get['news_id']);
		}

		$this->load->model('localisation/language');

		$data['languages'] = $this->model_localisation_language->getLanguages();

		if (isset($this->request->post['news_description'])) {
			$data['news_description'] = $this->request->post['news_description'];
		} elseif (isset($this->request->get['news_id'])) {
			$data['news_description'] = $this->model_catalog_news->getNewsDescriptions($this->request->get['news_id']);
		} else {
			$data['news_description'] = array();
		}

		$this->load->model('setting/store');

		$data['stores'] = $this->model_setting_store->getStores();

		if (isset($this->request->post['news_store'])) {
			$data['news_store'] = $this->request->post['news_store'];
		} elseif (isset($news_info)) {
			$data['news_store'] = $this->model_catalog_news->getNewsStores($this->request->get['news_id']);
		} else {
			$data['news_store'] = array(0);
		}

		if (isset($this->request->post['keyword'])) {
			$data['keyword'] = $this->request->post['keyword'];
		} elseif (isset($news_info)) {
			$data['keyword'] = $news_info['keyword'];
		} else {
			$data['keyword'] = '';
		}

		if (isset($this->request->post['status'])) {
			$data['status'] = $this->request->post['status'];
		} elseif (isset($news_info)) {
			$data['status'] = $news_info['status'];
		} else {
			$data['status'] = '';
		}

		if (isset($this->request->post['image'])) {
			$data['image'] = $this->request->post['image'];
		} elseif (!empty($news_info)) {
			$data['image'] = $news_info['image'];
		} else {
			$data['image'] = '';
		}

		$this->load->model('tool/image');

		$data['no_image'] = $this->model_tool_image->resize('no_image.jpg', 100, 100);

		if (isset($this->request->post['image']) && file_exists(DIR_IMAGE . $this->request->post['image'])) {
			$data['thumb'] = $this->model_tool_image->resize($this->request->post['image'], 100, 100);
		} elseif (!empty($news_info) && $news_info['image'] && file_exists(DIR_IMAGE . $news_info['image'])) {
			$data['thumb'] = $this->model_tool_image->resize($news_info['image'], 100, 100);
		} else {
			$data['thumb'] = $this->model_tool_image->resize('no_image.jpg', 100, 100);
		}

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('module/news_form.tpl', $data));
	}

	private function validate() {
		if (!$this->user->hasPermission('modify', 'module/news')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		if (!$this->request->post['news_headline_chars']) {
			$this->error['numchars'] = $this->language->get('error_numchars');
		}

		if (!$this->request->post['news_thumb_width'] || !$this->request->post['news_thumb_height']) {
			$this->error['newspage_thumb'] = $this->language->get('error_newspage_thumb');
		}

		if (!$this->request->post['news_popup_width'] || !$this->request->post['news_popup_height']) {
			$this->error['newspage_popup'] = $this->language->get('error_newspage_popup');
		}

		if (!$this->error) {
			return true;
		} else {
			return false;
		}
	}

	private function validateForm() {
		if (!$this->user->hasPermission('modify', 'module/news')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		foreach ($this->request->post['news_description'] as $language_id => $value) {
			if ((strlen($value['title']) < 3) || (strlen($value['title']) > 250)) {
				$this->error['title'][$language_id] = $this->language->get('error_title');
			}

			if (strlen($value['description']) < 3) {
				$this->error['description'][$language_id] = $this->language->get('error_description');
			}
		}

		if (!$this->error) {
			return true;
		} else {
			return false;
		}
	}

	private function validateDelete() {
		if (!$this->user->hasPermission('modify', 'module/news')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		if (!$this->error) {
			return true;
		} else {
			return false;
		}
	}

	private function validateReset() {
		if (!$this->user->hasPermission('modify', 'module/news')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		if (!$this->error) {
			return true;
		} else {
			return false;
		}
	}

	public function install() {
		$this->db->query("CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "news` (`news_id` int(11) NOT NULL AUTO_INCREMENT, `image` varchar(255) DEFAULT NULL, `date_added` datetime NOT NULL, `viewed` int(11) NOT NULL DEFAULT '0', `status` tinyint(1) NOT NULL, PRIMARY KEY (`news_id`)) ENGINE=MYISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci");
		$this->db->query("CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "news_description` (`news_id` int(11) NOT NULL, `language_id` int(11) NOT NULL, `title` varchar(255) NOT NULL, `meta_description` VARCHAR(255) NOT NULL, `description` text CHARACTER SET utf8 NOT NULL, `keyword` varchar(255) NOT NULL,  PRIMARY KEY (`news_id`,`language_id`)) ENGINE=MYISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci");
		$this->db->query("CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "news_to_store` (`news_id` int(11) NOT NULL, `store_id` int(11) NOT NULL, PRIMARY KEY (`news_id`,`store_id`)) ENGINE=MYISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci");
		$this->db->query("INSERT INTO " . DB_PREFIX . "url_alias SET query = 'information/news', keyword = 'news'");
	}

	public function uninstall() {
		$this->cache->delete('news');

		$this->db->query("DROP TABLE IF EXISTS `" . DB_PREFIX . "news`");
		$this->db->query("DROP TABLE IF EXISTS `" . DB_PREFIX . "news_description`");
		$this->db->query("DROP TABLE IF EXISTS `" . DB_PREFIX . "news_to_store`");

		$this->db->query("DELETE FROM `" . DB_PREFIX . "layout` WHERE `name` LIKE 'News' LIMIT 1");
		$this->db->query("DELETE FROM `" . DB_PREFIX . "layout_route` WHERE `route` LIKE 'information/news' LIMIT 1");
		$this->db->query("DELETE FROM `" . DB_PREFIX . "url_alias` WHERE `query` LIKE 'news_id=%'");
    }
}
?>