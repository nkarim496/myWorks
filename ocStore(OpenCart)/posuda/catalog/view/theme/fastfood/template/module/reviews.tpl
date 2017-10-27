<div class="box">
  <?php if ($header) {?>
  <div class="box-heading"><?php echo $header; ?></div>
  <?php }?>
  <div class="box-content">
    <div class="box-product">
      <?php foreach ($reviews as $review) { ?>
      <div>
        <?php if ($review['product_id']) {?>
          <?php if ($review['prod_thumb']) { ?>
          <div class="image" style="float:left;"><a href="<?php echo $review['prod_href']; ?>"><img src="<?php echo $review['prod_thumb']; ?>" alt="<?php echo $review['prod_name']; ?>" title="<?php echo $review['prod_name']; ?>"/></a></div>
          <?php } ?>
          <div class="name" style="text-align:center;"><a href="<?php echo $review['prod_href']; ?>"><?php echo $review['prod_name']; ?></a></div>
          <?php }?>
        <div class="rating" style="text-align:center;"><img src="catalog/view/theme/default/image/stars-<?php echo $review['rating']; ?>.png"/></div>
      </div>
      <div style="margin:0px;width:100%;"><?php echo $review['description']?> <a href="<?php echo $review['href']?>">...&raquo;</a></div>
      <div style="margin-bottom:20px;margin-right:0px;font-style:italic;font-weight:bold;text-align:right;width:100%;"><?php echo $review['author']?></div>
      <?php } ?>
      <a href="<?php echo $link_all_reviews; ?>" class="button"><?php echo $text_all_reviews;?></a>
    </div>
  </div>
</div>
