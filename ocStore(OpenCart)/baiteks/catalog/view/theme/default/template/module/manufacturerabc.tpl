<?php ?>
<div class="box">
  <div class="box-heading"><span><?php echo $heading_title; ?></span></div>
  <div class="box-content">
  
<?php foreach ($categories as $category) { ?>
    <a class="abc-a" href="<?php echo $href; ?>#<?php echo $category['name']; ?>"><b><?php echo $category['name']; ?></b></a>
    <?php } ?>
  
  </div>
</div>
