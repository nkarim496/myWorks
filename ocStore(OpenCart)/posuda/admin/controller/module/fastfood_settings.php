<?php
class ControllerModuleFastFoodSettings extends Controller {
	private $error = array(); 
	
	public function index() {
	
		$this->load->language('module/fastfood_settings');
		$this->document->setTitle(strip_tags($this->language->get('heading_title')));
		$this->load->model('setting/setting');
		$this->load->model('tool/image');
		$this->load->model('localisation/language');
		
		$data['languages'] = $this->model_localisation_language->getLanguages();
		
		if ($this->request->server['REQUEST_METHOD'] == 'POST') {
			$this->validate();
		}
		
		$data['lang'] = array_merge($data, $this->language->load('module/fastfood_settings'));
		
		if (isset($this->session->data['success'])) {
			$data['success'] = $this->session->data['success'];
			unset($this->session->data['success']);
		} else {
			$data['success'] = '';
		}

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

  		$data['breadcrumbs'] = array();

   		$data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home', 'token='.$this->session->data['token'], 'SSL'),
      		'separator' => false
   		);

   		$data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_module'),
			'href'      => $this->url->link('extension/module', 'token='.$this->session->data['token'], 'SSL'),
      		'separator' => ' :: '
   		);
		
   		$data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('module/fastfood_settings', 'token='.$this->session->data['token'], 'SSL'),
      		'separator' => ' :: '
   		);
		
		$data['action'] = $this->url->link('module/fastfood_settings', 'token='.$this->session->data['token'], 'SSL');
		
		$data['cancel'] = $this->url->link('extension/module', 'token='.$this->session->data['token'], 'SSL');
		
		$data['token'] = $this->session->data['token'];
		$this->load->model('tool/image');
		$data['placeholder'] = $this->model_tool_image->resize('no_image.png', 100, 100);
		
		$this->load->model('localisation/language');
		$languages = $this->model_localisation_language->getLanguages();
		
		$this->load->model('setting/store');
		
		$results = $this->model_setting_store->getStores();
		
		$data['stores'][] = array(
			'store_id' => 0,
			'name'     => $this->config->get('config_name') . $this->language->get('text_default'),
		);
 
    	foreach ($results as $result) {		
			$data['stores'][] = array(
				'store_id' => $result['store_id'],
				'name'     => $result['name'],
			);
		}
		
		if (isset($this->request->post['fastfood_settings'])) {
			$data['fastfood_settings'] = $this->request->post['fastfood_settings'];
		} elseif ($this->config->get('fastfood_settings')) {
			$data['fastfood_settings'] = $this->config->get('fastfood_settings');
		} else {
			$data['fastfood_settings'] = array();
		}
		
		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');
		
		$this->response->setOutput($this->load->view('module/fastfood_set.tpl', $data));
		
	}
	
	private function validate() {
		if (!$this->user->hasPermission('modify', 'module/fastfood_settings')) {
			$this->error['warning'] = 'У вас недостаточно прав для управления настройками шаблона!';
		} else {
			$this->saveSettings($this->request->post);
		}
		
		if (!$this->error) {
			return true;
		} else {
			return false;
		}	
	}
	
	private function saveSettings($data) {
		$url = $this->url->link('module/fastfood_settings', 'token='.$this->session->data['token'], 'SSL');
		$this->model_setting_setting->editSetting('fastfood_settings', $data);
		$this->session->data['success'] = $this->language->get('text_success');
		$this->response->redirect($url);
	}
}
?>