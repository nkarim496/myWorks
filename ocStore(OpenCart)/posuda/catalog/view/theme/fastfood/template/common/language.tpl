<?php if (count($languages) > 1) { ?>
<li id="language">
<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
    <?php foreach ($languages as $language) { ?>
    <img src="image/flags/<?php echo $language['image']; ?>" alt="<?php echo $language['name']; ?>" title="<?php echo $language['name']; ?>" onclick="$('input[name=\'code\']').attr('value', '<?php echo $language['code']; ?>'); $(this).parent().submit();" />
    <?php } ?>
    <input type="hidden" name="code" value="" />
    <input type="hidden" name="redirect" value="<?php echo $redirect; ?>" />
</form>
</li>
<?php } ?>
