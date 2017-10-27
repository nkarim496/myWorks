<?php echo $header; ?><?php echo $column_left; ?><?php echo $column_right; ?>
<?php if ($column_left && $column_right) { ?>
	<?php $class = 'col-sm-4'; ?>
<?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-8 col-md-8 col-lg-9'; ?>
<?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
<?php } ?>
<div id="content" class="<?php echo $class; ?>">
	<?php echo $content_top; ?>
</div>

<div class="home_bottom col-sm-12">
<?php if(isset($home_banner1) && isset($home_banner2) && isset($home_banner3)) { ?>
<div class="home_banners row">
	<div class="col-xs-12 col-sm-4 col-md-4"><div><?php echo $home_banner1; ?></div></div>
	<div class="col-xs-12 col-sm-4 col-md-4"><div><?php echo $home_banner2; ?></div></div>
	<div class="col-xs-12 col-sm-4 col-md-4"><div><?php echo $home_banner3; ?></div></div>
</div>
<?php } ?>
<?php echo $content_bottom; ?>
</div>

<?php echo $footer; ?>