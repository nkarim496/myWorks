<div <?php if($style){ echo 'class="custom_menu"'; } else { echo 'class="box"';}?>>
<?php if($head){ ?><div class="box-heading"><?php echo $head; ?></div><?php } ?>
<div class="box-content box_category">
<ul class="box-category">
<?php foreach($custom_menu as $menu){ ?> 
<?php if (in_array($menu['id'], $in_module)) { ?>
<?php if($menu['sub_menu']){ ?>
<li class="arrow"><a href="<?php echo $menu['link'] ?>"><?php if($menu['image']) { ?><img src="<?php echo $menu['image']; ?>" alt="<?php echo $menu['name']; ?>" /><?php } else { ?><i class="fa fa-chevron-right"></i><?php } ?><?php echo $menu['name']; ?></a><i class="fa fa-chevron-down"></i>
<?php } else {?>
<li><a href="<?php echo $menu['link'] ?>"><?php if($menu['image']) { ?><img src="<?php echo $menu['image']; ?>" alt="<?php echo $menu['name']; ?>" /><?php } else { ?><i class="fa fa-chevron-right"></i><?php } ?><?php echo $menu['name']; ?></a>
<?php }?>		
<?php if($menu['sub_menu']){ ?>
<?php for ($i = 0; $i < count($menu['sub_menu']);) { ?>	
<?php $j = $i + ceil(count($menu['sub_menu']) / $menu['column']); ?>
<ul>
<?php for (; $i < $j; $i++) { ?>
<?php if (isset($menu['sub_menu'][$i]) && in_array($menu['sub_menu'][$i]['id'], $in_module)) { ?>
<li>
<?php if($menu['sub_menu'][$i]['link'] != ''){?>					
<a class="first_child" href="<?php echo $menu['sub_menu'][$i]['link']; ?>"><?php if($menu['sub_menu'][$i]['image']) { ?><img src="<?php echo $menu['sub_menu'][$i]['image']; ?>" alt="<?php echo $menu['sub_menu'][$i]['name']; ?>" /><?php } ?> <?php echo $menu['sub_menu'][$i]['name']; ?></a>
<?php } else {?>
<b class="first_child"><?php if($menu['sub_menu'][$i]['image']) { ?><img src="<?php echo $menu['sub_menu'][$i]['image']; ?>" alt="<?php echo $menu['sub_menu'][$i]['name']; ?>" /><?php } ?> <?php echo $menu['sub_menu'][$i]['name']; ?></b>
<?php } ?>
<?php if($menu['sub_menu'][$i]['sub_menu']) {?>
<span>
<?php for ($wi = 0; $wi < count($menu['sub_menu'][$i]['sub_menu']); $wi++) { ?>	
<?php if (in_array($menu['sub_menu'][$i]['sub_menu'][$wi]['id'], $in_module)) { ?>
<a href="<?php echo $menu['sub_menu'][$i]['sub_menu'][$wi]['link']; ?>"><?php echo $menu['sub_menu'][$i]['sub_menu'][$wi]['name']; ?></a>
<?php }?>
<?php }?>
</span>			
<?php }?>	
</li>
<?php }?>
<?php }?>
</ul>
<?php }?>
<?php } ?>		
</li>			
<?php } ?>
<?php } ?>
</ul>
</div>
</div>