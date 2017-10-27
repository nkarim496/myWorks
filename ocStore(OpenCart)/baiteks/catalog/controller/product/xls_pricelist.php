<?php 
class ControllerProductXlsPricelist extends Controller {  



	var $width =0;
	var $delim = 0;
	var $l_margin = 0;
	var $xls_pricelist_store = array();
	var $xls_pricelist_category = array();
	var $xls_pricelist_poles = array();
	var $poles_count = 0;
	var $alignments = array();
	var $sheet = '';
	
	var $xls_pricelist_image_width = 50;
	var $xls_pricelist_image_height = 50;
	var $xls_pricelist_title = '';
	var $xls_pricelist_adress = '';
	var $xls_pricelist_phone = '';
	var $xls_pricelist_email = '';
	var $xls_pricelist_link = '';
	var $xls_pricelist_custom_text = '';
	var $xls_pricelist_title_color  = '';
	var $xls_pricelist_adress_color = '';
	var $xls_pricelist_phone_color = '';
	var $xls_pricelist_email_color = '';
	var $xls_pricelist_link_color = '';
	var $xls_pricelist_custom_color = '';
	var $xls_pricelist_sort_order = '';
	var $xls_pricelist_currency = '';
	var $xls_pricelist_customer_group = '';
	var $xls_pricelist_attribute_group = '';
	var $xls_pricelist_listname = '';
	var $xls_pricelist_use_options = '';
	var $xls_pricelist_use_attributes = '';
	var $xls_pricelist_nodubles = '';
	var $xls_pricelist_use_quantity = '';
	var $xls_pricelist_use_notinstock = '';
	var $xls_pricelist_language = '';
	var $xls_pricelist_usecache = 'no';
	var $xls_pricelist_memcacheServer = 'localhost';
	var $xls_pricelist_memcachePort = 11211;
	var $xls_pricelist_cacheTime = 600;
	
	var $xls_pricelist_category_link = '';
	var $xls_pricelist_product_link = '';
	
	var $xls_pricelist_code = '';
	var $xls_pricelist_model_width = '';
	var $xls_pricelist_name_width = '';
	var $xls_pricelist_stock_width = '';
	var $xls_pricelist_price_width = '';
	var $xls_pricelist_special_width = '';
	
	var $xls_pricelist_logo = '';
	var $xls_pricelist_logo_width = '';
	var $xls_pricelist_logo_height = '';
	var $xls_pricelist_use_collapse = 0;
	var $xls_pricelist_use_protection = 0;
	var $xls_pricelist_use_password = '';
	
	var $xls_pricelist_thead_color = '';
	var $xls_pricelist_thead_color_bg = '';
	var $xls_pricelist_underthead_color_bg = '';
	var $xls_pricelist_category0_color = '';
	var $xls_pricelist_category0_color_bg = '';
	var $xls_pricelist_category1_color = '';
	var $xls_pricelist_category1_color_bg = '';
	var $xls_pricelist_category2_color = '';
	var $xls_pricelist_category2_color_bg = '';
	


	var $LNG=array();
	
