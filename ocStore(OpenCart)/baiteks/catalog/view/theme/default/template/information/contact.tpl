<?php echo $header; ?>
<?php $lang = $this->language->get('code'); ?>

 <div class="breadcrumb-100">
  <div class="breadcrumb">
      <?php $w_bc_total = count($breadcrumbs); if ($w_bc_total > 0) {
		$w_bc_last = $w_bc_total - 1;
		foreach ($breadcrumbs as $i => $breadcrumb) { ?>
		<?php if ($i == $w_bc_last) { break; } ?>
		<i><span><?php echo $breadcrumb['separator']; ?></span></i><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
       <?php } ?>
       <i><span><?php echo $breadcrumbs[$w_bc_last]['separator']; ?></span></i><?php echo $breadcrumbs[$w_bc_last]['text']; ?><?php } ?>
  </div>
 </div>

<?php echo $column_left; ?><?php echo $column_right; ?>
<div id="content"><?php echo $content_top; ?>

<div class="category-details">

<div class="category-details-top"><div class="category-h1"><h1><?php echo $heading_title; ?></h1></div></div>

  <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
    <div class="contact-info">
      <div class="content">
      <div class="left">
	<h2 class="h2ContactUs"> <b><?php echo $text_ourcontacts; ?></b></h2>
        <i title="<?php echo $store; ?>" class="fa fa-hand-o-right fa-lg"></i> <b><?php echo $store; ?></b><br /><br />

        <?php if ($this->config->get('themer_address'.$lang)) {?>  <!-- HERE -->
        <i title="<?php echo $text_address; ?>" class="fa fa-map-marker fa-lg"></i><?php echo $this->config->get('themer_address'.$lang); ?><br /><br />
        <?php } ?>

        <?php if ($this->config->get('themer_phone_number')) {?> 
        <i title="<?php echo $text_telephone; ?>" class="fa fa-phone fa-lg"></i><a href="tel:<?php echo $this->config->get('themer_phone_number'); ?>"><?php echo $this->config->get('themer_phone_number'); ?></a><br /><br />
        <?php } ?>

        <?php if ($this->config->get('themer_mobile_phone_number')) {?> 
        <i title="Mobile" class="fa fa-mobile"></i><a href="tel:<?php echo $this->config->get('themer_mobile_phone_number'); ?>"><?php echo $this->config->get('themer_mobile_phone_number'); ?></a><br /><br />
        <?php } ?>

       <?php if ($this->config->get('themer_fax_number')) {?> 
       <i title="<?php echo $text_fax; ?>" class="fa fa-print fa-lg"></i><a href="tel:<?php echo $this->config->get('themer_fax_number'); ?>"><?php echo $this->config->get('themer_fax_number'); ?></a><br /><br />
       <?php } ?>

       <?php if ($this->config->get('themer_working_hours'.$lang)) {?> 
       <i title="Work Time" class="fa fa-clock-o"></i><?php echo $this->config->get('themer_working_hours'.$lang); ?><br /><br />
       <?php } ?>

       <?php if ($this->config->get('themer_email')) {?> 
       <i title="Email" class="fa fa-envelope-o"></i><a href="mailto:<?php echo $this->config->get('themer_email'); ?>"><?php echo $this->config->get('themer_email'); ?></a><br /><br /> 
       <?php } ?>

       <?php if ($this->config->get('themer_skype')) {?> 
       <i title="Skype" class="fa fa-skype"></i><a href="skype:<?php echo $this->config->get('themer_skype'); ?>?call"><?php echo $this->config->get('themer_skype'); ?></a><br /><br />
       <?php } ?>
      </div>


      <div class="right">
    	<h2 class="h2ContactUs"><?php echo $text_contact; ?></h2>
    	<i class="fa fa-user fa-lg"></i>
    	<input placeholder="<?php echo $entry_name; ?>" style="width: 160px;" type="text" name="name" value="<?php echo $name; ?>" />
    	<br />
    	<?php if ($error_name) { ?>
    	<span class="error"><?php echo $error_name; ?></span>
    	<?php } ?>
    	<br />
    	<i class="fa fa-envelope fa-lg"></i>
    	<input placeholder="<?php echo $entry_email; ?>" style="width: 160px;" type="text" name="email" value="<?php echo $email; ?>" />
    	<br />
    	<?php if ($error_email) { ?>
    	<span class="error"><?php echo $error_email; ?></span>
    	<?php } ?>
    	<br />
    	<textarea placeholder="<?php echo $entry_enquiry; ?>" name="enquiry" cols="40" rows="10" style="width: 99%;"><?php echo $enquiry; ?></textarea>
    	<br />
    	<?php if ($error_enquiry) { ?>
    	<span class="error"><?php echo $error_enquiry; ?></span>
    	<?php } ?>
    	<br />
    	<i class="fa fa-pencil"></i> <b><?php echo $entry_captcha; ?></b><br /><br />
    	<img src="index.php?route=information/contact/captcha" style="vertical-align: middle;" />&nbsp;
	<i class="fa fa-long-arrow-right"></i>
    	<input type="text" name="captcha" value="<?php echo $captcha; ?>" style="height:34px; width:130px" />&nbsp;
	<i class="fa fa-long-arrow-right"></i>
      	<input type="submit" class="button" />
    	<?php if ($error_captcha) { ?>
    	<span class="error"><?php echo $error_captcha; ?></span>
    	<?php } ?>
      </div>

    </div>

  <?php if ($this->config->get('themer_map')) { ?>
	<h2 class="h2ContactUs"><i class="fa fa-map-marker fa-lg"></i> <b><?php echo $text_location; ?></b></h2>
  <?php echo htmlspecialchars_decode($this->config->get('themer_map')); ?>
	<style>.ymaps-copyrights-logo {opacity: 0;display: none;}.ymaps-copyrights-legend {opacity: 0;display: none;}.ymaps-map {background: none;}.ymaps-image {}</style><br />
  <?php } ?>

    </div>
    <div class="buttons"></div>
  </form>

</div>

  <?php echo $content_bottom; ?></div>
<?php echo $footer; ?>