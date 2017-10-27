<?php echo $header; ?>
<div class="container">
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?></div>
    <?php echo $column_right; ?></div>
</div>
<section class="html-sec">
    <div class="main-categories"> 
        <div class="container"> 
            <div class="row">
                <div class="col-sm-4 "> 
                    <a href="http://lubimaya-shapka.ru/index.php?route=product/category&path=20_27" class="cat-wrap girls">Для девочек</a>
                </div>
                <div class="col-sm-4">
                    <a href="http://lubimaya-shapka.ru/index.php?route=product/category&path=20_26" class="cat-wrap boys">Для мальчиков</a>
                </div>
                <div class="col-sm-4"> 
                    <a href="http://lubimaya-shapka.ru/index.php?route=product/category&path=20_60" class="cat-wrap kids">До двух лет</a>
                </div>
            </div>
        </div>
    </div>
</section>
<?php echo $content_bottom; ?>
<?php echo $footer; ?>