	public function index() {
		
		$json = array();
		if(!$this->config->get('xls_pricelist_view')){
			if ($this->request->server['REQUEST_METHOD'] != 'POST') {
				$this->redirect($this->url->link('error/not_found'));
			}
			if ($this->request->server['REQUEST_METHOD'] == 'POST') {
				if($this->request->post['action'] != 'generate'){
					$this->redirect($this->url->link('error/not_found'));
				}
			}
		}
			$this->xls_pricelist_usecache = $this->config->get('xls_pricelist_usecache');
			$this->xls_pricelist_memcacheServer = $this->config->get('xls_pricelist_memcacheServer');
			$this->xls_pricelist_memcachePort = $this->config->get('xls_pricelist_memcachePort');
			$this->xls_pricelist_cacheTime = $this->config->get('xls_pricelist_cacheTime');
			$this->xls_pricelist_sort_order = $this->config->get('xls_pricelist_sort_order');
			$this->xls_pricelist_customer_group = $this->config->get('xls_pricelist_customer_group');
			$this->xls_pricelist_attribute_group = $this->config->get('xls_pricelist_attribute_group');
			$this->xls_pricelist_category = $this->config->get('xls_pricelist_category');
			$this->xls_pricelist_poles = $this->config->get('xls_pricelist_poles');
			
			$this->xls_pricelist_category_link = $this->config->get('xls_pricelist_category_link');
			$this->xls_pricelist_product_link = $this->config->get('xls_pricelist_product_link');

			$this->xls_pricelist_store = $this->config->get('xls_pricelist_store');
			$this->xls_pricelist_use_options = $this->config->get('xls_pricelist_use_options');
			$this->xls_pricelist_use_attributes = $this->config->get('xls_pricelist_use_attributes');
			$this->xls_pricelist_nodubles = $this->config->get('xls_pricelist_nodubles');
			
			$this->xls_pricelist_use_quantity = $this->config->get('xls_pricelist_use_quantity');
			$this->xls_pricelist_use_notinstock = $this->config->get('xls_pricelist_use_notinstock');
			$this->xls_pricelist_image_width = $this->config->get('xls_pricelist_image_width');
			$this->xls_pricelist_image_height = $this->config->get('xls_pricelist_image_height');
			
			$this->xls_pricelist_code = $this->config->get('xls_pricelist_code');
			$this->xls_pricelist_model_width = $this->config->get('xls_pricelist_model_width');
			$this->xls_pricelist_name_width = $this->config->get('xls_pricelist_name_width');
			$this->xls_pricelist_stock_width = $this->config->get('xls_pricelist_stock_width');
			$this->xls_pricelist_price_width = $this->config->get('xls_pricelist_price_width');
			$this->xls_pricelist_special_width = $this->config->get('xls_pricelist_special_width');
			$this->xls_pricelist_logo = $this->config->get('xls_pricelist_logo');
			$this->xls_pricelist_logo_width = $this->config->get('xls_pricelist_logo_width');
			$this->xls_pricelist_logo_height = $this->config->get('xls_pricelist_logo_height');
			$this->xls_pricelist_use_collapse = $this->config->get('xls_pricelist_use_collapse');
			$this->xls_pricelist_use_protection = $this->config->get('xls_pricelist_use_protection');
			$this->xls_pricelist_use_password = $this->config->get('xls_pricelist_use_password');
			

			$xls_pricelist_description = $this->config->get('xls_pricelist_description');
			$xls_pricelist_colors = $this->config->get('xls_pricelist_colors');
			
			$this->xls_pricelist_thead_color = $xls_pricelist_colors['thead'];
			$this->xls_pricelist_thead_color_bg = $xls_pricelist_colors['thead_bg'];
			$this->xls_pricelist_underthead_color_bg = $xls_pricelist_colors['underthead_bg'];
			$this->xls_pricelist_category0_color = $xls_pricelist_colors['category0'];
			$this->xls_pricelist_category0_color_bg = $xls_pricelist_colors['category0_bg'];
			$this->xls_pricelist_category1_color = $xls_pricelist_colors['category1'];
			$this->xls_pricelist_category1_color_bg = $xls_pricelist_colors['category1_bg'];
			$this->xls_pricelist_category2_color = $xls_pricelist_colors['category2'];
			$this->xls_pricelist_category2_color_bg = $xls_pricelist_colors['category2_bg'];
			
			
		
		$this->load->model('localisation/language');	
		$languages = $this->model_localisation_language->getLanguages();
		
		
		foreach($languages as $language){
		//if($language['language_id']==1)continue;
			$this->xls_pricelist_currency = $xls_pricelist_description[$language['language_id']]['currency'];
			$this->xls_pricelist_title = $xls_pricelist_description[$language['language_id']]['title'];
			$this->xls_pricelist_adress = $xls_pricelist_description[$language['language_id']]['adress'];
			$this->xls_pricelist_phone = $xls_pricelist_description[$language['language_id']]['phone'];
			$this->xls_pricelist_email = $xls_pricelist_description[$language['language_id']]['email'];
			$this->xls_pricelist_link = $xls_pricelist_description[$language['language_id']]['link'];
			$this->xls_pricelist_custom_text = $xls_pricelist_description[$language['language_id']]['custom_text'];
			$this->xls_pricelist_title_color = $xls_pricelist_description[$language['language_id']]['title_color'];
			$this->xls_pricelist_adress_color = $xls_pricelist_description[$language['language_id']]['adress_color'];
			$this->xls_pricelist_phone_color = $xls_pricelist_description[$language['language_id']]['phone_color'];
			$this->xls_pricelist_email_color = $xls_pricelist_description[$language['language_id']]['email_color'];
			$this->xls_pricelist_link_color = $xls_pricelist_description[$language['language_id']]['link_color'];
			$this->xls_pricelist_custom_color = $xls_pricelist_description[$language['language_id']]['custom_color'];
			$this->xls_pricelist_listname = $xls_pricelist_description[$language['language_id']]['listname'];
			$this->xls_pricelist_language = $language;
			
			if($this->config->get('xls_pricelist_view')&&$this->request->server['REQUEST_METHOD'] != 'POST'){
				$this->generate('view');
			}else{
				$this->generate();
				$json['success'] = 1;
				
			}
		
		}
		
		if(isset($json['success'])&&$json['success'])$this->response->setOutput(json_encode($json));
		
	}
	
	
	
	
	public function view() {
		
		
		if ($this->request->server['REQUEST_METHOD'] != 'POST') {
			$this->redirect($this->url->link('error/not_found'));

				
		}
		if ($this->request->server['REQUEST_METHOD'] == 'POST') {
			if($this->request->post['action'] != 'generate'){
				$this->redirect($this->url->link('error/not_found'));
			}
		}
		
		if(isset($this->request->post['xls_pricelist_store'])){
			$this->xls_pricelist_store = implode('_',$this->request->post['xls_pricelist_store']);
		}else{
			$this->xls_pricelist_store = $this->config->get('xls_pricelist_store');
		}
		
		if(isset($this->request->post['xls_pricelist_category'])){
			$this->xls_pricelist_category = implode('_',$this->request->post['xls_pricelist_category']);
		}else{
			$this->xls_pricelist_category = $this->config->get('xls_pricelist_category');
		}
		
		if(isset($this->request->post['xls_pricelist_poles'])){
			$this->xls_pricelist_poles = $this->request->post['xls_pricelist_poles'];
		}else{
			$this->xls_pricelist_poles = $this->config->get('xls_pricelist_poles');
		}
		
		
		if(isset($this->request->post['xls_pricelist_use_options'])){
			$this->xls_pricelist_use_options = $this->request->post['xls_pricelist_use_options'];
		}else{
			$this->xls_pricelist_use_options = $this->config->get('xls_pricelist_use_options');
		}
		if(isset($this->request->post['xls_pricelist_use_attributes'])){
			$this->xls_pricelist_use_attributes = $this->request->post['xls_pricelist_use_attributes'];
		}else{
			$this->xls_pricelist_use_attributes = $this->config->get('xls_pricelist_use_attributes');
		}
		if(isset($this->request->post['xls_pricelist_nodubles'])){
			$this->xls_pricelist_nodubles = $this->request->post['xls_pricelist_nodubles'];
		}else{
			$this->xls_pricelist_nodubles = $this->config->get('xls_pricelist_nodubles');
		}
		
		if(isset($this->request->post['xls_pricelist_use_quantity'])){
			$this->xls_pricelist_use_quantity = $this->request->post['xls_pricelist_use_quantity'];
		}else{
			$this->xls_pricelist_use_quantity = $this->config->get('xls_pricelist_use_quantity');
		}
		
		if(isset($this->request->post['xls_pricelist_code'])){
			$this->xls_pricelist_code = $this->request->post['xls_pricelist_code'];
		}else{
			$this->xls_pricelist_code = $this->config->get('xls_pricelist_code');
		}
		if(isset($this->request->post['xls_pricelist_use_collapse'])){
			$this->xls_pricelist_use_collapse = $this->request->post['xls_pricelist_use_collapse'];
		}else{
			$this->xls_pricelist_use_collapse = $this->config->get('xls_pricelist_use_collapse');
		}
		if(isset($this->request->post['xls_pricelist_use_protection'])){
			$this->xls_pricelist_use_protection = $this->request->post['xls_pricelist_use_protection'];
		}else{
			$this->xls_pricelist_use_protection = $this->config->get('xls_pricelist_use_protection');
		}
		if(isset($this->request->post['xls_pricelist_use_password'])){
			$this->xls_pricelist_use_password = $this->request->post['xls_pricelist_use_password'];
		}else{
			$this->xls_pricelist_use_password = $this->config->get('xls_pricelist_use_password');
		}
		
		
		if(isset($this->request->post['xls_pricelist_model_width'])){
			$this->xls_pricelist_model_width = (int)$this->request->post['xls_pricelist_model_width'];
		}else{
			$this->xls_pricelist_model_width = $this->config->get('xls_pricelist_model_width');
		}
		if(isset($this->request->post['xls_pricelist_name_width'])){
			$this->xls_pricelist_name_width = (int)$this->request->post['xls_pricelist_name_width'];
		}else{
			$this->xls_pricelist_name_width = $this->config->get('xls_pricelist_name_width');
		}
		if(isset($this->request->post['xls_pricelist_stock_width'])){
			$this->xls_pricelist_stock_width = (int)$this->request->post['xls_pricelist_stock_width'];
		}else{
			$this->xls_pricelist_stock_width = $this->config->get('xls_pricelist_stock_width');
		}
		if(isset($this->request->post['xls_pricelist_price_width'])){
			$this->xls_pricelist_price_width = (int)$this->request->post['xls_pricelist_price_width'];
		}else{
			$this->xls_pricelist_price_width = $this->config->get('xls_pricelist_price_width');
		}
		if(isset($this->request->post['xls_pricelist_special_width'])){
			$this->xls_pricelist_special_width = (int)$this->request->post['xls_pricelist_special_width'];
		}else{
			$this->xls_pricelist_special_width = $this->config->get('xls_pricelist_special_width');
		}
		if(isset($this->request->post['xls_pricelist_use_notinstock'])){
			$this->xls_pricelist_use_notinstock = $this->request->post['xls_pricelist_use_notinstock'];
		}else{
			$this->xls_pricelist_use_notinstock = $this->config->get('xls_pricelist_use_notinstock');
		}
		if(isset($this->request->post['xls_pricelist_usecache'])){
			$this->xls_pricelist_usecache = $this->request->post['xls_pricelist_usecache'];
		}else{
			$this->xls_pricelist_usecache = $this->config->get('xls_pricelist_usecache');
		}
		if(isset($this->request->post['xls_pricelist_category_link'])){
			$this->xls_pricelist_category_link = $this->request->post['xls_pricelist_category_link'];
		}else{
			$this->xls_pricelist_category_link = $this->config->get('xls_pricelist_category_link');
		}
		if(isset($this->request->post['xls_pricelist_product_link'])){
			$this->xls_pricelist_product_link = $this->request->post['xls_pricelist_product_link'];
		}else{
			$this->xls_pricelist_product_link = $this->config->get('xls_pricelist_product_link');
		}
		if(isset($this->request->post['xls_pricelist_memcacheServer'])){
			$this->xls_pricelist_memcacheServer = $this->request->post['xls_pricelist_memcacheServer']?$this->request->post['xls_pricelist_memcacheServer']:'localhost';
		}else{
			$this->xls_pricelist_memcacheServer = $this->config->get('xls_pricelist_memcacheServer');
		}
		if(isset($this->request->post['xls_pricelist_memcachePort'])){
			$this->xls_pricelist_memcachePort = (int)$this->request->post['xls_pricelist_memcachePort']?$this->request->post['xls_pricelist_memcachePort']:11211;
		}else{
			$this->xls_pricelist_memcachePort = $this->config->get('xls_pricelist_memcachePort');
		}
		if(isset($this->request->post['xls_pricelist_cacheTime'])){
			$this->xls_pricelist_cacheTime = (int)$this->request->post['xls_pricelist_cacheTime']?$this->request->post['xls_pricelist_cacheTime']:600;
		}else{
			$this->xls_pricelist_cacheTime = $this->config->get('xls_pricelist_cacheTime');
		}

		if(isset($this->request->post['xls_pricelist_image_width'])){
			$this->xls_pricelist_image_width = $this->request->post['xls_pricelist_image_width'];
		}else{	
			$this->xls_pricelist_image_width = $this->config->get('xls_pricelist_image_width');
		}
		if(isset($this->request->post['xls_pricelist_image_height'])){
			$this->xls_pricelist_image_height = $this->request->post['xls_pricelist_image_height'];
		}else{
			$this->xls_pricelist_image_height = $this->config->get('xls_pricelist_image_height');
		}
		if(isset($this->request->post['xls_pricelist_sort_order'])){
			$this->xls_pricelist_sort_order = $this->request->post['xls_pricelist_sort_order'];
		}else{
			$this->xls_pricelist_sort_order = $this->config->get('xls_pricelist_sort_order');
		}
		if(isset($this->request->post['xls_pricelist_customer_group'])){
			$this->xls_pricelist_customer_group = implode('_',$this->request->post['xls_pricelist_customer_group']);
		}else{
			$this->xls_pricelist_customer_group = $this->config->get('xls_pricelist_customer_group');
		}
		if(isset($this->request->post['xls_pricelist_attribute_group'])){
			$this->xls_pricelist_attribute_group = implode('_',$this->request->post['xls_pricelist_attribute_group']);
		}else{
			$this->xls_pricelist_attribute_group = $this->config->get('xls_pricelist_attribute_group');
		}
		if(isset($this->request->post['xls_pricelist_listname'])){
			$this->xls_pricelist_listname = $this->request->post['xls_pricelist_listname'];
		}else{
			$this->xls_pricelist_listname = $this->config->get('xls_pricelist_listname');
		}
		
		if(isset($this->request->post['xls_pricelist_logo'])){
			$this->xls_pricelist_logo = $this->request->post['xls_pricelist_logo'];
		}else{
			$this->xls_pricelist_logo = $this->config->get('xls_pricelist_logo');
		}
		
		if(isset($this->request->post['xls_pricelist_logo_width'])){
			$this->xls_pricelist_logo_width = $this->request->post['xls_pricelist_logo_width'];
		}else{
			$this->xls_pricelist_logo_width = $this->config->get('xls_pricelist_logo_width');
		}
		
		if(isset($this->request->post['xls_pricelist_logo_height'])){
			$this->xls_pricelist_logo_height = $this->request->post['xls_pricelist_logo_height'];
		}else{
			$this->xls_pricelist_logo_height = $this->config->get('xls_pricelist_logo_height');
		}
		
		if(isset($this->request->post['xls_pricelist_description'])){
			$xls_pricelist_description = $this->request->post['xls_pricelist_description'];
		}else{
			$xls_pricelist_description = $this->config->get('xls_pricelist_description');
		}
		if(isset($this->request->post['xls_pricelist_colors'])){
			$xls_pricelist_colors = $this->request->post['xls_pricelist_colors'];
		}else{
			$xls_pricelist_colors = $this->config->get('xls_pricelist_colors');
		}

		$this->xls_pricelist_thead_color = $xls_pricelist_colors['thead'];
		$this->xls_pricelist_thead_color_bg = $xls_pricelist_colors['thead_bg'];
		$this->xls_pricelist_underthead_color_bg = $xls_pricelist_colors['underthead_bg'];
		$this->xls_pricelist_category0_color = $xls_pricelist_colors['category0'];
		$this->xls_pricelist_category0_color_bg = $xls_pricelist_colors['category0_bg'];
		$this->xls_pricelist_category1_color = $xls_pricelist_colors['category1'];
		$this->xls_pricelist_category1_color_bg = $xls_pricelist_colors['category1_bg'];
		$this->xls_pricelist_category2_color = $xls_pricelist_colors['category2'];
		$this->xls_pricelist_category2_color_bg = $xls_pricelist_colors['category2_bg'];
			
		
		$this->load->model('localisation/language');	
		$languages = $this->model_localisation_language->getLanguages();
		
		
		foreach($languages as $language){
			$this->xls_pricelist_currency = $xls_pricelist_description[$language['language_id']]['currency'];
			$this->xls_pricelist_title = $xls_pricelist_description[$language['language_id']]['title'];
			$this->xls_pricelist_adress = $xls_pricelist_description[$language['language_id']]['adress'];
			$this->xls_pricelist_phone = $xls_pricelist_description[$language['language_id']]['phone'];
			$this->xls_pricelist_email = $xls_pricelist_description[$language['language_id']]['email'];
			$this->xls_pricelist_link = $xls_pricelist_description[$language['language_id']]['link'];
			$this->xls_pricelist_custom_text = $xls_pricelist_description[$language['language_id']]['custom_text'];
			$this->xls_pricelist_listname = $xls_pricelist_description[$language['language_id']]['listname'];
			$this->xls_pricelist_title_color = $xls_pricelist_description[$language['language_id']]['title_color'];
			$this->xls_pricelist_adress_color = $xls_pricelist_description[$language['language_id']]['adress_color'];
			$this->xls_pricelist_phone_color = $xls_pricelist_description[$language['language_id']]['phone_color'];
			$this->xls_pricelist_email_color = $xls_pricelist_description[$language['language_id']]['email_color'];
			$this->xls_pricelist_link_color = $xls_pricelist_description[$language['language_id']]['link_color'];
			$this->xls_pricelist_custom_color = $xls_pricelist_description[$language['language_id']]['custom_color'];
			$this->xls_pricelist_language = $language;
		
		$this->generate('view');
		break;
		}
	}
	
	
	// Error Handler
	public function error_handler_for_export($errno, $errstr, $errfile, $errline) {
		global $config;
		global $log;
		
		switch ($errno) {
			case E_NOTICE:
			case E_USER_NOTICE:
				$errors = "Notice";
				break;
			case E_WARNING:
			case E_USER_WARNING:
				$errors = "Warning";
				break;
			case E_ERROR:
			case E_USER_ERROR:
				$errors = "Fatal Error";
				break;
			default:
				$errors = "Unknown";
				break;
		}
			
		if (($errors=='Warning') || ($errors=='Unknown')) {
			return true;
		}

		if ($config->get('config_error_display')) {
			echo '<b>' . $errors . '</b>: ' . $errstr . ' in <b>' . $errfile . '</b> on line <b>' . $errline . '</b>';
		}
		
		if ($config->get('config_error_log')) {
			$log->write('PHP ' . $errors . ':  ' . $errstr . ' in ' . $errfile . ' on line ' . $errline);
		}

		return true;
	}


