<div class="<?php echo $slider_class;?>" style="<?php echo $slider_style;?>">
    <div class="container-full">
        <div class="inner">
            <div class="row no-offset">                        
				<div class="col-lg-12 col-md-12 no-gutter">
					<div class="layerslider">
						<div class="bannercontainer banner-fullwidth" style="padding: 0px 0px;margin: 0px 0px 0px;">
							<div id="hok-slider<?php echo $module;?>" class="rev_slider fullwidthbanner" style="width:100%; " >
								<ul>
									<?php foreach ($sliders as $slider) { ?>
									<?php if ($slider['link']) { ?>
									<?php $data_link = 'data-link="'.$slider['link'].'"'; ?>
									<?php } else { ?>
									<?php $data_link = ''?>
									<?php } ?>
									<li data-masterspeed="<?php echo $slider['masterspeed'];?>" data-delay="<?php echo $slider['delay'];?>"  data-transition="<?php echo $slider['transition'];?>" data-slotamount="<?php echo $slider['slot']; ?>" data-thumb="<?php echo $slider['image'];?>" <?php echo $data_link;?>>
										<img src="<?php echo $slider['image'];?>"  alt="<?php echo $slider['title'];?>"/>
										<?php foreach ($slider['captions'] as $caption) { ?> 
										<div class="caption <?php echo $caption['color_class']; ?> <?php echo $caption['animation_class']; ?> <?php echo $caption['easing']; ?> <?php echo $caption['easing']; ?> <?php echo $caption['caption_class']; ?>" data-x="<?php echo $caption['position_x']; ?>" data-y="<?php echo $caption['position_y']; ?>" data-speed="<?php echo $caption['speed'];?>" data-start="<?php echo $caption['start_after']; ?>" data-easing="<?php echo $caption['easing']; ?>" data-endeasing="<?php echo $caption['end_easing']; ?>" style="<?php echo $caption['custom_style']; ?>">
											<?php echo $caption['caption']; ?>
										</div>
										<?php } ?>
									</li>			
									<?php } ?>	 	 
								</ul>
								<div class="tp-bannertimer tp-top"></div>
							</div>
						</div>
						<script type="text/javascript">
							$(document).ready(function() {
								var tpj = jQuery;
								if (tpj.fn.cssOriginal!=undefined)
									tpj.fn.css = tpj.fn.cssOriginal;

								tpj('#hok-slider<?php echo $module;?>').revolution({	
									delay:<?php echo $delay; ?>,
									startwidth:<?php echo $start_width; ?>,
									startheight:<?php echo $start_height; ?>,
									autoHeight:"<?php echo $auto_height; ?>",
									fullScreenAlignForce:"<?php echo $full_screen_align_force; ?>",
							 
									onHoverStop:"<?php echo $hover_stop; ?>",
							 
									thumbWidth:<?php echo $thumb_width; ?>,
									thumbHeight:<?php echo $thumb_height; ?>,
									thumbAmount:<?php echo $thumb_amount; ?>,
							 
									hideThumbsOnMobile:"<?php echo $hide_thumbs_on_mobile; ?>",
									hideBulletsOnMobile:"<?php echo $hide_bullets_on_mobile; ?>",
									hideArrowsOnMobile:"<?php echo $hide_arrows_on_mobile; ?>",
									hideThumbsUnderResolution:<?php echo $hide_thumbs_under_resolution; ?>,
							 
									hideThumbs:<?php echo $hide_thumb; ?>,
							 
									navigationType:"<?php echo $navigation_type; ?>",
									navigationArrows:"<?php echo $navigation_arrow; ?>",
									navigationStyle:"<?php echo $navigation_style; ?>",
							 
									navigationHAlign:"<?php echo $navigation_halign; ?>",
									navigationVAlign:"<?php echo $navigation_valign; ?>",
									<?php if ($navigation_hoffset) { ?>
									navigationHOffset:<?php echo $navigation_hoffset; ?>,
									<?php } ?>
									<?php if ($navigation_voffset) { ?>
									navigationVOffset:<?php echo $navigation_voffset; ?>,
									<?php } ?>
							 
									soloArrowLeftHalign:"<?php echo $solo_arrow_left_halign; ?>",
									soloArrowLeftValign:"<?php echo $solo_arrow_left_valign; ?>",
									<?php if ($solo_arrow_left_hoffset) { ?>
									soloArrowLeftHOffset:<?php echo $solo_arrow_left_hoffset; ?>,
									<?php } ?>
									<?php if ($solo_arrow_left_voffset) { ?>
									soloArrowLeftVOffset:<?php echo $solo_arrow_left_voffset; ?>,
									<?php } ?>
							 
									soloArrowRightHalign:"<?php echo $solo_arrow_right_halign; ?>",
									soloArrowRightValign:"<?php echo $solo_arrow_right_valign; ?>",
									<?php if ($solo_arrow_right_hoffset) { ?>
									soloArrowRightHOffset:<?php echo $solo_arrow_right_hoffset; ?>,
									<?php } ?>
									<?php if ($solo_arrow_right_voffset) { ?>
									soloArrowRightVOffset:<?php echo $solo_arrow_right_voffset; ?>,
									<?php } ?>
							 
									touchenabled:"<?php echo $touch_enabled; ?>",
									
									shuffle:"<?php echo $shuffle; ?>",	
									stopAtSlide:<?php echo $stop_at_slide; ?>,
									stopAfterLoops:<?php echo $stop_after_loops; ?>,
									hideCaptionAtLimit:<?php echo $hide_caption_at_limit; ?>,
									hideAllCaptionAtLilmit:<?php echo $hide_all_caption_at_lilmit; ?>,
									hideSliderAtLimit:<?php echo $hide_slider_at_limit; ?>,
							 
									dottedOverlay:"<?php echo $dotted_overlay; ?>",
							 
									fullWidth:"<?php echo $full_width; ?>",
									forceFullWidth:"<?php echo $force_full_width; ?>",
									fullScreen:"<?php echo $full_screen; ?>",
									
									<?php if ($full_screen_offset_container) { ?>
									fullScreenOffsetContainer:"<?php echo $full_screen_offset_container; ?>",
									<?php } ?>
									
									shadow:<?php echo $shadow; ?>
								});
							});
						</script>
					</div>
				</div>
            </div>                                    
		</div>
    </div>
</div>