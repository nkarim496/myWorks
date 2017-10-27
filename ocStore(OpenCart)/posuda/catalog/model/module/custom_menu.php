<?php
class ModelModuleCustomMenu extends Model {

	public function getCustomMenu(){
	
	$this->load->model('tool/image');
	 
			$data=array();
			$query =$this->db->query("SELECT * FROM " . DB_PREFIX . "custom_menu h LEFT JOIN " . DB_PREFIX . "custom_menu_description hd ON (h.menu_id = hd.menu_id) where hd.language_id = '" . (int)$this->config->get('config_language_id') . "' and h.parent_id=0 and h.status=1 order by h.sort_order");

			
			foreach($query->rows as $row){
				$query1 = $this->db->query("SELECT * FROM " . DB_PREFIX . "custom_menu h LEFT JOIN " . DB_PREFIX . "custom_menu_description hd ON (h.menu_id = hd.menu_id) where hd.language_id = '" . (int)$this->config->get('config_language_id') . "' and h.parent_id='".$row['menu_id']."' and  h.status=1 order by h.sort_order" );
				
				$subtitle=array();
				foreach($query1->rows as $row1){
				
					$subtitlenew=array();
				
				$query2 = $this->db->query("SELECT * FROM " . DB_PREFIX . "custom_menu h LEFT JOIN " . DB_PREFIX . "custom_menu_description hd ON (h.menu_id = hd.menu_id) where hd.language_id = '" . (int)$this->config->get('config_language_id') . "' and h.status=1 and h.parent_id='".$row1['menu_id']."' order by h.sort_order");
					foreach($query2->rows as $row2){
					$subtitlenew[]=array('name' => $row2['name'],'id' => $row2['menu_id'],'column' => $row2['column'],'link' =>$row2['link'],'sub_menu' => $subtitlenew);
				}
				
					$subtitle[]=array('name' => $row1['name'],'id' => $row1['menu_id'],'image' => $this->model_tool_image->resize($row1['image'], 20, 20),'link' =>$row1['link'],'sub_menu' => $subtitlenew);
				} 
				
				if ($row['image']) {
					$image = $this->model_tool_image->resize($row['image'], 20, 20);
				} else {
					$image = '';
				}
				
				$data[]=array(
					'id' => $row['menu_id'],
					'name' => $row['name'],
					'image' => $image,
					'link' => $row['link'],
					'column' => $row['column'],
					'sub_menu' => $subtitle 
				);
			}
			return $data;
		}	
	}
?>