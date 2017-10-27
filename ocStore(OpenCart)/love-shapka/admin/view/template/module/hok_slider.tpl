<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
	<div class="page-header">
		<div class="container-fluid">
			<div class="pull-right">
				<button type="submit" form="form-slider" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
				<a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a>
			</div>
			<h1><?php echo $heading_title; ?></h1>
			<ul class="breadcrumb">
				<?php foreach ($breadcrumbs as $breadcrumb) { ?>
				<li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
				<?php } ?>
			</ul>
		</div>
	</div>
	<div class="container-fluid">
		<?php if ($error_warning) { ?>
		<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
			<button type="button" class="close" data-dismiss="alert">&times;</button>
		</div>
		<?php } ?>
		<div class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_form; ?></h3>
			</div>
			<div class="panel-body">
				<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-slider" class="form-horizontal">
					<ul class="nav nav-tabs">
						<li class="active"><a href="#tab-global-setting" data-toggle="tab"><?php echo $tab_global_setting; ?></a></li>
						<li><a href="#tab-navigation-setting" data-toggle="tab"><?php echo $tab_navigation_setting; ?></a></li>
						<li><a href="#tab-slider-loop-setting" data-toggle="tab"><?php echo $tab_slider_loop_setting; ?></a></li>
						<li><a href="#tab-mobile-visibility-setting" data-toggle="tab"><?php echo $tab_mobile_visibility_setting; ?></a></li>
						<li><a href="#tab-layout-style-setting" data-toggle="tab"><?php echo $tab_layout_style_setting; ?></a></li>
					</ul>
					<div class="tab-content">
						<div class="tab-pane active" id="tab-global-setting">
							<div class="form-group required">
								<label class="col-sm-2 control-label" for="input-name"><?php echo $entry_name; ?></label>
								<div class="col-sm-10">
									<input type="text" name="name" value="<?php echo $name; ?>" placeholder="<?php echo $entry_name; ?>" id="input-name" class="form-control" />
									<?php if ($error_name) { ?>
									<div class="text-danger"><?php echo $error_name; ?></div>
									<?php } ?>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label" for="input-slider-class"><span data-toggle="tooltip" title="<?php echo $help_slider_class; ?>"><?php echo $entry_slider_class; ?></span></label>
								<div class="col-sm-10">
									<input type="text" name="slider_class" value="<?php echo $slider_class; ?>" placeholder="<?php echo $entry_slider_class; ?>" id="input-slider-class" class="form-control" />
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label" for="input-slider-style"><span data-toggle="tooltip" title="<?php echo $help_slider_style; ?>"><?php echo $entry_slider_style; ?></span></label>
								<div class="col-sm-10">
									<input type="text" name="slider_style" value="<?php echo $slider_style; ?>" placeholder="<?php echo $entry_slider_style; ?>" id="input-slider-style" class="form-control" />
								</div>
							</div>
							<div class="form-group required">
								<label class="col-sm-2 control-label" for="input-delay"><span data-toggle="tooltip" title="<?php echo $help_delay; ?>"><?php echo $entry_delay; ?></span></label>
								<div class="col-sm-10">
									<input type="text" name="delay" value="<?php echo $delay; ?>" placeholder="<?php echo $entry_delay; ?>" id="input-delay" class="form-control" />
									<?php if ($error_delay) { ?>
									<div class="text-danger"><?php echo $error_delay; ?></div>
									<?php } ?>
								</div>
							</div>
							<div class="form-group required">
								<label class="col-sm-2 control-label" for="input-start-width"><span data-toggle="tooltip" title="<?php echo $help_start_width; ?>"><?php echo $entry_start_width; ?></span></label>
								<div class="col-sm-10">
									<input type="text" name="start_width" value="<?php echo $start_width; ?>" placeholder="<?php echo $entry_start_width; ?>" id="input-start-width" class="form-control" />
									<?php if ($error_start_width) { ?>
									<div class="text-danger"><?php echo $error_start_width; ?></div>
									<?php } ?>
								</div>
							</div>
							<div class="form-group required">
								<label class="col-sm-2 control-label" for="input-start-height"><span data-toggle="tooltip" title="<?php echo $help_start_height; ?>"><?php echo $entry_start_height; ?></span></label>
								<div class="col-sm-10">
									<input type="text" name="start_height" value="<?php echo $start_height; ?>" placeholder="<?php echo $entry_start_height; ?>" id="input-start-height" class="form-control" />
									<?php if ($error_start_height) { ?>
									<div class="text-danger"><?php echo $error_start_height; ?></div>
									<?php } ?>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label" for="input-shuffle"><span data-toggle="tooltip" title="<?php echo $help_shuffle; ?>"><?php echo $entry_shuffle; ?></span></label>
								<div class="col-sm-10">
									<select name="shuffle" id="input-shuffle" class="form-control">
										<?php if ($shuffle === 'on') { ?>
										<option value="on" selected="selected"><?php echo $text_on; ?></option>
										<option value="off"><?php echo $text_off; ?></option>
										<?php } else { ?>
										<option value="on"><?php echo $text_on; ?></option>
										<option value="off" selected="selected"><?php echo $text_off; ?></option>
										<?php } ?>
									</select>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label" for="input-status"><?php echo $entry_status; ?></label>
								<div class="col-sm-10">
									<select name="status" id="input-status" class="form-control">
										<?php if ($status) { ?>
										<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
										<option value="0"><?php echo $text_disabled; ?></option>
										<?php } else { ?>
										<option value="1"><?php echo $text_enabled; ?></option>
										<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
										<?php } ?>
									</select>
								</div>
							</div>
						</div>
						<div class="tab-pane" id="tab-navigation-setting">
							<div class="form-group">
								<label class="col-sm-2 control-label" for="input-hover-stop"><span data-toggle="tooltip" title="<?php echo $help_hover_stop; ?>"><?php echo $entry_hover_stop; ?></span></label>
								<div class="col-sm-10">
									<select name="hover_stop" id="input-hover-stop" class="form-control">
										<?php if ($hover_stop === 'on') { ?>
										<option value="on" selected="selected"><?php echo $text_on; ?></option>
										<option value="off"><?php echo $text_off; ?></option>
										<?php } else { ?>
										<option value="on"><?php echo $text_on; ?></option>
										<option value="off" selected="selected"><?php echo $text_off; ?></option>
										<?php } ?>
									</select>
								</div>
							</div>
							<div class="form-group required">
								<label class="col-sm-2 control-label" for="thumb-width"><span data-toggle="tooltip" title="<?php echo $help_thumb_width; ?>"><?php echo $entry_thumb_width; ?></span></label>
								<div class="col-sm-10">
									<input type="text" name="thumb_width" value="<?php echo $thumb_width; ?>" placeholder="<?php echo $entry_thumb_width; ?>" id="input-thumb-width" class="form-control" />
									<?php if ($error_thumb_width) { ?>
									<div class="text-danger"><?php echo $error_thumb_width; ?></div>
									<?php } ?>
								</div>
							</div>
							<div class="form-group required">
								<label class="col-sm-2 control-label" for="thumb-height"><span data-toggle="tooltip" title="<?php echo $help_thumb_height; ?>"><?php echo $entry_thumb_height; ?></span></label>
								<div class="col-sm-10">
									<input type="text" name="thumb_height" value="<?php echo $thumb_height; ?>" placeholder="<?php echo $entry_thumb_height; ?>" id="input-thumb-height" class="form-control" />
									<?php if ($error_thumb_height) { ?>
									<div class="text-danger"><?php echo $error_thumb_height; ?></div>
									<?php } ?>
								</div>
							</div>
							<div class="form-group required">
								<label class="col-sm-2 control-label" for="thumb-amount"><span data-toggle="tooltip" title="<?php echo $help_thumb_amount; ?>"><?php echo $entry_thumb_amount; ?></span></label>
								<div class="col-sm-10">
									<input type="text" name="thumb_amount" value="<?php echo $thumb_amount; ?>" placeholder="<?php echo $entry_thumb_amount; ?>" id="input-thumb-amount" class="form-control" />
									<?php if ($error_thumb_amount) { ?>
									<div class="text-danger"><?php echo $error_thumb_amount; ?></div>
									<?php } ?>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label" for="input-hide-thumb"><span data-toggle="tooltip" title="<?php echo $help_hide_thumb; ?>"><?php echo $entry_hide_thumb; ?></span></label>
								<div class="col-sm-10">
									<input type="text" name="hide_thumb" value="<?php echo $hide_thumb; ?>" placeholder="<?php echo $entry_hide_thumb; ?>" id="input-hide-thumb" class="form-control" />
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label" for="input-navigation-type"><span data-toggle="tooltip" title="<?php echo $help_navigation_type; ?>"><?php echo $entry_navigation_type; ?></span></label>
								<div class="col-sm-10">
									<select name="navigation_type" id="input-navigation-type" class="form-control">
										<?php if ($navigation_type) { ?>
										<option value="<?php echo $navigation_type; ?>" selected="selected"><?php echo $navigation_type; ?></option>
										<?php } ?>
										<option value="none">none</option>
										<option value="bullet">bullet</option>
										<option value="thumb">thumb</option>
										<option value="container">container</option>
										<option value="both">both</option>
									</select>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label" for="input-navigation-arrow"><span data-toggle="tooltip" title="<?php echo $help_navigation_arrow; ?>"><?php echo $entry_navigation_arrow; ?></span></label>
								<div class="col-sm-10">
									<select name="navigation_arrow" id="input-navigation-arrow" class="form-control">
										<?php if ($navigation_arrow) { ?>
										<option value="<?php echo $navigation_arrow; ?>" selected="selected"><?php echo $navigation_arrow; ?></option>
										<?php } ?>
										<option value="nexttobullets">nexttobullets</option>
										<option value="verticalcentered">verticalcentered</option>
										<option value="solo">solo</option>
										<option value="none">none</option>
									</select>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label" for="input-navigation-style"><span data-toggle="tooltip" title="<?php echo $help_navigation_style; ?>"><?php echo $entry_navigation_style; ?></span></label>
								<div class="col-sm-10">
									<select name="navigation_style" id="input-navigation-style" class="form-control">
										<?php if ($navigation_style) { ?>
										<option value="<?php echo $navigation_style; ?>" selected="selected"><?php echo $navigation_style; ?></option>
										<?php } ?>
										<option value="round">round</option>
										<option value="square">square</option>
										<option value="navbar">navbar</option>
										<option value="round-old">round-old</option>
										<option value="square-old">square-old</option>
										<option value="navbar-old">navbar-old</option>
									</select>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label" for="input-navigation-halign"><span data-toggle="tooltip" title="<?php echo $help_navigation_halign; ?>"><?php echo $entry_navigation_halign; ?></span></label>
								<div class="col-sm-10">
									<select name="navigation_halign" id="input-navigation-halign" class="form-control">
										<?php if ($navigation_halign) { ?>
										<option value="<?php echo $navigation_halign; ?>" selected="selected"><?php echo $navigation_halign; ?></option>
										<?php } ?>
										<option value="left">left</option>
										<option value="center">center</option>
										<option value="right">right</option>
									</select>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label" for="input-navigation-valign"><span data-toggle="tooltip" title="<?php echo $help_navigation_valign; ?>"><?php echo $entry_navigation_valign; ?></span></label>
								<div class="col-sm-10">
									<select name="navigation_valign" id="input-navigation-valign" class="form-control">
										<?php if ($navigation_valign) { ?>
										<option value="<?php echo $navigation_valign; ?>" selected="selected"><?php echo $navigation_valign; ?></option>
										<?php } ?>
										<option value="top">top</option>
										<option value="center">center</option>
										<option value="bottom">bottom</option>
									</select>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label" for="input-navigation-hoffset"><span data-toggle="tooltip" title="<?php echo $help_navigation_hoffset; ?>"><?php echo $entry_navigation_hoffset; ?></span></label>
								<div class="col-sm-10">
									<input type="text" name="navigation_hoffset" value="<?php echo $navigation_hoffset; ?>" placeholder="<?php echo $entry_navigation_hoffset; ?>" id="input-navigation-hoffset" class="form-control" />
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label" for="input-navigation-voffset"><span data-toggle="tooltip" title="<?php echo $help_navigation_voffset; ?>"><?php echo $entry_navigation_voffset; ?></span></label>
								<div class="col-sm-10">
									<input type="text" name="navigation_voffset" value="<?php echo $navigation_voffset; ?>" placeholder="<?php echo $entry_navigation_voffset; ?>" id="input-navigation-voffset" class="form-control" />
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label" for="input-solo-arrow-left-halign"><span data-toggle="tooltip" title="<?php echo $help_solo_arrow_left_halign; ?>"><?php echo $entry_solo_arrow_left_halign; ?></span></label>
								<div class="col-sm-10">
									<select name="solo_arrow_left_halign" id="input-solo-arrow-left-halign" class="form-control">
										<?php if ($solo_arrow_left_halign) { ?>
										<option value="<?php echo $solo_arrow_left_halign; ?>" selected="selected"><?php echo $solo_arrow_left_halign; ?></option>
										<?php } ?>
										<option value="left">left</option>
										<option value="center">center</option>
										<option value="right">right</option>
									</select>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label" for="input-solo-arrow-left-valign"><span data-toggle="tooltip" title="<?php echo $help_solo_arrow_left_valign; ?>"><?php echo $entry_solo_arrow_left_valign; ?></span></label>
								<div class="col-sm-10">
									<select name="solo_arrow_left_valign" id="input-solo-arrow-left-valign" class="form-control">
										<?php if ($solo_arrow_left_valign) { ?>
										<option value="<?php echo $solo_arrow_left_valign; ?>" selected="selected"><?php echo $solo_arrow_left_valign; ?></option>
										<?php } ?>
										<option value="top">top</option>
										<option value="center">center</option>
										<option value="bottom">bottom</option>
									</select>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label" for="input-solo-arrow-right-halign"><span data-toggle="tooltip" title="<?php echo $help_solo_arrow_right_halign; ?>"><?php echo $entry_solo_arrow_right_halign; ?></span></label>
								<div class="col-sm-10">
									<select name="solo_arrow_right_halign" id="input-solo-arrow-right-halign" class="form-control">
										<?php if ($solo_arrow_right_halign) { ?>
										<option value="<?php echo $solo_arrow_right_halign; ?>" selected="selected"><?php echo $solo_arrow_right_halign; ?></option>
										<?php } ?>
										<option value="left">left</option>
										<option value="center">center</option>
										<option value="right">right</option>
									</select>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label" for="input-solo-arrow-right-valign"><span data-toggle="tooltip" title="<?php echo $help_solo_arrow_right_valign; ?>"><?php echo $entry_solo_arrow_right_valign; ?></span></label>
								<div class="col-sm-10">
									<select name="solo_arrow_right_valign" id="input-solo-arrow-right-valign" class="form-control">
										<?php if ($solo_arrow_right_valign) { ?>
										<option value="<?php echo $solo_arrow_right_valign; ?>" selected="selected"><?php echo $solo_arrow_right_valign; ?></option>
										<?php } ?>
										<option value="top">top</option>
										<option value="center">center</option>
										<option value="bottom">bottom</option>
									</select>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label" for="input-solo-arrow-left-hoffset"><span data-toggle="tooltip" title="<?php echo $help_solo_arrow_left_hoffset; ?>"><?php echo $entry_solo_arrow_left_hoffset; ?></span></label>
								<div class="col-sm-10">
									<input type="text" name="solo_arrow_left_hoffset" value="<?php echo $solo_arrow_left_hoffset; ?>" placeholder="<?php echo $entry_solo_arrow_left_hoffset; ?>" id="input-solo-arrow-left-hoffset" class="form-control" />
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label" for="input-solo-arrow-left-voffset"><span data-toggle="tooltip" title="<?php echo $help_solo_arrow_left_voffset; ?>"><?php echo $entry_solo_arrow_left_voffset; ?></span></label>
								<div class="col-sm-10">
									<input type="text" name="solo_arrow_left_voffset" value="<?php echo $solo_arrow_left_voffset; ?>" placeholder="<?php echo $entry_solo_arrow_left_voffset; ?>" id="input-solo-arrow-left-voffset" class="form-control" />
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label" for="input-solo-arrow-right-hoffset"><span data-toggle="tooltip" title="<?php echo $help_solo_arrow_right_hoffset; ?>"><?php echo $entry_solo_arrow_right_hoffset; ?></span></label>
								<div class="col-sm-10">
									<input type="text" name="solo_arrow_right_hoffset" value="<?php echo $solo_arrow_right_hoffset; ?>" placeholder="<?php echo $entry_solo_arrow_right_hoffset; ?>" id="input-solo-arrow-right-hoffset" class="form-control" />
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label" for="input-solo-arrow-right-voffset"><span data-toggle="tooltip" title="<?php echo $help_solo_arrow_right_voffset; ?>"><?php echo $entry_solo_arrow_right_voffset; ?></span></label>
								<div class="col-sm-10">
									<input type="text" name="solo_arrow_right_voffset" value="<?php echo $solo_arrow_right_voffset; ?>" placeholder="<?php echo $entry_solo_arrow_right_voffset; ?>" id="input-solo-arrow-right-voffset" class="form-control" />
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label" for="input-touch-enabled"><span data-toggle="tooltip" title="<?php echo $help_touch_enabled; ?>"><?php echo $entry_touch_enabled; ?></span></label>
								<div class="col-sm-10">
									<select name="touch_enabled" id="input-touch-enabled" class="form-control">
										<?php if ($touch_enabled === 'on') { ?>
										<option value="on" selected="selected"><?php echo $text_on; ?></option>
										<option value="off"><?php echo $text_off; ?></option>
										<?php } else { ?>
										<option value="on"><?php echo $text_on; ?></option>
										<option value="off" selected="selected"><?php echo $text_off; ?></option>
										<?php } ?>
									</select>
								</div>
							</div>
						</div>
						<div class="tab-pane" id="tab-slider-loop-setting">
							<div class="form-group">
								<label class="col-sm-2 control-label" for="input-stop-at-slide"><span data-toggle="tooltip" title="<?php echo $help_stop_at_slide; ?>"><?php echo $entry_stop_at_slide; ?></span></label>
								<div class="col-sm-10">
									<input type="text" name="stop_at_slide" value="<?php echo $stop_at_slide; ?>" placeholder="<?php echo $entry_stop_at_slide; ?>" id="input-stop-at-slide" class="form-control" />
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label" for="input-stop-after-loops"><span data-toggle="tooltip" title="<?php echo $help_stop_after_loops; ?>"><?php echo $entry_stop_after_loops; ?></span></label>
								<div class="col-sm-10">
									<input type="text" name="stop_after_loops" value="<?php echo $stop_after_loops; ?>" placeholder="<?php echo $entry_stop_after_loops; ?>" id="input-stop-after-loops" class="form-control" />
								</div>
							</div>						
						</div>
						<div class="tab-pane" id="tab-mobile-visibility-setting">
							<div class="form-group">
								<label class="col-sm-2 control-label" for="input-hide-caption-at-limit"><span data-toggle="tooltip" title="<?php echo $help_hide_caption_at_limit; ?>"><?php echo $entry_hide_caption_at_limit; ?></span></label>
								<div class="col-sm-10">
									<input type="text" name="hide_caption_at_limit" value="<?php echo $hide_caption_at_limit; ?>" placeholder="<?php echo $entry_hide_caption_at_limit; ?>" id="input-hide-caption-at-limit" class="form-control" />
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label" for="input-hide-all-caption-at-limit"><span data-toggle="tooltip" title="<?php echo $help_hide_all_caption_at_limit; ?>"><?php echo $entry_hide_all_caption_at_limit; ?></span></label>
								<div class="col-sm-10">
									<input type="text" name="hide_all_caption_at_limit" value="<?php echo $hide_all_caption_at_limit; ?>" placeholder="<?php echo $entry_hide_all_caption_at_limit; ?>" id="input-hide-all-caption-at-limit" class="form-control" />
								</div>
							</div>	
							<div class="form-group">
								<label class="col-sm-2 control-label" for="input-hide-slider-at-limit"><span data-toggle="tooltip" title="<?php echo $help_hide_slider_at_limit; ?>"><?php echo $entry_hide_slider_at_limit; ?></span></label>
								<div class="col-sm-10">
									<input type="text" name="hide_slider_at_limit" value="<?php echo $hide_slider_at_limit; ?>" placeholder="<?php echo $entry_hide_slider_at_limit; ?>" id="input-hide-slider-at-limit" class="form-control" />
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label" for="input-hide-thumbs-on-mobile"><span data-toggle="tooltip" title="<?php echo $help_hide_thumbs_on_mobile; ?>"><?php echo $entry_hide_thumbs_on_mobile; ?></span></label>
								<div class="col-sm-10">
									<select name="hide_thumbs_on_mobile" id="input-hide-thumbs-on-mobile" class="form-control">
										<?php if ($hide_thumbs_on_mobile === 'on') { ?>
										<option value="on" selected="selected"><?php echo $text_on; ?></option>
										<option value="off"><?php echo $text_off; ?></option>
										<?php } else { ?>
										<option value="on"><?php echo $text_on; ?></option>
										<option value="off" selected="selected"><?php echo $text_off; ?></option>
										<?php } ?>
									</select>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label" for="input-hide-bullets-on-mobile"><span data-toggle="tooltip" title="<?php echo $help_hide_bullets_on_mobile; ?>"><?php echo $entry_hide_bullets_on_mobile; ?></span></label>
								<div class="col-sm-10">
									<select name="hide_bullets_on_mobile" id="input-hide-bullets-on-mobile" class="form-control">
										<?php if ($hide_bullets_on_mobile === 'on') { ?>
										<option value="on" selected="selected"><?php echo $text_on; ?></option>
										<option value="off"><?php echo $text_off; ?></option>
										<?php } else { ?>
										<option value="on"><?php echo $text_on; ?></option>
										<option value="off" selected="selected"><?php echo $text_off; ?></option>
										<?php } ?>
									</select>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label" for="input-hide-arrows-on-mobile"><span data-toggle="tooltip" title="<?php echo $help_hide_arrows_on_mobile; ?>"><?php echo $entry_hide_arrows_on_mobile; ?></span></label>
								<div class="col-sm-10">
									<select name="hide_arrows_on_mobile" id="input-hide-arrows-on-mobile" class="form-control">
										<?php if ($hide_arrows_on_mobile === 'on') { ?>
										<option value="on" selected="selected"><?php echo $text_on; ?></option>
										<option value="off"><?php echo $text_off; ?></option>
										<?php } else { ?>
										<option value="on"><?php echo $text_on; ?></option>
										<option value="off" selected="selected"><?php echo $text_off; ?></option>
										<?php } ?>
									</select>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label" for="input-hide-thumbs-under-resolution"><span data-toggle="tooltip" title="<?php echo $help_hide_thumbs_under_resolution; ?>"><?php echo $entry_hide_thumbs_under_resolution; ?></span></label>
								<div class="col-sm-10">
									<input type="text" name="hide_thumbs_under_resolution" value="<?php echo $hide_thumbs_under_resolution; ?>" placeholder="<?php echo $entry_hide_thumbs_under_resolution; ?>" id="input-hide-thumbs-under-resolution" class="form-control" />
								</div>
								<?php if ($error_hide_thumbs_under_resolution) { ?>
									<div class="text-danger"><?php echo $error_hide_thumbs_under_resolution; ?></div>
								<?php } ?>
							</div>
						</div>	
						<div class="tab-pane" id="tab-layout-style-setting">
							<div class="form-group">
								<label class="col-sm-2 control-label" for="input-full-width"><span data-toggle="tooltip" title="<?php echo $help_full_width; ?>"><?php echo $entry_full_width; ?></span></label>
								<div class="col-sm-10">
									<select name="full_width" id="input-full-width" class="form-control">
										<?php if ($full_width === 'on') { ?>
										<option value="on" selected="selected"><?php echo $text_on; ?></option>
										<option value="off"><?php echo $text_off; ?></option>
										<?php } else { ?>
										<option value="on"><?php echo $text_on; ?></option>
										<option value="off" selected="selected"><?php echo $text_off; ?></option>
										<?php } ?>
									</select>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label" for="input-auto-height"><span data-toggle="tooltip" title="<?php echo $help_auto_height; ?>"><?php echo $entry_auto_height; ?></span></label>
								<div class="col-sm-10">
									<select name="auto_height" id="input-auto-height" class="form-control">
										<?php if ($auto_height === 'on') { ?>
										<option value="on" selected="selected"><?php echo $text_on; ?></option>
										<option value="off"><?php echo $text_off; ?></option>
										<?php } else { ?>
										<option value="on"><?php echo $text_on; ?></option>
										<option value="off" selected="selected"><?php echo $text_off; ?></option>
										<?php } ?>
									</select>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label" for="input-full-screen-align-force"><span data-toggle="tooltip" title="<?php echo $help_full_screen_align_force; ?>"><?php echo $entry_full_screen_align_force; ?></span></label>
								<div class="col-sm-10">
									<select name="full_screen_align_force" id="input-full-screen-align-force" class="form-control">
										<?php if ($full_screen_align_force === 'on') { ?>
										<option value="on" selected="selected"><?php echo $text_on; ?></option>
										<option value="off"><?php echo $text_off; ?></option>
										<?php } else { ?>
										<option value="on"><?php echo $text_on; ?></option>
										<option value="off" selected="selected"><?php echo $text_off; ?></option>
										<?php } ?>
									</select>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label" for="input-force-full-width"><span data-toggle="tooltip" title="<?php echo $help_force_full_width; ?>"><?php echo $entry_force_full_width; ?></span></label>
								<div class="col-sm-10">
									<select name="force_full_width" id="input-force-full-width" class="form-control">
										<?php if ($force_full_width === 'on') { ?>
										<option value="on" selected="selected"><?php echo $text_on; ?></option>
										<option value="off"><?php echo $text_off; ?></option>
										<?php } else { ?>
										<option value="on"><?php echo $text_on; ?></option>
										<option value="off" selected="selected"><?php echo $text_off; ?></option>
										<?php } ?>
									</select>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label" for="input-full-screen"><span data-toggle="tooltip" title="<?php echo $help_full_screen; ?>"><?php echo $entry_full_screen; ?></span></label>
								<div class="col-sm-10">
									<select name="full_screen" id="input-full-screen" class="form-control">
										<?php if ($full_screen === 'on') { ?>
										<option value="on" selected="selected"><?php echo $text_on; ?></option>
										<option value="off"><?php echo $text_off; ?></option>
										<?php } else { ?>
										<option value="on"><?php echo $text_on; ?></option>
										<option value="off" selected="selected"><?php echo $text_off; ?></option>
										<?php } ?>
									</select>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label" for="input-full-screen-offset-container"><span data-toggle="tooltip" title="<?php echo $help_full_screen_offset_container; ?>"><?php echo $entry_full_screen_offset_container; ?></span></label>
								<div class="col-sm-10">
									<input type="text" name="full_screen_offset_container" value="<?php echo $full_screen_offset_container; ?>" placeholder="<?php echo $entry_full_screen_offset_container; ?>" id="input-full-screen-offset-container" class="form-control" />
								</div>
							</div>	
							<div class="form-group">
								<label class="col-sm-2 control-label" for="input-shadow"><span data-toggle="tooltip" title="<?php echo $help_shadow; ?>"><?php echo $entry_shadow; ?></span></label>
								<div class="col-sm-10">
									<select name="shadow" id="input-shadow" class="form-control">
										<?php if ($shadow) { ?>
										<option value="<?php echo $shadow; ?>" selected="selected"><?php echo $shadow; ?></option>
										<?php } ?>
										<option value="0">0</option>
										<option value="1">1</option>
										<option value="2">2</option>
										<option value="3">3</option>
									</select>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label" for="input-dotted-overlay"><span data-toggle="tooltip" title="<?php echo $help_dotted_overlay; ?>"><?php echo $entry_dotted_overlay; ?></span></label>
								<div class="col-sm-10">
									<select name="dotted_overlay" id="input-dotted-overlay" class="form-control">
										<?php if ($dotted_overlay) { ?>
										<option value="<?php echo $dotted_overlay; ?>" selected="selected"><?php echo $dotted_overlay; ?></option>
										<?php } ?>
										<option value="none">none</option>
										<option value="twoxtwo">twoxtwo</option>
										<option value="threexthree">threexthree</option>
										<option value="twoxtwowhite">twoxtwowhite</option>
										<option value="threexthreewhite">threexthreewhite</option>
									</select>
								</div>
							</div>
						</div>
					</div>		
					<table id="images" class="table table-striped table-bordered table-hover">
						<thead>
							<tr>
								<td class="text-left" style="width:30%"><?php echo $entry_slide; ?></td>
								<td class="text-left"><?php echo $entry_caption; ?></td>
								<td class="text-left" style="width:10%"><?php echo $entry_status; ?></td>
								<td class="text-right" style="width:3%"><?php echo $entry_sort_order; ?></td>
								<td style="width:1%"></td>
							</tr>
						</thead>
						<tbody>
							<?php $image_row = 0; ?>
							<?php $caption_row = array(); ?>
							<?php foreach ($slider_images as $slider_image) { ?>
							<tr id="image-row<?php echo $image_row; ?>">
								<td class="text-left">
									<div class="form-group required">
										<label class="col-sm-4 control-label"><?php echo $entry_image; ?></label>
										<div class="col-sm-8">
											<a href="" id="thumb-image<?php echo $image_row; ?>" data-toggle="image" class="img-thumbnail"><img src="<?php echo $slider_image['thumb']; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a>
											<input type="hidden" name="slider_image[<?php echo $image_row; ?>][image]" value="<?php echo $slider_image['image']; ?>" id="input-image<?php echo $image_row; ?>" />
										</div>
									</div>
									<div class="form-group required">
										<label class="col-sm-4 control-label"><?php echo $entry_title; ?></label>
										<div class="col-sm-8">
											<?php foreach ($languages as $language) { ?>
											<div class="input-group pull-left"><span class="input-group-addon"><img src="<?php echo ((version_compare(VERSION, '2.2.0.0', '<') == true) ? 'view/image/flags/' . $language['image'] : 'language/' . $language['code'] . '/' . $language['code'] . '.png'); ?>" title="<?php echo $language['name']; ?>" /></span>
												<input type="text" name="slider_image[<?php echo $image_row; ?>][slider_image_description][<?php echo $language['language_id']; ?>][title]" value="<?php echo isset($slider_image['slider_image_description'][$language['language_id']]) ? $slider_image['slider_image_description'][$language['language_id']]['title'] : ''; ?>" placeholder="<?php echo $entry_title; ?>" class="form-control" />
											</div>
											<?php if (isset($error_slider_image[$image_row][$language['language_id']])) { ?>
											<div class="text-danger"><?php echo $error_slider_image[$image_row][$language['language_id']]; ?></div>
											<?php } ?>
											<?php } ?>
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-4 control-label"><?php echo $entry_link; ?></label>
										<div class="col-sm-8">
											<input type="text" name="slider_image[<?php echo $image_row; ?>][link]" value="<?php echo $slider_image['link']; ?>" placeholder="<?php echo $entry_link; ?>" class="form-control" />
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-4 control-label"><?php echo $entry_transition; ?></label>
										<div class="col-sm-8">
											<select name="slider_image[<?php echo $image_row; ?>][transition]" id="input-transition" class="form-control">
												<?php if ($slider_image['transition']) { ?>
												<option value="<?php echo $slider_image['transition']; ?>" selected="selected"><?php echo $slider_image['transition']; ?></option>
												<?php } ?>
												<option value="random">random</option>
												<option value="fade">fade</option>
												<option value="boxslide">boxslide</option>
												<option value="boxfade">boxfade</option>
												<option value="slotzoom-horizontal">slotzoom-horizontal</option>
												<option value="slotslide-horizontal">slotslide-horizontal</option>
												<option value="slotfade-horizontal">slotfade-horizontal</option>
												<option value="slotzoom-vertical">slotzoom-vertical</option>
												<option value="slotslide-vertical">slotslide-vertical</option>
												<option value="slotfade-vertical">slotfade-vertical</option>
												<option value="curtain-1">curtain-1</option>
												<option value="curtain-2">curtain-2</option>
												<option value="curtain-3">curtain-3</option>
												<option value="slideleft">slideleft</option>
												<option value="slideright">slideright</option>
												<option value="slideup">slideup</option>
												<option value="slidedown">slidedown</option>
											</select>
										</div>
									</div>
									<div class="form-group required">
										<label class="col-sm-4 control-label" ><?php echo $text_slot; ?></label>
										<div class="col-sm-8">
											<input type="text" name="slider_image[<?php echo $image_row; ?>][slot]" value="<?php echo $slider_image['slot']; ?>" placeholder="<?php echo $entry_slot; ?>" class="form-control" />
											<?php if (isset($error_slider_image[$image_row]['slot'])) { ?>
											<div class="text-danger"><?php echo $error_slider_image[$image_row]['slot']; ?></div>
											<?php } ?>
										</div>
									</div>
									<div class="form-group required">
										<label class="col-sm-4 control-label" ><?php echo $entry_masterspeed; ?></label>
										<div class="col-sm-8">
											<input type="text" name="slider_image[<?php echo $image_row; ?>][masterspeed]" value="<?php echo $slider_image['masterspeed']; ?>" placeholder="<?php echo $entry_masterspeed; ?>" class="form-control" />
										</div>
									</div>
									<div class="form-group required">
										<label class="col-sm-4 control-label" ><?php echo $text_delay; ?></label>
										<div class="col-sm-8">
											<input type="text" name="slider_image[<?php echo $image_row; ?>][delay]" value="<?php echo $slider_image['delay']; ?>" placeholder="<?php echo $entry_delay; ?>" class="form-control" />
											<?php if (isset($error_slider_image[$image_row]['delay'])) { ?>
											<div class="text-danger"><?php echo $error_slider_image[$image_row]['delay']; ?></div>
											<?php } ?>
										</div>
									</div>
								</td>
								<td class="text-left" id="caption-row<?php echo $image_row; ?>">
									<?php $caption_row[$image_row] = 0; ?>
									<div class="row">
										<div class="col-sm-3">
											<ul class="nav nav-pills nav-stacked" id="caption">
												<?php for($row = 0; $row < count($slider_image['captions']); $row++) { ?>
												<li class="<?php echo (($row == 0)?'active':'');?>"><a href="#tab-caption<?php echo $image_row.'-'.$row; ?>" data-toggle="tab"><i class="fa fa-minus-circle" onclick="$('#caption a:first').tab('show'); $('#caption a[href=\'#tab-caption<?php echo $image_row.'-'.$row; ?>\']').parent().remove(); $('#tab-caption<?php echo $image_row.'-'.$row; ?>').remove();"></i> <?php echo $tab_caption . ' ' . ($row+1); ?></a></li>
												<?php } ?>
												<li id="caption-add<?php echo $image_row; ?>"><a onclick="addCaption(<?php echo $image_row; ?>);"><i class="fa fa-plus-circle"></i> <?php echo $button_caption; ?></a></li>
											</ul>
										</div>
										<div class="col-sm-9">
											<div class="tab-content">
												<?php foreach ($slider_image['captions'] as $caption_id => $caption) { ?>
												<div class="tab-pane <?php echo (($caption_row[$image_row] == 0)?'active':'');?>" id="tab-caption<?php echo $image_row.'-'.$caption_row[$image_row];?>">
													<div class="form-group">
														<label class="col-sm-2 control-label"><?php echo $entry_caption; ?></label>
														<div class="col-sm-10">
															<?php foreach ($languages as $language) { ?>
															<div class="input-group pull-left"><span class="input-group-addon"><img src="<?php echo ((version_compare(VERSION, '2.2.0.0', '<') == true) ? 'view/image/flags/' . $language['image'] : 'language/' . $language['code'] . '/' . $language['code'] . '.png'); ?>" title="<?php echo $language['name']; ?>" /></span>
																<input type="text" name="slider_image[<?php echo $image_row; ?>][captions][<?php echo $caption_row[$image_row]; ?>][languages][<?php echo $language['language_id']; ?>][caption]" value="<?php echo isset($caption['languages'][$language['language_id']]) ? $caption['languages'][$language['language_id']]['caption'] : ''; ?>" placeholder="<?php echo $entry_caption; ?>" class="form-control" />
															</div>
															<?php if (isset($error_slider_image[$image_row]['captions'][$caption_id]['languages'][$language['language_id']])) { ?>
															<div class="text-danger"><?php echo $error_slider_image[$image_row]['captions'][$caption_id]['languages'][$language['language_id']]; ?></div>
															<?php } ?>
															<?php } ?>
														</div>
													</div>
													<div class="form-group">
														<label class="col-sm-2 control-label" for="input-customer-group"><?php echo $entry_color_class; ?></label>
														<div class="col-sm-10">
															<select name="slider_image[<?php echo $image_row; ?>][captions][<?php echo $caption_row[$image_row]; ?>][color_class]" class="form-control">
																<?php if (isset($caption['color_class'])) { ?>
																<option value="<?php echo $caption['color_class']; ?>" selected="selected"><?php echo $caption['color_class']; ?></option>
																<?php } ?>
																<option value="very_large_black_text">very_large_black_text</option>
																<option value="very_large_text">very_large_text</option>
																<option value="large_black_text">large_black_text</option>
																<option value="large_text">large_text</option>
																<option value="big_great">big_great</option>
																<option value="big_great_white">big_great_white</option>
																<option value="big_white">big_white</option>
																<option value="big_black">big_black</option>
																<option value="big_red">big_red</option>
																<option value="big_purple">big_purple</option>
																<option value="big_grey">big_grey</option>
																<option value="medium_white">medium_white</option>
																<option value="medium_black">medium_black</option>
																<option value="medium_red">medium_red</option>
																<option value="medium_purple">medium_purple</option>
																<option value="medium_grey">medium_grey</option>
																<option value="medium_text">medium_text</option>
																<option value="medium_roboto_white">medium_roboto_white</option>
																<option value="small_white">small_white</option>
																<option value="small_black">small_black</option>
																<option value="small_red">small_red</option>
																<option value="small_purple">small_purple</option>
																<option value="small_grey">small_grey</option>
																<option value="small_text">small_text</option>
																<option value="Hind_very_big_white">Hind_very_big_white</option>
																<option value="Hind_big_white">Hind_big_white</option>
																<option value="Hind_small_white">Hind_small_white</option>
																<option value="hr_line_purple">hr_line_purple</option>
																<option value="bold_brown_text">bold_brown_text</option>
																<option value="bold_red_text">bold_red_text</option>
																<option value="bold_green_text">bold_green_text</option>
																<option value="cus_color">cus_color</option>
																<option value="cus_black">cus_black</option>
																<option value="btn-links">btn-links</option>
															</select>
														</div>
													</div>
													<div class="form-group">
														<label class="col-sm-2 control-label" for="input-customer-group"><?php echo $entry_animation_class; ?></label>
														<div class="col-sm-10">
															<select name="slider_image[<?php echo $image_row; ?>][captions][<?php echo $caption_row[$image_row]; ?>][animation_class]" class="form-control">
																<?php if (isset($caption['animation_class'])) { ?>
																<option value="<?php echo $caption['animation_class']; ?>" selected="selected"><?php echo str_replace(array('l','r','t','b','sf','lf'),array(' Left',' Right',' Top',' Bottom','Short From','Long From'),$caption['animation_class']); ?></option>
																<?php } ?>
																<option value="sft">Short From Top</option>
																<option value="sfb">Short From Bottom</option>
																<option value="sfr">Short From Right</option>
																<option value="sfl">Short From Left</option>
																<option value="lft">Long From Top</option>
																<option value="lfb">Long From Bottom</option>
																<option value="lfr">Long From Right</option>
																<option value="lfl">Long From Left</option>
															</select>
														</div>
													</div>
													<div class="form-group">
														<label class="col-sm-2 control-label" for="input-customer-group"><?php echo $entry_custom_style; ?></label>
														<div class="col-sm-10">
															<input type="text" name="slider_image[<?php echo $image_row; ?>][captions][<?php echo $caption_row[$image_row]; ?>][custom_style]" value="<?php echo isset($caption['custom_style']) ? $caption['custom_style'] : ''; ?>" placeholder="<?php echo $entry_custom_style; ?>" class="form-control" />
														</div>
													</div>
													<div class="form-group">
														<label class="col-sm-2 control-label" for="input-customer-group"><?php echo $entry_caption_class; ?></label>
														<div class="col-sm-10">
															<input type="text" name="slider_image[<?php echo $image_row; ?>][captions][<?php echo $caption_row[$image_row]; ?>][caption_class]" value="<?php echo isset($caption['caption_class']) ? $caption['caption_class'] : ''; ?>" placeholder="<?php echo $entry_caption_class; ?>" class="form-control" />
														</div>
													</div>
													<div class="form-group">
														<label class="col-sm-2 control-label" for="input-customer-group"><?php echo $entry_pos_x; ?></label>
														<div class="col-sm-10">
															<input type="text" name="slider_image[<?php echo $image_row; ?>][captions][<?php echo $caption_row[$image_row]; ?>][position_x]" value="<?php echo isset($caption['position_x']) ? $caption['position_x'] : ''; ?>" placeholder="<?php echo $entry_pos_x; ?>" class="form-control" />
															<?php if (isset($error_slider_image[$image_row]['captions'][$caption_id]['position_x'])) { ?>
															<div class="text-danger"><?php echo $error_slider_image[$image_row]['captions'][$caption_id]['position_x']; ?></div>
															<?php } ?>
														</div>
													</div>
													<div class="form-group">
														<label class="col-sm-2 control-label" for="input-customer-group"><?php echo $entry_pos_y; ?></label>
														<div class="col-sm-10">
															<input type="text" name="slider_image[<?php echo $image_row; ?>][captions][<?php echo $caption_row[$image_row]; ?>][position_y]" value="<?php echo isset($caption['position_y']) ? $caption['position_y'] : ''; ?>" placeholder="<?php echo $entry_pos_y; ?>" class="form-control" />
															<?php if (isset($error_slider_image[$image_row]['captions'][$caption_id]['position_y'])) { ?>
															<div class="text-danger"><?php echo $error_slider_image[$image_row]['captions'][$caption_id]['position_y']; ?></div>
															<?php } ?>
														</div>
													</div>
													<div class="form-group">
														<label class="col-sm-2 control-label" for="input-customer-group"><?php echo $entry_speed; ?></label>
														<div class="col-sm-10">
															<input type="text" name="slider_image[<?php echo $image_row; ?>][captions][<?php echo $caption_row[$image_row]; ?>][speed]" value="<?php echo isset($caption['speed']) ? $caption['speed'] : ''; ?>" placeholder="<?php echo $entry_speed; ?>" class="form-control" />
															<?php if (isset($error_slider_image[$image_row]['captions'][$caption_id]['speed'])) { ?>
															<div class="text-danger"><?php echo $error_slider_image[$image_row]['captions'][$caption_id]['speed']; ?></div>
															<?php } ?>
														</div>
													</div>
													<div class="form-group">
														<label class="col-sm-2 control-label" for="input-customer-group"><?php echo $entry_start_after; ?></label>
														<div class="col-sm-10">
															<input type="text" name="slider_image[<?php echo $image_row; ?>][captions][<?php echo $caption_row[$image_row]; ?>][start_after]" value="<?php echo isset($caption['start_after']) ? $caption['start_after'] : ''; ?>" placeholder="<?php echo $entry_start_after; ?>" class="form-control" />
															<?php if (isset($error_slider_image[$image_row]['captions'][$caption_id]['start_after'])) { ?>
															<div class="text-danger"><?php echo $error_slider_image[$image_row]['captions'][$caption_id]['start_after']; ?></div>
															<?php } ?>
														</div>
													</div>
													<div class="form-group">
														<label class="col-sm-2 control-label" for="input-customer-group"><?php echo $entry_easing; ?></label>
														<div class="col-sm-10">
															<select name="slider_image[<?php echo $image_row; ?>][captions][<?php echo $caption_row[$image_row]; ?>][easing]" class="form-control">
																<?php if (isset($caption['easing'])) { ?>
																<option value="<?php echo $caption['easing']; ?>" selected="selected"><?php echo $caption['easing']; ?></option>
																<?php } ?>
																<option value="easeOutBack">easeOutBack</option>
																<option value="easeInQuad">easeInQuad</option>
																<option value="easeOutQuad">easeOutQuad</option>
																<option value="easeInOutQuad">easeInOutQuad</option>
																<option value="easeInCubic">easeInCubic</option>
																<option value="easeOutCubic">easeOutCubic</option>
																<option value="easeInOutCubic">easeInOutCubic</option>
																<option value="easeInQuart">easeInQuart</option>
																<option value="easeOutQuart">easeOutQuart</option>
																<option value="easeInOutQuart">easeInOutQuart</option>
																<option value="easeInQuint">easeInQuint</option>
																<option value="easeOutQuint">easeOutQuint</option>
																<option value="easeInOutQuint">easeInOutQuint</option>
																<option value="easeInSine">easeInSine</option>
																<option value="easeOutSine">easeOutSine</option>
																<option value="easeInOutSine">easeInOutSine</option>
																<option value="easeInExpo">easeInExpo</option>
																<option value="easeInOutExpo">easeInOutExpo</option>
																<option value="easeInCirc">easeInCirc</option>
																<option value="easeOutCirc">easeOutCirc</option>
																<option value="easeInOutCirc">easeInOutCirc</option>
																<option value="easeInElastic">easeInElastic</option>
																<option value="easeOutElastic">easeOutElastic</option>
																<option value="easeInOutElastic">easeInOutElastic</option>
																<option value="easeInBack">easeInBack</option>
																<option value="easeOutBack">easeOutBack</option>
																<option value="easeInOutBack">easeInOutBack</option>
																<option value="easeInBounce">easeInBounce</option>
																<option value="easeOutBounce">easeOutBounce</option>
																<option value="easeInOutBounce">easeInOutBounce</option>
															</select>
														</div>
													</div>
													<div class="form-group">
														<label class="col-sm-2 control-label" for="input-customer-group"><?php echo $entry_end_easing; ?></label>
														<div class="col-sm-10">
															<select name="slider_image[<?php echo $image_row; ?>][captions][<?php echo $caption_row[$image_row]; ?>][end_easing]" class="form-control">
																<?php if (isset($caption['end_easing'])) { ?>
																<option value="<?php echo $caption['end_easing']; ?>" selected="selected"><?php echo $caption['end_easing']; ?></option>
																<?php } ?>
																<option value="easeOutBack">easeOutBack</option>
																<option value="easeInQuad">easeInQuad</option>
																<option value="easeOutQuad">easeOutQuad</option>
																<option value="easeInOutQuad">easeInOutQuad</option>
																<option value="easeInCubic">easeInCubic</option>
																<option value="easeOutCubic">easeOutCubic</option>
																<option value="easeInOutCubic">easeInOutCubic</option>
																<option value="easeInQuart">easeInQuart</option>
																<option value="easeOutQuart">easeOutQuart</option>
																<option value="easeInOutQuart">easeInOutQuart</option>
																<option value="easeInQuint">easeInQuint</option>
																<option value="easeOutQuint">easeOutQuint</option>
																<option value="easeInOutQuint">easeInOutQuint</option>
																<option value="easeInSine">easeInSine</option>
																<option value="easeOutSine">easeOutSine</option>
																<option value="easeInOutSine">easeInOutSine</option>
																<option value="easeInExpo">easeInExpo</option>
																<option value="easeInOutExpo">easeInOutExpo</option>
																<option value="easeInCirc">easeInCirc</option>
																<option value="easeOutCirc">easeOutCirc</option>
																<option value="easeInOutCirc">easeInOutCirc</option>
																<option value="easeInElastic">easeInElastic</option>
																<option value="easeOutElastic">easeOutElastic</option>
																<option value="easeInOutElastic">easeInOutElastic</option>
																<option value="easeInBack">easeInBack</option>
																<option value="easeOutBack">easeOutBack</option>
																<option value="easeInOutBack">easeInOutBack</option>
																<option value="easeInBounce">easeInBounce</option>
																<option value="easeOutBounce">easeOutBounce</option>
																<option value="easeInOutBounce">easeInOutBounce</option>
															</select>
														</div>
													</div>
												</div>												
												<?php $caption_row[$image_row]++; ?>
												<?php } ?>
											</div>
										</div>	
									</div>
								</td>
								<td class="text-right">
									<select name="slider_image[<?php echo $image_row; ?>][status]" class="form-control">
										<?php if ($slider_image['status']) { ?>
										<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
										<option value="0"><?php echo $text_disabled; ?></option>
										<?php } else { ?>
										<option value="1"><?php echo $text_enabled; ?></option>
										<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
										<?php } ?>
									</select>
								</td>
								<td class="text-right"><input type="text" name="slider_image[<?php echo $image_row; ?>][sort_order]" value="<?php echo $slider_image['sort_order']; ?>" placeholder="<?php echo $entry_sort_order; ?>" class="form-control" /></td>
								<td class="text-left"><button type="button" onclick="$('#image-row<?php echo $image_row; ?>, .tooltip').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>
							</tr>
							<?php $image_row++; ?>
							<?php } ?>
						</tbody>
						<tfoot>
							<tr>
								<td colspan="4"></td>
								<td class="text-left"><button type="button" onclick="addImage();" data-toggle="tooltip" title="<?php echo $button_slider_add; ?>" class="btn btn-primary"><i class="fa fa-plus-circle"></i></button></td>
							</tr>
						</tfoot>
					</table>
				</form>
			</div>
		</div>
	</div>
