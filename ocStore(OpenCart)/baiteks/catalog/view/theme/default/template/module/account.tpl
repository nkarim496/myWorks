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
      <li><a href="<?php echo $address; ?>"><i id="retinaicon" class="fa fa-columns"></i><?php echo $text_address; ?></a></li>
      <li><a href="<?php echo $wishlist; ?>"><i id="retinaicon" class="fa fa-star"></i><?php echo $text_wishlist; ?></a></li>
      <li><a href="<?php echo $order; ?>"><i id="retinaicon" class="fa fa-folder-open"></i><?php echo $text_order; ?></a></li>
      <li><a href="<?php echo $download; ?>"><i id="retinaicon" class="fa fa-download"></i><?php echo $text_download; ?></a></li>
      <li><a href="<?php echo $return; ?>"><i id="retinaicon" class="fa fa-mail-reply-all"></i><?php echo $text_return; ?></a></li>
      <li><a href="<?php echo $transaction; ?>"><i id="retinaicon" class="fa fa-money"></i><?php echo $text_transaction; ?></a></li>
      <li><a href="<?php echo $newsletter; ?>"><i id="retinaicon" class="fa fa-envelope"></i><?php echo $text_newsletter; ?></a></li>
      <?php if ($logged) { ?>
      <li><a href="<?php echo $logout; ?>"><i id="retinaicon" class="fa fa-times-circle"></i><?php echo $text_logout; ?></a></li>
      <?php } ?>
    </ul>
  </div>
</div>
