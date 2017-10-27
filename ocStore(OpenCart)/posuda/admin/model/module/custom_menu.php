<?php
class ModelModuleCustomMenu extends Model {
	public function addCustomMenu($data) {
		$this->db->query("INSERT INTO " . DB_PREFIX . "custom_menu SET link = '" .$data['link'] . "', image = '" .$data['image'] . "', parent_id = '" .$data['parent_id'] . "', parent_parent_id = '" .$data['parent_parent_id'] . "', `column` = '" .$data['column'] . "',status = '" . (int)$data['status'] . "', sort_order = '" . (int)$data['sort_order'] . "'");

		$menu_id = $this->db->getLastId(); 
		
		foreach ($data['menu_description'] as $language_id => $value) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "custom_menu_description SET menu_id = '" . (int)$menu_id . "', language_id = '" . (int)$language_id . "', name = '" . $this->db->escape($value['name']) . "'");
		}

		$this->cache->delete('custom_menu');
	}
	
	public function editCustomMenu($menu_id, $data) {	
		$this->db->query("UPDATE " . DB_PREFIX . "custom_menu SET link = '" .$data['link'] . "', image = '" .$data['image'] . "', parent_id = '" .$data['parent_id'] . "', parent_parent_id = '" .$data['parent_parent_id'] . "' , `column` = '" .$data['column'] . "',status = '" . (int)$data['status'] . "', sort_order = '" . (int)$data['sort_order'] . "' WHERE menu_id = '" . (int)$menu_id . "'");
		
		$this->db->query("DELETE FROM " . DB_PREFIX . "custom_menu_description WHERE menu_id = '" . (int)$menu_id . "'");
		
		foreach ($data['menu_description'] as $language_id => $value) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "custom_menu_description SET menu_id = '" . (int)$menu_id . "', language_id = '" . (int)$language_id . "', name = '" . $this->db->escape($value['name']) . "'");
		}
		
		$this->cache->delete('custom_menu');
	}
	
	public function deleteCustomMenu($menu_id) {
		$this->db->query("DELETE FROM " . DB_PREFIX . "custom_menu WHERE menu_id = '" . (int)$menu_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "custom_menu_description WHERE menu_id = '" . (int)$menu_id . "'");

		$this->cache->delete('custom_menu');
	}	
	
	public function getCustomMenuForm($menu_id) {
		$sql = "SELECT * FROM " . DB_PREFIX . "custom_menu i LEFT JOIN " . DB_PREFIX . "custom_menu_description id ON (i.menu_id = id.menu_id) LEFT JOIN " . DB_PREFIX . "custom_menu_description id2 ON (parent_id = id2.menu_id) where i.menu_id='".$menu_id."'";
		$query = $this->db->query($sql);
		return $query->row;
	}
	
	public function getCustomMenu($data) {

			$sql = "SELECT i.menu_id as menu_id, CONCAT_WS(' &gt; ', id3.name, id2.name, id.name) as name,  
			i.link as link, 
			i.parent_id as parent_id,
			i.parent_parent_id as parent_parent_id,			
			i.sort_order as sort_order,
			i.status as status
			FROM " . DB_PREFIX . "custom_menu i 
			LEFT JOIN " . DB_PREFIX . "custom_menu_description id ON (i.menu_id = id.menu_id) 
			LEFT JOIN " . DB_PREFIX . "custom_menu_description id2 ON (i.parent_id = id2.menu_id)
			LEFT JOIN " . DB_PREFIX . "custom_menu_description id3 ON (i.parent_parent_id = id3.menu_id)			
			WHERE id.language_id = '" . (int)$this->config->get('config_language_id') . "'";
		
			$sort_data = array(
				'name',				
				'link'
			);		
			
			if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
				$sql .= " GROUP BY " . $data['sort'];	
			} else {
				$sql .= " GROUP BY name";	
			}
			
			if (isset($data['order']) && ($data['order'] == 'DESC')) {
				$sql .= " DESC";
			} else {
				$sql .= " ASC, sort_order ASC";
			}
			
			if (isset($data['start']) || isset($data['limit'])) {
				if ($data['start'] < 0) {
					$data['start'] = 0;
				}		

				if ($data['limit'] < 1) {
					$data['limit'] = 20;
				}	
			
				$sql .= " LIMIT " . (int)$data['start'] . "," . (int)$data['limit'];
			}	
			
			$query = $this->db->query($sql);
			return $query->rows;
	}
	
	public function getCustomMenu1() {
		$sql = "SELECT i.menu_id as menu_id, CONCAT_WS(' &gt; ', id3.name, id2.name, id.name) as name,  
			i.parent_id as parent_id,
			i.parent_parent_id as parent_parent_id,			
			i.sort_order as sort_order
			FROM " . DB_PREFIX . "custom_menu i 
			LEFT JOIN " . DB_PREFIX . "custom_menu_description id ON (i.menu_id = id.menu_id) 
			LEFT JOIN " . DB_PREFIX . "custom_menu_description id2 ON (i.parent_id = id2.menu_id)
			LEFT JOIN " . DB_PREFIX . "custom_menu_description id3 ON (i.parent_parent_id = id3.menu_id)
			WHERE id.language_id = '" . (int)$this->config->get('config_language_id') . "' and parent_parent_id = '0'
			GROUP BY name ASC, sort_order ASC";	
			
		$query = $this->db->query($sql);
		return $query->rows;	
	}
	
	public function getCustomMenu2() {
		$sql = "SELECT i.menu_id as menu_id, CONCAT_WS(' &gt; ', id3.name, id2.name, id.name) as name,  
			i.parent_id as parent_id,
			i.parent_parent_id as parent_parent_id,			
			i.sort_order as sort_order
			FROM " . DB_PREFIX . "custom_menu i 
			LEFT JOIN " . DB_PREFIX . "custom_menu_description id ON (i.menu_id = id.menu_id) 
			LEFT JOIN " . DB_PREFIX . "custom_menu_description id2 ON (i.parent_id = id2.menu_id)
			LEFT JOIN " . DB_PREFIX . "custom_menu_description id3 ON (i.parent_parent_id = id3.menu_id)
			WHERE id.language_id = '" . (int)$this->config->get('config_language_id') . "'
			GROUP BY name ASC, sort_order ASC";	
			
		$query = $this->db->query($sql);
		return $query->rows;	
	}
	
	public function getCustomMenuDescriptions($menu_id) {
		$custom_menu_description_data = array();
		
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "custom_menu_description WHERE menu_id = '" . (int)$menu_id . "'");

		foreach ($query->rows as $result) {
			$custom_menu_description_data[$result['language_id']] = array(
				'name'       => $result['name']			
				);
		}
		
		return $custom_menu_description_data;
	}	
		
	public function getTotalCustomMenu() {
		$this->checkMenu();
		
      	$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "custom_menu");
		
		return $query->row['total'];
	}	
	
	public function checkMenu() { 
		$this->db->query("CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "custom_menu` (`menu_id` int(11) NOT NULL auto_increment, `link` VARCHAR(255) COLLATE utf8_general_ci default NULL, `image` VARCHAR(255) COLLATE utf8_general_ci default NULL, `parent_id` int(11) default NULL, `parent_parent_id` int(11) default NULL, `status` int(11) default NULL, `column` int(11) default NULL, `sort_order` int(11) default NULL, PRIMARY KEY (`menu_id`)) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci");
	
		$this->db->query("CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "custom_menu_description` (`menu_id` int(11) NOT NULL default '0', `language_id` int(11) NOT NULL default '0', `name` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci");
		
		$show_keys = $this->db->query("SHOW KEYS FROM `" . DB_PREFIX . "custom_menu_description`");

		$show_key = $show_keys->rows;
		
		if($show_key) {
			$this->db->query("ALTER TABLE `" . DB_PREFIX . "custom_menu_description` DROP PRIMARY KEY");
		}	
	}
}
?>