<?php $lang = $this->language->get('code'); ?>

</div>

<div class="footer-100">
<div id="footer">

  <div class="column">
    <h6><?php echo $text_account; ?></h6>
    <ul>
      <li><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
      <li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
      <li><a href="<?php echo $wishlist; ?>"><?php echo $text_wishlist; ?></a></li>
      <li><a href="<?php echo $return; ?>"><?php echo $text_return; ?></a></li>
      <li><a href="<?php echo $newsletter; ?>"><?php echo $text_newsletter; ?></a></li>
    </ul>
  </div>

  <?php if ($informations) { ?>
  <div class="column">
    <h6><?php echo $text_information; ?></h6>
    <ul>
      <?php foreach ($informations as $information) { ?>
      <li><a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a></li>
      <?php } ?>
      <li><a href="<?php echo $contact; ?>"><?php echo $text_contact; ?></a></li>
    </ul>
  </div>
  <?php } ?>

  <div class="column">
    <h6><?php echo $text_extra; ?></h6>
    <ul>
      <li><a href="<?php echo $manufacturer; ?>"><?php echo $text_manufacturer; ?></a></li>
      <li><a href="<?php echo $voucher; ?>"><?php echo $text_voucher; ?></a></li>
      <li><a href="<?php echo $affiliate; ?>"><?php echo $text_affiliate; ?></a></li>
      <li><a href="<?php echo $sitemap; ?>"><?php echo $text_sitemap; ?></a></li>
      <li><a href="<?php echo $special; ?>"><?php echo $text_special; ?></a></li>
    </ul>
  </div>

  <div class="column">
    <h6><?php echo $text_contact; ?></h6>
     <table style="border-collapse: collapse;" border="0">

     <?php if ($this->config->get('themer_phone_number')) {?> 
     <tr><td><i title="Phone" class="fa fa-phone"></i></td><td><a href="tel:<?php echo $this->config->get('themer_phone_number'); ?>"><?php echo $this->config->get('themer_phone_number'); ?></a></td></tr> 
     <?php } ?>

     <?php if ($this->config->get('themer_mobile_phone_number')) {?> 
     <tr><td><i title="Mobile" class="fa fa-mobile"></i></td><td><a href="tel:<?php echo $this->config->get('themer_mobile_phone_number'); ?>"><?php echo $this->config->get('themer_mobile_phone_number'); ?></a></td></tr> 
     <?php } ?>

     <?php if ($this->config->get('themer_fax_number')) {?> 
     <tr><td><i title="Fax" class="fa fa-print"></i></td><td><a href="tel:<?php echo $this->config->get('themer_fax_number'); ?>"><?php echo $this->config->get('themer_fax_number'); ?></a></td></tr> 
     <?php } ?>

     <?php if ($this->config->get('themer_working_hours'.$lang)) {?> 
     <tr><td><i title="Work Time" class="fa fa-clock-o"></i></td><td><?php echo $this->config->get('themer_working_hours'.$lang); ?></td></tr> 
     <?php } ?>

     <?php if ($this->config->get('themer_email')) {?> 
     <tr><td><i title="Email" class="fa fa-envelope-o"></i></td><td><a href="mailto:<?php echo $this->config->get('themer_email'); ?>"><?php echo $this->config->get('themer_email'); ?></a></td></tr> 
     <?php } ?>

     <?php if ($this->config->get('themer_address'.$lang)) {?> 
     <tr><td><i title="Map" class="fa fa-globe"></i></td><td><a href="<?php echo $contact; ?>"><?php echo $this->config->get('themer_address'.$lang); ?></a></td></tr> 
     <?php } ?>

     <?php if ($this->config->get('themer_skype')) {?> 
     <tr><td><i title="Skype" class="fa fa-skype"></i></td><td><a href="skype:<?php echo $this->config->get('themer_skype'); ?>?call"><?php echo $this->config->get('themer_skype'); ?></a></td></tr> 
     <?php } ?>

     </table>
  </div>

</div>
</div>
<?php 
$flag = false;

