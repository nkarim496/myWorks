<?php
/*error_reporting(E_ALL);
ini_set('display_errors', '1');
*/

$GLOBALS['magiczoomplus_module_loaded'] = 'true'; // to fix boxes and pages conflict, I thunk we could find a better way in future
if (defined('HTTP_ADMIN')) {
    define ('MTOOLBOX_ADMIN_FOLDER_magiczoomplus',str_replace('catalog',preg_replace('/.*?([^\/]*)\/$/is','$1',HTTP_ADMIN),DIR_APPLICATION) . 'controller/module/magiczoomplus-opencart-module/');
} else {
    define ('MTOOLBOX_ADMIN_FOLDER_magiczoomplus',DIR_APPLICATION . 'controller/module/magiczoomplus-opencart-module/');
}

function magiczoomplus_LoadScroll($tool) {
    static $scroll = null;
    if($scroll === null) {
        $scroll = false;
        if($tool->params->checkValue('magicscroll', 'yes', 'product')) {
            require_once (MTOOLBOX_ADMIN_FOLDER_magiczoomplus.'magicscroll.module.core.class.php');
            $scroll = new MagicScrollModuleCoreClass(false);
            //NOTE: load params in a separate profile, in order not to overwrite the options of MagicScroll module
            $scroll->params->appendParams($tool->params->getParams('product'), 'product-magicscroll-options');
            $scroll->params->setValue('orientation', ($tool->params->checkValue('template', array('left', 'right'), 'product') ? 'vertical' : 'horizontal'), 'product-magicscroll-options');
        }
    }
    return $scroll;
}

function magiczoomplus($content, $currentController = false , $type = false, $info = false) {

    
    $settings = $currentController->config->get('magiczoomplus_settings');
    $magiczoomplus_status = $settings['magiczoomplus_status'];
  

    if ($magiczoomplus_status != 0) {

        $tool = & magiczoomplus_load_core_class($currentController);
	
	
	if ($tool->params->profileExists($type)) { //for main profiles
	    $tool->params->setProfile($type);
	}

	
        $enabled_on_this_page = false;

        unset($GLOBALS['magictoolbox']['items']);


        if ($tool->type == 'standard') { //do not apply MSS-like modules to category & product pages
            if ($tool->params->checkValue('page-status','Yes') && (!$tool->params->checkValue('zoomMode', 'off') || !$tool->params->checkValue('expand', 'off')) && $tool->params->profileExists($type)) {
		$enabled_on_this_page = true;
	    }
        }

        if ($tool->type == 'circle') { //Apply 360 only to Products Page 
            if ($type && $type == 'product') {
                    $enabled_on_this_page = true;
            }

	} else { //boxes

		if ($type && ($type == 'latest_home_category' || $type == 'latest_home' || $type == 'latest_right' || $type == 'latest_left' || $type == 'latest_content_top' || $type == 'latest_content_bottom' || $type == 'latest_column_left' || $type == 'latest_column_right')) {
			$tool->params->setProfile('latest');
		}
		if ($type && ($type == 'featured_home' || $type == 'featured_right' || $type == 'featured_left' || $type == 'featured_left' || $type == 'featured_content_top' || $type == 'featured_content_bottom' || $type == 'featured_column_left' || $type == 'featured_column_right')) {
			$tool->params->setProfile('featured');
		}
		
		if ($type && ($type == 'special_home' || $type == 'special_right' || $type == 'special_left' || $type == 'special_content_top' || $type == 'special_content_bottom' || $type == 'special_column_left' || $type == 'special_column_right')) {
			$tool->params->setProfile('special');
		}
		
		if ($type && ($type == 'bestseller_home' || $type == 'bestseller_right' || $type == 'bestseller_left' || $type == 'bestseller_content_top' || $type == 'bestseller_content_bottom' || $type == 'bestseller_column_left' || $type == 'bestseller_column_right')) {
			$tool->params->setProfile('bestseller');
		}
		
		
		if ($tool->params->checkValue('page-status','Yes') && (!$tool->params->checkValue('zoomMode', 'off') || !$tool->params->checkValue('expand', 'off'))) {
		    $enabled_on_this_page = true;
		}


	}

        if ($enabled_on_this_page) {

	    if ($type && $info) {
		$GLOBALS['magictoolbox']['page_type'] = $type;
		$GLOBALS['magictoolbox']['prods_info'] = $info;
	    } else {
		return $content;
	    }


            
            $oldContent = $content;
            $GLOBALS['current_profile'] = $tool->params->getProfile();
            $content = magiczoomplus_parse_contents($content,$currentController);
            if ($oldContent != $content) $content = magiczoomplus_set_headers($content);


            if ($type == 'product' && $tool->type == 'standard' && isset($GLOBALS['magictoolbox']['MagicZoomPlus']['main'])) {
                // template helper class
                $tool->params->setProfile($type);
                require_once (MTOOLBOX_ADMIN_FOLDER_magiczoomplus.'magictoolbox.templatehelper.class.php');
                MagicToolboxTemplateHelperClass::setPath(MTOOLBOX_ADMIN_FOLDER_magiczoomplus.'templates');
                MagicToolboxTemplateHelperClass::setOptions($tool->params);
                $scroll = magiczoomplus_LoadScroll($tool);
                $html = MagicToolboxTemplateHelperClass::render(array(
                    'main' => $GLOBALS['magictoolbox']['MagicZoomPlus']['main'],
                    'thumbs' => (count($GLOBALS['magictoolbox']['MagicZoomPlus']['selectors']) > 1) ? $GLOBALS['magictoolbox']['MagicZoomPlus']['selectors'] : array(),
                    'magicscrollOptions' => $scroll ? $scroll->params->serialize(false, '', 'product-magicscroll-options') : '',
                    'pid' => $GLOBALS['magictoolbox']['prods_info']['product_id'],
                ));

                $content = str_replace('MAGICTOOLBOX_PLACEHOLDER', $html, $content);
            }



        }
    }

    return $content;
}

