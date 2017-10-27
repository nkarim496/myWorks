<div class="box">
	<div class="box-heading"><i class="fa fa-bars"></i> <?php echo $heading_title; ?></div>
	<div class="box-content box-accordeon"><?php echo $category_accordion; ?></div>
</div>
<script type="text/javascript">
$(document).ready(function() {
	$('#cat_accordion').cutomAccordion({
		classExpand : 'custom_id<?php echo $category_accordion_cid; ?>',
		menuClose: false,
		autoClose: true,
		saveState: false,
		disableLink: false,		
		autoExpand: true
	});
});
</script>
