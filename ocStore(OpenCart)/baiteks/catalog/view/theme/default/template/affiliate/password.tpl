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

  <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
    <h2><?php echo $text_password; ?></h2>
    <div class="content">
      <table class="form">
        <tr>
          <td><span class="required">*</span> <?php echo $entry_password; ?></td>
          <td><input type="password" name="password" value="<?php echo $password; ?>" />
            <?php if ($error_password) { ?>
            <span class="error"><?php echo $error_password; ?></span>
            <?php } ?></td>
        </tr>
        <tr>
          <td><span class="required">*</span> <?php echo $entry_confirm; ?></td>
          <td><input type="password" name="confirm" value="<?php echo $confirm; ?>" />
            <?php if ($error_confirm) { ?>
            <span class="error"><?php echo $error_confirm; ?></span>
            <?php } ?></td>
        </tr>
      </table>
    </div>
    <div class="buttons">
      <div class="left"><a href="<?php echo $back; ?>" class="button"><?php echo $button_back; ?></a></div>
      <div class="right"><input type="submit" value="<?php echo $button_continue; ?>" class="button" /></div>
    </div>
  </form>

</div>

  <?php echo $content_bottom; ?></div>
<?php echo $footer; ?>