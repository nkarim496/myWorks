<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
<div class="page-header">
<div class="container-fluid">
<div class="pull-right"></div>
<h1><?php echo $lang['heading_title']; ?></h1>
<div></div>
<ul class="breadcrumb">
<?php foreach ($breadcrumbs as $breadcrumb) { ?>
<li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
<?php } ?>
</ul>
</div>
</div>
<div class="container-fluid">
<?php if ($error_warning) { ?>
<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?></div>
<?php } ?>
<style>
.content input[type='button'] {height:22px;}
#copyright {clear:both;text-align:left;}
</style>
<div class="content">
<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" class="fastfood_settings">
<div style="margin:0 0 15px;padding:10px;background:#FFD1D1;">
Пожалуйста, введите лицензионный ключ: <input type="text" name="fastfood_lic[license]" value="" style="width:300px;" />
<input type="button" onclick="$('.fastfood_settings').submit();" value="Активировать" style="cursor:pointer" />
</div>
</form>
<div id="copyright">Если у вас нет лицензионного ключа, то вы можете его приобрести или просто получить, если вы приобрели шаблон ранее. <br />
Для этого вам необходимо написать мне письмо на адрес <?php echo $lang['text_copyright']; ?> с указанием домена, где работает (будет работать) шаблон, места покупки и вашего логина.</div>
</div>
</div>
</div>
<?php echo $footer; ?>