function magiczoomplus_set_headers ($content, $headers = false) {

    if (empty($GLOBALS['magictoolbox']['page_type'])) return $content;

	if(defined('HTTP_ADMIN')) {
		$aFolder = preg_replace('/.*\/([^\/].*)\//is','$1',HTTP_ADMIN);
	} else {
		$aFolder = 'admin';
	}

    $plugin = $GLOBALS["magictoolbox"]["magiczoomplus"];

    if (!$headers) {
	$plugin->params->resetProfile();

        $prefix = '';
        if (preg_match("/components\/com_(ayelshop|aceshop|mijoshop)\/opencart\//ims",DIR_APPLICATION,$matches) || strpos($content,'</head>')) {
            $prefix = '';
            if ($matches) $prefix = 'components/com_'.$matches[1].'/opencart/';
            $headers = $plugin->getHeadersTemplate($prefix.'catalog/view/javascript',$prefix.'catalog/view/css');
        }

        

    }
    $scroll = magiczoomplus_LoadScroll($plugin);
    if($scroll && $GLOBALS['magictoolbox']['page_type'] == 'product') {
        static $scrollHeaders = '';
        if(!defined('MagicScrollModuleHeaders') && !defined('MAGICSCROLL_MODULE_HEADERS')) {
            $scroll->params->resetProfile();
            $scrollHeaders = $scroll->getHeadersTemplate($prefix.'catalog/view/javascript', $prefix.'catalog/view/css', false);
        }
        if(!empty($scrollHeaders)) {
            $headers .= $scrollHeaders;
        }
    }

    if (!$plugin->params->checkValue('use-effect-on-category-page', 'No') || !$plugin->params->checkValue('use-effect-on-manufacturers-page', 'No') || !$plugin->params->checkValue('use-effect-on-search-page', 'No')) {//fix for category && manufacturers view switch
        $headers .= '<script type="text/javascript">
		    var magicAddEvent = "je1";
		    if(typeof(magicJS.Doc.je1) == "undefined") magicAddEvent = "jAddEvent";
		    
                    $mjs(document)[magicAddEvent](\'domready\', function() {
                      if (typeof display !== \'undefined\') {
                        var olddisplay = display;
                        window.display = function (view) {
			  if ("MagicZoomPlus" != "MagicZoomPlus") {
			      MagicZoomPlus.stop();
			      olddisplay(view);
			      MagicZoomPlus.start();
			  } else {
			      MagicZoom.stop();
			      olddisplay(view);
			      MagicZoom.start();
			  }
                        }
                      }
                    });
                   </script>';
    }
        if (preg_match('/optionimage\.js/is',$content)) {
        $headers .= '<script type="text/javascript">
        
			var magicAddEvent = "je1";
			if(typeof(magicJS.Doc.je1) == "undefined") magicAddEvent = "jAddEvent";
			
                        $mjs(document)[magicAddEvent](\'domready\', function() {
                                zoomId = $(\'.MagicToolboxSelectorsContainer\').attr(\'id\').match(/[0-9]+/)[0];
                                $(\'.options .option select\').change(
                                    function() {
                                        var newsrc = $(this).find(\'option:selected\').attr(\'rel\');
                                        var id = $(this).find(\'option:selected\').attr(\'value\');
                                        var optId = $(this).attr(\'name\').match(/[0-9]+/)+"";
                                        
                                        if(newsrc.indexOf(\'no_image\') > 0) {
                                            // do nothing!
                                        } else {
					    MagicZoom.update(\'MagicZoomPlusImage\'+ zoomId, MagicZoomPlusOptiMages[optId][id][\'original\'], MagicZoomPlusOptiMages[optId][id][\'thumb\']);
                                        }
                                        
                                    }
                                );
                        });
                      </script>';
    }


    if ($headers && $content && !isset($GLOBALS['magiczoomplus_headers_set'])) {

        if (preg_match("/components\/com_(ayelshop|aceshop|mijoshop)\/opencart\//ims",DIR_APPLICATION)) {
            $content = $headers.$content;
            $GLOBALS['magiczoomplus_headers_set'] = true;
        } else {
            $content = preg_replace('/\<\/head\>/is',"\n".$headers."\n</head>",$content,1,$matched);
        }

        if ($matched > 0) $GLOBALS['magiczoomplus_headers_set'] = true;
    }
    return $content;
}

function &magiczoomplus_load_core_class($currentController = false) {
    if(!isset($GLOBALS["magictoolbox"])) $GLOBALS["magictoolbox"] = array();
    if(!isset($GLOBALS["magictoolbox"]["magiczoomplus"])) {
        /* load core class */
        require_once (MTOOLBOX_ADMIN_FOLDER_magiczoomplus.'magiczoomplus.module.core.class.php');
        $tool = new MagicZoomPlusModuleCoreClass();
        /* add category for core params */
        $params = $tool->params->getParams();
        foreach($params as $k => $v) {
            $v['category'] = array(
                "name" => 'General options',
                "id" => 'general-options'
            );
            $params[$k] = $v;
        }
        $tool->params->appendParams($params);

        $GLOBALS["magictoolbox"]["magiczoomplus"] = & $tool;
    }
    if($currentController) {


        $GLOBALS['magictoolbox']['currentController'] = $currentController; //SEO url fix
        
	$settings = $currentController->config->get('magiczoomplus_settings');
	
	foreach($settings as $param_name => $param_value) {
	    if (preg_match('/([^_]*?)_([^_]*)/is',$param_name,$matches)) {
		if (!preg_match('/watermark/is',$param_name)) {
		    $GLOBALS["magictoolbox"]["magiczoomplus"]->params->setValue($matches[2],$param_value,$matches[1]);
		} else if (preg_match('/default_watermark/is',$param_name)) {
		    $GLOBALS["magictoolbox"]["magiczoomplus"]->params->setValue($matches[2],$param_value,$matches[1]);
		    $GLOBALS["magictoolbox"]["magiczoomplus"]->params->setValue(str_replace('default_','',$param_name),$param_value,'default');

		}
	    }
	

	} 


    }
    return $GLOBALS["magictoolbox"]["magiczoomplus"];
}

function magiczoomplus_parse_contents($content,$currentController) {

    $plugin = $GLOBALS['magictoolbox']['magiczoomplus'];
    $type = $GLOBALS['magictoolbox']['page_type'];

     /*OptionsImages fix START*/
    if ($type == 'product') { //use only on product page
      $options = $currentController->model_catalog_product->getProductOptions($GLOBALS['magictoolbox']['prods_info']['product_id']);

      $jsOptions = array();
      foreach ($options as $opt) {
	  $opt_id = $opt['product_option_id'];
	  
	  if (!isset($opt['option_value']) || empty($opt['option_value'])) continue;
	  
	  $opt = $opt['option_value'];
	  
	  if (is_array($opt) && count($opt)) {
	      foreach ($opt as $option) {
		  $option_value = '';
		  if (!empty($option['option_image'])) {
		      $option_value = $option['option_image'];
		  } else if (!empty($option['image'])) {
		      $option_value = $option['image'];
		  }   
		  if (!empty($option_value)) {
		      $jsOptions[$opt_id][$option['product_option_value_id']]['original'] = magiczoomplus_getThumb('image/'.$option_value,'original');
		      $jsOptions[$opt_id][$option['product_option_value_id']]['thumb'] = magiczoomplus_getThumb('image/'.$option_value,'thumb');
		  }
	      }
	  }
      }
      $oldContent = $content;
    }
    /*OptionsImages fix END*/
    


    

    //some bugs fix
    $content = str_replace("<!--code start-->",'',$content);
    $content = str_replace("<!--code end-->",'',$content);
    if (empty($GLOBALS['magictoolbox']['prods_info']['image']) && isset($GLOBALS['magictoolbox']['prods_info']['images'][0]['image'])) {
        $GLOBALS['magictoolbox']['prods_info']['image'] = $GLOBALS['magictoolbox']['prods_info']['images'][0]['image'];
    }

    if ($type == 'product') {
        $enabled = true;
        if ($plugin->type == 'circle') {
            $all_img = $GLOBALS['magictoolbox']['prods_info']['images'];
            if (isset($GLOBALS['magictoolbox']['prods_info']['image']) && !empty($GLOBALS['magictoolbox']['prods_info']['image'])) {
                $all_img[]['image'] = $GLOBALS['magictoolbox']['prods_info']['image'];
            }
            $enabled = $plugin->isEnabled($all_img,$GLOBALS['magictoolbox']['prods_info']['product_id']);
        }

        if ($enabled) {
            $content = preg_replace("/(<a[^>]*?class[ =\"']*?fancybox[^>]*?>)([^<]*?(?:<div[^>]*?class=\"promotags\"[^>]*?><\/div>.*?)*)<img/ims","<style type=\"text/css\">.promotags{z-index:10000;}.image{position:relative;}</style>$2$1<img",$content);
	    
	    /*Journal theme fix start*/
            $content = preg_replace('/<div[^>]*?class=\"image-gallery\".*?>.*?<\/div>/is','',$content); // CUT DUPLICATE SELECTORS TAB
            
            preg_match('/<div id="product\-gallery" class="image\-additional journal\-carousel">(.*?)<\/div>/ims',$content,$matches);
            if (count($matches)) {                             
            	$content = str_replace($matches[0],'',str_replace('<img','<img data-largeimg="" ',$content));
            }
            /*Journal theme fix end*/

            $pattern = '(?:<a([^>]*)>)[^<]*<img([^>]*)(?:>)(?:[^<]*<\/img>)?(.*?)[^<]*?<\/a>';
            $content = preg_replace_callback("/{$pattern}/is",'magiczoomplus_callback',$content);
            //add main image to additional
            if (!isset($GLOBALS['magictoolbox'][strtoupper('magiczoomplus').'_MAIN_IMAGE_AFFECTED'])) return $content;
            $thumb = $GLOBALS['magictoolbox'][strtoupper('magiczoomplus').'_MAIN_IMAGE_AFFECTED'];

            if ($plugin->type == 'circle') {
                $content = preg_replace('/<a[^>]*?\#tab_image.*?>.*?<\/a>/is','',$content); // CUT SELECTORS TAB
                $content = preg_replace('/<a[^>]*?\#product_gallery.*?>.*?\/a>/is','',$content); // CUT SELECTORS TAB (shoppica)
                $content = preg_replace('/<div[^>]*?id=\"tab_image\"[^>*?]class=\"tab_page\".*?>.*?<div id="tab_related"/is','<div id="tab_related"',$content); // CUT SELECTORS DIV
                $content = preg_replace('/<div[^>]*?class=\"image-additional\"[^>]*?>.*?<\/div>/is','',$content); // CUT SELECTORS DIV
                $content = preg_replace('/<li[^>]*?class=\"image-additional\"[^>]*?>.*?<\/li>/is','',$content); // CUT SELECTORS DIV

                /* FIXES BAD OpenCart Sorting*/
                $tArr = array();
                
        $GLOBALS['magictoolbox']['items'] = array_map("unserialize", array_unique(array_map("serialize", $GLOBALS['magictoolbox']['items']))); //remove duplicates
        $enabled = $plugin->isEnabled($GLOBALS['magictoolbox']['items'],$GLOBALS['magictoolbox']['prods_info']['product_id']); //check after duplicates removal
        if (!$enabled) return $oldContent;

		foreach ($GLOBALS['magictoolbox']['items'] as $item) {
		    $tArr[] = preg_replace('/(^.*?)([^\/]*\.(jpg|png|jpeg|gif))/is','$2',$item['img']);
		    $tArrr[] = preg_replace('/(^.*?)([^\/]*\.(jpg|png|jpeg|gif))/is','$1',$item['img']);
		}
		natcasesort($tArr);
        
        $tArr = array_unique($tArr);
        
		foreach ($tArr as $id => $value) {
		    $tArrrr[$id] = $tArrr[$id].$value;
		}
		$tArr = $tArrrr;
		foreach ($tArr as $id => $img) {
		    foreach ($GLOBALS['magictoolbox']['items'] as $it) {
			if ($it['img'] == $img) {
			    $ttArr[$id]['medium'] = $it['medium'];
			    $ttArr[$id]['img'] = $img;
			}
		    }
		}
		$GLOBALS['magictoolbox']['items'] = $ttArr;                
		/* FIXES BAD OpenCart Sorting*/
                
                $content = str_replace ('magiczoomplus_MAIN_IMAGE',$plugin->getMainTemplate($GLOBALS['magictoolbox']['items']),$content); //REPLACE MAIN IMAGE WITH EFFECT
            }

            $content = str_replace('<div class="image-additional">','<div class="image-additional">'.$thumb.' ',$content);
            $content = preg_replace('/<a[^>]*?\#product_gallery.*?>.*?\/a>/is','',$content); // CUT SELECTORS TAB (shoppica)
            $content = preg_replace('/<div[^>]*?id=[\'\"]product_gallery[\'\"].*?>.*?\/div>/is','',$content); // CUT SELECTORS DIV
            $content = preg_replace('/<span[^>]*?>[^<]*?'.$currentController->language->get('text_enlarge').'[^<]*?<\/span>/is','',$content); //REMOVE DEFAULT "Click to Enlarge"
            /*Journal theme fix start*/
            $content = preg_replace('/<div id="product\-gallery" class="image\-additional journal\-carousel">(.*?)<\/div>/ims','',$content);
            $content = preg_replace('/<div class="gallery\-text"><span>[^<]*?<\/span><\/div>/ims','',$content);
            /*Journal theme fix end*/
            $content = preg_replace('/\$\(\'\.thumbnails\'\)\.magnificPopup\(\{/is','$(\'.disabled-zoom\').magnificPopup({',$content); //REMOVE DEFAULT magnifier
        }


    } else if ($type == 'category' || $type == 'manufacturers' || $type == 'search' || strpos($type,'content_top') || strpos($type,'content_bottom') ||
			  ($type == 'latest_home_category' && $GLOBALS['magictoolbox']['page_type'] == 'latest_home') || 
		      ($type == 'featured_home_category' && $GLOBALS['magictoolbox']['page_type'] == 'featured_home')) {
        //if($type == 'latest_home_category') $GLOBALS['magictoolbox']['page_type'] = 'latest_home';
        preg_match_all('/<table[^>]class=[\"\']list[\'\"]>.*?<\/table>/is',$content,$table_contents);


		if (empty($table_contents[0]) && count($table_contents) < 2) { //FOR NEW OPENCART
			preg_match_all('/<div class="product-list">.*?<div class="pagination">/is',$content,$table_contents);
			if (empty($table_contents[0]) && count($table_contents) < 2) { //FOR OPENCART 1.5.x
				if (VERSION < 2) {
				    preg_match_all('/<div class="box-product">.*?<\/div>[^<]*<\/div>[^<]*<\/div>/is',$content,$table_contents); //latest 1.5.x OpenCart
				} else { //OpenCart 2 pattern
				    if ((VERSION == '2.0.0.1' || VERSION == '2.0.0.0') || $type == 'category') {
					preg_match_all('/<div class="[^\"]*product-layout[^\"]*">.*?<\/div>[^<]*?<\/div>[^<]*?<\/div>[^<]*?<\/div>/is',$content,$table_contents);
				    } else {
					preg_match_all('/<div class="[^\"]*row[^\"]*">.*?<\/div>[^<]*?<\/div>[^<]*?<\/div>[^<]*?<\/div>/is',$content,$table_contents);
				    }
				}

                if (empty($table_contents[0]) && count($table_contents) < 2) {
                    preg_match_all('/<div class="product\-grid">.*?<div class="pagination">/is',$content,$table_contents);
                }
			}
			$content = str_replace('</head>','
						<style type="text/css">
						.product-list > div {
							overflow: hidden !important;}
						</style></head>',$content);
		}


        $pattern = '(?:<a([^>]*)>)[^<]*<img([^>]*)(?:>)(?:[^<]*<\/img>)?(.*?)[^<]*?<\/a>';
        if (isset($table_contents[0]) && !is_array($table_contents[0])) {
            $result = preg_replace_callback("/{$pattern}/is",'magiczoomplus_callback_category',$table_contents[0]);
        } else if (isset($table_contents[0][0]) && !is_array($table_contents[0][0])) {
            //$result = preg_replace_callback("/{$pattern}/is",'magiczoomplus_callback_category',$table_contents[0][0]);
            if (VERSION < 2) {
		$result = preg_replace_callback("/{$pattern}/is",'magiczoomplus_callback_category',$table_contents[0][0]);
	    } else {
		$result = array();
		foreach ($table_contents[0] as $rez_id => $rez) {
		    $result[$rez_id] = preg_replace_callback("/{$pattern}/is",'magiczoomplus_callback_category',$rez);
		}
	    }
        }

	if ($plugin->type == 'standard') {
            if (isset($table_contents[0]) && !is_array($table_contents[0])) {
                $content = str_replace($table_contents[0],$result,$content);
            } else if (isset($table_contents[0][0]) && !is_array($table_contents[0][0])) {
                if (VERSION < 2) {
			$content = str_replace($table_contents[0][0],$result,$content);
		} else {
		    foreach ($table_contents[0] as $cont_id => $cont) {
			$content = str_replace($cont,$result[$cont_id],$content);
		    }
		}
            }
		} else if (isset($GLOBALS['magictoolbox']['items']) && count($GLOBALS['magictoolbox']['items']) >= $plugin->params->getValue('items')) {
			$options['id'] = $type;
			$options['title'] = 'Right';
			
            foreach($GLOBALS['magictoolbox']['items'] as $k => $v) {
                unset($GLOBALS['magictoolbox']['items'][$k]['description']);
            }
			
			
			//$plugin->general->params['width'] = $plugin->params->params['width'];
			
			//$plugin->params->setValue('width',$plugin->params->params['home-thumb-max-width']['value']);
			
            $toolHTML = $plugin->getMainTemplate($GLOBALS['magictoolbox']['items'], $options);
			$content = str_replace($table_contents[0], $toolHTML, $content);
		}



    } else if ($type) {
        $pattern = '(?:<a([^>]*)>)[^<]*<img([^>]*)(?:>)(?:[^<]*<\/img>)?(.*?)[^<]*?<\/a>';
        $result = preg_replace_callback("/{$pattern}/is",'magiczoomplus_callback_category',$content);

        if ($plugin->type == 'standard') {
            $content = str_replace($content,$result,$content);
         } else if (isset($GLOBALS['magictoolbox']['items'])
            ) { //SLIDESHOW
            if (VERSION >= 1.5) {
				if (VERSION >= 2) {
				    if (VERSION == '2.0.0.1' || VERSION == '2.0.0.0') {
					$pattern = '<div class="[^\"]*product-layout[^\"]*">.*?<\/div>[^<]*?<\/div>[^<]*?<\/div>[^<]*?<\/div>'; //OpenCart 2 pattern
				    } else {
					$pattern = '<div class="[^\"]*row[^\"]*">.*?<\/div>[^<]*?<\/div>[^<]*?<\/div>[^<]*?<\/div>'; //OpenCart 2 pattern
				    }
				} else {
				    $pattern = '(^.*?<div class="box-product">)(.*)';
				}
			} else {
				$pattern = '(^.*?<div[^>]*?\"middle\">)(.*)?(<div[^>]*?\"bottom">.*)';
			}

            if (!strpos($type,'_home') && !strpos($type,'content_')) {

                $thumbs_current = $plugin->params->getValue('thumbnails');
                $plugin->params->setValue('thumbnails','off');

                /*$arrows_current = $plugin->params->getValue('arrows');
                $plugin->params->setValue('arrows','No');*/


            } 

            $options['id'] = $type;
            foreach($GLOBALS['magictoolbox']['items'] as $k => $v) {
                unset($GLOBALS['magictoolbox']['items'][$k]['description']);
            }

            $toolHTML = $plugin->getMainTemplate($GLOBALS['magictoolbox']['items'], $options);
			if (VERSION >= 1.5) {
				if (VERSION >= 2) {
				    $content = preg_replace("/{$pattern}/is",'$1'.$toolHTML,$content);
				} else {
				    $content = preg_replace("/{$pattern}/is",'$1'.$toolHTML.'</div></div></div>',$content);
				}
			} else {
				$content = preg_replace("/{$pattern}/is",'$1'.$toolHTML.'</div>$3',$content);
			}
        }
    }
if (isset($thumbs_current)) $plugin->params->setValue('thumbnails',$thumbs_current);
//if (isset($arrows_current)) $plugin->params->setValue('arrows',$arrows_current);
if (isset($direction_current)) $plugin->params->setValue('direction',$direction_current);
if (isset($jsOptions) && count($jsOptions)  && $content != $oldContent) $content = str_replace('</head>','<script type="text/javascript"> MagicZoomPlusOptiMages = '.json_encode($jsOptions).'; </script></head>',$content);
return $content;
}



function magiczoomplus_callback_category ($matches) {

    if (preg_match("/data\/Stick_Gallery/ims",$matches[0])) return $matches[0];//Product Label module support
    if (preg_match("/route\=common\/home/ims",$matches[0])) return $matches[0];//Skip Logo
    
    $plugin = $GLOBALS["magictoolbox"]["magiczoomplus"];
    $plugin_enabled = true;
    $result = $matches[0];
    if ($plugin_enabled) {
        $show_message_current = $plugin->params->getValue('show-message');
        $plugin->params->setValue('show-message','No');
        $shop_dir = str_replace('system/','',DIR_SYSTEM);
        $image_dir = str_replace ($shop_dir,'',DIR_IMAGE);
        $type = $GLOBALS['magictoolbox']['page_type'];
        $link = preg_replace("/^.*?href\s*=\s*[\"\'](.*?)[\"\'].*$/is","$1",$matches[1]);

        $id = preg_replace('/^.*?product_id=(\d+).*/is','$1',$link);

        if (!strpos($link,'product_id')) { //SEO links fix
            $currentController = $GLOBALS['magictoolbox']['currentController'];
            $config_seo_url_postfix = $currentController->config->get('config_seo_url_postfix');
            $furl = preg_replace('/.*\/([^\?]*).*/is','$1',$link);
            $furl = str_replace($config_seo_url_postfix, '', $furl);
            $query = $currentController->db->query("SELECT * FROM " . DB_PREFIX . "url_alias WHERE `keyword` = '".$furl."'");
            $query = $query->rows[0]['query'];
            $id = preg_replace('/^.*?id=(\d+).*/is','$1',$query);
        }
        
        if (!is_numeric($id)) {
	    //$id = preg_replace('/^([0-9]{1,})\-[a-z0-9]{1,}/ims','$1',$furl);
	    $id = preg_replace('/^([0-9]{1,})\-.*/ims','$1',$furl);
	}

        if (!is_numeric($id)) return $matches[0];
        $pid = $id;
        $p_info = magiczoomplus_getProductParams($id,$GLOBALS['magictoolbox']['prods_info']);
        if ($p_info['image'] == '') return $matches[0];
        $id = $id.'_'.$type;

        if ($plugin->params->checkValue('link-to-product-page','No')) $link='';

        $title = $p_info['name'];
        $title = htmlspecialchars(htmlspecialchars_decode($title, ENT_QUOTES));
        $description = $p_info['description'];
        $description = htmlspecialchars(htmlspecialchars_decode($description, ENT_QUOTES));

        $group = $type;

        $original = $image_dir.$p_info['image'];
        $img = magiczoomplus_getThumb($original,'original',$pid);

        if ($type != 'category') {
            $position = preg_replace('/.*?_(.*)/is','$1',$type);
        } else {
            $position = $type;
        }
        
        if ($plugin->type == 'standard') {
            $position = str_replace('column_','',$position);
	    $cat_array=array('home','content_bottom','content_top');
	    
            if (in_array($position,$cat_array)) $position = 'category';
            
            if (preg_match('/(left|right)/is',$position)) {
        $thumb = magiczoomplus_getThumb($original,$position.'-thumb',$pid);
		$thumb = magiczoomplus_getThumb($original,$position.'-thumb2x',$pid);
            } else {
        $thumb = magiczoomplus_getThumb($original,'thumb',$pid);
		$thumb2x = magiczoomplus_getThumb($original,'thumb2x',$pid);
	    }
	    
            $result = $plugin->getMainTemplate(compact('img','thumb', 'thumb2x','id','title','description','link','group'));
        } else {
	    $position = str_replace('column_','',$position);
	    if ($position == 'content_bottom' || $position == 'content_top') $position = 'category';
            $img = magiczoomplus_getThumb($original,$position.'-thumb',$pid);
            $thumb = magiczoomplus_getThumb($original,'home-selector-thumb',$pid);
            $GLOBALS['magictoolbox']['items'][] = array(
                'img' => $img,
                'thumb' => $thumb,
                'id' => $id,
                'title' => $title,
                'description' => $description,
                'link' => $link,
            );
        }
    }
    
    $plugin->params->setValue('show-message',$show_message_current);
    return $result;
}

function magiczoomplus_callback ($matches) {

    if (preg_match("/data\/Stick_Gallery/ims",$matches[0])) return $matches[0];//Product Label module support

    $plugin = $GLOBALS["magictoolbox"]["magiczoomplus"];
    $plugin_enabled = true;
    $result = $matches[0];
    if(!preg_match("/class\s*=\s*[\'\"]\s*(?:[^\"\'\s]*\s)*thickbox(?:\s[^\"\'\s]*)*\s*[\'\"]/iUs",$matches[0]) && 
       !preg_match("/class\s*=\s*[\'\"]\s*(?:[^\"\'\s]*\s)*fancybox(?:\s[^\"\'\s]*)*\s*[\'\"]/iUs",$matches[0]) &&
       !preg_match("/class\s*=\s*[\'\"]\s*(?:[^\"\'\s]*\s)*lightbox(?:\s[^\"\'\s]*)*\s*[\'\"]/iUs",$matches[0]) &&
       !preg_match("/class\s*=\s*[\'\"]\s*(?:[^\"\'\s]*\s)*thumbnail(?:\s[^\"\'\s]*)*\s*[\'\"]/iUs",$matches[0]) &&
       !preg_match("/class\s*=\s*[\'\"]\s*(?:[^\"\'\s]*\s)*yoxview(?:\s[^\"\'\s]*)*\s*[\'\"]/iUs",$matches[0]) &&
       //!preg_match("/class\s*=\s*[\'\"]\s*(?:[^\"\'\s]*\s)*cloud\-zoom(?:\s[^\"\'\s]*)*\s*[\'\"]/iUs",$matches[0]) &&
       !preg_match("/class\s*=\s*[\'\"]\s*(?:[^\"\'\s]*\s)*cloud\-zoom.*?(?:\s[^\"\'\s]*)*\s*[\'\"]/iUs",$matches[0]) &&
       !preg_match("/class\s*=\s*[\'\"]\s*(?:[^\"\'\s]*\s)*colorbox(?:\s[^\"\'\s]*)*\s*[\'\"]/iUs",$matches[0]) &&
       !preg_match("/class\s*=\s*[\'\"]\s*(?:[^\"\'\s]*\s)*jqzoom(?:\s[^\"\'\s]*)*\s*[\'\"]/iUs",$matches[0]) &&
       //!preg_match("/rel\s*=\s*[\'\"]\s*(?:[^\"\'\s]*\s)*colorbox(?:\s[^\"\'\s]*)*\s*[\'\"]/iUs",$matches[0]) &&
       !preg_match("/rel\s*=\s*[\'\"]\s*(?:[^\"\'\s]*\s)*colorbox.*?(?:\s[^\"\'\s]*)*\s*[\'\"]/iUs",$matches[0]) &&
       !preg_match("/data-zoom-image\s*=/iUs",$matches[0]) &&  
       !preg_match("/data-largeimg\s*=/iUs",$matches[0]) && //Journal theme
       !preg_match("/rel\s*=\s*[\'\"]\s*(?:[^\"\'\s]*\s)*prettyPhoto\[gallery\](?:\s[^\"\'\s]*)*\s*[\'\"]/iUs",$matches[0])) {
        $plugin_enabled = false;
    }
    if ($plugin_enabled) {
    
        $currentController = $GLOBALS['magictoolbox']['currentController'];
        
        if ($currentController->config->get('config_template')=='journal2') {
            if (preg_match("/id=\"image\"/iUs",$matches[0])) {
                $GLOBALS['magic'] = true;
            }
            if (empty($GLOBALS['magic'])) {
                return $matches[0];
            }
        }
    
        $shop_dir = str_replace('system/','',DIR_SYSTEM);
        $image_dir = str_replace ($shop_dir,'',DIR_IMAGE);

        $title = $GLOBALS['magictoolbox']['prods_info']['name'];
        $title = htmlspecialchars(htmlspecialchars_decode($title, ENT_QUOTES));
        $description = $GLOBALS['magictoolbox']['prods_info']['description'];
        $description = htmlspecialchars(htmlspecialchars_decode($description, ENT_QUOTES));

        
        $img = preg_replace("/^.*?href\s*=\s*[\"\'].*(?:\/|\\\)(.*?)-\d+x\d+.*[\"\'].*$/is","$1",$matches[1]);
        $img = preg_replace('/([\[\]\(\)\/\-\+])/is','\\\$1',$img); // and now certainly all escaped now =)

        $original_image = false;
        if (isset($GLOBALS['magictoolbox'][strtoupper('magiczoomplus').'_MAIN_IMAGE_AFFECTED'])) {
            foreach ($GLOBALS['magictoolbox']['prods_info']['images'] as $image) {
		
		$image2 = preg_replace('/[\/_]/is','-',$image['image']);
		if (preg_match('/.*?'.strtolower($img).'(\-\d+x\d+)?\.(png|jpg|jpeg|gif)/is',strtolower($image['image']))) {
		    $original_image = $image['image'];
		} else if (preg_match('/.*?'.strtolower($img).'(\-\d+x\d+)?\.(png|jpg|jpeg|gif)/is',strtolower($image2))) {
		    $original_image = $image['image'];
		}
            }
        } else {
            $original_image = $GLOBALS['magictoolbox']['prods_info']['image'];
        }
        if (!$original_image) return $matches[0];

        $id = $GLOBALS['magictoolbox']['prods_info']['product_id'];

        $original_image = $image_dir.$original_image;
        $img = magiczoomplus_getThumb($original_image,'original',$id);
        $selector = magiczoomplus_getThumb($original_image,'selector',$id);
        $medium = magiczoomplus_getThumb($original_image,null,$id);
        $medium2x = magiczoomplus_getThumb($original_image, 'thumb2x',$id);
        $thumb = $selector;
        $thumb2x = magiczoomplus_getThumb($original_image,'selector2x',$id);

        if ($plugin->type == 'standard') {

            if (!isset($GLOBALS['magictoolbox'][strtoupper('magiczoomplus').'_MAIN_IMAGE_AFFECTED'])) {
                $additional_result = $plugin->getSelectorTemplate(compact('title','img','medium', 'medium2x','thumb', 'thumb2x','id'));
                $GLOBALS['magictoolbox'][strtoupper('magiczoomplus').'_MAIN_IMAGE_AFFECTED'] = '';// $additional_result;

                $thumb = magiczoomplus_getThumb($original_image,null,$id);
                $thumb2x = magiczoomplus_getThumb($original_image,'thumb2x',$id);                
                $result = $plugin->getMainTemplate(compact('img','thumb', 'thumb2x','id','title','description'));

                $GLOBALS['magictoolbox']['MagicZoomPlus']['selectors'][] = $additional_result;
                $GLOBALS['magictoolbox']['MagicZoomPlus']['main'] = $result;

                return 'MAGICTOOLBOX_PLACEHOLDER';

            } else {
                $result = $plugin->getSelectorTemplate(compact('title','img','medium', 'medium2x','thumb', 'thumb2x','id'));

                /* ivideo FIX START */
                if (preg_match('/data\-iproductvideo/ims',$matches[0])) {
                    $result = preg_replace('/<a.*?>(<img.*)/ims',preg_replace('/(<a.*?>)<img.*/ims','$1',$matches[0]).'$1',$result);
                }
                /* ivideo FIX END */
                
                $GLOBALS['magictoolbox']['MagicZoomPlus']['selectors'][] = $result;
                return '';
            }
        } else if ($plugin->type == 'circle') {
            if (!isset ($GLOBALS['magictoolbox'][strtoupper('magiczoomplus').'_MAIN_IMAGE_AFFECTED'])) {
                $result = 'magiczoomplus_MAIN_IMAGE';
                $GLOBALS['magictoolbox'][strtoupper('magiczoomplus').'_MAIN_IMAGE_AFFECTED'] = $matches[0];
            } else {
		$GLOBALS['magictoolbox']['items'][] = array('medium' => $medium, 'img' => $thumb);
                $result = $matches[0];
            }
            
        }
    }
return $result;
}

function magiczoomplus_getProductParams ($id, $params = false) {
    if (!$params) $params = $GLOBALS['magictoolbox']['prods_info'];
    foreach ($params as $key=>$product_array) {
        if ($product_array['product_id'] == $id) {
            return $product_array;
        }
    }
}

function magiczoomplus_getThumb($src, $size = null, $pid = null) {
    if($size === null) $size = 'thumb';
    require_once (MTOOLBOX_ADMIN_FOLDER_magiczoomplus.'magictoolbox.imagehelper.class.php');
    
    if (defined('HTTP_IMAGE')) {
        $url = str_replace('image/','',HTTP_IMAGE);
    } else {
        $url = HTTP_SERVER;
    }
    $shop_dir = str_replace('system/','',DIR_SYSTEM);
    $image_dir = str_replace ($shop_dir,'',DIR_IMAGE);

    $imagehelper = new MagicToolboxImageHelperClass($shop_dir, '/'.$image_dir.'magictoolbox_cache', $GLOBALS["magictoolbox"]["magiczoomplus"]->params, null, $url);
    return preg_replace('/https?\:\/\//is','//',$imagehelper->create('/' . $src, $size, $pid));
}

function magiczoomplus_set_params_from_config ($config = false) {
    if ($config) {
        $plugin = $GLOBALS["magictoolbox"]["magiczoomplus"];

        foreach ($plugin->params->getNames() as $name) {
            if ($config->get($name)) {
                $plugin->params->setValue($name,$config->get($name));
            }
        }
        foreach ($plugin->params->getParams() as $param) {
            if (!isset($param['value'])) {
                $plugin->params->setValue($param['id'],$plugin->params->getValue($param['id']));
            }
        }

        $plugin->general->appendParams($plugin->params->getParams());
    }
}

function magiczoomplus_use_effect_on(&$tool) {
    return !$tool->params->checkValue('use-effect-on-product-page','No') ||
           !$tool->params->checkValue('use-effect-on-category-page','No') ||
           !$tool->params->checkValue('use-effect-on-latest-box','No') ||
           !$tool->params->checkValue('use-effect-on-featured-box','No') ||
           !$tool->params->checkValue('use-effect-on-special-box','No') ||
           !$tool->params->checkValue('use-effect-on-bestsellers-box','No');
}

?>
