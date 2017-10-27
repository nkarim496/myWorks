<div id="footer">
<img id="pic-vertu" src="image/vertu.png">
  
  
  <!--<div class="column">
  <h3><?php echo $powered; ?></h3>
  <p> Адрес: г. Москва, ул. Барклая 8, пав. 126.<br/>
		Все права защищены.<br/>
		
	</p>
  </div>-->
  <?php if ($informations) { ?>
  <div class="column">
    <!--<h3><?php echo $text_information; ?></h3>-->
    <ul>
      <?php foreach ($informations as $information) { ?>
      <li><a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a></li>
      <?php } ?>
	  <li><a href="<?php echo $sitemap; ?>"><?php echo $text_sitemap; ?></a></li>
	  <li><a href="<?php echo $special; ?>"><?php echo $text_special; ?></a></li>
    </ul>
	<p>
	Copyright © 2014, All rights reserved. Копирование материалов сайта запрещено. 
Интернет-сайт носит исключительно информационный характер и ни при каких условиях не является публичной офертой (ст.437 ГК РФ).<br/><br/>
Kupi-vertu.ru. Москва, ул. Барклая 8, пав. 126.
	</p>
  </div> 
  <?php } ?>
  <div class="column right">
	<a href="mailto:info@kupivertu.ru">info@kupivertu.ru</a><br/>
	<span class="phone">+7(929) 992-77-77</span>
  
  </div>
  
  
  
</div>
<!--
OpenCart is open source software and you are free to remove the powered by OpenCart if you want, but its generally accepted practise to make a small donation.
Please donate via PayPal to donate@opencart.com
//-->

<!--
OpenCart is open source software and you are free to remove the powered by OpenCart if you want, but its generally accepted practise to make a small donation.
Please donate via PayPal to donate@opencart.com
//-->
</div>

</body></html>