$social_networks = array(
	'themer_facebook',
	'themer_twitter',
	'themer_google_plus',
	'themer_youtube',
	'themer_vimeo',
	'themer_vk',
	'themer_pinterest',
	'themer_tumblr',
	'themer_odnoklassniki',
	'themer_myworld',
	'themer_instagram'
);

foreach ($social_networks as $social) {
  if($this->config->get($social)) {
    $flag = true;
  }
}

if($flag) { 
?>
<div class="social-100">
  <div id="social">
  <?php if ($this->config->get('themer_facebook')) {?><a href="<?php echo $this->config->get('themer_facebook'); ?>"><i title="facebook" class="fa fa-facebook-square"></i></a> <?php } ?>
  <?php if ($this->config->get('themer_twitter')) {?><a href="<?php echo $this->config->get('themer_twitter'); ?>"><i title="twitter" class="fa fa-twitter-square"></i></a> <?php } ?>
  <?php if ($this->config->get('themer_vimeo')) {?><a href="<?php echo $this->config->get('themer_vimeo'); ?>"><i title="vimeo" class="fa fa-vimeo-square"></i></a> <?php } ?>
  <?php if ($this->config->get('themer_google_plus')) {?><a href="<?php echo $this->config->get('themer_google_plus'); ?>"><i title="google-plus" class="fa fa-google-plus-square"></i></a> <?php } ?>
  <?php if ($this->config->get('themer_youtube')) {?><a href="<?php echo $this->config->get('themer_youtube'); ?>"><i title="youtube" class="fa fa-youtube-square"></i></a> <?php } ?>
  <?php if ($this->config->get('themer_vk')) {?><a href="<?php echo $this->config->get('themer_vk'); ?>"><i title="vk" class="fa fa-vk"></i></a> <?php } ?>
  <?php if ($this->config->get('themer_pinterest')) {?><a href="<?php echo $this->config->get('themer_pinterest'); ?>"><i title="twitter" class="fa fa-pinterest-square"></i></a> <?php } ?>
  <?php if ($this->config->get('themer_tumblr')) {?><a href="<?php echo $this->config->get('themer_tumblr'); ?>"><i title="tumblr" class="fa fa-tumblr-square"></i></i></a> <?php } ?>
  <?php if ($this->config->get('themer_myworld')) {?><a href="<?php echo $this->config->get('themer_myworld'); ?>"><i title="MyWorld (Mail.ru)" class="myworld"></i></a> <?php } ?>
  <?php if ($this->config->get('themer_odnoklassniki')) {?><a href="<?php echo $this->config->get('themer_odnoklassniki'); ?>"><i title="Odnoklassniki" class="odnoklassniki"></i></a> <?php } ?>
  <?php if ($this->config->get('themer_instagram')) {?><a href="<?php echo $this->config->get('themer_instagram'); ?>"><i title="instagram" class="fa fa-instagram"></i></a> <?php } ?>
  </div>
</div>
<?php } ?>