	public function fatal_error_shutdown_handler_for_export()
	{
		$last_error = error_get_last();
		if ($last_error['type'] === E_ERROR) {
			// fatal error
			error_handler_for_export(E_ERROR, $last_error['message'], $last_error['file'], $last_error['line']);
		}
	}

	
	
	
	private function generate($method='') {
		if(!defined('HTTP_IMAGE')) {
			define('HTTP_IMAGE', HTTP_SERVER.'image/');
		}
		set_error_handler(array($this, 'error_handler_for_export'));
		//register_shutdown_function(array($this, 'fatal_error_shutdown_handler_for_export'));
		
		//ini_set("memory_limit","512M");
		//ini_set("max_execution_time",180);
		
		$_ = array();
		require(DIR_LANGUAGE . $this->xls_pricelist_language['directory'] . '/product/xls_pricelist.php');
		$this->LNG = $_;
		
	
		set_include_path(DIR_SYSTEM.'PHPExcel/Classes');		
		
		require_once "PHPExcel.php";

		if (!extension_loaded('zip')) { 
			if (!dl('zip.so')) {
				PHPExcel_Settings::setZipClass(PHPExcel_Settings::PCLZIP);
			}
		}

		if($this->xls_pricelist_usecache!='no'){
			if($this->xls_pricelist_usecache=='file'){
				$cacheMethod = PHPExcel_CachedObjectStorageFactory:: cache_to_discISAM;
				
				if(ini_get('upload_tmp_dir')) $upload_tmp_dir = ini_get('upload_tmp_dir');
				else $upload_tmp_dir = DIR_DOWNLOAD;
				
				$cacheSettings = array( 'dir'  => $upload_tmp_dir );
				
				PHPExcel_Settings::setCacheStorageMethod($cacheMethod, $cacheSettings);
			}elseif($this->xls_pricelist_usecache=='memcache'){
				$cacheMethod = PHPExcel_CachedObjectStorageFactory::cache_to_memcache;
				$cacheSettings = array( 'memcacheServer'  => ''.$this->xls_pricelist_memcacheServer.'',
										'memcachePort'    => (int)$this->xls_pricelist_memcachePort,
										'cacheTime'       => (int)$this->xls_pricelist_cacheTime
									  );
				PHPExcel_Settings::setCacheStorageMethod($cacheMethod, $cacheSettings);
			}
		}
		
		$this->xls_pricelist_poles = array_values($this->xls_pricelist_poles);
		$this->poles_count = sizeof($this->xls_pricelist_poles);
		$this->alignments = array(
			'left'	=> PHPExcel_Style_Alignment::HORIZONTAL_LEFT,
			'right'	=> PHPExcel_Style_Alignment::HORIZONTAL_RIGHT,
			'center'	=> PHPExcel_Style_Alignment::HORIZONTAL_CENTER,
		);
		
		
		$stores=explode("_", $this->xls_pricelist_store);
		foreach($stores as $store){ 
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "setting WHERE store_id = '".(int)$store."'");



		foreach ($query->rows as $setting) {
			$this->config->set('config_store_id', $store);
			if (!$setting['serialized']) {
				$this->config->set($setting['key'], $setting['value']);
			} else {
				$this->config->set($setting['key'], unserialize($setting['value']));
			}
		}	
		$workbook = new PHPExcel();
		
		
		$this->load->model('xls_pricelist/helper_models');
		$cust_groups=explode("_", $this->xls_pricelist_customer_group);
		$sh=0;
		foreach($cust_groups as $cust_group){
			$this->delim = 0;
			$customer_group = $this->model_xls_pricelist_helper_models->getCustomerGroup($cust_group);
			if(!isset($customer_group['name']))$customer_group = $this->model_xls_pricelist_helper_models->getCustomerGroup1($cust_group, $this->xls_pricelist_language['language_id']);
			if(!$customer_group)continue;
			if(sizeof($cust_groups)==1&&$this->xls_pricelist_listname){
				$workbook->setActiveSheetIndex($sh);
				$this->sheet = $workbook->getActiveSheet();
				$this->sheet->setTitle($this->xls_pricelist_listname );
			}
			else{
				if($sh)$workbook->createSheet();
				$workbook->setActiveSheetIndex($sh);
				$this->sheet = $workbook->getActiveSheet();
				$this->sheet->setTitle($customer_group['name']);
			}
		
		if($this->xls_pricelist_use_collapse){		
			$this->sheet->setShowSummaryBelow(false);////collapse
		}
		if($this->xls_pricelist_use_protection){
			$this->sheet->getProtection()->setPassword($this->xls_pricelist_use_password);///protection
			$this->sheet->getProtection()->setSheet(true);///protection
		}
		
		
		
		///////////
		$f_title = array(
			'font' => array(
				'bold' => false,
				'color'=> array(
					'argb' => '00'.($this->xls_pricelist_title_color?$this->xls_pricelist_title_color:'000000')
				),
				'size' => 20,
				'name' => 'BELL MT'
			),
			'alignment' => array(
				'horizontal' => PHPExcel_Style_Alignment::HORIZONTAL_CENTER,
			)
			
		);
		$f_address = array(
			'font' => array(
				'bold' => false,
				'color'=> array(
					'argb' => '00'.($this->xls_pricelist_adress_color?$this->xls_pricelist_adress_color:'000000')
				),
				'size' => 14,
				'name' => 'BELL MT'
			),
			'alignment' => array(
				'horizontal' => PHPExcel_Style_Alignment::HORIZONTAL_CENTER,
			)
			
		);
		$f_phone = array(
			'font' => array(
				'bold' => true,
				'color'=> array(
					'argb' => '00'.($this->xls_pricelist_phone_color?$this->xls_pricelist_phone_color:'000000')
				),
				'size' => 10,
				'name' => 'Cambria'
			),
			'alignment' => array(
				'horizontal' => PHPExcel_Style_Alignment::HORIZONTAL_CENTER,
			)
			
		);
		$f_email = array(
			'font' => array(
				'bold' => true,
				'color'=> array(
					'argb' => '00'.($this->xls_pricelist_email_color?$this->xls_pricelist_email_color:'339966')
				),
				'size' => 10,
				'name' => 'Cambria'
			),
			'alignment' => array(
				'horizontal' => PHPExcel_Style_Alignment::HORIZONTAL_CENTER,
			)
			
		);
		$f_link = array(
			'font' => array(
				'bold' => false,
				'underline'	=>true,
				'color'=> array(
					'argb' => '00'.($this->xls_pricelist_link_color?$this->xls_pricelist_link_color:'0000ff')
				),
				'size' => 10,
				'name' => 'Arial'
			),
			'alignment' => array(
				'horizontal' => PHPExcel_Style_Alignment::HORIZONTAL_CENTER,
			)
			
		);
		$f_custom = array(
			'font' => array(
				
				'color'=> array(
					'argb' => '00'.($this->xls_pricelist_custom_color?$this->xls_pricelist_custom_color:'000000')
				),
				'size' => 8,
				'name' => 'Arial'
			),
			'alignment' => array(
				'horizontal' => PHPExcel_Style_Alignment::HORIZONTAL_CENTER,
				'vertical' => PHPExcel_Style_Alignment::VERTICAL_CENTER,
			),
			
		);
		if($this->xls_pricelist_thead_color_bg){
			$fu = array(
				'font' => array(
					'bold' => true,
					
					'color'=> array(
						'argb' => '00'.($this->xls_pricelist_thead_color?$this->xls_pricelist_thead_color:'000000')
					),
					'size' => 8,
					'name' => 'Arial'
				),
				'alignment' => array(
					'horizontal' => PHPExcel_Style_Alignment::HORIZONTAL_CENTER,
					'vertical' => PHPExcel_Style_Alignment::VERTICAL_BOTTOM,
				),
				'borders' => array(
					'allborders' => array(
						'style' => PHPExcel_Style_Border::BORDER_THIN,
					),	
				),
				'fill' => array(
					'type' => PHPExcel_Style_Fill::FILL_SOLID,
					'startcolor' => array(
						'argb' => '00'.$this->xls_pricelist_thead_color_bg,
					),
				),	
			);
		}else{
			$fu = array(
				'font' => array(
					'bold' => true,
					
					'color'=> array(
						'argb' => '00'.($this->xls_pricelist_thead_color?$this->xls_pricelist_thead_color:'000000')
					),
					'size' => 8,
					'name' => 'Arial'
				),
				'alignment' => array(
					'horizontal' => PHPExcel_Style_Alignment::HORIZONTAL_CENTER,
					'vertical' => PHPExcel_Style_Alignment::VERTICAL_BOTTOM,
				),
				'borders' => array(
					'allborders' => array(
						'style' => PHPExcel_Style_Border::BORDER_THIN,
					),	
				),
				
			);

		}
		
		
		
		
		if($this->xls_pricelist_underthead_color_bg){
			$fe = array(
				
				'alignment' => array(
					'horizontal' => PHPExcel_Style_Alignment::HORIZONTAL_CENTER,
					'vertical' => PHPExcel_Style_Alignment::VERTICAL_BOTTOM,
				),
				'borders' => array(
					'allborders' => array(
						'style' => PHPExcel_Style_Border::BORDER_THIN,
					),	
				),
				'fill' => array(
					'type' => PHPExcel_Style_Fill::FILL_SOLID,
					'startcolor' => array(
						'argb' => '00'.$this->xls_pricelist_underthead_color_bg,
					),
					
				),

			);
		}else{
			$fe = array(
				
				'alignment' => array(
					'horizontal' => PHPExcel_Style_Alignment::HORIZONTAL_CENTER,
					'vertical' => PHPExcel_Style_Alignment::VERTICAL_BOTTOM,
				),
				'borders' => array(
					'allborders' => array(
						'style' => PHPExcel_Style_Border::BORDER_THIN,
					),	
				),
				
			);
		}
		
		if($this->xls_pricelist_category0_color_bg){
			$fc1 = array(
				'font' => array(
					'bold' => true,
					
					'color'=> array(
						'argb' => '00'.($this->xls_pricelist_category0_color?$this->xls_pricelist_category0_color:'FFFFFF')
					),
					'size' => 13,
					'name' => 'BELL MT'
				),
				'alignment' => array(
					'horizontal' => PHPExcel_Style_Alignment::HORIZONTAL_CENTER,
					//'vertical' => PHPExcel_Style_Alignment::VERTICAL_BOTTOM,
				),
				'borders' => array(
					'allborders' => array(
						'style' => PHPExcel_Style_Border::BORDER_THIN,
					),	
				),
				'fill' => array(
					'type' => PHPExcel_Style_Fill::FILL_SOLID,
					'startcolor' => array(
						'argb' => '00'.$this->xls_pricelist_category0_color_bg,
					),
					
				),

			);
		}else{
			$fc1 = array(
				'font' => array(
					'bold' => true,
					
					'color'=> array(
						'argb' => '00'.($this->xls_pricelist_category0_color?$this->xls_pricelist_category0_color:'FFFFFF')
					),
					'size' => 13,
					'name' => 'BELL MT'
				),
				'alignment' => array(
					'horizontal' => PHPExcel_Style_Alignment::HORIZONTAL_CENTER,
					//'vertical' => PHPExcel_Style_Alignment::VERTICAL_BOTTOM,
				),
				'borders' => array(
					'allborders' => array(
						'style' => PHPExcel_Style_Border::BORDER_THIN,
					),	
				),
			);
		}
		if($this->xls_pricelist_category1_color_bg){
			$fc2 = array(
				'font' => array(
					'bold' => true,
					
					'italic'  => true,
					'color'=> array(
						'argb' => '00'.($this->xls_pricelist_category1_color?$this->xls_pricelist_category1_color:'000000')
					),
					'size' => 9,
					'name' => 'Arial'
				),
				'alignment' => array(
					'horizontal' => PHPExcel_Style_Alignment::HORIZONTAL_LEFT,
					//'vertical' => PHPExcel_Style_Alignment::VERTICAL_BOTTOM,
				),
				'borders' => array(
					'allborders' => array(
						'style' => PHPExcel_Style_Border::BORDER_THIN,
					),	
				),
				'fill' => array(
					'type' => PHPExcel_Style_Fill::FILL_SOLID,
					'startcolor' => array(
						'argb' => '00'.$this->xls_pricelist_category1_color_bg,
					),
					
				),

			);
		}else{
			$fc2 = array(
				'font' => array(
					'bold' => true,
					
					'italic'  => true,
					'color'=> array(
						'argb' => '00'.($this->xls_pricelist_category1_color?$this->xls_pricelist_category1_color:'000000')
					),
					'size' => 9,
					'name' => 'Arial'
				),
				'alignment' => array(
					'horizontal' => PHPExcel_Style_Alignment::HORIZONTAL_LEFT,
					//'vertical' => PHPExcel_Style_Alignment::VERTICAL_BOTTOM,
				),
				'borders' => array(
					'allborders' => array(
						'style' => PHPExcel_Style_Border::BORDER_THIN,
					),	
				),
				
			);
		}
		if($this->xls_pricelist_category2_color_bg){
			$fc3 = array(
				'font' => array(
					'bold' => true,
					
					'italic'  => true,
					'color'=> array(
						'argb' => '00'.($this->xls_pricelist_category2_color?$this->xls_pricelist_category2_color:'000000')
					),
					'size' => 8,
					'name' => 'Arial'
				),
				'alignment' => array(
					'horizontal' => PHPExcel_Style_Alignment::HORIZONTAL_LEFT,
					//'vertical' => PHPExcel_Style_Alignment::VERTICAL_BOTTOM,
				),
				'borders' => array(
					'allborders' => array(
						'style' => PHPExcel_Style_Border::BORDER_THIN,
					),	
				),
				'fill' => array(
					'type' => PHPExcel_Style_Fill::FILL_SOLID,
					'startcolor' => array(
						'argb' => '00'.$this->xls_pricelist_category2_color_bg,
					),
					
				),

			);
		}else{
			$fc3 = array(
				'font' => array(
					'bold' => true,
					
					'italic'  => true,
					'color'=> array(
						'argb' => '00'.($this->xls_pricelist_category2_color?$this->xls_pricelist_category2_color:'000000')
					),
					'size' => 8,
					'name' => 'Arial'
				),
				'alignment' => array(
					'horizontal' => PHPExcel_Style_Alignment::HORIZONTAL_LEFT,
					//'vertical' => PHPExcel_Style_Alignment::VERTICAL_BOTTOM,
				),
				'borders' => array(
					'allborders' => array(
						'style' => PHPExcel_Style_Border::BORDER_THIN,
					),	
				),
				
			);
		}
		
	
		
			$fc_arr=array($fc1, $fc2, $fc3);
	
		///////////	
			$this->delim=0;
			
			for($i=0; $i<$this->poles_count; $i++){
				$this->sheet->getColumnDimension($this->sheet->getCellByColumnAndRow($i, 1)->getColumn())->setWidth((int)$this->xls_pricelist_poles[$i]['dlina']);
				$this->width += (int)$this->xls_pricelist_poles[$i]['dlina'];
			}
			
			
			///logo
			
			if($this->xls_pricelist_logo){
				$this->load->model('tool/image');
				
				$logo = $this->model_tool_image->resize($this->xls_pricelist_logo, $this->xls_pricelist_logo_width?$this->xls_pricelist_logo_width:50, $this->xls_pricelist_logo_height?$this->xls_pricelist_logo_height:50);
				
				
				if($logo){
						
						$rh = ($this->xls_pricelist_logo_height?$this->xls_pricelist_logo_height+2:52)*3/4;
						$this->sheet->getRowDimension('1')->setRowHeight($rh);
						
						$objDrawing = new PHPExcel_Worksheet_Drawing();
						$objDrawing->setPath(str_replace(HTTP_IMAGE, DIR_IMAGE, $logo));
						$objDrawing->setHeight($this->xls_pricelist_logo_height?$this->xls_pricelist_logo_height:50);
						$objDrawing->setWorksheet($this->sheet);
						$objDrawing->setCoordinates($this->sheet->getCellByColumnAndRow(1, 1)->getCoordinate());
						
						$columnsize = ($this->sheet->getColumnDimensionByColumn(1)->getWidth())*7+5;
						
						if($columnsize>$this->xls_pricelist_logo_width){
							$objDrawing->setOffsetX(($columnsize-$this->xls_pricelist_logo_width)/2);
						}else{
							$objDrawing->setOffsetX($this->l_margin/2+1);
						}
						$objDrawing->setOffsetY(2);

						//$worksheet->insertBitmap ( $i , 0 , DIR_CACHE.'tmp.bmp' , $this->l_margin/2+1 , 2 , 1 , 1 );
					}
				
			}
			
			///
			
			$this->sheet->setCellValueByColumnAndRow(0+$this->delim, 2, $this->xls_pricelist_title?$this->xls_pricelist_title:$this->config->get('config_name'));
			$this->sheet->getStyle($this->sheet->getCellByColumnAndRow(0+$this->delim, 2)->getCoordinate())->applyFromArray($f_title);
			$this->sheet->setCellValueByColumnAndRow(0+$this->delim, 3, $this->xls_pricelist_adress?$this->xls_pricelist_adress:$this->config->get('config_address'));
			$this->sheet->getStyle($this->sheet->getCellByColumnAndRow(0+$this->delim, 3)->getCoordinate())->applyFromArray($f_address);
			$this->sheet->setCellValueByColumnAndRow(0+$this->delim, 4, $this->xls_pricelist_phone? $this->xls_pricelist_phone:(($this->config->get('config_telephone')?$this->LNG['text_phone'].' '.$this->config->get('config_telephone'):'').'     '.($this->config->get('config_fax')?$this->LNG['text_fax'].' '.$this->config->get('config_fax'):'')));
			$this->sheet->getStyle($this->sheet->getCellByColumnAndRow(0+$this->delim, 4)->getCoordinate())->applyFromArray($f_phone);
			$this->sheet->setCellValueByColumnAndRow(0+$this->delim, 5, $this->xls_pricelist_email?$this->xls_pricelist_email:'e-mail:'.$this->config->get('config_email'));
			$this->sheet->getStyle($this->sheet->getCellByColumnAndRow(0+$this->delim, 5)->getCoordinate())->applyFromArray($f_email);
			$this->sheet->setCellValueByColumnAndRow(0+$this->delim, 6, $this->xls_pricelist_link?$this->xls_pricelist_link:$this->config->get('config_url'));
			$this->sheet->getStyle($this->sheet->getCellByColumnAndRow(0+$this->delim, 6)->getCoordinate())->applyFromArray($f_link);
			$this->sheet->getCellByColumnAndRow(0+$this->delim, 6)->getHyperlink()->setUrl($this->config->get('config_url'));
			
			if($this->xls_pricelist_custom_text){
				$rs=explode("\n", $this->xls_pricelist_custom_text);
				
				$this->sheet->setCellValueByColumnAndRow(0+$this->delim, 7, str_replace("\r", "" ,$this->xls_pricelist_custom_text));
				$this->sheet->getStyle($this->sheet->getCellByColumnAndRow(0+$this->delim, 7)->getCoordinate())->applyFromArray($f_custom);
				$this->sheet->getStyle($this->sheet->getCellByColumnAndRow(0+$this->delim, 7)->getCoordinate())->getAlignment()->setWrapText(true);
				$this->sheet->mergeCells($this->sheet->getCellByColumnAndRow(0+$this->delim, 7)->getCoordinate().':'.$this->sheet->getCellByColumnAndRow($this->poles_count - 1+$this->delim, 7)->getCoordinate());
				$this->sheet->getRowDimension('7')->setRowHeight(sizeof($rs)*(8+3));
				
			}
			
			$this->sheet->mergeCells($this->sheet->getCellByColumnAndRow(0+$this->delim, 2)->getCoordinate().':'.$this->sheet->getCellByColumnAndRow($this->poles_count - 1+$this->delim, 2)->getCoordinate());
			$this->sheet->mergeCells($this->sheet->getCellByColumnAndRow(0+$this->delim, 3)->getCoordinate().':'.$this->sheet->getCellByColumnAndRow($this->poles_count - 1+$this->delim, 3)->getCoordinate());
			$this->sheet->mergeCells($this->sheet->getCellByColumnAndRow(0+$this->delim, 4)->getCoordinate().':'.$this->sheet->getCellByColumnAndRow($this->poles_count - 1+$this->delim, 4)->getCoordinate());
			$this->sheet->mergeCells($this->sheet->getCellByColumnAndRow(0+$this->delim, 5)->getCoordinate().':'.$this->sheet->getCellByColumnAndRow($this->poles_count - 1+$this->delim, 5)->getCoordinate());
			$this->sheet->mergeCells($this->sheet->getCellByColumnAndRow(0+$this->delim, 6)->getCoordinate().':'.$this->sheet->getCellByColumnAndRow($this->poles_count - 1+$this->delim, 6)->getCoordinate());
	///////////

			for($j=0; $j<$this->poles_count; $j++){
				if($this->xls_pricelist_poles[$j]['type']=='image'){
					$this->load->model('tool/image');
				}
				$this->sheet->setCellValueByColumnAndRow($j+$this->delim, 9, $this->xls_pricelist_poles[$j]['name'][$this->xls_pricelist_language['language_id']]);
				$this->sheet->getStyle($this->sheet->getCellByColumnAndRow($j+$this->delim, 9)->getCoordinate())->applyFromArray($fu);
				$this->sheet->setCellValueByColumnAndRow($j+$this->delim, 10, '');
				$this->sheet->getStyle($this->sheet->getCellByColumnAndRow($j+$this->delim, 10)->getCoordinate())->applyFromArray($fe);
			}
	////
	
		$i=10;
			
			$categories = array();
			
			$cats=explode("_", $this->xls_pricelist_category);

			foreach($cats as $category_id){
				$ccat=$this->model_xls_pricelist_helper_models->getCategory($category_id, $this->xls_pricelist_language['language_id']);
				if($ccat)
				$categories[] = $ccat;
			}
			//$categories = $this->model_catalog_category->getCategories(0);
		
			foreach ($categories as $category) {
			$i++;	
				$level=$this->model_xls_pricelist_helper_models->getCategoryLevel($category['category_id'], 0, $this->xls_pricelist_language['language_id']);
				$path=$this->model_xls_pricelist_helper_models->getCategoryPath($category['category_id'], array(), $this->xls_pricelist_language['language_id']);
				//print $path."<br>";
				$level1=$level;
				if($level>2)$level1=2;
				
				
				$this->sheet->setCellValueByColumnAndRow(0+$this->delim, $i, html_entity_decode($category['name'], ENT_QUOTES, 'UTF-8'));
				
				for($j=0; $j<$this->poles_count; $j++){
					$this->sheet->getStyle($this->sheet->getCellByColumnAndRow($j+$this->delim, $i)->getCoordinate())->applyFromArray($fc_arr[$level1]);
				}
				
				if($this->xls_pricelist_category_link){
					$this->sheet->getCellByColumnAndRow(0+$this->delim, $i)->getHyperlink()->setUrl(str_replace('&amp;', '&', $this->url->link('product/category', 'path=' . $path)));
				}
				$this->sheet->mergeCells($this->sheet->getCellByColumnAndRow(0+$this->delim, $i)->getCoordinate().':'.$this->sheet->getCellByColumnAndRow($this->poles_count - 1+$this->delim, $i)->getCoordinate());
			
				
				
				if($this->xls_pricelist_use_collapse&&$level){
					$this->sheet->getRowDimension($i)->setOutlineLevel($level);//////collapse
					$this->sheet->getRowDimension($i)->setVisible(false);//////collapse
					$this->sheet->getRowDimension($i)->setCollapsed(true);//////collapse
				}
				$this->getProducts($i, $category['category_id'], $path, $cust_group, $level+1);
				
			}
			
			$sh++;
			
		}
		


		
		if($method=='view'){ 
			//отдаем пользователю в браузер
			include_once("PHPExcel/Writer/Excel2007.php");
			$objWriter = new PHPExcel_Writer_Excel2007($workbook);
			// redirect output to client browser
			header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
			header('Content-Disposition: attachment;filename="price_'.$this->xls_pricelist_language['code'].$store.'.xlsx"');
			header('Cache-Control: max-age=0');
			$objWriter->save('php://output');
			break;
		}else{
			include_once("PHPExcel/Writer/Excel2007.php");
			$objWriter = new PHPExcel_Writer_Excel2007($workbook);
			$objWriter->save(DIR_DOWNLOAD."price_".$this->xls_pricelist_language['code'].$store.".xlsx");
		}
		$workbook->disconnectWorksheets();
		unset($objWriter);
		unset($workbook);
	}
		/*////  uncomment this, if you want to compress generated xls to zip
		if($method!='view'){ 
			if (file_exists(DIR_DOWNLOAD."price_".$this->xls_pricelist_language['code'].$store.".zip")) unlink(DIR_DOWNLOAD."price_".$this->xls_pricelist_language['code'].$store.".zip");
			$zip = new ZipArchive();
			$filename = DIR_DOWNLOAD."price_".$this->xls_pricelist_language['code'].$store.".zip";

			if ($zip->open($filename, ZIPARCHIVE::CREATE)!==TRUE) {
				exit("Cannot open <$filename>\n");
			}

			$zip->addFile(DIR_DOWNLOAD."price_".$this->xls_pricelist_language['code'].$store.".xls", "price_".$this->xls_pricelist_language['code'].$store.".xls");
			$zip->close();
			if (file_exists(DIR_DOWNLOAD."price_".$this->xls_pricelist_language['code'].$store.".xls")) unlink(DIR_DOWNLOAD."price_".$this->xls_pricelist_language['code'].$store.".xls");
			
		}
		////*/
		
		
	}
	
	
	private function getProducts(&$i, $category_id, $path, $customer_group_id='', $level){ 
		
		list($sort, $order)=explode('-',$this->xls_pricelist_sort_order);
		
		$data = array(
				'filter_category_id' => $category_id, 
				'sort'               => $sort,
				'order'              => $order,
				'start'              => 0,
				'limit'              => 1000000000,
				'customer_group_id'  => $customer_group_id,
				'language_id'		=> $this->xls_pricelist_language['language_id'],
				'filter_dubles' => $this->xls_pricelist_nodubles
			);
			
		$results = $this->model_xls_pricelist_helper_models->getProducts($data);
		
		
		foreach ($results as $result) { 
				$rh=0;
				$quantity = $result['quantity'];
				if(!$this->xls_pricelist_use_notinstock){
					if($quantity<=0)continue;
				}
				if(!$this->xls_pricelist_use_quantity){
					if($quantity<=0)$quantity=$this->LNG['text_outofstock'];
					else $quantity=$this->LNG['text_instock'];
				}
				//$quantity="Нет на складе";
				//elseif($quantity>1000)$quantity=">1000";
				//elseif($quantity>500)$quantity=">500";
				//elseif($quantity>100)$quantity=">100";
				//elseif($quantity>50)$quantity=">50";
				//elseif($quantity>10)$quantity=">10";
				//elseif($quantity>5)$quantity=">5";
			$i++;	
			if($this->xls_pricelist_use_collapse){
				$this->sheet->getRowDimension($i)->setOutlineLevel($level);///collapse
				$this->sheet->getRowDimension($i)->setVisible(false);///collapse	
				$this->sheet->getRowDimension($i)->setCollapsed(true);///collapse
			}	
			
			$rrh = 0;
			
			$attr_group='';
				
						$attribute_groups=explode("_", $this->xls_pricelist_attribute_group);
						
						
						foreach($this->model_xls_pricelist_helper_models->getProductAttributes($result['product_id'], $this->xls_pricelist_language['language_id']) as $attribute_group){
							if(!in_array($attribute_group['attribute_group_id'], $attribute_groups)) continue;
							$attrs = array();
							$rrh++;
							
							if($this->xls_pricelist_use_attributes)
							$attr_group.=" \n (".$attribute_group['name'].": "	;
							else $attr_group.=" \n (";
							
							foreach($attribute_group['attribute'] as $attribute){
								$attrs[]=$attribute['name']." - ".$attribute['text']	;
							}
							$attr_group.=" ".implode(', ', $attrs).")";
						}
						
						
						if($rrh) $rrh = ($rrh*11+9)+9;
						
			for($j=0; $j<$this->poles_count; $j++){
				
				if($this->xls_pricelist_poles[$j]['bgcolor']){
					$this->f_name = array(
						'font' => array(
							
							'color'=> array(
								'argb' => '00'.($this->xls_pricelist_poles[$j]['textcolor']?$this->xls_pricelist_poles[$j]['textcolor']:'000000')
							),
							'size' => 8,
							'name' => 'Arial'
						),
						'alignment' => array(
							'horizontal' => $this->alignments[$this->xls_pricelist_poles[$j]['alignment']],
							'vertical' => PHPExcel_Style_Alignment::VERTICAL_CENTER,
						),
						'borders' => array(
							'allborders' => array(
								'style' => PHPExcel_Style_Border::BORDER_THIN,
							),	
						),
						'fill' => array(
								'type' => PHPExcel_Style_Fill::FILL_SOLID,
								'startcolor' => array(
									'argb' => '00'.$this->xls_pricelist_poles[$j]['bgcolor'],
								),
								
							),
					);
				}else{
					$this->f_name = array(
						'font' => array(
							
							'color'=> array(
								'argb' => '00'.($this->xls_pricelist_poles[$j]['textcolor']?$this->xls_pricelist_poles[$j]['textcolor']:'000000')
							),
							'size' => 8,
							'name' => 'Arial'
						),
						'alignment' => array(
							'horizontal' => $this->alignments[$this->xls_pricelist_poles[$j]['alignment']],
							'vertical' => PHPExcel_Style_Alignment::VERTICAL_CENTER,
						),
						'borders' => array(
							'allborders' => array(
								'style' => PHPExcel_Style_Border::BORDER_THIN,
							),	
						),
						
					);
				}
				
				switch($this->xls_pricelist_poles[$j]['type']){

					case 'name':
						$this->sheet->setCellValueByColumnAndRow($j+$this->delim, $i, html_entity_decode($result['name'].$attr_group, ENT_QUOTES, 'UTF-8'));
						$this->sheet->getStyle($this->sheet->getCellByColumnAndRow($j+$this->delim, $i)->getCoordinate())->applyFromArray($this->f_name);
						$this->sheet->getStyle($this->sheet->getCellByColumnAndRow($j+$this->delim, $i)->getCoordinate())->getAlignment()->setWrapText(true);
						if($this->xls_pricelist_product_link){
							$this->sheet->getCellByColumnAndRow($j+$this->delim, $i)->getHyperlink()->setUrl(str_replace('&amp;', '&', $this->url->link('product/product', 'path=' . $path . '&product_id=' . $result['product_id'])));
						}
						break;
					case 'description':
						$this->sheet->setCellValueByColumnAndRow($j+$this->delim, $i, strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')));
						$this->sheet->getStyle($this->sheet->getCellByColumnAndRow($j+$this->delim, $i)->getCoordinate())->applyFromArray($this->f_name);
						$this->sheet->getStyle($this->sheet->getCellByColumnAndRow($j+$this->delim, $i)->getCoordinate())->getAlignment()->setWrapText(true);
						break;
					case 'quantity':
						$this->sheet->setCellValueByColumnAndRow($j+$this->delim, $i, $quantity);
						$this->sheet->getStyle($this->sheet->getCellByColumnAndRow($j+$this->delim, $i)->getCoordinate())->applyFromArray($this->f_name);
						break;
					case 'image':
						
						$this->l_margin = $this->xls_pricelist_poles[$j]['dlina']*7+5-($this->xls_pricelist_image_width?$this->xls_pricelist_image_width:50);
						
						
						if ($result['image']) {
							$image = $this->model_tool_image->resize($result['image'], $this->xls_pricelist_image_width?$this->xls_pricelist_image_width:50, $this->xls_pricelist_image_height?$this->xls_pricelist_image_height:50);
						} else {
							$image = false;
						}
						
						if($image){
							
							$rh = ($this->xls_pricelist_image_height?$this->xls_pricelist_image_height+5:55)*3/4;
							if($rh>$rrh){
								
								$this->sheet->getRowDimension(''.$i.'')->setRowHeight($rh);
							}
							$objDrawing = new PHPExcel_Worksheet_Drawing();
							$objDrawing->setPath(str_replace(HTTP_IMAGE, DIR_IMAGE, $image));
							$objDrawing->setHeight($this->xls_pricelist_image_height?$this->xls_pricelist_image_height:50);
							$objDrawing->setWorksheet($this->sheet);
							$objDrawing->setCoordinates($this->sheet->getCellByColumnAndRow(0, $i)->getCoordinate());
							$objDrawing->setOffsetX($this->l_margin/2+1);
							$objDrawing->setOffsetY(2);

							//$worksheet->insertBitmap ( $i , 0 , DIR_CACHE.'tmp.bmp' , $this->l_margin/2+1 , 2 , 1 , 1 );
						}
						$this->sheet->getStyle($this->sheet->getCellByColumnAndRow($j+$this->delim, $i)->getCoordinate())->applyFromArray($this->f_name);
					
						break;
						case 'price':
						if ((float)$result['price']) {
							$price = $this->currency->format($this->tax->calculate($result['price'], $result['tax_class_id'], $this->config->get('config_tax')), $this->xls_pricelist_currency);
						} else {
							$price = false;
						}
						$this->sheet->setCellValueByColumnAndRow($j+$this->delim, $i, $price?$price:'');
						$this->sheet->getStyle($this->sheet->getCellByColumnAndRow($j+$this->delim, $i)->getCoordinate())->applyFromArray($this->f_name);
						break;
						case 'special':
						if ((float)$result['special']) {
							$special = $this->currency->format($this->tax->calculate($result['special'], $result['tax_class_id'], $this->config->get('config_tax')), $this->xls_pricelist_currency);
						} else {
							$special = false;
						}	
						$this->sheet->setCellValueByColumnAndRow($j+$this->delim, $i, $special?$special:'');
						$this->sheet->getStyle($this->sheet->getCellByColumnAndRow($j+$this->delim, $i)->getCoordinate())->applyFromArray($this->f_name);
						break;
					default:
					   $this->sheet->setCellValueByColumnAndRow($j+$this->delim, $i, ($result[$this->xls_pricelist_poles[$j]['type']])?$result[$this->xls_pricelist_poles[$j]['type']]:'');
					   $this->sheet->getStyle($this->sheet->getCellByColumnAndRow($j+$this->delim, $i)->getCoordinate())->applyFromArray($this->f_name);
						
				}
			}
			
			if($this->xls_pricelist_use_options){
				foreach ($this->model_xls_pricelist_helper_models->getProductOptions($result['product_id'], $this->xls_pricelist_language['language_id']) as $option) { 
					if ($option['type'] == 'select' || $option['type'] == 'radio' || $option['type'] == 'checkbox' || $option['type'] == 'image') { 
						
						
						foreach ($option['option_value'] as $option_value) {
							$quantity = $option_value['quantity'];
								if(!$this->xls_pricelist_use_notinstock){
									if($quantity<=0)continue;
								}
								if(!$this->xls_pricelist_use_quantity){
									if($quantity<=0)$quantity=$this->LNG['text_outofstock'];
									else $quantity=$this->LNG['text_instock'];
								}
							$i++;
							if($this->xls_pricelist_use_collapse){
								$this->sheet->getRowDimension($i)->setOutlineLevel($level);///collapse
								$this->sheet->getRowDimension($i)->setVisible(false);///collapse	
								$this->sheet->getRowDimension($i)->setCollapsed(true);///collapse
							}
							$option_price = 0;
							if ($option_value['price_prefix'] == '+') {
								$option_price += $option_value['price'];
							} elseif ($option_value['price_prefix'] == '-') {
								$option_price -= $option_value['price'];
							}
							$option_weight = 0;
							if ($option_value['weight_prefix'] == '+') {
								$option_weight += $option_value['weight'];
							} elseif ($option_value['price_prefix'] == '-') {
								$option_weight -= $option_value['weight'];
							}
							for($j=0; $j<$this->poles_count; $j++){
								
								if($this->xls_pricelist_poles[$j]['bgcolor']){
									$this->f_name = array(
										'font' => array(
											
											'color'=> array(
												'argb' => '00'.($this->xls_pricelist_poles[$j]['textcolor']?$this->xls_pricelist_poles[$j]['textcolor']:'000000')
											),
											'size' => 8,
											'name' => 'Arial'
										),
										'alignment' => array(
											'horizontal' => $this->alignments[$this->xls_pricelist_poles[$j]['alignment']],
											'vertical' => PHPExcel_Style_Alignment::VERTICAL_CENTER,
										),
										'borders' => array(
											'allborders' => array(
												'style' => PHPExcel_Style_Border::BORDER_THIN,
											),	
										),
										'fill' => array(
												'type' => PHPExcel_Style_Fill::FILL_SOLID,
												'startcolor' => array(
													'argb' => '00'.$this->xls_pricelist_poles[$j]['bgcolor'],
												),
												
											),
									);
								}else{
									$this->f_name = array(
										'font' => array(
											
											'color'=> array(
												'argb' => '00'.($this->xls_pricelist_poles[$j]['textcolor']?$this->xls_pricelist_poles[$j]['textcolor']:'000000')
											),
											'size' => 8,
											'name' => 'Arial'
										),
										'alignment' => array(
											'horizontal' => $this->alignments[$this->xls_pricelist_poles[$j]['alignment']],
											'vertical' => PHPExcel_Style_Alignment::VERTICAL_CENTER,
										),
										'borders' => array(
											'allborders' => array(
												'style' => PHPExcel_Style_Border::BORDER_THIN,
											),	
										),
										
									);
								}
							
								switch($this->xls_pricelist_poles[$j]['type']){
									case 'name':
										
										
										$this->sheet->setCellValueByColumnAndRow($j+$this->delim, $i, html_entity_decode($result['name'].' ('.$option['name'].': '.$option_value['name'].')'.$attr_group, ENT_QUOTES, 'UTF-8'));
										$this->sheet->getStyle($this->sheet->getCellByColumnAndRow($j+$this->delim, $i)->getCoordinate())->applyFromArray($this->f_name);
										$this->sheet->getStyle($this->sheet->getCellByColumnAndRow($j+$this->delim, $i)->getCoordinate())->getAlignment()->setWrapText(true);
										if($this->xls_pricelist_product_link){
											$this->sheet->getCellByColumnAndRow($j+$this->delim, $i)->getHyperlink()->setUrl(str_replace('&amp;', '&', $this->url->link('product/product', 'path=' . $path . '&product_id=' . $result['product_id'])));
										}
										break;
									case 'description':
										$this->sheet->setCellValueByColumnAndRow($j+$this->delim, $i, strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')));
										$this->sheet->getStyle($this->sheet->getCellByColumnAndRow($j+$this->delim, $i)->getCoordinate())->applyFromArray($this->f_name);
										$this->sheet->getStyle($this->sheet->getCellByColumnAndRow($j+$this->delim, $i)->getCoordinate())->getAlignment()->setWrapText(true);
										break;
									case 'quantity':
										$this->sheet->setCellValueByColumnAndRow($j+$this->delim, $i, $quantity);
										$this->sheet->getStyle($this->sheet->getCellByColumnAndRow($j+$this->delim, $i)->getCoordinate())->applyFromArray($this->f_name);
										break;
									case 'image':
										
										
										
										if ($option_value['image']) {
											$image1 = $this->model_tool_image->resize($option_value['image'], $this->xls_pricelist_image_width?$this->xls_pricelist_image_width:50, $this->xls_pricelist_image_height?$this->xls_pricelist_image_height:50);
										} else {
											$image1 = $image;
										}
										
										if($image1){
											$rh1 = ($this->xls_pricelist_image_height?$this->xls_pricelist_image_height+2:52)*3/4;
											if($rh1>$rrh){
												$this->sheet->getRowDimension(''.$i.'')->setRowHeight($rh1);
											}
											$objDrawing = new PHPExcel_Worksheet_Drawing();
											$objDrawing->setPath(str_replace(HTTP_IMAGE, DIR_IMAGE, $image1));
											$objDrawing->setHeight($this->xls_pricelist_image_height?$this->xls_pricelist_image_height:50);
											$objDrawing->setWorksheet($this->sheet);
											$objDrawing->setCoordinates($this->sheet->getCellByColumnAndRow(0, $i)->getCoordinate());
											$objDrawing->setOffsetX($this->l_margin/2+1);
											$objDrawing->setOffsetY(2);

											//$worksheet->insertBitmap ( $i , 0 , DIR_CACHE.'tmp.bmp' , $this->l_margin/2+1 , 2 , 1 , 1 );
										}
										$this->sheet->getStyle($this->sheet->getCellByColumnAndRow($j+$this->delim, $i)->getCoordinate())->applyFromArray($this->f_name);
									
										break;
										case 'price':
										if ((float)$result['price']) {
											$price = $this->currency->format($this->tax->calculate($result['price']+$option_price, $result['tax_class_id'], $this->config->get('config_tax')), $this->xls_pricelist_currency);
										} else {
											$price = false;
										}
										$this->sheet->setCellValueByColumnAndRow($j+$this->delim, $i, $price?$price:'');
										$this->sheet->getStyle($this->sheet->getCellByColumnAndRow($j+$this->delim, $i)->getCoordinate())->applyFromArray($this->f_name);
										break;
										case 'special':
										if ((float)$result['special']) {
											$special = $this->currency->format($this->tax->calculate($result['special']+$option_price, $result['tax_class_id'], $this->config->get('config_tax')), $this->xls_pricelist_currency);
										} else {
											$special = false;
										}	
										$this->sheet->setCellValueByColumnAndRow($j+$this->delim, $i, $special?$special:'');
										$this->sheet->getStyle($this->sheet->getCellByColumnAndRow($j+$this->delim, $i)->getCoordinate())->applyFromArray($this->f_name);
										break;
										case 'weight':
										$this->sheet->setCellValueByColumnAndRow($j+$this->delim, $i, ($result[$this->xls_pricelist_poles[$j]['type']]+$option_weight)!=0?$result[$this->xls_pricelist_poles[$j]['type']]+$option_weight:'');
										$this->sheet->getStyle($this->sheet->getCellByColumnAndRow($j+$this->delim, $i)->getCoordinate())->applyFromArray($this->f_name);
										break;
									default:
									   $this->sheet->setCellValueByColumnAndRow($j+$this->delim, $i, ($result[$this->xls_pricelist_poles[$j]['type']])?$result[$this->xls_pricelist_poles[$j]['type']]:'');
									   $this->sheet->getStyle($this->sheet->getCellByColumnAndRow($j+$this->delim, $i)->getCoordinate())->applyFromArray($this->f_name);
										
								}
							}
						}
					}
					
					
				}
			}	
			
			
			
		}
	}
	
	
	
}
?>