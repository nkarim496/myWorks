<div class="box">
  <div class="box-heading"><?php echo $heading_title; ?></div>
  <div class="box-content">
    <ul class="box-category">
      <?php if (!$logged) { ?>
      <li><a href="<?php echo $forgotten; ?>"><i class="fa fa-chevron-right"></i><?php echo $text_forgotten; ?></a></li>
      <?php } ?>
      <li><a href="<?php echo $account; ?>"><i class="fa fa-chevron-right"></i><?php echo $text_account; ?></a></li>
      <?php if ($logged) { ?>
      <li></i><a href="<?php echo $edit; ?>"><i class="fa fa-chevron-right"></i>Контактная информация</a></li>
      <li></i><a href="<?php echo $password; ?>"><i class="fa fa-chevron-right"></i><?php echo $text_password; ?></a></li>
      <?php } ?>
      <li></i><a href="<?php echo $address; ?>"><i class="fa fa-chevron-right"></i><?php echo $text_address; ?></a></li>
      <li></i><a href="<?php echo $order; ?>"><i class="fa fa-chevron-right"></i><?php echo $text_order; ?></a></li>
      <li></i><a href="<?php echo $return; ?>"><i class="fa fa-chevron-right"></i><?php echo $text_return; ?></a></li>
      <li></i><a href="<?php echo $transaction; ?>"><i class="fa fa-chevron-right"></i><?php echo $text_transaction; ?></a></li>
      <li></i><a href="<?php echo $newsletter; ?>"><i class="fa fa-chevron-right"></i><?php echo $text_newsletter; ?></a></li>
      <?php if ($logged) { ?>
      <li><a href="<?php echo $logout; ?>"><i class="fa fa-chevron-right"></i><?php echo $text_logout; ?></a></li>
      <?php } ?>
    </ul>
  </div>
</div>