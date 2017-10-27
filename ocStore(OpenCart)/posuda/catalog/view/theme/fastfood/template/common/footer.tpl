</div>
</div>
<script type="text/javascript" src="catalog/view/theme/fastfood/js/common.js"></script>
<script type="text/javascript" src="catalog/view/theme/fastfood/js/jquery.maskedinput.min.js"></script>
<link rel="stylesheet" type="text/css" property="stylesheet" href="catalog/view/theme/fastfood/stylesheet/quick_view.css" />
</div>
<div id="footer">
<div class="container">
<div class="menu_phone">
<div class="menu">
<?php if (isset($footerlinks)) { ?>
<?php foreach ($footerlinks as $footerlink) { ?>
	<a href="<?php echo $footerlink['link']; ?>" title="<?php echo $footerlink['title']; ?>"><?php echo $footerlink['title']; ?></a>
<?php } ?>
<?php } ?>
</div>
<div class="phone"><i class="fa fa-phone"></i><?php echo $phone; ?></div>
</div>
<div class="copyright">
<div><?php echo $powered ?></div>
<div class="social">
<?php if (isset($socials)) { ?>
<?php foreach ($socials as $social) { ?>
	<a href="<?php echo $social['link']; ?>" target="_blank" title="" ><i class="fa <?php echo $social['icon']; ?>"></i></a>
<?php } ?>
<?php } ?>
</div>
<div class="address"><?php echo $address; ?><br /><?php if(isset($store_hours)) { echo $store_hours; } ?></div>
<div class="payment">
<?php if(isset($social_visa)) { ?><i class="fa fa-cc-visa"></i><?php } ?>
<?php if(isset($social_master)) { ?><i class="fa fa-cc-mastercard"></i><?php } ?>
</div>
</div>
</div>
<input type="hidden" name="fixheader" value="<?php if($fixheader) {echo '1';} else {echo '0';} ?>" />
<input type="hidden" name="quickview" value="<?php if($show_quickview) {echo '1';} else {echo '0';} ?>" />
<script type="text/javascript">
function price_format(n) { 
    c = <?php echo (empty($currency['decimals']) ? "0" : $currency['decimals'] ); ?>;
    d = '<?php echo $currency['decimal_point']; ?>';
    t = '<?php echo $currency['thousand_point']; ?>';
    s_left = '<?php echo $currency['symbol_left']; ?>';
    s_right = '<?php echo $currency['symbol_right']; ?>';
    i = parseInt(n = Math.abs(n).toFixed(c)) + ''; 
    j = ((j = i.length) > 3) ? j % 3 : 0; 
    return s_left + (j ? i.substr(0, j) + t : '') + i.substr(j).replace(/(\d{3})(?=\d)/g, "$1" + t) + (c ? d + Math.abs(n - i).toFixed(c).slice(2) : '') + s_right; 
}
function weight_format(n, unit) { 
    c = <?php echo (empty($currency['decimals']) ? "0" : $currency['decimals'] ); ?>;
    d = '<?php echo $currency['decimal_point']; ?>';
    t = '<?php echo $currency['thousand_point']; ?>';
    i = parseInt(n = Math.abs(n).toFixed(c)) + ''; 
    j = ((j = i.length) > 3) ? j % 3 : 0; 
    return (j ? i.substr(0, j) + t : '') + i.substr(j).replace(/(\d{3})(?=\d)/g, "$1" + t) + (c ? d + Math.abs(n - i).toFixed(c).slice(2) : '') + unit; 
}
</script>
<?php echo $google_analytics; ?>
</div>
</body></html>