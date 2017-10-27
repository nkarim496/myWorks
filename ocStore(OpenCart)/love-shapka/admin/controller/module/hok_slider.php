<?php
class ControllerModuleHokSlider extends Controller {
	private $error = array();

	public function index() {
		$this->load->language('module/hok_slider');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('extension/module');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			if (!isset($this->request->get['module_id'])) {
				$this->model_extension_module->addModule('hok_slider', $this->request->post);
			} else {
				$this->model_extension_module->editModule($this->request->get['module_id'], $this->request->post);
			}

			$this->session->data['success'] = $this->language->get('text_success');

			$this->response->redirect($this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'));
		}

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_edit'] = $this->language->get('text_edit');
		$data['text_form'] = $this->language->get('text_form');
		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');
		$data['text_width'] = $this->language->get('text_width');
		$data['text_height'] = $this->language->get('text_height');
		$data['text_on'] = $this->language->get('text_on');
		$data['text_off'] = $this->language->get('text_off');
		$data['text_speed'] = $this->language->get('text_speed');
		$data['text_caption'] = $this->language->get('text_caption');
		$data['text_start'] = $this->language->get('text_start');
		$data['text_slot'] = $this->language->get('text_slot');
		$data['text_pos_x'] = $this->language->get('text_pos_x');
		$data['text_pos_y'] = $this->language->get('text_pos_y');
		$data['text_delay'] = $this->language->get('text_delay');

		$data['entry_name'] = $this->language->get('entry_name');
		$data['entry_slider'] = $this->language->get('entry_slider');
		$data['entry_width'] = $this->language->get('entry_width');
		$data['entry_height'] = $this->language->get('entry_height');	
		$data['entry_title'] = $this->language->get('entry_title');	
		$data['entry_link'] = $this->language->get('entry_link');	
		$data['entry_image'] = $this->language->get('entry_image');	
		$data['entry_sort_order'] = $this->language->get('entry_sort_order');	
		$data['entry_speed'] = $this->language->get('entry_speed');	
		$data['entry_caption'] = $this->language->get('entry_caption');	
		$data['entry_slide'] = $this->language->get('entry_slide');	
		$data['entry_transition'] = $this->language->get('entry_transition');	
		$data['entry_start'] = $this->language->get('entry_start');	
		$data['entry_pos_x'] = $this->language->get('entry_pos_x');	
		$data['entry_pos_y'] = $this->language->get('entry_pos_y');	
		$data['entry_status'] = $this->language->get('entry_status');
		$data['entry_slot'] = $this->language->get('entry_slot');
		$data['entry_start_width'] = $this->language->get('entry_start_width');
		$data['entry_start_height']= $this->language->get('entry_start_height');
		$data['entry_shuffle']= $this->language->get('entry_shuffle');
		$data['entry_delay'] = $this->language->get('entry_delay');
		$data['entry_easing'] = $this->language->get('entry_easing');
		$data['entry_end_easing'] = $this->language->get('entry_end_easing');
		$data['entry_start_after'] = $this->language->get('entry_start_after');
		$data['entry_color_class'] = $this->language->get('entry_color_class');
		$data['entry_animation_class'] = $this->language->get('entry_animation_class');
		$data['entry_hide_thumb']  = $this->language->get('entry_hide_thumb');
		$data['entry_thumb_width'] = $this->language->get('entry_thumb_width');
		$data['entry_thumb_height']= $this->language->get('entry_thumb_height');
		$data['entry_thumb_amount']= $this->language->get('entry_thumb_amount');
		$data['entry_custom_style']= $this->language->get('entry_custom_style');
		$data['entry_slider_class']= $this->language->get('entry_slider_class');
		$data['entry_caption_class']= $this->language->get('entry_caption_class');
		$data['entry_slider_style']= $this->language->get('entry_slider_style');
		$data['entry_navigation_hoffset']= $this->language->get('entry_navigation_hoffset');
		$data['entry_navigation_voffset']= $this->language->get('entry_navigation_voffset');
		$data['entry_solo_arrow_left_hoffset']= $this->language->get('entry_solo_arrow_left_hoffset');
		$data['entry_solo_arrow_left_voffset']= $this->language->get('entry_solo_arrow_left_voffset');
		$data['entry_solo_arrow_right_hoffset']= $this->language->get('entry_solo_arrow_right_hoffset');
		$data['entry_solo_arrow_right_voffset']= $this->language->get('entry_solo_arrow_right_voffset');
		$data['entry_stop_at_slide']= $this->language->get('entry_stop_at_slide');
		$data['entry_stop_after_loops']= $this->language->get('entry_stop_after_loops');
		$data['entry_hide_caption_at_limit']= $this->language->get('entry_hide_caption_at_limit');
		$data['entry_hide_all_caption_at_limit']= $this->language->get('entry_hide_all_caption_at_limit');
		$data['entry_hide_slider_at_limit']= $this->language->get('entry_hide_slider_at_limit');
		$data['entry_hide_thumbs_on_mobile']= $this->language->get('entry_hide_thumbs_on_mobile');
		$data['entry_hide_bullets_on_mobile']= $this->language->get('entry_hide_bullets_on_mobile');
		$data['entry_hide_arrows_on_mobile']= $this->language->get('entry_hide_arrows_on_mobile');
		$data['entry_hide_thumbs_under_resolution']= $this->language->get('entry_hide_thumbs_under_resolution');
		$data['entry_full_width']= $this->language->get('entry_full_width');
		$data['entry_auto_height']= $this->language->get('entry_auto_height');
		$data['entry_full_screen_align_force']= $this->language->get('entry_full_screen_align_force');
		$data['entry_force_full_width']= $this->language->get('entry_force_full_width');
		$data['entry_full_screen']= $this->language->get('entry_full_screen');
		$data['entry_full_screen_offset_container']= $this->language->get('entry_full_screen_offset_container');
		$data['entry_shadow']= $this->language->get('entry_shadow');
		$data['entry_dotted_overlay']= $this->language->get('entry_dotted_overlay');
		$data['entry_hover_stop']= $this->language->get('entry_hover_stop');
		$data['entry_navigation_type']= $this->language->get('entry_navigation_type');
		$data['entry_navigation_arrow']= $this->language->get('entry_navigation_arrow');
		$data['entry_navigation_style']= $this->language->get('entry_navigation_style');
		$data['entry_navigation_halign']= $this->language->get('entry_navigation_halign');
		$data['entry_navigation_valign']= $this->language->get('entry_navigation_valign');
		$data['entry_solo_arrow_left_halign']= $this->language->get('entry_solo_arrow_left_halign');
		$data['entry_solo_arrow_left_valign']= $this->language->get('entry_solo_arrow_left_valign');
		$data['entry_solo_arrow_right_halign']= $this->language->get('entry_solo_arrow_right_halign');
		$data['entry_solo_arrow_right_valign']= $this->language->get('entry_solo_arrow_right_valign');
		$data['entry_touch_enabled']= $this->language->get('entry_touch_enabled');
		$data['entry_masterspeed'] = $this->language->get('entry_masterspeed');

		$data['button_slider_add'] = $this->language->get('button_slider_add');
		$data['button_caption'] = $this->language->get('button_caption');
		$data['button_remove'] = $this->language->get('button_remove');
		$data['button_save'] = $this->language->get('button_save');
		$data['button_cancel'] = $this->language->get('button_cancel');
		
		$data['help_slider_class'] = $this->language->get('help_slider_class');
		$data['help_slider_style'] = $this->language->get('help_slider_style');
		$data['help_delay'] = $this->language->get('help_delay');
		$data['help_start_width'] = $this->language->get('help_start_width');
		$data['help_start_height'] = $this->language->get('help_start_height');
		$data['help_shuffle'] = $this->language->get('help_shuffle');
		$data['help_hover_stop'] = $this->language->get('help_hover_stop');
		$data['help_thumb_width'] = $this->language->get('help_thumb_width');
		$data['help_thumb_height'] = $this->language->get('help_thumb_height');
		$data['help_thumb_amount'] = $this->language->get('help_thumb_amount');
		$data['help_hide_thumb'] = $this->language->get('help_hide_thumb');
		$data['help_navigation_type'] = $this->language->get('help_navigation_type');
		$data['help_navigation_arrow'] = $this->language->get('help_navigation_arrow');
		$data['help_navigation_style'] = $this->language->get('help_navigation_style');
		$data['help_navigation_halign'] = $this->language->get('help_navigation_halign');
		$data['help_navigation_valign'] = $this->language->get('help_navigation_valign');
		$data['help_navigation_hoffset'] = $this->language->get('help_navigation_hoffset');
		$data['help_navigation_voffset'] = $this->language->get('help_navigation_voffset');
		$data['help_solo_arrow_left_halign'] = $this->language->get('help_solo_arrow_left_halign');
		$data['help_solo_arrow_left_valign'] = $this->language->get('help_solo_arrow_left_valign');
		$data['help_solo_arrow_right_halign'] = $this->language->get('help_solo_arrow_right_halign');
		$data['help_solo_arrow_right_valign'] = $this->language->get('help_solo_arrow_right_valign');
		$data['help_solo_arrow_left_hoffset'] = $this->language->get('help_solo_arrow_left_hoffset');
		$data['help_solo_arrow_left_voffset'] = $this->language->get('help_solo_arrow_left_voffset');
		$data['help_solo_arrow_right_hoffset'] = $this->language->get('help_solo_arrow_right_hoffset');
		$data['help_solo_arrow_right_voffset'] = $this->language->get('help_solo_arrow_right_voffset');
		$data['help_touch_enabled'] = $this->language->get('help_touch_enabled');
		$data['help_stop_at_slide'] = $this->language->get('help_stop_at_slide');
		$data['help_stop_after_loops'] = $this->language->get('help_stop_after_loops');
		$data['help_hide_caption_at_limit'] = $this->language->get('help_hide_caption_at_limit');
		$data['help_hide_all_caption_at_limit'] = $this->language->get('help_hide_all_caption_at_limit');
		$data['help_hide_slider_at_limit'] = $this->language->get('help_hide_slider_at_limit');
		$data['help_hide_thumbs_on_mobile'] = $this->language->get('help_hide_thumbs_on_mobile');
		$data['help_hide_bullets_on_mobile'] = $this->language->get('help_hide_bullets_on_mobile');
		$data['help_hide_arrows_on_mobile'] = $this->language->get('help_hide_arrows_on_mobile');
		$data['help_hide_thumbs_under_resolution'] = $this->language->get('help_hide_thumbs_under_resolution');
		$data['help_full_width'] = $this->language->get('help_full_width');
		$data['help_auto_height'] = $this->language->get('help_auto_height');
		$data['help_full_screen_align_force'] = $this->language->get('help_full_screen_align_force');
		$data['help_force_full_width'] = $this->language->get('help_force_full_width');
		$data['help_full_screen'] = $this->language->get('help_full_screen');
		$data['help_full_screen_offset_container'] = $this->language->get('help_full_screen_offset_container');
		$data['help_shadow'] = $this->language->get('help_shadow');
		$data['help_dotted_overlay'] = $this->language->get('help_dotted_overlay');
		
		$data['tab_caption'] = $this->language->get('tab_caption');
		$data['tab_global_setting']= $this->language->get('tab_global_setting');
		$data['tab_navigation_setting']= $this->language->get('tab_navigation_setting');
		$data['tab_slider_loop_setting']= $this->language->get('tab_slider_loop_setting');
		$data['tab_mobile_visibility_setting']= $this->language->get('tab_mobile_visibility_setting');
		$data['tab_layout_style_setting']= $this->language->get('tab_layout_style_setting');
		
		$this->load->model('localisation/language');

		$data['languages'] = $this->model_localisation_language->getLanguages();
		
		$this->load->model('tool/image');
		
		$data['placeholder'] = $this->model_tool_image->resize('no_image.png', 100, 100);

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		if (isset($this->error['name'])) {
			$data['error_name'] = $this->error['name'];
		} else {
			$data['error_name'] = '';
		}
		
		if (isset($this->error['start_width'])) {
			$data['error_start_width'] = $this->error['start_width'];
		} else {
			$data['error_start_width'] = '';
		}
		
		if (isset($this->error['start_height'])) {
			$data['error_start_height'] = $this->error['start_height'];
		} else {
			$data['error_start_height'] = '';
		}
		
		if (isset($this->error['delay'])) {
			$data['error_delay'] = $this->error['delay'];
		} else {
			$data['error_delay'] = '';
		}
		
		if (isset($this->error['thumb_width'])) {
			$data['error_thumb_width'] = $this->error['thumb_width'];
		} else {
			$data['error_thumb_width'] = '';
		}
		
		if (isset($this->error['thumb_height'])) {
			$data['error_thumb_height'] = $this->error['thumb_height'];
		} else {
			$data['error_thumb_height'] = '';
		}
		
		if (isset($this->error['thumb_amount'])) {
			$data['error_thumb_amount'] = $this->error['thumb_amount'];
		} else {
			$data['error_thumb_amount'] = '';
		}
		
		if (isset($this->error['navigation_hoffset'])) {
			$data['error_navigation_hoffset'] = $this->error['navigation_hoffset'];
		} else {
			$data['error_navigation_hoffset'] = '';
		}
		
		if (isset($this->error['navigation_voffset'])) {
			$data['error_navigation_voffset'] = $this->error['navigation_voffset'];
		} else {
			$data['error_navigation_voffset'] = '';
		}
		
		if (isset($this->error['solo_arrow_left_hoffset'])) {
			$data['error_solo_arrow_left_hoffset'] = $this->error['solo_arrow_left_hoffset'];
		} else {
			$data['error_solo_arrow_left_hoffset'] = '';
		}
		
		if (isset($this->error['solo_arrow_left_voffset'])) {
			$data['error_solo_arrow_left_voffset'] = $this->error['solo_arrow_left_voffset'];
		} else {
			$data['error_solo_arrow_left_voffset'] = '';
		}
		
		if (isset($this->error['solo_arrow_right_hoffset'])) {
			$data['error_solo_arrow_right_hoffset'] = $this->error['solo_arrow_right_hoffset'];
		} else {
			$data['error_solo_arrow_right_hoffset'] = '';
		}
		
		if (isset($this->error['solo_arrow_right_voffset'])) {
			$data['error_solo_arrow_right_voffset'] = $this->error['solo_arrow_right_voffset'];
		} else {
			$data['error_solo_arrow_right_voffset'] = '';
		}
		
		if (isset($this->error['hide_thumbs_under_resolution'])) {
			$data['error_hide_thumbs_under_resolution'] = $this->error['hide_thumbs_under_resolution'];
		} else {
			$data['error_hide_thumbs_under_resolution'] = '';
		}
		
		if (isset($this->error['slider_image'])) {
			$data['error_slider_image'] = $this->error['slider_image'];
		} else {
			$data['error_slider_image'] = array();
		}

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], 'SSL')
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_module'),
			'href' => $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL')
		);

		if (!isset($this->request->get['module_id'])) {
			$data['breadcrumbs'][] = array(
				'text' => $this->language->get('heading_title'),
				'href' => $this->url->link('module/hok_slider', 'token=' . $this->session->data['token'], 'SSL')
			);
		} else {
			$data['breadcrumbs'][] = array(
				'text' => $this->language->get('heading_title'),
				'href' => $this->url->link('module/hok_slider', 'token=' . $this->session->data['token'] . '&module_id=' . $this->request->get['module_id'], 'SSL')
			);
		}

		if (!isset($this->request->get['module_id'])) {
			$data['action'] = $this->url->link('module/hok_slider', 'token=' . $this->session->data['token'], 'SSL');
		} else {
			$data['action'] = $this->url->link('module/hok_slider', 'token=' . $this->session->data['token'] . '&module_id=' . $this->request->get['module_id'], 'SSL');
		}

		$data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');

		if (isset($this->request->get['module_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
			$module_info = $this->model_extension_module->getModule($this->request->get['module_id']);
		}

		if (isset($this->request->post['name'])) {
			$data['name'] = $this->request->post['name'];
		} elseif (!empty($module_info)) {
			$data['name'] = $module_info['name'];
		} else {
			$data['name'] = '';
		}

		if (isset($this->request->post['slider_class'])) {
			$data['slider_class'] = $this->request->post['slider_class'];
		} elseif (!empty($module_info)) {
			$data['slider_class'] = $module_info['slider_class'];
		} else {
			$data['slider_class'] = '';
		}
		
		if (isset($this->request->post['slider_style'])) {
			$data['slider_style'] = $this->request->post['slider_style'];
		} elseif (!empty($module_info)) {
			$data['slider_style'] = $module_info['slider_style'];
		} else {
			$data['slider_style'] = '';
		}
		
		if (isset($this->request->post['delay'])) {
			$data['delay'] = $this->request->post['delay'];
		} elseif (!empty($module_info)) {
			$data['delay'] = $module_info['delay'];
		} else {
			$data['delay'] = 9000;
		}
		
		if (isset($this->request->post['start_width'])) {
			$data['start_width'] = $this->request->post['start_width'];
		} elseif (!empty($module_info)) {
			$data['start_width'] = $module_info['start_width'];
		} else {
			$data['start_width'] = '';
		}
		
		if (isset($this->request->post['start_height'])) {
			$data['start_height'] = $this->request->post['start_height'];
		} elseif (!empty($module_info)) {
			$data['start_height'] = $module_info['start_height'];
		} else {
			$data['start_height'] = '';
		}
		
		if (isset($this->request->post['shuffle'])) {
			$data['shuffle'] = $this->request->post['shuffle'];
		} elseif (!empty($module_info)) {
			$data['shuffle'] = $module_info['shuffle'];
		} else {
			$data['shuffle'] = '';
		}

		if (isset($this->request->post['status'])) {
			$data['status'] = $this->request->post['status'];
		} elseif (!empty($module_info)) {
			$data['status'] = $module_info['status'];
		} else {
			$data['status'] = '';
		}
		
		if (isset($this->request->post['hover_stop'])) {
			$data['hover_stop'] = $this->request->post['hover_stop'];
		} elseif (!empty($module_info)) {
			$data['hover_stop'] = $module_info['hover_stop'];
		} else {
			$data['hover_stop'] = '';
		}
		
		if (isset($this->request->post['thumb_width'])) {
			$data['thumb_width'] = $this->request->post['thumb_width'];
		} elseif (!empty($module_info)) {
			$data['thumb_width'] = $module_info['thumb_width'];
		} else {
			$data['thumb_width'] = '';
		}
		
		if (isset($this->request->post['thumb_height'])) {
			$data['thumb_height'] = $this->request->post['thumb_height'];
		} elseif (!empty($module_info)) {
			$data['thumb_height'] = $module_info['thumb_height'];
		} else {
			$data['thumb_height'] = '';
		}
		
		if (isset($this->request->post['thumb_amount'])) {
			$data['thumb_amount'] = $this->request->post['thumb_amount'];
		} elseif (!empty($module_info)) {
			$data['thumb_amount'] = $module_info['thumb_amount'];
		} else {
			$data['thumb_amount'] = '';
		}
		
		if (isset($this->request->post['hide_thumb'])) {
			$data['hide_thumb'] = $this->request->post['hide_thumb'];
		} elseif (!empty($module_info)) {
			$data['hide_thumb'] = $module_info['hide_thumb'];
		} else {
			$data['hide_thumb'] = 0;
		}
		
		if (isset($this->request->post['navigation_type'])) {
			$data['navigation_type'] = $this->request->post['navigation_type'];
		} elseif (!empty($module_info)) {
			$data['navigation_type'] = $module_info['navigation_type'];
		} else {
			$data['navigation_type'] = '';
		}
		
		if (isset($this->request->post['navigation_arrow'])) {
			$data['navigation_arrow'] = $this->request->post['navigation_arrow'];
		} elseif (!empty($module_info)) {
			$data['navigation_arrow'] = $module_info['navigation_arrow'];
		} else {
			$data['navigation_arrow'] = '';
		}
		
		if (isset($this->request->post['navigation_style'])) {
			$data['navigation_style'] = $this->request->post['navigation_style'];
		} elseif (!empty($module_info)) {
			$data['navigation_style'] = $module_info['navigation_style'];
		} else {
			$data['navigation_style'] = '';
		}
		
		if (isset($this->request->post['navigation_halign'])) {
			$data['navigation_halign'] = $this->request->post['navigation_halign'];
		} elseif (!empty($module_info)) {
			$data['navigation_halign'] = $module_info['navigation_halign'];
		} else {
			$data['navigation_halign'] = '';
		}
		
		if (isset($this->request->post['navigation_valign'])) {
			$data['navigation_valign'] = $this->request->post['navigation_valign'];
		} elseif (!empty($module_info)) {
			$data['navigation_valign'] = $module_info['navigation_valign'];
		} else {
			$data['navigation_valign'] = '';
		}
		
		if (isset($this->request->post['navigation_hoffset'])) {
			$data['navigation_hoffset'] = $this->request->post['navigation_hoffset'];
		} elseif (!empty($module_info)) {
			$data['navigation_hoffset'] = $module_info['navigation_hoffset'];
		} else {
			$data['navigation_hoffset'] = '';
		}
		
		if (isset($this->request->post['navigation_voffset'])) {
			$data['navigation_voffset'] = $this->request->post['navigation_voffset'];
		} elseif (!empty($module_info)) {
			$data['navigation_voffset'] = $module_info['navigation_voffset'];
		} else {
			$data['navigation_voffset'] = '';
		}
		
		if (isset($this->request->post['solo_arrow_left_halign'])) {
			$data['solo_arrow_left_halign'] = $this->request->post['solo_arrow_left_halign'];
		} elseif (!empty($module_info)) {
			$data['solo_arrow_left_halign'] = $module_info['solo_arrow_left_halign'];
		} else {
			$data['solo_arrow_left_halign'] = '';
		}
		
		if (isset($this->request->post['solo_arrow_left_valign'])) {
			$data['solo_arrow_left_valign'] = $this->request->post['solo_arrow_left_valign'];
		} elseif (!empty($module_info)) {
			$data['solo_arrow_left_valign'] = $module_info['solo_arrow_left_valign'];
		} else {
			$data['solo_arrow_left_valign'] = '';
		}
		
		if (isset($this->request->post['solo_arrow_right_halign'])) {
			$data['solo_arrow_right_halign'] = $this->request->post['solo_arrow_right_halign'];
		} elseif (!empty($module_info)) {
			$data['solo_arrow_right_halign'] = $module_info['solo_arrow_right_halign'];
		} else {
			$data['solo_arrow_right_halign'] = '';
		}
		
		if (isset($this->request->post['solo_arrow_right_valign'])) {
			$data['solo_arrow_right_valign'] = $this->request->post['solo_arrow_right_valign'];
		} elseif (!empty($module_info)) {
			$data['solo_arrow_right_valign'] = $module_info['solo_arrow_right_valign'];
		} else {
			$data['solo_arrow_right_valign'] = '';
		}
		
		if (isset($this->request->post['solo_arrow_left_hoffset'])) {
			$data['solo_arrow_left_hoffset'] = $this->request->post['solo_arrow_left_hoffset'];
		} elseif (!empty($module_info)) {
			$data['solo_arrow_left_hoffset'] = $module_info['solo_arrow_left_hoffset'];
		} else {
			$data['solo_arrow_left_hoffset'] = '';
		}
		
		if (isset($this->request->post['solo_arrow_left_voffset'])) {
			$data['solo_arrow_left_voffset'] = $this->request->post['solo_arrow_left_voffset'];
		} elseif (!empty($module_info)) {
			$data['solo_arrow_left_voffset'] = $module_info['solo_arrow_left_voffset'];
		} else {
			$data['solo_arrow_left_voffset'] = '';
		}
		
		if (isset($this->request->post['solo_arrow_right_hoffset'])) {
			$data['solo_arrow_right_hoffset'] = $this->request->post['solo_arrow_right_hoffset'];
		} elseif (!empty($module_info)) {
			$data['solo_arrow_right_hoffset'] = $module_info['solo_arrow_right_hoffset'];
		} else {
			$data['solo_arrow_right_hoffset'] = '';
		}
		
		if (isset($this->request->post['solo_arrow_right_voffset'])) {
			$data['solo_arrow_right_voffset'] = $this->request->post['solo_arrow_right_voffset'];
		} elseif (!empty($module_info)) {
			$data['solo_arrow_right_voffset'] = $module_info['solo_arrow_right_voffset'];
		} else {
			$data['solo_arrow_right_voffset'] = '';
		}
		
		if (isset($this->request->post['touch_enabled'])) {
			$data['touch_enabled'] = $this->request->post['touch_enabled'];
		} elseif (!empty($module_info)) {
			$data['touch_enabled'] = $module_info['touch_enabled'];
		} else {
			$data['touch_enabled'] = '';
		}
		
		if (isset($this->request->post['stop_at_slide'])) {
			$data['stop_at_slide'] = $this->request->post['stop_at_slide'];
		} elseif (!empty($module_info)) {
			$data['stop_at_slide'] = $module_info['stop_at_slide'];
		} else {
			$data['stop_at_slide'] = -1;
		}
		
		if (isset($this->request->post['stop_after_loops'])) {
			$data['stop_after_loops'] = $this->request->post['stop_after_loops'];
		} elseif (!empty($module_info)) {
			$data['stop_after_loops'] = $module_info['stop_after_loops'];
		} else {
			$data['stop_after_loops'] = -1;
		}
		
		if (isset($this->request->post['hide_caption_at_limit'])) {
			$data['hide_caption_at_limit'] = $this->request->post['hide_caption_at_limit'];
		} elseif (!empty($module_info)) {
			$data['hide_caption_at_limit'] = $module_info['hide_caption_at_limit'];
		} else {
			$data['hide_caption_at_limit'] = 0;
		}
		
		if (isset($this->request->post['hide_all_caption_at_limit'])) {
			$data['hide_all_caption_at_limit'] = $this->request->post['hide_all_caption_at_limit'];
		} elseif (!empty($module_info)) {
			$data['hide_all_caption_at_limit'] = $module_info['hide_all_caption_at_limit'];
		} else {
			$data['hide_all_caption_at_limit'] = 0;
		}
		
		if (isset($this->request->post['hide_slider_at_limit'])) {
			$data['hide_slider_at_limit'] = $this->request->post['hide_slider_at_limit'];
		} elseif (!empty($module_info)) {
			$data['hide_slider_at_limit'] = $module_info['hide_slider_at_limit'];
		} else {
			$data['hide_slider_at_limit'] = 0;
		}
		
		if (isset($this->request->post['hide_thumbs_on_mobile'])) {
			$data['hide_thumbs_on_mobile'] = $this->request->post['hide_thumbs_on_mobile'];
		} elseif (!empty($module_info)) {
			$data['hide_thumbs_on_mobile'] = $module_info['hide_thumbs_on_mobile'];
		} else {
			$data['hide_thumbs_on_mobile'] = '';
		}
		
		if (isset($this->request->post['hide_bullets_on_mobile'])) {
			$data['hide_bullets_on_mobile'] = $this->request->post['hide_bullets_on_mobile'];
		} elseif (!empty($module_info)) {
			$data['hide_bullets_on_mobile'] = $module_info['hide_bullets_on_mobile'];
		} else {
			$data['hide_bullets_on_mobile'] = '';
		}
		
		if (isset($this->request->post['hide_arrows_on_mobile'])) {
			$data['hide_arrows_on_mobile'] = $this->request->post['hide_arrows_on_mobile'];
		} elseif (!empty($module_info)) {
			$data['hide_arrows_on_mobile'] = $module_info['hide_arrows_on_mobile'];
		} else {
			$data['hide_arrows_on_mobile'] = '';
		}
		
		if (isset($this->request->post['hide_thumbs_under_resolution'])) {
			$data['hide_thumbs_under_resolution'] = $this->request->post['hide_thumbs_under_resolution'];
		} elseif (!empty($module_info)) {
			$data['hide_thumbs_under_resolution'] = $module_info['hide_thumbs_under_resolution'];
		} else {
			$data['hide_thumbs_under_resolution'] = 0;
		}
		
		if (isset($this->request->post['full_width'])) {
			$data['full_width'] = $this->request->post['full_width'];
		} elseif (!empty($module_info)) {
			$data['full_width'] = $module_info['full_width'];
		} else {
			$data['full_width'] = '';
		}
		
		if (isset($this->request->post['auto_height'])) {
			$data['auto_height'] = $this->request->post['auto_height'];
		} elseif (!empty($module_info)) {
			$data['auto_height'] = $module_info['auto_height'];
		} else {
			$data['auto_height'] = '';
		}
		
		if (isset($this->request->post['full_screen_align_force'])) {
			$data['full_screen_align_force'] = $this->request->post['full_screen_align_force'];
		} elseif (!empty($module_info)) {
			$data['full_screen_align_force'] = $module_info['full_screen_align_force'];
		} else {
			$data['full_screen_align_force'] = '';
		}
		
		if (isset($this->request->post['force_full_width'])) {
			$data['force_full_width'] = $this->request->post['force_full_width'];
		} elseif (!empty($module_info)) {
			$data['force_full_width'] = $module_info['force_full_width'];
		} else {
			$data['force_full_width'] = '';
		}
		
		if (isset($this->request->post['full_screen'])) {
			$data['full_screen'] = $this->request->post['full_screen'];
		} elseif (!empty($module_info)) {
			$data['full_screen'] = $module_info['full_screen'];
		} else {
			$data['full_screen'] = '';
		}
		
		if (isset($this->request->post['full_screen_offset_container'])) {
			$data['full_screen_offset_container'] = $this->request->post['full_screen_offset_container'];
		} elseif (!empty($module_info)) {
			$data['full_screen_offset_container'] = $module_info['full_screen_offset_container'];
		} else {
			$data['full_screen_offset_container'] = '';
		}
		
		if (isset($this->request->post['shadow'])) {
			$data['shadow'] = $this->request->post['shadow'];
		} elseif (!empty($module_info)) {
			$data['shadow'] = $module_info['shadow'];
		} else {
			$data['shadow'] = '';
		}
		
		if (isset($this->request->post['dotted_overlay'])) {
			$data['dotted_overlay'] = $this->request->post['dotted_overlay'];
		} elseif (!empty($module_info)) {
			$data['dotted_overlay'] = $module_info['dotted_overlay'];
		} else {
			$data['dotted_overlay'] = '';
		}
		
		if (isset($this->request->post['slider_image'])) {
			$slider_images = $this->request->post['slider_image'];
		} elseif (!empty($module_info)) {
			$slider_images = $module_info['slider_image'];
		} else {
			$slider_images = array();
		}
		
		$data['slider_images'] = array();

		foreach ($slider_images as $slider_image) {
			if (is_file(DIR_IMAGE . $slider_image['image'])) {
				$image = $slider_image['image'];
				$thumb = $slider_image['image'];
			} else {
				$image = '';
				$thumb = 'no_image.png';
			}

			$data['slider_images'][] = array(
				'slider_image_description' => $slider_image['slider_image_description'],
				'link'                     => $slider_image['link'],
				'captions'                 => (isset($slider_image['captions']) ? $slider_image['captions'] : array()),
				'image'                    => $image,
				'slot'              	   => $slider_image['slot'],
				'delay'              	   => $slider_image['delay'],
				'masterspeed'              => $slider_image['masterspeed'],
				'transition'               => $slider_image['transition'],
				'thumb'                    => $this->model_tool_image->resize($thumb, 100, 100),
				'status'               	   => $slider_image['status'],
				'sort_order'               => $slider_image['sort_order']
			);
		}

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('module/hok_slider.tpl', $data));
	}

	protected function validate() {
		if (!$this->user->hasPermission('modify', 'module/hok_slider')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		if ((utf8_strlen($this->request->post['name']) < 3) || (utf8_strlen($this->request->post['name']) > 64)) {
			$this->error['name'] = $this->language->get('error_name');
		}
	
		if (!$this->request->post['start_width']) {
			$this->error['start_width'] = $this->language->get('error_start_width');
		}
		
		if (!$this->request->post['start_height']) {
			$this->error['start_height'] = $this->language->get('error_start_height');
		}
		
		if (!$this->request->post['delay']) {
			$this->error['delay'] = $this->language->get('error_delay');
		}
		
		if (!$this->request->post['thumb_width']) {
			$this->error['thumb_width'] = $this->language->get('error_thumb_width');
		}
		
		if (!$this->request->post['thumb_height']) {
			$this->error['thumb_height'] = $this->language->get('error_thumb_height');
		}
		
		if (!$this->request->post['thumb_amount']) {
			$this->error['thumb_amount'] = $this->language->get('error_thumb_amount');
		}
		
		if ($this->request->post['hide_thumbs_under_resolution'] < 0 || $this->request->post['hide_thumbs_under_resolution'] > 1900) {
			$this->error['hide_thumbs_under_resolution'] = $this->language->get('error_hide_thumbs_under_resolution');
		}
		
		if ($this->request->post['navigation_hoffset'] < -1000 || $this->request->post['navigation_hoffset'] > 1000) {
			$this->error['navigation_hoffset'] = $this->language->get('error_navigation_hoffset');
		}
		
		if ($this->request->post['navigation_voffset'] < -1000 || $this->request->post['navigation_voffset'] > 1000) {
			$this->error['navigation_voffset'] = $this->language->get('error_navigation_voffset');
		}
		
		if ($this->request->post['solo_arrow_left_hoffset'] < -1000 || $this->request->post['solo_arrow_left_hoffset'] > 1000) {
			$this->error['solo_arrow_left_hoffset'] = $this->language->get('error_solo_arrow_left_hoffset');
		}
		
		if ($this->request->post['solo_arrow_left_voffset'] < -1000 || $this->request->post['solo_arrow_left_voffset'] > 1000) {
			$this->error['solo_arrow_left_voffset'] = $this->language->get('error_solo_arrow_left_voffset');
		}
		
		if ($this->request->post['solo_arrow_right_hoffset'] < -1000 || $this->request->post['solo_arrow_right_hoffset'] > 1000) {
			$this->error['solo_arrow_right_hoffset'] = $this->language->get('error_solo_arrow_right_hoffset');
		}
		
		if ($this->request->post['solo_arrow_right_voffset'] < -1000 || $this->request->post['solo_arrow_right_voffset'] > 1000) {
			$this->error['solo_arrow_right_voffset'] = $this->language->get('error_solo_arrow_right_voffset');
		}
		
		if (isset($this->request->post['slider_image'])) {
			foreach ($this->request->post['slider_image'] as $slider_image_id => $slider_image) {
				if (isset($slider_image['captions'])) {
					foreach ($slider_image['captions'] as $caption_id => $caption) {
						foreach ($caption['languages'] as $language_id => $lcaption) {
							if ((utf8_strlen($lcaption['caption']) < 1) || (utf8_strlen($lcaption['caption']) > 264)) {
								$this->error['slider_image'][$slider_image_id]['captions'][$caption_id]['languages'][$language_id] = $this->language->get('error_caption');
							}
						}
						
						if ((utf8_strlen($caption['position_x']) < 1) || (utf8_strlen($caption['position_x']) > 64)) {
							$this->error['slider_image'][$slider_image_id]['captions'][$caption_id]['position_x'] = $this->language->get('error_pos_x');
						}
						
						if ((utf8_strlen($caption['position_y']) < 1) || (utf8_strlen($caption['position_y']) > 64)) {
							$this->error['slider_image'][$slider_image_id]['captions'][$caption_id]['position_y'] = $this->language->get('error_pos_y');
						}
						
						if ((utf8_strlen($caption['speed']) < 1) || (utf8_strlen($caption['speed']) > 64)) {
							$this->error['slider_image'][$slider_image_id]['captions'][$caption_id]['speed'] = $this->language->get('speed');
						}
						
						if ((utf8_strlen($caption['start_after']) < 1) || (utf8_strlen($caption['start_after']) > 64)) {
							$this->error['slider_image'][$slider_image_id]['captions'][$caption_id]['start_after'] = $this->language->get('error_start_after');
						}
						
					}
				}
				
				foreach ($slider_image['slider_image_description'] as $language_id => $slider_image_description) {
					if ((utf8_strlen($slider_image_description['title']) < 2) || (utf8_strlen($slider_image_description['title']) > 64)) {
						$this->error['slider_image'][$slider_image_id][$language_id] = $this->language->get('error_title');
					}
				}
				
				if ((utf8_strlen($slider_image['slot']) < 1) || (utf8_strlen($slider_image['slot']) > 64)) {
						$this->error['slider_image'][$slider_image_id]['slot'] = $this->language->get('error_slot');
				}
				
				if ((utf8_strlen($slider_image['delay']) <1) || (utf8_strlen($slider_image['delay']) > 64)) {
						$this->error['slider_image'][$slider_image_id]['delay'] = $this->language->get('error_delay');
				}
			}
		}
		
		if ($this->error && !isset($this->error['warning'])) {
			$this->error['warning'] = $this->language->get('error_warning');
		}

		return !$this->error;
	}
}
