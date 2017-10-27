<div class="box">
  <div class="box-heading"><?php echo $heading_title; ?></div>
  <div class="box-content">
    <ul class="box-category">
      <?php if (!$logged) { ?>
      <li><a class="loginregister" href="<?php echo $login; ?>"><i id="retinaicon" class="fa fa-unlock"></i><?php echo $text_login; ?></a> / <a class="loginregister" href="<?php echo $register; ?>"><?php echo $text_register; ?></a></li>
      <li><a href="<?php echo $forgotten; ?>"><i id="retinaicon" class="fa fa-question"></i><?php echo $text_forgotten; ?></a></li>
      <?php } ?>
      <li><a href="<?php echo $account; ?>"><i id="retinaicon" class="fa fa-info"></i><?php echo $text_account; ?></a></li>
      <?php if ($logged) { ?>
      <li><a href="<?php echo $edit; ?>"><i id="retinaicon" class="fa fa-keyboard-o"></i><?php echo $text_edit; ?></a></li>
      <li><a href="<?php echo $password; ?>"><i id="retinaicon" class="fa fa-lock"></i><?php echo $text_password; ?></a></li>
      <?php } ?>
      <li><a href="<?php echo $payment; ?>"><i id="retinaicon" class="fa fa-money"></i><?php echo $text_payment; ?></a></li>
      <li><a href="<?php echo $tracking; ?>"><i id="retinaicon" class="fa fa-barcode"></i><?php echo $text_tracking; ?></a></li>
      <li><a href="<?php echo $transaction; ?>"><i id="retinaicon" class="fa fa-files-o"></i><?php echo $text_transaction; ?></a></li>
      <?php if ($logged) { ?>
      <li><a href="<?php echo $logout; ?>"><i id="retinaicon" class="fa fa-times-circle"></i><?php echo $text_logout; ?></a></li>
      <?php } ?>
    </ul>
  </div>
</div>
