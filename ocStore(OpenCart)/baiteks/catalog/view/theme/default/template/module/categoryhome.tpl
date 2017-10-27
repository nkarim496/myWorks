<div class="box">

  <div class="box-heading"><i class="fa fa-th"></i> <?php echo $heading_title; ?></div>

    <div class="box-content" style="padding: 20px 20px 10px;">
      <div class="box-product">
        <?php foreach ($categoryhome as $categoryhome) { ?>
         <div style="margin-bottom: 40px;text-align: center;">
           <div class="image"><a href="<?php echo $categoryhome['href']; ?>"><img src="<?php echo $categoryhome['thumb']; ?>" alt="<?php echo $categoryhome['name']; ?>" border="1" title="<?php echo $categoryhome['name']; ?>" /></a></div>
           <div class="name"><a href="<?php echo $categoryhome['href']; ?>"><?php echo $categoryhome['name']; ?></a></div>
         </div>
        <?php } ?>
      </div>
    </div>
</div>