<?php if (count($languages) > 1) { ?>

<p><a class="menu_head3"></a><a class="menu_name3"><?php echo $text_language; ?></a></p>
<div class="language">
<ul class="menu_body3">


<form action="<?php echo str_replace('&', '&amp;', $action); ?>" method="post" enctype="multipart/form-data" id="language_form">

  <div id="language">
    <?php foreach ($languages as $language) { ?>
		<li><a href="javascript:;" onclick="$('input[name=\'language_code\']').attr('value', '<?php echo $language['code']; ?>'); $('#language_form').submit();"><img src="image/flags/<?php echo $language['image']; ?>" alt="<?php echo $language['name']; ?>" /><?php echo $language['name']; ?></a></li>
		<?php } ?>
    <input type="hidden" name="language_code" value="" />
    <input type="hidden" name="redirect" value="<?php echo $redirect; ?>" />
  </div>
</form>


</ul>
</div>

<?php } ?>