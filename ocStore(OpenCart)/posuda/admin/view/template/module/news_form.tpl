<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
		<a onclick="$('#form').submit();" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></a>
       <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a>
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
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-pencil"></i> Создание/редактирование новости</h3>
      </div>
      <div class="panel-body">
    <div class="content">
<style>
table {width:100%}
table tr td {padding:7px 4px}
table tr td:nth-child(1) {width:220px;max-width:220px}
table tr td + td {padding:7px 0 7px 10px}
table tr:nth-child(2n) {background: #f4f4f4;}
</style>
      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
        <div id="tab-language">
          <ul class="nav nav-tabs">
            <?php foreach ($languages as $language) { ?>
			<li><a href="#language<?php echo $language['language_id']; ?>" data-toggle="tab"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a></li>
            <?php } ?>
          </ul>
		  <div class="tab-content">
          <?php foreach ($languages as $language) { ?>
		  
            <div id="language<?php echo $language['language_id']; ?>" class="tab-pane">
              <table class="form">
                <tr>
                  <td><span class="required">*</span> <?php echo $entry_title; ?></td>
                  <td><input name="news_description[<?php echo $language['language_id']; ?>][title]" size="80" value="<?php echo isset($news_description[$language['language_id']]) ? $news_description[$language['language_id']]['title'] : ''; ?>" />
                    <?php if (isset($error_title[$language['language_id']])) { ?>
                      <span class="error"><?php echo $error_title[$language['language_id']]; ?></span>
                    <?php } ?>
                  </td>
                </tr>
                <tr>
                  <td><?php echo $entry_meta_description; ?></td>
                  <td><textarea name="news_description[<?php echo $language['language_id']; ?>][meta_description]" cols="40" rows="5"><?php echo isset($news_description[$language['language_id']]) ? $news_description[$language['language_id']]['meta_description'] : ''; ?></textarea></td>
                </tr>
                <tr>
                  <td><span class="required">*</span> <?php echo $entry_description; ?></td>
                  <td><textarea name="news_description[<?php echo $language['language_id']; ?>][description]" id="description<?php echo $language['language_id']; ?>"><?php echo isset($news_description[$language['language_id']]) ? $news_description[$language['language_id']]['description'] : ''; ?></textarea>
                    <?php if (isset($error_description[$language['language_id']])) { ?>
                      <span class="error"><?php echo $error_description[$language['language_id']]; ?></span>
                    <?php } ?>
                  </td>
                </tr>
              </table>
            </div>		
          <?php } ?>
		  </div>
        </div>
        <div id="tab-setting">
          <table class="form">
            <tr>
              <td><?php echo $entry_store; ?></td>
              <td>
                  <div class="well well-sm" style="height: 150px; overflow: auto;">
                    <div class="checkbox">
                      <label>
                        <?php if (in_array(0, $news_store)) { ?>
                        <input type="checkbox" name="news_store[]" value="0" checked="checked" />
                        <?php echo $text_default; ?>
                        <?php } else { ?>
                        <input type="checkbox" name="news_store[]" value="0" />
                        <?php echo $text_default; ?>
                        <?php } ?>
                      </label>
                    </div>
                    <?php foreach ($stores as $store) { ?>
                    <div class="checkbox">
                      <label>
                        <?php if (in_array($store['store_id'], $news_store)) { ?>
                        <input type="checkbox" name="news_store[]" value="<?php echo $store['store_id']; ?>" checked="checked" />
                        <?php echo $store['name']; ?>
                        <?php } else { ?>
                        <input type="checkbox" name="news_store[]" value="<?php echo $store['store_id']; ?>" />
                        <?php echo $store['name']; ?>
                        <?php } ?>
                      </label>
                    </div>
                    <?php } ?>
                  </div>
              </td>
            </tr>
            <tr>
              <td><?php echo $entry_keyword; ?></td>
              <td><input type="text" name="keyword" value="<?php echo $keyword; ?>" size="40" /></td>
            </tr>
            <tr>
            <td><?php echo $entry_image; ?></td>
            <td>
				<a href="" id="thumb-image" data-toggle="image" class="img-thumbnail"><img src="<?php if($thumb) { echo $thumb; } else { echo $placeholder; } ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a>
				<input type="hidden" name="image" value="<?php echo $image; ?>" id="image" />
			</td>
            </tr>
            <tr style="background:#F8F8F8;">
              <td><?php echo $entry_status; ?></td>
              <td><select name="status">
                <?php if ($status) { ?>
                  <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                  <option value="0"><?php echo $text_disabled; ?></option>
                <?php } else { ?>
                  <option value="1"><?php echo $text_enabled; ?></option>
                  <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                <?php } ?>
              </select></td>
            </tr>
          </table>
        </div>
      </form>
    </div>
  </div>
</div>
<script type="text/javascript"><!--
<?php foreach ($languages as $language) { ?>
<?php if ($ckeditor) { ?>
ckeditorInit('#description<?php echo $language['language_id']; ?>', '<?php echo $token; ?>');
<?php } else { ?>
$('#description<?php echo $language['language_id']; ?>').summernote({
	height: 300,
    lang:'<?php echo $lang; ?>'
});
<?php } ?>
<?php } ?>
//--></script>
<script type="text/javascript"><!--
$('#tab-language a:first').tab('show');
//--></script>

<?php echo $footer; ?>