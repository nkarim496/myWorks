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

  <?php if ($reviews) { ?>
  <div class="product-list">
    <?php foreach ($reviews as $review) { ?>
    <div style="max-width: 552px;">
      <?php if ($review['prod_thumb']) { ?>
      <div class="image"><a href="<?php echo $review['prod_href']; ?>"><img src="<?php echo $review['prod_thumb']; ?>" title="<?php echo $review['prod_name']; ?>" alt="<?php echo $review['prod_name']; ?>" /></a></div>
      <?php } ?>
      <div class="name">
        <?php if ($review['rating']) { ?>
          <span style="margin-right:8px;"><img src="catalog/view/theme/default/image/stars-<?php echo $review['rating']; ?>.png" alt="<?php echo $review['rating']; ?>" /></span>
        <?php } ?>
        <a href="<?php echo $review['prod_href']; ?>"><?php echo $review['prod_name']; ?></a>
      </div>
      <div class="description" style="font-style:italic;"><?php echo $review['description']; ?></div>
      <div style="text-align:right;"><?php echo $review["date_added"];?><span style="font-weight:bold; margin-left:10px;"><?php echo $review["author"];?></span></div>
    </div>
    <?php } ?>
  </div>
  <div class="pagination"><?php echo $pagination; ?></div>
  <?php } else { ?>
  <div class="content"><?php echo $text_empty; ?></div>
  <?php }?>

</div>

  <?php echo $content_bottom; ?></div>
<?php echo $footer; ?>