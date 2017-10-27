<?php
class ControllerModuleNews extends Controller {
	private $_name = 'news';

	public function index($setting) {
		static $module = 0;

		$this->language->load('module/' . $this->_name);
		$language_id = $this->config->get('config_language_id');

      	$data['heading_title'] = $this->language->get('heading_title');

		$data['customtitle'] = $setting['news_module'][$language_id]['title'];
		$data['header'] = $this->config->get($this->_name . '_header');

		if (!$data['customtitle']) { $data['customtitle'] = $data['heading_title']; }

		$data['icon'] = $this->config->get($this->_name . '_icon');
		$data['box'] = $this->config->get($this->_name . '_box');

		$data['text_more'] = $this->language->get('text_more');
		$data['text_posted'] = $this->language->get('text_posted');

		$data['buttonlist'] = $this->language->get('buttonlist');

		$this->load->model('catalog/news');
		$this->load->model('tool/image');

		$data['news_count'] = $this->model_catalog_news->getTotalNews();

		$data['news_limit'] = $setting['news_module']['limit'];

		if ($data['news_count'] > $data['news_limit']) {
			$data['showbutton'] = true;
		} else {
			$data['showbutton'] = false;
		}

		$data['newslist'] = $this->url->link('information/news');
		
		if (isset($setting['news_module']['heading'])) {
			$data['show_headline'] = $setting['news_module']['heading'];
		} else {
			$data['show_headline'] = '';
		}

		$data['numchars'] = $setting['news_module']['numchars'];

		if (isset($data['numchars'])) {
			$chars = $data['numchars'];
		} else {
			$chars = 100;
		}

		$data['news'] = array();

		$results = $this->model_catalog_news->getNewsShort($setting['news_module']['limit']);

		foreach ($results as $result) {
			if ($result['image']) {
				$image = $this->model_tool_image->resize($result['image'], 320, 240);
			} else {
				$image = false;
			}

			$news_length = strlen(utf8_decode($result['description']));

			if ($news_length > $setting['news_module']['numchars']) {
				$description = utf8_substr(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')), 0, $setting['news_module']['numchars']) . '..';
			} else {
				$description = html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8');
			}

			$data['news'][] = array(
				'title'        	=> $result['title'],
				'image'			=> $image,
				'description'	=> $description,
				'href'         	=> $this->url->link('information/news', 'news_id=' . $result['news_id']),
				'posted'   		=> date($this->language->get('date_format_short'), strtotime($result['date_added']))
			);
		}

		$data['module'] = $module++;		
		
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/news.tpl')) {
			return $this->load->view($this->config->get('config_template') . '/template/module/news.tpl', $data);
		} else {
			return $this->load->view('default/template/module/news.tpl', $data);
		}
	}
}
?>