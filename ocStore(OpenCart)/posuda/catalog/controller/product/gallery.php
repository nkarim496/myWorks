<?php  
class ControllerProductGallery extends Controller {
	public function index() { 
	
		$this->load->model('catalog/gallery');
		$this->load->model('tool/image');
		
		$this->language->load('product/gallery');

		$settings = $this->config->get('fastfood_settings');
		$settings = $settings[$this->config->get('config_store_id')];
		$language_id = $this->config->get('config_language_id');
		
		$title_gallery = $settings[$language_id ]['title_gallery'];
		
		$this->document->setTitle($title_gallery);
		
		$data['breadcrumbs'] = array();

   		$data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home'),
       		'separator' => false
   		);

   		$data['breadcrumbs'][] = array(
       		'text'      => $title_gallery,
			'href'      => $this->url->link('product/gallery'),
       		'separator' => $this->language->get('text_separator')
   		);

		$gallerys = $this->model_catalog_gallery->getGallerys();
		
		if($gallerys) {
		
			foreach ($gallerys as $gallery) {
			
				$images = array();
		
				$results = $this->model_catalog_gallery->getGallery($gallery['gallery_id']);
		
				foreach ($results as $result) {
					if (file_exists(DIR_IMAGE . $result['image'])) {
						$images[] = array(
							'title' => $result['title'],
							'link'  => $result['link'],
							'image' => $this->model_tool_image->resize($result['image'], 320, 240),
							'popup' => $this->model_tool_image->resize($result['image'], 800, 600)
						);
					}
				}
		
				$data['gallerys'][] = array(
					'name' 		=> $gallery['name'],
					'images'    => $images,
				);
			}
				
			$data['column_left'] = $this->load->controller('common/column_left');
			$data['column_right'] = $this->load->controller('common/column_right');
			$data['content_top'] = $this->load->controller('common/content_top');
			$data['content_bottom'] = $this->load->controller('common/content_bottom');
			$data['footer'] = $this->load->controller('common/footer');
			$data['header'] = $this->load->controller('common/header');

			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/product/gallery.tpl')) {
				$this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/product/gallery.tpl', $data));
			} else {
				$this->response->setOutput($this->load->view('default/template/product/gallery.tpl', $data));
			}
		
		} else {

			$this->document->setTitle($this->language->get('text_error'));

			$data['heading_title'] = $this->language->get('text_error');

			$data['text_error'] = $this->language->get('text_error');

			$data['button_continue'] = $this->language->get('button_continue');

			$data['continue'] = $this->url->link('common/home');

			$this->response->addHeader($this->request->server['SERVER_PROTOCOL'] . ' 404 Not Found');

			$data['column_left'] = $this->load->controller('common/column_left');
			$data['column_right'] = $this->load->controller('common/column_right');
			$data['content_top'] = $this->load->controller('common/content_top');
			$data['content_bottom'] = $this->load->controller('common/content_bottom');
			$data['footer'] = $this->load->controller('common/footer');
			$data['header'] = $this->load->controller('common/header');

			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/error/not_found.tpl')) {
				$this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/error/not_found.tpl', $data));
			} else {
				$this->response->setOutput($this->load->view('default/template/error/not_found.tpl', $data));
			}
		}
	}
}
?>