<?php  
class ControllerModulecategoryhome extends Controller {
	protected $category_id = 0;
	protected $path = array();
	
	protected function index() {
		$this->language->load('module/categoryhome');
		
    	$this->data['heading_title'] = $this->language->get('heading_title');
		
		$this->load->model('catalog/category');
		
		$this->load->model('tool/image');
		
		if (isset($this->request->get['path'])) {
			$this->path = explode('_', $this->request->get['path']);
			
			$this->category_id = end($this->path);
		}
		$url = '';
		$this->data['categoryhome'] = $this->getCategories($this->config->get('categoryhome_category'));
						
		$this->id = 'categoryhome';

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/categoryhome.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/module/categoryhome.tpl';
		} else {
			$this->template = 'default/template/module/categoryhome.tpl';
		}
		
		$this->render();
  	}
	
	protected function getCategories($parent_id, $current_path = '') {
		
		$categoryhome = array();
		$category_id = array_shift($this->path);
		
		$results = $this->model_catalog_category->getCategories($parent_id);
		
		$i=0;
		foreach ($results as $result) {	
			if (!$current_path) 
			{
				$new_path = $result['category_id'];
			} 
			else 
			{
				$new_path = $current_path . '_' . $result['category_id'];
			}
			
			
			
			
			if ($this->category_id == $result['category_id']) {
			$categoryhome[$i]['href'] = $this->url->link('product/category', 'path=' . $new_path);
			
			} else {
			$categoryhome[$i]['href'] =  $this->url->link('product/category', 'path=' . $new_path);
			}
			if ($result['image']) {
						$image = $result['image'];
					} else {
						$image = 'no_image.jpg';
					}
			$categoryhome[$i]['thumb'] = $this->model_tool_image->resize($image, 160, 140);
			$categoryhome[$i]['name'] = $result['name'];
			
        $i++;
 
		}
 
		
		return $categoryhome;
	}		
}
?>