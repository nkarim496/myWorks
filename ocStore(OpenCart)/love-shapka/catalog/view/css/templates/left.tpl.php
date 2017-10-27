<?php
$selectorMaxWidth = (int)self::$options->getValue('selector-max-width');
if(!empty($magicscroll) && !empty($magicscrollOptions)) {
    $magicscrollOptions = " data-options=\"{$magicscrollOptions}\"";
}
?>
<!-- Begin magiczoomplus -->
<div class="MagicToolboxContainer selectorsLeft minWidth<?php echo empty($magicscroll)?' noscroll':'' ?>">
<?php

if(is_array($thumbs)){
    $thumbs = array_unique($thumbs);
}

if(count($thumbs) > 1) {
    ?>
    <div class="MagicToolboxSelectorsContainer" style="width: <?php echo $selectorMaxWidth ?>px;">
        <div id="MagicToolboxSelectors<?php echo $pid ?>" class="<?php echo $magicscroll ?>"<?php echo $magicscrollOptions ?>>
        <?php echo join("\n\t", $thumbs); ?>
        </div>
    </div>
    <?php
        if(!empty($magicscroll) && !is_numeric(self::$options->getValue('height'))) {
            ?>
            <script type="text/javascript">
                mzOptions = mzOptions || {};
                mzOptions.onUpdate = function() {
                    MagicScroll.resize('MagicToolboxSelectors<?php echo $pid ?>');
                };
            </script>
            <?php
        }
        ?>
    <?php
}
?>
    <div class="MagicToolboxMainContainer">
        <?php echo $main; ?>
    </div>
</div>
<!-- End magiczoomplus -->
