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

  <h2><?php echo $text_my_account; ?></h2>
  <div class="content">
    <ul>
      <li><i id="retinaicon2" class="fa fa-keyboard-o"></i><a href="<?php echo $edit; ?>"><?php echo $text_edit; ?></a></li>
      <li><i id="retinaicon2" class="fa fa-lock"></i><a href="<?php echo $password; ?>"><?php echo $text_password; ?></a></li>
      <li><i id="retinaicon2" class="fa  fa-money"></i><a href="<?php echo $payment; ?>"><?php echo $text_payment; ?></a></li>
    </ul>
  </div>
  <h2><?php echo $text_my_tracking; ?></h2>
  <div class="content">
    <ul>
      <li><i id="retinaicon2" class="fa fa-barcode"></i><a href="<?php echo $tracking; ?>"><?php echo $text_tracking; ?></a></li>
    </ul>
  </div>
  <h2><?php echo $text_my_transactions; ?></h2>
  <div class="content">
    <ul>
      <li><i id="retinaicon2" class="fa fa-files-o"></i><a href="<?php echo $transaction; ?>"><?php echo $text_transaction; ?></a></li>
    </ul>
  </div>

</div>

  <?php echo $content_bottom; ?>

<?php if ($success) { ?>
<div class="success"><?php echo $success; ?><img src="catalog/view/theme/default/image/close.png" alt="" class="close" /></div>
<?php } ?>

</div>
<?php echo $footer; ?>