<div class="powered-100"><div id="powered">
<p class="powered_powered"><?php echo $powered; ?></p>
<p class="powered_oplata">
<?php if ($this->config->get('themer_alfabank') == 'on') {?> <a target="_blank" href="<?php echo $this->config->get('themer_custom_payment_s1_url'); ?>"><img title="alfabank" src="catalog/view/theme/default/image/payment/alfabank.png"></a><?php } ?>
<?php if ($this->config->get('themer_maestro') == 'on') {?> <a target="_blank" href="<?php echo $this->config->get('themer_custom_payment_s2_url'); ?>"><img title="maestro" src="catalog/view/theme/default/image/payment/maestro.png"></a><?php } ?>
<?php if ($this->config->get('themer_robokassa2') == 'on') {?> <a target="_blank" href="<?php echo $this->config->get('themer_custom_payment_s3_url'); ?>"><img title="robokassa2" src="catalog/view/theme/default/image/payment/robokassa2.png"></a><?php } ?>
<?php if ($this->config->get('themer_american_express') == 'on') {?> <a target="_blank" href="<?php echo $this->config->get('themer_custom_payment_s4_url'); ?>"><img title="american_express" src="catalog/view/theme/default/image/payment/american_express.png"></a><?php } ?>
<?php if ($this->config->get('themer_mail_money') == 'on') {?> <a target="_blank" href="<?php echo $this->config->get('themer_custom_payment_s5_url'); ?>"><img title="mail_money" src="catalog/view/theme/default/image/payment/mail_money.png"></a><?php } ?>
<?php if ($this->config->get('themer_robokassa') == 'on') {?> <a target="_blank" href="<?php echo $this->config->get('themer_custom_payment_s6_url'); ?>"><img title="robokassa" src="catalog/view/theme/default/image/payment/robokassa.png"></a><?php } ?>
<?php if ($this->config->get('themer_assist') == 'on') {?> <a target="_blank" href="<?php echo $this->config->get('themer_custom_payment_s7_url'); ?>"><img title="assist" src="catalog/view/theme/default/image/payment/assist.png"></a><?php } ?>
<?php if ($this->config->get('themer_mastercard') == 'on') {?> <a target="_blank" href="<?php echo $this->config->get('themer_custom_payment_s8_url'); ?>"><img title="mastercard" src="catalog/view/theme/default/image/payment/mastercard.png"></a><?php } ?>
<?php if ($this->config->get('themer_sberbank') == 'on') {?> <a target="_blank" href="<?php echo $this->config->get('themer_custom_payment_s9_url'); ?>"><img title="sberbank" src="catalog/view/theme/default/image/payment/sberbank.png"></a><?php } ?>
<?php if ($this->config->get('themer_chronopay') == 'on') {?> <a target="_blank" href="<?php echo $this->config->get('themer_custom_payment_s10_url'); ?>"><img title="chronopay" src="catalog/view/theme/default/image/payment/chronopay.png"></a><?php } ?>
<?php if ($this->config->get('themer_migom') == 'on') {?> <a target="_blank" href="<?php echo $this->config->get('themer_custom_payment_s11_url'); ?>"><img title="migom" src="catalog/view/theme/default/image/payment/migom.png"></a><?php } ?>
<?php if ($this->config->get('themer_skrill_moneybookers') == 'on') {?> <a target="_blank" href="<?php echo $this->config->get('themer_custom_payment_s12_url'); ?>"><img title="skrill_moneybookers" src="catalog/view/theme/default/image/payment/skrill_moneybookers.png"></a><?php } ?>
<?php if ($this->config->get('themer_cirrus') == 'on') {?> <a target="_blank" href="<?php echo $this->config->get('themer_custom_payment_s13_url'); ?>"><img title="cirrus" src="catalog/view/theme/default/image/payment/cirrus.png"></a><?php } ?>
<?php if ($this->config->get('themer_moneymail') == 'on') {?> <a target="_blank" href="<?php echo $this->config->get('themer_custom_payment_s14_url'); ?>"><img title="moneymail" src="catalog/view/theme/default/image/payment/moneymail.png"></a><?php } ?>
<?php if ($this->config->get('themer_telemoney') == 'on') {?> <a target="_blank" href="<?php echo $this->config->get('themer_custom_payment_s15_url'); ?>"><img title="telemoney" src="catalog/view/theme/default/image/payment/telemoney.png"></a><?php } ?>
<?php if ($this->config->get('themer_contact') == 'on') {?> <a target="_blank" href="<?php echo $this->config->get('themer_custom_payment_s16_url'); ?>"><img title="contact" src="catalog/view/theme/default/image/payment/contact.png"></a><?php } ?>
<?php if ($this->config->get('themer_mts_bank') == 'on') {?> <a target="_blank" href="<?php echo $this->config->get('themer_custom_payment_s17_url'); ?>"><img title="mts_bank" src="catalog/view/theme/default/image/payment/mts_bank.png"></a><?php } ?>
<?php if ($this->config->get('themer_unistream') == 'on') {?> <a target="_blank" href="<?php echo $this->config->get('themer_custom_payment_s18_url'); ?>"><img title="unistream" src="catalog/view/theme/default/image/payment/unistream.png"></a><?php } ?>
<?php if ($this->config->get('themer_diners_club') == 'on') {?> <a target="_blank" href="<?php echo $this->config->get('themer_custom_payment_s19_url'); ?>"><img title="diners_club" src="catalog/view/theme/default/image/payment/diners_club.png"></a><?php } ?>
<?php if ($this->config->get('themer_paypal') == 'on') {?> <a target="_blank" href="<?php echo $this->config->get('themer_custom_payment_s20_url'); ?>"><img title="paypal" src="catalog/view/theme/default/image/payment/paypal.png"></a><?php } ?>
<?php if ($this->config->get('themer_visa') == 'on') {?> <a target="_blank" href="<?php echo $this->config->get('themer_custom_payment_s21_url'); ?>"><img title="visa" src="catalog/view/theme/default/image/payment/visa.png"></a><?php } ?>
<?php if ($this->config->get('themer_elecsnet') == 'on') {?> <a target="_blank" href="<?php echo $this->config->get('themer_custom_payment_s22_url'); ?>"><img title="elecsnet" src="catalog/view/theme/default/image/payment/elecsnet.png"></a><?php } ?>
<?php if ($this->config->get('themer_payu') == 'on') {?> <a target="_blank" href="<?php echo $this->config->get('themer_custom_payment_s23_url'); ?>"><img title="payu" src="catalog/view/theme/default/image/payment/payu.png"></a><?php } ?>
<?php if ($this->config->get('themer_webmoney') == 'on') {?> <ahref="<?php echo $this->config->get('themer_custom_payment_s24_url'); ?>"><img title="webmoney" src="catalog/view/theme/default/image/payment/webmoney.png"></a><?php } ?>
<?php if ($this->config->get('themer_Intellectmoney') == 'on') {?> <a target="_blank" href="<?php echo $this->config->get('themer_custom_payment_s25_url'); ?>"><img title="Intellectmoney" src="catalog/view/theme/default/image/payment/Intellectmoney.png"></a><?php } ?>
<?php if ($this->config->get('themer_qiwi') == 'on') {?> <a target="_blank" href="<?php echo $this->config->get('themer_custom_payment_s26_url'); ?>"><img title="qiwi" src="catalog/view/theme/default/image/payment/qiwi.png"></a><?php } ?>
<?php if ($this->config->get('themer_western_union') == 'on') {?> <a target="_blank" href="<?php echo $this->config->get('themer_custom_payment_s27_url'); ?>"><img title="western_union" src="catalog/view/theme/default/image/payment/western_union.png"></a><?php } ?>
<?php if ($this->config->get('themer_jcb') == 'on') {?> <a target="_blank" href="<?php echo $this->config->get('themer_custom_payment_s28_url'); ?>"><img title="jcb" src="catalog/view/theme/default/image/payment/jcb.png"></a><?php } ?>
<?php if ($this->config->get('themer_rbk_money') == 'on') {?> <a target="_blank" href="<?php echo $this->config->get('themer_custom_payment_s29_url'); ?>"><img title="rbk_money" src="catalog/view/theme/default/image/payment/rbk_money.png"></a><?php } ?>
<?php if ($this->config->get('themer_yandex_money') == 'on') {?> <a target="_blank" href="<?php echo $this->config->get('themer_custom_payment_s30_url'); ?>"><img title="yandex_money" src="catalog/view/theme/default/image/payment/yandex_money.png"></a><?php } ?>

