<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <a onclick="$('#form').submit();" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></a>
		<a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-primary"><i class="fa fa-reply"></i></a>
	  </div>
      <h1><?php echo $heading_title; ?></h1>
	  <div></div>
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
    <div class="panel-heading"><h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $heading_title; ?></h3></div>
    <div class="panel-body">
	
    <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
	<div class="tab-content">
    <table class="form">
		<tr>
		<td>Заголовок пункта меню:</td>
		<td>
		<?php foreach ($languages as $language) { ?>
			<div style="overflow:auto;margin:0 0 3px 0;">
			<img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['language_id']; ?>" style="display:inline-block; vertical-align:middle; float:left;" />
			<input type="text" name="menu_description[<?php echo $language['language_id']; ?>][name]" value="<?php echo isset($menu_description[$language['language_id']]) ? $menu_description[$language['language_id']]['name'] : ''; ?>" size="15" />
			</div>
			<?php if (isset($error_name[$language['language_id']])) { ?>
                <span class="error"><?php echo $error_name[$language['language_id']]; ?></span>
            <?php } ?>
		<?php } ?>
		</td>
		</tr>
        <tr>
		<td><?php echo $entry_link; ?></td>
		<td><input type="text" name="link" value="<?php echo $link; ?>" size="100" /></td>
		</tr>
		<tr>
		<td><?php echo $entry_parent_id; ?></td>
		<td> 
		<select class="parent_id" name="parent_id">
		<option value=""><?php echo $text_select ?></option> 
		<?php if($custom_menu) { 
			foreach($custom_menu as $menu) {
				if($menu['menu_id']==$parent_id) {
					$sel="selected";
				} else {
					$sel="";
				}
				?>
		<option <?php echo $sel; ?> data-parent="<?php echo $menu['parent_id'] ?>"  value="<?php echo $menu['menu_id'] ?>"><?php echo $menu['name']; ?></option> 
		<?php }} ?>
		</select>
		<input type="hidden" name="parent_parent_id" value="<?php echo $parent_parent_id ?>" size="4" />
		</td>
		</tr>
		<tr>
        <td><?php echo $entry_image; ?></td>
        <td valign="top">
		<a href="" id="thumb-image" data-toggle="image" class="img-thumbnail"><img src="<?php if($thumb) { echo $thumb; } else { echo $placeholder; } ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a>
		<input type="hidden" name="image" value="<?php echo $image; ?>" id="image" />
		</td>
        </tr>
		<tr>
			 <td><?php echo $entry_column; ?></td>
			 <td><input type="text" name="column" value="<?php if ($column) { ?><?php echo $column; ?><?php } else { ?>1<?php } ?>" size="2" /></td>
			 </tr>
			 <tr>
			 <td><?php echo $entry_status; ?></td>
			 <td><select name="status">
                  <?php if ($status) { ?>
                  <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                  <option value="0"><?php echo $text_disabled; ?></option>
                  <?php } else { ?>
                  <option value="1"><?php echo $text_enabled; ?></option>
                  <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                  <?php } ?>
                </select>				
			</td>
			 </tr>
			    <tr>
			 <td><?php echo $entry_sort_order; ?></td>
			 <td><input type="text" name="sort_order" value="<?php echo $sort_order; ?>" size="2" /></td>
			 </tr>
            </table>
        </div>
      </form>
    </div>
  </div>
</div>

<style>
	table {width:100%}
	table tr:nth-child(2n) {background: #f4f4f4;}
	table tr + tr {border-top:solid 1px #ddd;}
	table tr td {padding:7px 10px}
	table tr td:first-child {width:300px;max-width:300px;}
	table img {display:block;float:left;border:solid 1px #aaa;border-right:none;background:#ddd;padding:6px 4px;border-radius: 2px 0 0 2px}
	table input[type='text'], table textarea {display:block;float:left;width:190px !important; padding:2px 5px}
</style>

<script type="text/javascript"><!--
$('.nav-tabs a:first').tab('show');
//--></script>  

<script type="text/javascript"><!--
$(document).ready(function() {
	var val = $('.parent_id option:selected').attr('data-parent');
	$('input[name="parent_parent_id"]').val(val);
	
$('.parent_id').bind('change', function() { 
	var val = $('.parent_id option:selected').attr('data-parent');
	$('input[name="parent_parent_id"]').val(val);
});
});
//--></script> 
<?php echo $footer; ?>