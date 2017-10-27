<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <a onclick="$('#form').submit();" data-toggle="tooltip" title="<?php echo $lang['button_save']; ?>" class="btn btn-primary"><i class="fa fa-save"></i></a>
        <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $lang['button_cancel']; ?>" class="btn btn-danger"><i class="fa fa-reply"></i></a>
	  </div>
      <h1><?php echo $lang['heading_title']; ?></h1>
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
    <div class="panel-heading"><h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $lang['heading_title']; ?></h3></div>
    <div class="panel-body">	
	
	<style>
	.module-list tr td:first-child {width:250px;max-width:250px;padding:7px 10px 6px}
	table tr:nth-child(2n) {background: #f4f4f4;}
	table img {display:block;float:left;border:solid 1px #aaa;border-right:none;background:#ddd;padding:6px 4px;border-radius: 2px 0 0 2px}
	table input[type='text'], table textarea {display:block;float:left;width:200px !important; padding:2px 5px}
	table input + input {margin:0 0 0 10px;}
	.required {margin:0 3px 0 0;color:#f00;}
	</style>
	
    <div class="content">
      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form" name="newsform">
        <div class="table-responsive">
		<h4 <?php if($module_id) {echo 'style="display:none;"';} ?>>Общие настройки</h4>
        <table class="table table-bordered table-hover module-list" <?php if($module_id) {echo 'style="display:none;"';} ?>>
          <tr>
            <td><span class="required">*</span><?php echo $lang['entry_newspage_thumb']; ?></td>
            <td>
              <input type="text" name="news[thumb_width]" value="<?php if(isset($news['thumb_width'])) { echo $news['thumb_width']; } ?>" style="width:40px !important; text-align:center;" />
              <input type="text" name="news[thumb_height]" value="<?php if(isset($news['thumb_height'])) { echo $news['thumb_height']; } ?>" style="width:40px !important; text-align:center;" /> &nbsp; пикселей
              <?php if ($error_newspage_thumb) { ?>
                <span class="error"><?php echo $lang['error_newspage_thumb']; ?></span>
              <?php } ?>
            </td>
          </tr>
          <tr>
            <td><span class="required">*</span><?php echo $lang['entry_newspage_popup']; ?></td>
            <td>
              <input type="text" name="news[popup_width]" value="<?php if(isset($news['popup_width'])) { echo $news['popup_width']; } ?>" style="width:40px !important; text-align:center;" />
              <input type="text" name="news[popup_height]" value="<?php if(isset($news['popup_height'])) { echo $news['popup_height']; } ?>" style="width:40px !important; text-align:center;" /> &nbsp; пикселей
              <?php if ($error_newspage_popup) { ?>
                <span class="error"><?php echo $lang['error_newspage_popup']; ?></span>
              <?php } ?>
            </td>
          </tr>
          <tr>
            <td><?php echo $lang['entry_newspage_addthis']; ?></td>
            <td><input type="checkbox" name="news[addthis]" value="1" <?php if (isset($news['addthis'])) { ?>checked="checked"<?php } ?> /></td>
          </tr>
          <tr>
            <td><span class="required">*</span><?php echo $lang['entry_headline_chars']; ?></td>
            <td>
				<input type="text" name="news[chars]" value="<?php if(isset($news['chars'])) echo $news['chars']; ?>" style="width:40px !important; text-align:center;" /> &nbsp; символов
				<?php if ($error_numchars) { ?><span class="error"><?php echo $lang['error_numchars']; ?></span><?php } ?>
            </td>
          </tr>
		<table>
		<h4>Настройки модуля</h4>
		<table class="table table-bordered table-hover module-list">
		<tr <?php if($module_id) {echo 'style="display:none;"';} ?>>
		<td><?php echo $lang['entry_add_module']; ?></td>
		<td><input type="checkbox" name="add_module" value="1" /></td>
        </tr>
		<tr>
        <td><span class="required">*</span><?php echo $lang['entry_module_name']; ?></td>
        <td><input type="text" name="name" value="<?php if(isset($name)) { echo $name; } ?>" /></td>
        </tr>
		<tr>
            <td><span class="required">*</span><?php echo $lang['entry_module_customtitle']; ?></td>
            <td>
			<?php foreach ($languages as $language) { ?>
			<div style="min-width:180px;overflow:auto;margin:0 0 3px 0;">
			<img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" alt="" style="vertical-align:top;" />
            <input type="text" name="news_module[<?php echo $language['language_id']; ?>][title]" value="<?php if(isset($news_module[$language['language_id']]['title'])) {echo $news_module[$language['language_id']]['title'];} ?>" placeholder="Пример: Наши новости" />
            </div>
			<?php } ?>
			</td>
          </tr>
          <tr>
            <td><span class="required">*</span><?php echo $lang['entry_module_heading']; ?></td>
            <td><input type="checkbox" name="news_module[heading]" value="1" <?php if (isset($news_module['heading'])) { ?>checked="checked"<?php } ?> /></td>
          </tr>
		<tr>
		<td><span class="required">*</span><?php echo $lang['entry_module_limit']; ?></td>
		<td><input type="text" name="news_module[limit]" value="<?php if(isset($news_module['limit'])) { echo $news_module['limit']; } ?>" tyle="width:30px !important; text-align:center;" /></td>
		</tr>
		<tr>
		<td><span class="required">*</span><?php echo $lang['entry_module_numchars']; ?></td>
        <td><input type="text" name="news_module[numchars]" value="<?php if(isset($news_module['numchars'])) { echo $news_module['numchars']; } ?>" style="width:40px !important; text-align:center;" /> &nbsp; символов</td>
		</tr>
		<tr>
            <td><span class="required">*</span><?php echo $lang['entry_module_thumb']; ?></td>
            <td>
              <input type="text" name="news_module[thumb_width]" value="<?php if(isset($news_module['thumb_width'])) { echo $news_module['thumb_width']; } ?>" style="width:40px !important; text-align:center;" />
              <input type="text" name="news_module[thumb_height]" value="<?php if(isset($news_module['thumb_height'])) { echo $news_module['thumb_height']; } ?>" style="width:40px !important; text-align:center;" /> &nbsp; пикселей
              <?php if ($error_newspage_thumb) { ?>
                <span class="error"><?php echo $error_newspage_thumb; ?></span>
              <?php } ?>
            </td>
          </tr>
		<tr>
            <td><b><?php echo $lang['entry_module_status']; ?></b></td>
            <td>
              <select name="status">
                <?php if ($status) { ?>
                <option value="1" selected="selected"><?php echo $lang['text_enabled']; ?></option>
                <option value="0"><?php echo $lang['text_disabled']; ?></option>
                <?php } else { ?>
                <option value="1"><?php echo $lang['text_enabled']; ?></option>
                <option value="0" selected="selected"><?php echo $lang['text_disabled']; ?></option>
                <?php } ?>
              </select>
            </td>
          </tr>
        </table>
		</div>
      </form>
    </div>
	
	
	
	
	
</div>
</div>
</div>
</div>
<?php echo $footer; ?>