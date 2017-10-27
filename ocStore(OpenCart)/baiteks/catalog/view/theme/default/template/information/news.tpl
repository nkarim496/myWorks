<?php ?>

<?php echo $header; ?>

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

	<?php if(isset($news_info)) { ?>
	
		<div class="content-news">
		
			<div class="news" <?php if($image) { echo 'style="min-height:' . $min_height . 'px;"'; } ?>>
				<?php if ($image) { ?>
					<div class="image">
					<a href="<?php echo $popup; ?>" title="<?php echo $heading_title; ?>" class="colorbox" rel="colorbox"><img src="<?php echo $thumb; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" id="image" /></a>
					</div>
				<?php } ?>
				<h3><?php echo $heading_title; ?></h3>
				<?php echo $description; ?>
			</div>
			
			<div class="addthis">
			<?php if($addthis) { ?>
			<!-- AddThis Button BEGIN -->
				<div class="addthis_toolbox addthis_default_style ">
				<a class="addthis_button_email"></a>
				<a class="addthis_button_print"></a>
				<a class="addthis_button_preferred_1"></a>
				<a class="addthis_button_preferred_2"></a>
				<a class="addthis_button_preferred_3"></a>
				<a class="addthis_button_preferred_4"></a>
				<a class="addthis_button_compact"></a>
				<a class="addthis_counter addthis_bubble_style"></a>
				</div>
				<script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js"></script>
			<!-- AddThis Button END -->
			<?php } ?>
			</div>
			
		</div>
		
		<div class="buttons">
			<div class="right">
				<a onclick="location='<?php echo $news; ?>'" class="button"><span><?php echo $button_news; ?></span></a>
				<a href="<?php echo $continue; ?>" class="button"><span><?php echo $button_continue; ?></span></a>
			</div>
		</div>
		
		
		
		
		
		
		
		
		
		
		
		
		
	<?php } elseif (isset($news_data)) { ?>
		<?php foreach ($news_data as $news) { ?>
			<div class="panelcollapsed">
				<h2><a href="<?php echo $news['href']; ?>"> <?php echo $news['title']; ?></a></h2>
				<div class="panelcontent">

					<?php if ($news['thumb']) { ?>
					<div class="image">
					<a href="<?php echo $news['href']; ?>">
					<img src="<?php echo $news['thumb']; ?>" title="<?php echo $news['title']; ?>" alt="<?php echo $news['title']; ?>" id="image" />
					</a>
					<p class="more"><a class="button" href="<?php echo $news['href']; ?>"> <?php echo $text_more; ?></a></p>
					</div>
					<?php } ?>
					
					<p class="description"><?php echo $news['description']; ?> .. </p>
					<p class="newsinfo"><i title="<?php echo $text_posted; ?>" class="fa fa-clock-o"></i> <?php echo $news['posted']; ?></p>
				</div>
			</div>
		<?php } ?>
		<div class="buttons">
			<div class="right"><a href="<?php echo $continue; ?>" class="button"><span><?php echo $button_continue; ?></span></a></div>
		</div>
	

</div>

	<?php echo $content_bottom; ?>

<div class="pagination"><?php echo $pagination; ?><?php } ?></div>
</div>

<script type="text/javascript"><!--
$(document).ready(function() {
	$('.colorbox').colorbox({
		overlayClose: true,
		opacity: 0.5,
		rel: "colorbox"
	});
});
//--></script>

<?php echo $footer; ?>