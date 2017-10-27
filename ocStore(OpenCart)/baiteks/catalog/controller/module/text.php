<?php  
class ControllerModuleText extends Controller {
	protected function index($setting) {
		$this->language->load('module/text');
    	
		$this->data['message'] = html_entity_decode($setting['description'][$this->config->get('config_language_id')], ENT_QUOTES, 'UTF-8');
		$this->data['title'] = html_entity_decode($setting['title'][$this->config->get('config_language_id')], ENT_QUOTES, 'UTF-8');

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/text.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/module/text.tpl';
		} else {
			$this->template = 'default/template/module/text.tpl';
		}
		
		$this->render();
	}
}
?>