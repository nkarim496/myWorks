<?php echo $header; ?>
<?php if($this->config->get('themer_shadow') == 'on') { ?>
<style type="text/css">
.header-100 {
	box-shadow: 0px 7px 20px -10px rgba(0, 0, 0, 0.506);
	-moz-box-shadow: 0px 7px 20px -10px rgba(0, 0, 0, 0.506);
	-webkit-box-shadow: 0px 7px 20px -10px rgba(0, 0, 0, 0.506);
} 
</style>
<?php } ?>
<?php echo $column_left; ?><?php echo $column_right; ?>

<div id="content"><?php echo $content_top; ?>
<div><?php echo $content_bottom; ?></div>
</div>

<?php echo $footer; ?>