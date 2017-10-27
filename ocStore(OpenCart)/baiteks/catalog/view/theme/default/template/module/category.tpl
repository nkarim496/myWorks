<?php if($this->config->get('themer_left_right_column_categories_type')== 1) { ?>   
<div class="box">
  <div class="box-heading"><i class="fa fa-bars"></i> <?php echo $heading_title; ?></div>
  <div class="box-content-category">
    <ul class="box-category">
      <?php foreach ($categories as $category) { ?>
      <li>
        <?php if ($category['category_id'] == $category_id) { ?>
        <a href="<?php echo $category['href']; ?>" class="active"><?php echo $category['name']; ?></a>
        <?php } else { ?>
        <a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a>
        <?php } ?>
        <?php if ($category['children']) { ?>
        <ul>
          <?php foreach ($category['children'] as $child) { ?>
          <li>
            <?php if ($child['category_id'] == $child_id) { ?>
            <a href="<?php echo $child['href']; ?>" class="active"><?php echo $child['name']; ?></a>
            <?php } else { ?>
            <a href="<?php echo $child['href']; ?>"><?php echo $child['name']; ?></a>
            <?php } ?>
          </li>
          <?php } ?>
        </ul>
        <?php } ?>
      </li>
      <?php } ?>
    </ul>
  </div>
</div>
<?php } ?>
<?php if($this->config->get('themer_left_right_column_categories_type')== 0) { ?> 
<script type="text/javascript">
$(document).ready(function() {
  $('#accordion-1').dcAccordion({
    disableLink: false, 
    menuClose: false,
    autoClose: true,
    autoExpand: true,   
    saveState: false
  });
});
</script>
<div class="box">
  <div class="box-heading"><i class="fa fa-bars"></i> <?php echo $heading_title; ?></div>
  <div class="box-content-category">
      <ul class="accordion" id="accordion-1">
        <?php foreach ($categories as $category) { ?>
        <li>
          <?php if ($category['category_id'] == $category_id) { ?>
          <a href="<?php echo $category['href']; ?>" class="active"><?php echo $category['name']; ?></a><div class="dcjq-icon">&nbsp;&nbsp;&nbsp;</div>
          <?php } else if($category['children']) { ?>
          <a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a><div class="dcjq-icon">&nbsp;&nbsp;&nbsp;</div>
          <?php } else { ?>
          <a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a>
          <?php } ?>
          <?php if ($category['children']) { ?>
          <ul>
            <?php foreach ($category['children'] as $child) { ?>
            <li>
              <?php if ($child['category_id'] == $child_id) { ?>
              <a href="<?php echo $child['href']; ?>" class="active"><?php echo $child['name']; ?></a>
              <?php } else { ?>
              <a href="<?php echo $child['href']; ?>"><?php echo $child['name']; ?></a>
              <?php } ?>
            </li>
            <?php } ?>
          </ul>
          <?php } ?>
        </li>
        <?php } ?>
      </ul>
  </div>
</div>
<?php } ?>