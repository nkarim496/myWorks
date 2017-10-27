<?php
class ControllerModuleHokSlider extends Controller {
	public function index($setting) {
		static $module = 0;
		
		$this->load->language('module/hok_banner');
		$this->load->model('tool/image');
		
		$this->document->addScript('catalog/view/javascript/jquery/hok-slider/jquery.themepunch.plugins.min.js');
		$this->document->addScript('catalog/view/javascript/jquery/hok-slider/jquery.themepunch.revolution.min.js');
		$this->document->addStyle('catalog/view/javascript/jquery/hok-slider/revo.css');

		$data['sliders'] = array();

		$results = $setting['slider_image'];

		$data['slider_class'] = $setting['slider_class'];
		$data['slider_style'] = $setting['slider_style'];
		$data['delay'] = (int)$setting['delay'];
		$data['start_width'] = (int)$setting['start_width'];
		$data['start_height'] = (int)$setting['start_height'];
		$data['shuffle'] = $setting['shuffle'];
		$data['hover_stop'] = $setting['hover_stop'];
		$data['thumb_width'] = (int)$setting['thumb_width'];
		$data['thumb_height'] = (int)$setting['thumb_height'];
		$data['thumb_amount'] = (int)$setting['thumb_amount'];
		$data['hide_thumb'] = (int)$setting['hide_thumb'];
		$data['navigation_type'] = $setting['navigation_type'];
		$data['navigation_arrow'] = $setting['navigation_arrow'];
		$data['navigation_style'] = $setting['navigation_style'];
		$data['navigation_halign'] = $setting['navigation_halign'];
		$data['navigation_valign'] = $setting['navigation_valign'];
		$data['navigation_hoffset'] = (int)$setting['navigation_hoffset'];
		$data['navigation_voffset'] = (int)$setting['navigation_voffset'];
		$data['solo_arrow_left_halign'] = $setting['solo_arrow_left_halign'];
		$data['solo_arrow_left_valign'] = $setting['solo_arrow_left_valign'];
		$data['solo_arrow_left_hoffset'] = (int)$setting['solo_arrow_left_hoffset'];
		$data['solo_arrow_left_voffset'] = (int)$setting['solo_arrow_left_voffset'];
		$data['solo_arrow_right_halign'] = $setting['solo_arrow_right_halign'];
		$data['solo_arrow_right_valign'] = $setting['solo_arrow_right_valign'];
		$data['solo_arrow_right_hoffset'] = (int)$setting['solo_arrow_right_hoffset'];
		$data['solo_arrow_right_voffset'] = (int)$setting['solo_arrow_right_voffset'];
		$data['touch_enabled'] = $setting['touch_enabled'];
		$data['stop_at_slide'] = (int)$setting['stop_at_slide'];
		$data['stop_after_loops'] = (int)$setting['stop_after_loops'];
		$data['hide_caption_at_limit'] = (int)$setting['hide_caption_at_limit'];
		$data['hide_all_caption_at_lilmit'] = (int)$setting['hide_all_caption_at_limit'];
		$data['hide_slider_at_limit'] = (int)$setting['hide_slider_at_limit'];
		$data['hide_thumbs_on_mobile'] = $setting['hide_thumbs_on_mobile'];
		$data['hide_bullets_on_mobile'] = $setting['hide_bullets_on_mobile'];
		$data['hide_arrows_on_mobile'] = $setting['hide_arrows_on_mobile'];
		$data['hide_thumbs_under_resolution'] = (int)$setting['hide_thumbs_under_resolution'];
		$data['full_width'] = $setting['full_width'];
		$data['auto_height'] = $setting['auto_height'];
		$data['full_screen_align_force'] = $setting['full_screen_align_force'];
		$data['force_full_width'] = $setting['force_full_width'];
		$data['full_screen'] = $setting['full_screen'];
		$data['full_screen_offset_container'] = $setting['full_screen_offset_container'];
		$data['shadow'] = $setting['shadow'];
		$data['dotted_overlay'] = $setting['dotted_overlay'];
		
		$sort_order = array();
		
		foreach ($results as $sort_od){
			$sort_order[] = $sort_od['sort_order'];
		}
		
		array_multisort($sort_order, $results);
		
		foreach ($results as $result) {
			if (is_file(DIR_IMAGE . $result['image']) && $result['status']) {
				foreach ($result['slider_image_description'] as $language_id => $banner_image_description) { 
					if ($language_id === (int)$this->config->get('config_language_id')) {
						$title = $banner_image_description['title'];
					}	
				}
				
				$caption_info = array();
				
				if (isset($result['captions'])) {
					ksort($result['captions']);
				
					foreach ($result['captions'] as $caption) { 
						$caption_info[] = array(
							'caption' 		  => html_entity_decode($caption['languages'][(int)$this->config->get('config_language_id')]['caption'], ENT_QUOTES, 'UTF-8'),
							'color_class' 	  => $caption['color_class'],
							'animation_class' => $caption['animation_class'],
							'custom_style'	  => $caption['custom_style'],
							'caption_class'	  => $caption['caption_class'],
							'position_x' 	  => (int)$caption['position_x'],
							'position_y' 	  => (int)$caption['position_y'],
							'speed' 		  => (int)$caption['speed'],
							'start_after' 	  => $caption['start_after'],
							'easing' 	  	  => $caption['easing'],
							'end_easing' 	  => $caption['end_easing'],
						);
					}
				}
				
				$data['sliders'][] = array(
					'title' 		 => $title,
					'link'  		 => $result['link'],
					'transition'     => $result['transition'],
					'slot'     		 => (int)$result['slot'],
					'masterspeed'    => (int)$result['masterspeed'],
					'delay'     	 => (int)$result['delay'],
					'captions' 		 => $caption_info,
					'image' 		 => $this->model_tool_image->resize($result['image'], $setting['start_width'], $setting['start_height'], 'w')
				);
			}
		}

		$data['module'] = $module++;

		if (version_compare(VERSION, '2.2.0.0', '<') == true) {
			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/hok_slider.tpl')) {
				return $this->load->view($this->config->get('config_template') . '/template/module/hok_slider.tpl', $data);
			} else {
				return $this->load->view('default/template/module/hok_slider.tpl', $data);
			}
		} else {
			return $this->load->view('module/hok_slider', $data);
		}
	}
}