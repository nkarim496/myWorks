<div class="box">
  <div class="box-heading"><?php echo $heading_title; ?></div>
  <div class="box-content">
    <ul class="box-category category_sidebar">
      <?php foreach ($categories as $key => $category) { ?>
      <li <?php if($key > ($show_cat_items-1)) { ?>class="hidden"<?php } ?>>
        <?php if ($category['category_id'] == $category_id) { ?>
			<a href="<?php echo $category['href']; ?>" class="active"><i class="fa fa-chevron-right"></i><?php echo $category['name']; ?></a>
			<?php if ($category['children']) { ?>
				<i class="fa fa-chevron-down"></i>
			<?php } ?>
        <?php } else { ?>
			<a href="<?php echo $category['href']; ?>"><i class="fa fa-chevron-right"></i><?php echo $category['name']; ?></a>
			<?php if ($category['children']) { ?>
				<i class="fa fa-chevron-down"></i>
			<?php } ?>
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
	  <?php if($key > ($show_cat_items-1)) { ?>
	  <li class="five"><i class="fa fa-angle-double-down"></i></li>
	  <?php } ?>
    </ul>
  </div>
</div>
