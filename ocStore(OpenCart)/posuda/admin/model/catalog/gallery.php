<?php class ModelCatalogGallery extends Model {
	public function addGallery($data) {
		$this->db->query("INSERT INTO " . DB_PREFIX . "gallery SET name = '" . $this->db->escape($data['name']) . "', status = '" . (int)$data['status'] . "'");

		$gallery_id = $this->db->getLastId();

		if (isset($data['gallery_image'])) {
			foreach ($data['gallery_image'] as $gallery_image) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "gallery_image SET gallery_id = '" . (int)$gallery_id . "', link = '" .  $this->db->escape($gallery_image['link']) . "', image = '" .  $this->db->escape($gallery_image['image']) . "'");

				$gallery_image_id = $this->db->getLastId();

				foreach ($gallery_image['gallery_image_description'] as $language_id => $gallery_image_description) {				
					$this->db->query("INSERT INTO " . DB_PREFIX . "gallery_image_description SET gallery_image_id = '" . (int)$gallery_image_id . "', language_id = '" . (int)$language_id . "', gallery_id = '" . (int)$gallery_id . "', title = '" .  $this->db->escape($gallery_image_description['title']) . "'");
				}
			}
		}		
	}

	public function editgallery($gallery_id, $data) {
		$this->db->query("UPDATE " . DB_PREFIX . "gallery SET name = '" . $this->db->escape($data['name']) . "', status = '" . (int)$data['status'] . "' WHERE gallery_id = '" . (int)$gallery_id . "'");

		$this->db->query("DELETE FROM " . DB_PREFIX . "gallery_image WHERE gallery_id = '" . (int)$gallery_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "gallery_image_description WHERE gallery_id = '" . (int)$gallery_id . "'");

		if (isset($data['gallery_image'])) {
			foreach ($data['gallery_image'] as $gallery_image) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "gallery_image SET gallery_id = '" . (int)$gallery_id . "', link = '" .  $this->db->escape($gallery_image['link']) . "', image = '" .  $this->db->escape($gallery_image['image']) . "'");

				$gallery_image_id = $this->db->getLastId();

				foreach ($gallery_image['gallery_image_description'] as $language_id => $gallery_image_description) {				
					$this->db->query("INSERT INTO " . DB_PREFIX . "gallery_image_description SET gallery_image_id = '" . (int)$gallery_image_id . "', language_id = '" . (int)$language_id . "', gallery_id = '" . (int)$gallery_id . "', title = '" .  $this->db->escape($gallery_image_description['title']) . "'");
				}
			}
		}			
	}

	public function deleteGallery($gallery_id) {
		$this->db->query("DELETE FROM " . DB_PREFIX . "gallery WHERE gallery_id = '" . (int)$gallery_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "gallery_image WHERE gallery_id = '" . (int)$gallery_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "gallery_image_description WHERE gallery_id = '" . (int)$gallery_id . "'");
	}

	public function getGallery($gallery_id) {			
		$query = $this->db->query("SELECT DISTINCT * FROM " . DB_PREFIX . "gallery WHERE gallery_id = '" . (int)$gallery_id . "'");

		return $query->row;
	}

	public function getGallerys($data = array()) {
		
		
		$sql = "SELECT * FROM " . DB_PREFIX . "gallery";

		$sort_data = array(
			'name',
			'status'
		);	

		if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
			$sql .= " ORDER BY " . $data['sort'];	
		} else {
			$sql .= " ORDER BY name";	
		}

		if (isset($data['order']) && ($data['order'] == 'DESC')) {
			$sql .= " DESC";
		} else {
			$sql .= " ASC";
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

	public function getGalleryImages($gallery_id) {
		$gallery_image_data = array();

		$gallery_image_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "gallery_image WHERE gallery_id = '" . (int)$gallery_id . "'");

		foreach ($gallery_image_query->rows as $gallery_image) {
			$gallery_image_description_data = array();

			$gallery_image_description_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "gallery_image_description WHERE gallery_image_id = '" . (int)$gallery_image['gallery_image_id'] . "' AND gallery_id = '" . (int)$gallery_id . "'");

			foreach ($gallery_image_description_query->rows as $gallery_image_description) {			
				$gallery_image_description_data[$gallery_image_description['language_id']] = array('title' => $gallery_image_description['title']);
			}

			$gallery_image_data[] = array(
				'gallery_image_description' => $gallery_image_description_data,
				'link'                     => $gallery_image['link'],
				'image'                    => $gallery_image['image']	
			);
		}

		return $gallery_image_data;
	}

	public function getTotalgallerys() {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "gallery");

		return $query->row['total'];
	}	
	
}
?>