<!-- custom payments -->
<?php if ($this->config->get('themer_custom_payment_1') == 'on') {?> 
  <a target="_blank" href="<?php echo $this->config->get('themer_custom_payment_1_url'); ?>">
    <img title="<?php echo $this->config->get('themer_custom_payment_1_name'); ?>" src="image/<?php echo $this->config->get('themer_custom_payment_image1'); ?>">
  </a>
<?php } ?>

<?php if ($this->config->get('themer_custom_payment_2') == 'on') {?> 
  <a target="_blank" href="<?php echo $this->config->get('themer_custom_payment_2_url'); ?>">
    <img title="<?php echo $this->config->get('themer_custom_payment_2_name'); ?>" src="image/<?php echo $this->config->get('themer_custom_payment_image2'); ?>">
  </a>
<?php } ?>

<?php if ($this->config->get('themer_custom_payment_3') == 'on') {?> 
  <a target="_blank" href="<?php echo $this->config->get('themer_custom_payment_3_url'); ?>">
    <img title="<?php echo $this->config->get('themer_custom_payment_3_name'); ?>" src="image/<?php echo $this->config->get('themer_custom_payment_image3'); ?>">
  </a>
<?php } ?>

<?php if ($this->config->get('themer_custom_payment_4') == 'on') {?> 
  <a target="_blank" href="<?php echo $this->config->get('themer_custom_payment_4_url'); ?>">
    <img title="<?php echo $this->config->get('themer_custom_payment_4_name'); ?>" src="image/<?php echo $this->config->get('themer_custom_payment_image4'); ?>">
  </a>
<?php } ?>

