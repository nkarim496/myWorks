<?php

if (isset($_GET['magic'])) {
    error_reporting(E_ALL);
    ini_set('display_errors', '1');
}

$groups = array();

$toolAbr = '';
$abr = explode(" ", strtolower("Magic Zoom Plus"));
foreach ($abr as $word) $toolAbr .= $word{0};

$corePath = HTTP_SERVER.'view/image/magiczoomplus-opencart-module';
?>

<?php


$style = '<style type="text/css">
	      .fa-check:before { font-weight:bold; color:green; font-size:16px; } 
	      .fa-close { font-weight:bold; color:red; font-size:16px; }
	      .fixed .buttons {
		    margin-right: 25px !important;
		    right: 0% !important;
		}
		.fixed{
		      border-radius: 0 0 0 0 !important;
		      left: 0;
		      position: fixed;
		      top: -15px;
		      width: 100%;
		      background: white;
		      z-index: 9999999;
		      padding-top: 10px;
		      border-bottom: 1px solid lightgray;
		}
	  </style>';

$script = '<script type="text/javascript">
$(document).ready(function() {
    var headingTop = $(\'.page-header\').position().top;
    console.log(headingTop);
    $(window).scroll(function() {
        if(headingTop >= $(window).scrollTop()) {
            if($(\'.page-header\').hasClass(\'fixed\')) {
                $(\'.page-header\').removeClass(\'fixed\');
            }
        } else { 
            if(!$(\'.page-header\').hasClass(\'fixed\')) {
                $(\'.page-header\').addClass(\'fixed\');
            }
        }
    });
});
</script>';

$old_header = $header;
$header = str_replace('</head>',$style.$script.'</head>',$header);
if ($old_header == $header) {
    $header = str_replace('<div id="container">',$style.$script.'<div id="container">',$header);
}

echo $header; ?>

<?php echo $column_left; ?>

<div id="content">
<form action="<?php echo $action; ?>" method="post" id="form-magiczoomplus" name="form-magiczoomplus" class="form-horizontal">
    <div class="page-header">
	<div class="container-fluid">
	    <div class="pull-right">
		<button type="submit" form="form-magiczoomplus" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
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
    
<?php 
if (preg_match("/components\/com_(ayelshop|aceshop|mijoshop)\/opencart\//ims",DIR_APPLICATION)) {
    print $style;
}
?>
<div class="content">

  <?php trial_bage(); ?>
  
  <ul class="nav nav-tabs">
	<li class="active" >
	    <a href="#tab-general" data-toggle="tab">General</a>
	</li>
	
	<?php foreach ($blocks as $block_id => $block_name) { 
	if ($block_id == 'default') continue;
	?>
	<li>
	    <a href="#tab-<?php echo $block_id; ?>" data-toggle="tab"><?php echo $block_name; ?></a>
	</li>
	<?php } ?>
	
    </ul>
    
    <div class="tab-content">
    
	<div class="tab-pane  active" id="tab-general">
  
	    <div class="panel panel-default">
		<div class="panel-heading">
		    <h3 class="panel-title"><i class="fa fa-pencil"></i>Module status</h3>
		</div>
	    
		<div class="panel-body <?php echo $toolAbr; ?>params">
		
		    <div class="form-group">
			<label class="col-sm-2 control-label" for="magiczoomplussettingStatus">Enable/Disable module</label>
			<div class="col-sm-10">
			  <select name="magiczoomplus_status" class="form-control">
				<option value="1" <?php echo (($magiczoomplus_status) ? 'selected' : ''); ?> ><?php echo $text_enabled; ?></option>
				<option value="0" <?php echo ((!$magiczoomplus_status) ? 'selected' : ''); ?> ><?php echo $text_disabled; ?></option>
			  </select>
			</div>
		    </div>
		    
		</div>
	    </div>
	    
	    <?php echo groupsHTML($parameters, 'default', array('default' => array('Watermark' => $map['default']['Watermark']))); ?>
	    
	    <div class="panel panel-default">
		    <div class="panel-heading">
				<h3 class="panel-title"><i class="fa fa-pencil"></i>Other</h3>
		    </div>
		    
		    <div class="panel-body <?php echo $toolAbr; ?>params">
				<div class="form-group">
				<label class="col-sm-2 control-label" for="magiczoomplussettingChache-path">Path to cache folder</label>
				<div class="col-sm-10">
						<input class="form-control" type="text" size="60" value="<?php echo $path_to_cache; ?>" disabled="disabled" />
						<p class="help-block">Relative for site base path</p>
				</div>
				</div>
				<div class="form-group">
				<label class="col-sm-2 control-label" for="magiczoomplussettingTotal-items">Total items</label>
				<div class="col-sm-10">
						<input class="form-control" type="text" size="60" value="<?php echo $total_items; ?>" disabled="disabled" />
				</div>
				</div>
				<div class="form-group">
				<label class="col-sm-2 control-label" for="magiczoomplussettingUnuser-items">Unused items</label>
				<div class="col-sm-10">
						<input class="form-control" type="text" size="60" value="<?php echo $unused_items; ?>" disabled="disabled" />
				</div>
				</div>
				<div class="form-group">
				<label class="col-sm-2 control-label" for="magiczoomplussettingEmpte-chache">Empty cache</label>
				<div class="col-sm-10">
						<select class="form-control" name="what-clear">
						<option value="unused_items" selected="selected">Delete unused items</option>
						<option value="all_items">Delete all items</option>
						</select>&nbsp;
						<input type="hidden" id="clear_cache" name="clear_cache" value="0" />
					</div>
				</div>
				<div class="form-group">
				<div class="col-sm-2"></div>
					<div class=" col-sm-10">
						<a class="btn btn-primary" onclick="$('#clear_cache').val(1);$(this).closest('form').submit();" class="button"><span><?php echo $button_clear; ?></span></a>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	
	
	<?php foreach ($blocks as $block_id => $block_name) { 
	    if ($block_id == 'default') continue;
	?>
	    <div class="tab-pane" id="tab-<?php echo $block_id; ?>">
		  <?php echo groupsHTML($parameters, $block_id, $map); ?>
	    </div>
	<?php } ?>
	  
	</div>

      </div>
    </form>
  </div>
</div>
</div>
<?php echo $footer; ?>




    <?php
    
	function groupsHTML ($parameters, $profile = 'default', $map) {

	    if (!isset($parameters[$profile])) return false;
	    
	    $parameters = $parameters[$profile];
	    
	    
	    $imgArray = array('zoom &amp; expand','yes','zoom','expand','expanded','original','swap images only','no','left','top left', 'top-left', 'top','top right', 'top-right', 'right', 'bottom right', 'bottom-right', 'bottom', 'bottom left', 'bottom-left'); //array for the images ordering

	    global $toolAbr, $magiczoomplus_status;

	    if ($magiczoomplus_status) $selected_yes = 'selected'; else $selected_yes = '';
	    if (!$magiczoomplus_status) $selected_no = 'selected'; else $selected_no = '';

        $html = '';
        
        foreach ($parameters as $name => $s) {

			if (!isset($map[$profile][$s['group']]) || !in_array($s['id'], $map[$profile][$s['group']])) continue;

			if ($profile == 'product') {
			    if ($s['id'] == 'page-status' && !isset($s['value'])) {
				$s['default'] = 'Yes';
			    }
			}
			
			if ($s['id'] == 'direction') continue;
			
			
			if ($s['id'] == 'thumb-max-width' && !isset($s['value']) && in_array($profile,array('featured','bestseller','latest','special'))) {
			    $s['default'] = '100';
			}
			
			if ($s['id'] == 'thumb-max-height' && !isset($s['value']) && in_array($profile,array('featured','bestseller','latest','special'))) {
			    $s['default'] = '100';
			}
			
                        if (!isset($s['group'])) {
                            $s['group'] = 'Miscellaneous';
                        }
                        if (!isset($groups[$s['group']])) {
                                $groups[$s['group']] = array();
                        }

                        if (strpos($s["label"],'(')) {
                            $before = substr($s["label"],0,strpos($s["label"],'('));
                            $after = ' '.str_replace(')','',substr($s["label"],strpos($s["label"],'(')+1));
                        } else {
                            $before = $s["label"];
                            $after = '';
                        }
                        if (strpos($after,'%')) $after = ' %';
                        if (strpos($after,'in pixels')) $after = ' pixels';
                        if (strpos($after,'milliseconds')) $after = ' milliseconds';
                        
                        $description = '';
                        if (isset($s["description"]) && trim($s["description"]) != '') {
                        	$description = $s["description"];
						}


                            $html  .= '<div class="form-group">';
                            $html  .= '';
                            
                            
                            if ($s["type"]=='num' || $s["type"]=='text') {
                            	$html  .= '<label class="col-sm-2 control-label" for="magiczoomplussettings'. ucwords(strtolower($name)).'">'.$before.'</label>';
							} else {
                            	$html  .= '<label class="col-sm-2 control-label">'.$before.'</label>';
							}

                            if(($s['type'] != 'array') && isset($s['values'])) {
				$description = implode(', ',$s['values']);
			    }

                            
                            $html .= '<div class="col-sm-10">';
                                                        
                            if (!empty($after)) {
                            	$html .= '<div class="input-group">';
                            }

                            switch($s["type"]) {
                                case "array":
                                        $rButtons = array();
                                        foreach($s["values"] as $p) {
                                            if (!isset($s["value"])) $s["value"] = $s["default"];
                                            $rButtons[strtolower($p)] = '<label class="radio-inline"><input type="radio" value="'.$p.'"'. ($s["value"]==$p?"checked=\"checked\"":"").' name="'.$profile.'_'.$s['id'].'" id="magiczoomplussettings'. ucwords(strtolower($name)).$p.'">';
                                            $pName = ucwords($p);

                                            if ($pName=='Yes') $pName = '<span class="fa fa-check"></span>';
                                            if ($pName=='No') $pName = '<span class="fa fa-close"></span>';


                                            $rButtons[strtolower($p)] .= ' '.$pName.'</label>';

                                        }
                                        foreach ($imgArray as $img){
                                            if (isset($rButtons[$img])) {
                                                $html .= $rButtons[$img];
                                                unset($rButtons[$img]);
                                            }
                                        }
                                        $html .= implode('',$rButtons);
                                    break;
                                case "num":
                                case "text":
                                default:
                                    if (strtolower($name) == 'message') { $width = 'style="width:95%;"';} else {$width = '';}
                                    if (!isset($s["value"])) $s["value"] = $s["default"];
                                    $html .= '<input class="form-control" '.$width.' type="text" name="'.$profile.'_'.$s['id'].'" id="magiczoomplussettings'. ucwords(strtolower($name)).'" value="'.$s["value"].'" />';
                                    break;
                            }

                            if (!empty($after)) {
                            	$html .= '<span class="input-group-addon">'.$after.'</span>';
							}


                            if (!empty($after)) {
                            	$html .= '</div>';
							}

                            if (!empty($description)) $html .= '<p class="help-block">'.$description.'</p>';
                            
                            $html .= '</div>';




                            $html .= '</div>';
                            $groups[$s['group']][] = $html;
                            $html = '';

        }

	$finalHTML = '';
        foreach ($groups as $name => $group) {
                        $i = 0;
                        $group[count($group)-1] = str_replace('<tr','<tr class="last"',$group[count($group)-1]); //set "last" class

                        $finalHTML .= '<div class="panel panel-default">
				  <div class="panel-heading">
				      <h3 class="panel-title"><i class="fa fa-pencil"></i>'.$name.'</h3>
				  </div>
				  <div class="panel-body '.$toolAbr.'params">
				  ';

                        foreach ($group as $g) {
                            if (++$i%2==0) { //set stripes
                                if (strpos($g,'class="last"')) {
                                    $g = str_replace('class="last"','class="back last"',$g);
                                } else {
                                    $g = str_replace('<tr','<tr class="back"',$g);
                                }
                            }
                            $finalHTML .= $g;
                        }
                        $finalHTML .= ' </div></div>';
                    }
                    
                    return $finalHTML;

	  }
       
function trial_bage() {
if (!preg_match('/DEMO/is',@file_get_contents(DIR_CATALOG.'view/javascript/magiczoomplus.js'))) return;
echo '
  <div style="border: 1px solid #C7C16C;background: #FFF899;text-align: center;">
  <h1 style="color: black;font-size: 1.5em;text-transform: none;">Trial version</h1>
  To remove the red "<span style="color:red;">Please upgrade..</span>" text, please <a target="_blank" href="http://magictoolbox.com/buy/magiczoomplus/"><b>buy</b></a> and upload your licensed magiczoomplus.js file to this folder:
  <div style="padding:10px 0;">'.preg_replace('/^.*?([^\/]*\/?$)/is','$1',DIR_CATALOG).'view/javascript/magiczoomplus.js</div></div>';
}

 ?>
 

