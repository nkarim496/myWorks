<?php echo $header; ?>

 <div class="breadcrumb-100">
  <div class="breadcrumb">
      <?php $w_bc_total = count($breadcrumbs); if ($w_bc_total > 0) {
		$w_bc_last = $w_bc_total - 1;
		foreach ($breadcrumbs as $i => $breadcrumb) { ?>
		<?php if ($i == $w_bc_last) { break; } ?>
		<i><span><?php echo $breadcrumb['separator']; ?></span></i><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
       <?php } ?>
       <i><span><?php echo $breadcrumbs[$w_bc_last]['separator']; ?></span></i><?php echo $breadcrumbs[$w_bc_last]['text']; ?><?php } ?>
  </div>
 </div>

<?php echo $column_left; ?><?php echo $column_right; ?>
<div id="content"><?php echo $content_top; ?>

<div class="category-details">

<div class="category-details-top"><div class="category-h1"><h1><?php echo $heading_title; ?></h1></div></div>

  <?php if ($returns) { ?>
  <?php foreach ($returns as $return) { ?>
  <div class="return-list">
    <div class="return-id"><b><?php echo $text_return_id; ?></b> #<?php echo $return['return_id']; ?></div>
    <div class="return-status"><b><?php echo $text_status; ?></b> <?php echo $return['status']; ?></div>
    <div class="return-content">
      <div><b><?php echo $text_date_added; ?></b> <?php echo $return['date_added']; ?><br />
        <b><?php echo $text_order_id; ?></b> <?php echo $return['order_id']; ?></div>
      <div><b><?php echo $text_customer; ?></b> <?php echo $return['name']; ?></div>
      <div class="return-info"><a href="<?php echo $return['href']; ?>"><img src="catalog/view/theme/default/image/info.png" alt="<?php echo $button_view; ?>" title="<?php echo $button_view; ?>" /></a></div>
    </div>
  </div>
  <?php } ?>
  <div class="pagination"><?php echo $pagination; ?></div>
  <?php } else { ?>
  <div class="content"><?php echo $text_empty; ?></div>
  <?php } ?>
  <div class="buttons">
    <div class="right"><a href="<?php echo $continue; ?>" class="button"><?php echo $button_continue; ?></a></div>
  </div>

</div>

  <?php echo $content_bottom; ?></div>
<?php echo $footer; ?>