<?php if ($this->config->get('themer_custom_payment_5') == 'on') {?> 
  <a target="_blank" href="<?php echo $this->config->get('themer_custom_payment_5_url'); ?>">
    <img title="<?php echo $this->config->get('themer_custom_payment_5_name'); ?>" src="image/<?php echo $this->config->get('themer_custom_payment_image5'); ?>">
  </a>
<?php } ?>

<?php if ($this->config->get('themer_custom_payment_6') == 'on') {?> 
  <a target="_blank" href="<?php echo $this->config->get('themer_custom_payment_6_url'); ?>">
    <img title="<?php echo $this->config->get('themer_custom_payment_6_name'); ?>" src="image/<?php echo $this->config->get('themer_custom_payment_image6'); ?>">
  </a>
<?php } ?>

<?php if ($this->config->get('themer_custom_payment_7') == 'on') {?> 
  <a target="_blank" href="<?php echo $this->config->get('themer_custom_payment_7_url'); ?>">
    <img title="<?php echo $this->config->get('themer_custom_payment_7_name'); ?>" src="image/<?php echo $this->config->get('themer_custom_payment_image7'); ?>">
  </a>
<?php } ?>

<?php if ($this->config->get('themer_custom_payment_8') == 'on') {?> 
  <a target="_blank" href="<?php echo $this->config->get('themer_custom_payment_8_url'); ?>">
    <img title="<?php echo $this->config->get('themer_custom_payment_8_name'); ?>" src="image/<?php echo $this->config->get('themer_custom_payment_image8'); ?>">
  </a>
<?php } ?>

<?php if ($this->config->get('themer_custom_payment_9') == 'on') {?> 
  <a target="_blank" href="<?php echo $this->config->get('themer_custom_payment_9_url'); ?>">
    <img title="<?php echo $this->config->get('themer_custom_payment_9_name'); ?>" src="image/<?php echo $this->config->get('themer_custom_payment_image9'); ?>">
  </a>
<?php } ?>

<?php if ($this->config->get('themer_custom_payment_10') == 'on') {?> 
  <a target="_blank" href="<?php echo $this->config->get('themer_custom_payment_10_url'); ?>">
    <img title="<?php echo $this->config->get('themer_custom_payment_10_name'); ?>" src="image/<?php echo $this->config->get('themer_custom_payment_image10'); ?>">
  </a>
<?php } ?>

<?php if ($this->config->get('themer_custom_payment_11') == 'on') {?> 
  <a target="_blank" href="<?php echo $this->config->get('themer_custom_payment_11_url'); ?>">
    <img title="<?php echo $this->config->get('themer_custom_payment_11_name'); ?>" src="image/<?php echo $this->config->get('themer_custom_payment_image11'); ?>">
  </a>
<?php } ?>

<!-- custom payments end -->
</p>
</div></div>

<div style="display: none;"><?php echo htmlspecialchars_decode($this->config->get('themer_counters')); ?></div>

</div>

<a href="#" class="scrollup"><i class="fa fa-angle-up"></i></a>
<script type="text/javascript">
$(document).ready(function(){

$(window).scroll(function(){
if ($(this).scrollTop() > 800) {
$('.scrollup').fadeIn();
} else {
$('.scrollup').fadeOut();
}
});

$('.scrollup').click(function(){
$("html, body").animate({ scrollTop: 0 }, 600);
return false;
});

});
</script>

</body></html>