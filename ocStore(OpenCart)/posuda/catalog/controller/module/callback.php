<?php  
class ControllerModuleCallback extends Controller {
	public function index() {
	
		$settings = $this->config->get('fastfood_settings');
		$settings = $settings[$this->config->get('config_store_id')];
		$language_id = $this->config->get('config_language_id');
		
		if(isset($settings['callback_phone_mask'])) {
			$data['callback_phone_mask'] = $settings['callback_phone_mask'];
		} else {
			$data['callback_phone_mask'] = '';
		}
		
		if(isset($settings['show_reason1'])) {
			$data['show_reason1'] = $settings['show_reason1'];
			$data['text_reason1'] = $settings[$language_id]['text_reason1'];
		} else {
			$data['show_reason1'] = '';
		}
		if(isset($settings['show_reason2'])) {
			$data['show_reason2'] = $settings['show_reason2'];
			$data['text_reason2'] = $settings[$language_id]['text_reason2'];
		} else {
			$data['show_reason2'] = '';
		}
		if(isset($settings['show_reason3'])) {
			$data['show_reason3'] = $settings['show_reason3'];
			$data['text_reason3'] = $settings[$language_id]['text_reason3'];
		} else {
			$data['show_reason3'] = '';
		}
		
		$this->language->load('module/callback');
				
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/callback.tpl')) {
			$this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/module/callback.tpl', $data));
		} else {
			$this->response->setOutput($this->load->view('template/module/callback.tpl', $data));
		}
		
		//$this->response->setOutput($this->render());
		//$this->response->setOutput($this->index());
  	}
	
	public function mail() {
		$this->load->model('extension/extension');
		
		$text = '';
		if (isset($this->request->post['customer_mail'])) {
			$text .= '<b>Имя:</b> ' . $this->request->post['customer_name'] . '<br />';
		}
		if (isset($this->request->post['customer_mail'])) {
			$text .= '<b>Телефон:</b> ' . $this->request->post['customer_phone'] . '<br />';
		}
		if (isset($this->request->post['customer_mail'])) {
			$text .= '<b>E-mail:</b> ' . $this->request->post['customer_mail'] . '<br />';
		}
		if (isset($this->request->post['customer_comment'])) {
			$text .= '<b>Комментарий:</b> ' . $this->request->post['customer_comment'] . '<br />';
		}
		
		if (isset($this->request->post['customer_reason'])) {
			$subject = 'Тема обращения: ' . $this->request->post['customer_reason'];
		} else {
			$subject = 'Заказ звонка';
		}
		
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
		
		if((isset($this->request->post['customer_name']) && $this->request->post['customer_name'] != '') && (isset($this->request->post['customer_phone']) && $this->request->post['customer_phone'] != '')) {
			$mail->send();
			$json['success'] = 'Спасибо, мы свяжемся с вами в ближайшее время.';
		} else {
			$json['error'] = 'Обязательно укажите своё имя и контактный телефон.';
		}
		
		$this->response->setOutput(json_encode($json));
	}
}
?>