<script type="text/javascript">
var image_row = <?php echo $image_row; ?>;
var caption_row = <?php echo json_encode($caption_row); ?>;

function addCaption(image_row) {
	image_row = parseInt(image_row);
	if (typeof caption_row[image_row] ==='undefined') {
		caption_row[image_row] = 0;
	}
	html = '<div class="tab-pane" id="tab-caption'+ image_row + '-' + caption_row[image_row] +'">';
	html += '	<div class="form-group">';
	html += '		<label class="col-sm-2 control-label"><?php echo $entry_caption; ?></label>';
	html += '		<div class="col-sm-10">';
	<?php foreach ($languages as $language) { ?>
	html += '			<div class="input-group pull-left"><span class="input-group-addon"><img src="<?php echo ((version_compare(VERSION, '2.2.0.0', '<') == true) ? 'view/image/flags/' . $language['image'] : 'language/' . $language['code'] . '/' . $language['code'] . '.png'); ?>" title="<?php echo $language['name']; ?>" /></span>';
	html += '				<input type="text" name="slider_image[' + image_row + '][captions][' + caption_row[image_row] + '][languages][<?php echo $language['language_id']; ?>][caption]" value="" placeholder="<?php echo $entry_caption; ?>" class="form-control" />';
	html += '			</div>';
	<?php } ?>
	html += '		</div>';
	html += '	</div>';
	html += '	<div class="form-group">';
	html += '		<label class="col-sm-2 control-label"><?php echo $entry_color_class; ?></label>';
	html += '		<div class="col-sm-10">';
	html += '			<select name="slider_image[' + image_row + '][captions][' + caption_row[image_row] + '][color_class]" class="form-control">';
	html += '				<option value="very_large_black_text">very_large_black_text</option>';
	html += '				<option value="very_large_text">very_large_text</option>';
	html += '				<option value="large_black_text">large_black_text</option>';
	html += '				<option value="large_text">large_text</option>';
	html += '				<option value="big_great">big_great</option>';
	html += '				<option value="big_great_white">big_great_white</option>';
	html += '				<option value="big_white">big_white</option>';
	html += '				<option value="big_black">big_black</option>';
	html += '				<option value="big_red">big_red</option>';
	html += '				<option value="big_purple">big_purple</option>';
	html += '				<option value="big_grey">big_grey</option>';
	html += '				<option value="medium_white">medium_white</option>';
	html += '				<option value="medium_black">medium_black</option>';
	html += '				<option value="medium_red">medium_red</option>';
	html += '				<option value="medium_purple">medium_purple</option>';
	html += '				<option value="medium_grey">medium_grey</option>';
	html += '				<option value="medium_text">medium_text</option>';
	html += '				<option value="medium_roboto_white">medium_roboto_white</option>';
	html += '				<option value="small_white">small_white</option>';
	html += '				<option value="small_black">small_black</option>';
	html += '				<option value="small_red">small_red</option>';
	html += '				<option value="small_purple">small_purple</option>';
	html += '				<option value="small_grey">small_grey</option>';
	html += '				<option value="small_text">small_text</option>';
	html += '				<option value="Hind_very_big_white">Hind_very_big_white</option>';
	html += '				<option value="Hind_big_white">Hind_big_white</option>';
	html += '				<option value="Hind_small_white">Hind_small_white</option>';
	html += '				<option value="hr_line_purple">hr_line_purple</option>';
	html += '				<option value="bold_brown_text">bold_brown_text</option>';
	html += '				<option value="bold_red_text">bold_red_text</option>';
	html += '				<option value="bold_green_text">bold_green_text</option>';
	html += '				<option value="cus_color">cus_color</option>';
	html += '				<option value="cus_black">cus_black</option>';
	html += '				<option value="btn-links">btn-links</option>';
	html += '			</select>';	
	html += '		</div>';
	html += '	</div>';
	html += '	<div class="form-group">';
	html += '		<label class="col-sm-2 control-label"><?php echo $entry_animation_class; ?></label>';
	html += '		<div class="col-sm-10">';
	html += '			<select name="slider_image[' + image_row + '][captions][' + caption_row[image_row] + '][animation_class]" class="form-control">';
	html += '				<option value="sft">Short From Top</option>';
	html += '				<option value="sfb">Short From Bottom</option>';
	html += '				<option value="sfr">Short From Right</option>';
	html += '				<option value="sfl">Short From Left</option>';
	html += '				<option value="lft">Long From Top</option>';
	html += '				<option value="lfb">Long From Bottom</option>';
	html += '				<option value="lfr">Long From Right</option>';
	html += '				<option value="lfl">Long From Left</option>';
	html += '			</select>';
	html += '		</div>';
	html += '	</div>';
	html += '	<div class="form-group">';
	html += '		<label class="col-sm-2 control-label"><?php echo $entry_custom_style; ?></label>';
	html += '		<div class="col-sm-10">';
	html += '			<input type="text" name="slider_image[' + image_row + '][captions][' + caption_row[image_row] + '][custom_style]" value="" placeholder="<?php echo $entry_custom_style; ?>" class="form-control" />';
	html += '		</div>';
	html += '	</div>';
	html += '	<div class="form-group">';
	html += '		<label class="col-sm-2 control-label"><?php echo $entry_caption_class; ?></label>';
	html += '		<div class="col-sm-10">';
	html += '			<input type="text" name="slider_image[' + image_row + '][captions][' + caption_row[image_row] + '][caption_class]" value="" placeholder="<?php echo $entry_caption_class; ?>" class="form-control" />';
	html += '		</div>';
	html += '	</div>';
	html += '	<div class="form-group">';
	html += '		<label class="col-sm-2 control-label"><?php echo $entry_pos_x; ?></label>';
	html += '		<div class="col-sm-10">';
	html += '			<input type="text" name="slider_image[' + image_row + '][captions][' + caption_row[image_row] + '][position_x]" value="" placeholder="<?php echo $entry_pos_x; ?>" class="form-control" />';
	html += '		</div>';
	html += '	</div>';
	html += '	<div class="form-group">';
	html += '		<label class="col-sm-2 control-label"><?php echo $entry_pos_y; ?></label>';
	html += '		<div class="col-sm-10">';
	html += '			<input type="text" name="slider_image[' + image_row + '][captions][' + caption_row[image_row] + '][position_y]" value="" placeholder="<?php echo $entry_pos_y; ?>" class="form-control" />';
	html += '		</div>';
	html += '	</div>';
	html += '	<div class="form-group">';
	html += '		<label class="col-sm-2 control-label"><?php echo $entry_speed; ?></label>';
	html += '		<div class="col-sm-10">';
	html += '			<input type="text" name="slider_image[' + image_row + '][captions][' + caption_row[image_row] + '][speed]" value="" placeholder="<?php echo $entry_speed; ?>" class="form-control" />';
	html += '		</div>';
	html += '	</div>';
	html += '	<div class="form-group">';
	html += '		<label class="col-sm-2 control-label"><?php echo $entry_start_after; ?></label>';
	html += '		<div class="col-sm-10">';
	html += '			<input type="text" name="slider_image[' + image_row + '][captions][' + caption_row[image_row] + '][start_after]" value="" placeholder="<?php echo $entry_start_after; ?>" class="form-control" />';
	html += '		</div>';
	html += '	</div>';
	html += '	<div class="form-group">';
	html += '		<label class="col-sm-2 control-label"><?php echo $entry_easing; ?></label>';
	html += '		<div class="col-sm-10">';
	html += '			<select name="slider_image[' + image_row + '][captions][' + caption_row[image_row] + '][easing]" class="form-control">';
	html += '				<option value="easeOutBack">easeOutBack</option>';
	html += '				<option value="easeInQuad">easeInQuad</option>';
	html += '				<option value="easeOutQuad">easeOutQuad</option>';
	html += '				<option value="easeInOutQuad">easeInOutQuad</option>';
	html += '				<option value="easeInCubic">easeInCubic</option>';
	html += '				<option value="easeOutCubic">easeOutCubic</option>';
	html += '				<option value="easeInOutCubic">easeInOutCubic</option>';
	html += '				<option value="easeInQuart">easeInQuart</option>';
	html += '				<option value="easeOutQuart">easeOutQuart</option>';
	html += '				<option value="easeInOutQuart">easeInOutQuart</option>';
	html += '				<option value="easeInQuint">easeInQuint</option>';
	html += '				<option value="easeOutQuint">easeOutQuint</option>';
	html += '				<option value="easeInOutQuint">easeInOutQuint</option>';
	html += '				<option value="easeInSine">easeInSine</option>';
	html += '				<option value="easeOutSine">easeOutSine</option>';
	html += '				<option value="easeInOutSine">easeInOutSine</option>';
	html += '				<option value="easeInExpo">easeInExpo</option>';
	html += '				<option value="easeInOutExpo">easeInOutExpo</option>';
	html += '				<option value="easeInCirc">easeInCirc</option>';
	html += '				<option value="easeOutCirc">easeOutCirc</option>';
	html += '				<option value="easeInOutCirc">easeInOutCirc</option>';
	html += '				<option value="easeInElastic">easeInElastic</option>';
	html += '				<option value="easeOutElastic">easeOutElastic</option>';
	html += '				<option value="easeInOutElastic">easeInOutElastic</option>';
	html += '				<option value="easeInBack">easeInBack</option>';
	html += '				<option value="easeOutBack">easeOutBack</option>';
	html += '				<option value="easeInOutBack">easeInOutBack</option>';
	html += '				<option value="easeInBounce">easeInBounce</option>';
	html += '				<option value="easeOutBounce">easeOutBounce</option>';
	html += '				<option value="easeInOutBounce">easeInOutBounce</option>';
	html += '			</select>';
	html += '		</div>';
	html += '	</div>';
	html += '	<div class="form-group">';
	html += '		<label class="col-sm-2 control-label"><?php echo $entry_end_easing; ?></label>';
	html += '		<div class="col-sm-10">';
	html += '			<select name="slider_image[' + image_row + '][captions][' + caption_row[image_row] + '][end_easing]" class="form-control">';
	html += '				<option value="easeOutBack">easeOutBack</option>';
	html += '				<option value="easeInQuad">easeInQuad</option>';
	html += '				<option value="easeOutQuad">easeOutQuad</option>';
	html += '				<option value="easeInOutQuad">easeInOutQuad</option>';
	html += '				<option value="easeInCubic">easeInCubic</option>';
	html += '				<option value="easeOutCubic">easeOutCubic</option>';
	html += '				<option value="easeInOutCubic">easeInOutCubic</option>';
	html += '				<option value="easeInQuart">easeInQuart</option>';
	html += '				<option value="easeOutQuart">easeOutQuart</option>';
	html += '				<option value="easeInOutQuart">easeInOutQuart</option>';
	html += '				<option value="easeInQuint">easeInQuint</option>';
	html += '				<option value="easeOutQuint">easeOutQuint</option>';
	html += '				<option value="easeInOutQuint">easeInOutQuint</option>';
	html += '				<option value="easeInSine">easeInSine</option>';
	html += '				<option value="easeOutSine">easeOutSine</option>';
	html += '				<option value="easeInOutSine">easeInOutSine</option>';
	html += '				<option value="easeInExpo">easeInExpo</option>';
	html += '				<option value="easeInOutExpo">easeInOutExpo</option>';
	html += '				<option value="easeInCirc">easeInCirc</option>';
	html += '				<option value="easeOutCirc">easeOutCirc</option>';
	html += '				<option value="easeInOutCirc">easeInOutCirc</option>';
	html += '				<option value="easeInElastic">easeInElastic</option>';
	html += '				<option value="easeOutElastic">easeOutElastic</option>';
	html += '				<option value="easeInOutElastic">easeInOutElastic</option>';
	html += '				<option value="easeInBack">easeInBack</option>';
	html += '				<option value="easeOutBack">easeOutBack</option>';
	html += '				<option value="easeInOutBack">easeInOutBack</option>';
	html += '				<option value="easeInBounce">easeInBounce</option>';
	html += '				<option value="easeOutBounce">easeOutBounce</option>';
	html += '				<option value="easeInOutBounce">easeInOutBounce</option>';
	html += '			</select>';
	html += '		</div>';
	html += '	</div>';
	html += '</div>';
	
	$('#caption-row'+ image_row +' .tab-content').append(html);
	$('#caption-add'+ image_row).before('<li><a href="#tab-caption' + image_row + '-' + caption_row[image_row] + '" data-toggle="tab"><i class="fa fa-minus-circle" onclick="$(\'#caption a:first\').tab(\'show\'); $(\'a[href=\\\'#tab-caption' + image_row + '-' + caption_row[image_row] + '\\\']\').parent().remove(); $(\'#tab-caption' + image_row + '-' + caption_row[image_row] + '\').remove();"></i> <?php echo $tab_caption; ?> ' + (caption_row[image_row]+1) + '</a></li>');
	$('#caption a[href=\'#tab-caption' + image_row + '-' + caption_row[image_row] + '\']').tab('show');
	
	caption_row[image_row]++;
}
function addImage() {
	html  = '<tr id="image-row' + image_row + '">';
    html += '	<td class="text-left">';
	html += '		<div class="form-group required">';
	html += '			<label class="col-sm-4 control-label"><?php echo $entry_image; ?></label>';
	html += '			<div class="col-sm-8">';
	html += '				<a href="" id="thumb-image' + image_row + '" data-toggle="image" class="img-thumbnail"><img src="<?php echo $placeholder; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a><input type="hidden" name="slider_image[' + image_row + '][image]" value="" id="input-image' + image_row + '" />';
	html += '			</div>';
	html += '		</div>';
	html += '		<div class="form-group required">';
	html += '			<label class="col-sm-4 control-label"><?php echo $entry_title; ?></label>';
	html += '			<div class="col-sm-8">';
	<?php foreach ($languages as $language) { ?>
	html += '    			<div class="input-group">';
	html += '      				<span class="input-group-addon"><img src="<?php echo ((version_compare(VERSION, '2.2.0.0', '<') == true) ? 'view/image/flags/' . $language['image'] : 'language/' . $language['code'] . '/' . $language['code'] . '.png'); ?>" title="<?php echo $language['name']; ?>" /></span><input type="text" name="slider_image[' + image_row + '][slider_image_description][<?php echo $language['language_id']; ?>][title]" value="" placeholder="<?php echo $entry_title; ?>" class="form-control" />';
    html += '    			</div>';
	<?php } ?>
	html += '			</div>';
	html += '		</div>';
	html += '		<div class="form-group">';
	html += '			<label class="col-sm-4 control-label"><?php echo $entry_link; ?></label>';
	html += '			<div class="col-sm-8">';
	html += '				<input type="text" name="slider_image[' + image_row + '][link]" value="" placeholder="<?php echo $entry_link; ?>" class="form-control" />';
	html += '			</div>';
	html += '		</div>';
	html += '		<div class="form-group">';
	html += '			<label class="col-sm-4 control-label"><?php echo $entry_transition; ?></label>';
	html += '			<div class="col-sm-8">';
	html += '   			<select name="slider_image[' + image_row + '][transition]" id="input-transition" class="form-control">';
	html += '	  				<option value="random" selected="selected">random</option>';
	html += '	  				<option value="fade">fade</option>';
	html += '	 			 	<option value="boxslide">boxslide</option>';
	html += '	  				<option value="boxfade">boxfade</option>';
	html += '	  				<option value="slotzoom-horizontal">slotzoom-horizontal</option>';
	html +=	'	  				<option value="slotslide-horizontal">slotslide-horizontal</option>';
	html += '	  				<option value="slotfade-horizontal">slotfade-horizontal</option>';
	html += '	  				<option value="slotzoom-vertical">slotzoom-vertical</option>';
	html += '	  				<option value="slotslide-vertical">slotslide-vertical</option>';
	html += '	  				<option value="slotfade-vertical">slotfade-vertical</option>';
	html += '	  				<option value="curtain-1">curtain-1</option>';
	html += '	  				<option value="curtain-2">curtain-2</option>';
	html += '	  				<option value="curtain-3">curtain-3</option>';
	html += '	  				<option value="slideleft">slideleft</option>';
	html += '	  				<option value="slideright">slideright</option>';
	html += '	  				<option value="slideup">slideup</option>';
	html += '	  				<option value="slidedown">slidedown</option>';
	html += '				</select>';
	html += '			</div>';
	html += '		</div>';
	html += '		<div class="form-group required">';
	html += '			<label class="col-sm-4 control-label" ><?php echo $text_slot; ?></label>';
	html += '			<div class="col-sm-8">';
	html += '				<input type="text" name="slider_image[' + image_row + '][slot]" value="" placeholder="<?php echo $entry_slot; ?>" class="form-control" />';
	html += '			</div>';
	html += '		</div>';
	html += '		<div class="form-group required">';
	html += '			<label class="col-sm-4 control-label" ><?php echo $entry_masterspeed; ?></label>';
	html += '			<div class="col-sm-8">';
	html += '				<input type="text" name="slider_image[' + image_row + '][masterspeed]" value="300" placeholder="<?php echo $entry_masterspeed; ?>" class="form-control" />';
	html += '			</div>';
	html += '		</div>';	
	html += '		<div class="form-group required">';
	html += '			<label class="col-sm-4 control-label" ><?php echo $text_delay; ?></label>';
	html += '			<div class="col-sm-8">';
	html += '				<input type="text" name="slider_image[' + image_row + '][delay]" value="9000" placeholder="<?php echo $entry_delay; ?>" class="form-control" />';
	html += '			</div>';
	html += '		</div>';
	html += '	</td>';
	html += '  	<td class="text-left" id="caption-row' + image_row + '">';
	html += '		<div class="row">';
	html += '			<div class="col-sm-3">';
	html += '				<ul class="nav nav-pills nav-stacked" id="caption">';
	html += '					<li id="caption-add' + image_row + '"><a onclick="addCaption(' + image_row + ');"><i class="fa fa-plus-circle"></i> <?php echo $button_caption; ?></a></li>';
	html += '				</ul>';
	html += '			</div>';
	html += '			<div class="col-sm-9">';
	html += '				<div class="tab-content">';
	html += '				</div>';
	html += '			</div>';
	html += '		</div>';
	html += '  	</td>';
	html += '  	<td class="text-right">';
	html += '		<select name="slider_image[' + image_row + '][status]" class="form-control">';
	html += '			<option value="1"><?php echo $text_enabled; ?></option>';
	html += '			<option value="0" selected="selected"><?php echo $text_disabled; ?></option>';
	html += '		</select>';
	html += '	</td>';
	html += '  	<td class="text-right"><input type="text" name="slider_image[' + image_row + '][sort_order]" value="" placeholder="<?php echo $entry_sort_order; ?>" class="form-control" /></td>';
	html += '  	<td class="text-left"><button type="button" onclick="$(\'#image-row' + image_row  + '\').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>';
	html += '</tr>';
	
	$('#images>tbody').append(html);
	
	image_row++;
}
</script>
<style type="text/css">
.table tbody > tr > td {
  vertical-align: top;
}
</style>
</div>
<?php echo $footer; ?>