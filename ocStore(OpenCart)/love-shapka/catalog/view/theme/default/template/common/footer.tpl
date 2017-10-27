<div class="wave"></div>
<footer>
  <div class="foot-wrap">
    <div class="container">
      <div class="row">
        <?php if ($informations) { ?>
        <div class="col-sm-3">
          <h5><?php echo $text_information; ?></h5>
          <ul class="list-unstyled">
            <?php foreach ($informations as $information) { ?>
            <li><a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a></li>
            <?php } ?>
          </ul>
        </div>
        <?php } ?>
        <div class="col-sm-3">
          <h5>О производителе</h5>
          <ul class="list-unstyled">
            <li>Брэнд “Любимая шапка”.<br/>
                ИП Каппушева Фатима Сафаровна<br/>
                ОГРНИП: 314091709700027
            </li>
          </ul>
        </div>
        <div class="col-sm-3">
          <h5><?php echo $text_account; ?></h5>
          <ul class="list-unstyled">
            <li><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
            <li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
            <li><a href="<?php echo $wishlist; ?>"><?php echo $text_wishlist; ?></a></li>
            <li><a href="<?php echo $newsletter; ?>"><?php echo $text_newsletter; ?></a></li>
          </ul>
        </div>
        <div class="col-sm-3">
          <h5>Контакты</h5>
          <ul class="list-unstyled foot-con">
            <li><i class="fa fa-phone" aria-hidden="true"></i>+7 (928) 032 04 00</li>
            <li class="f-email"><i class="fa fa-globe" aria-hidden="true"></i>lubimaya.shapka@gmail.com</li>
            <li><i class="fa fa-map-marker" aria-hidden="true"></i><p>г.Черкесск,<br/>ул.Воробьева 29</p></li>
          </ul>
        </div>
      </div>
      <hr>
      <p>г. Черкесск 2016. © Все права защищены.<br/>
Сделано в АРИС</p>
    </div>
  </div>
</footer>

<!--
OpenCart is open source software and you are free to remove the powered by OpenCart if you want, but its generally accepted practise to make a small donation.
Please donate via PayPal to donate@opencart.com
//-->

<!-- Theme created by Welford Media for OpenCart 2.0 www.welfordmedia.co.uk -->

</body></html>