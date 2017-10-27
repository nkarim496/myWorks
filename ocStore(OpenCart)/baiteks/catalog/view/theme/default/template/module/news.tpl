<?php ?>

<?php if ($news) { ?>
<?php if($box) { ?>
	<div class="box">
	
		<div class="box-heading">
			<?php if($icon) { ?>
				<div style="float: left; margin-right: 8px;"><i class="fa fa-list-alt"></i></div>
			<?php } ?>
			<?php if($customtitle) { ?>
				<?php echo $customtitle; ?>
			<?php } ?>
		</div>
		
		<div class="box-content">
		
		  <?php foreach ($news as $news_story) { ?>
			<div class="box-news">
			
				<?php if ($show_headline) { ?>
				<a style="color: #000;text-decoration: none;" href="<?php echo $news_story['href']; ?>"><h4><?php echo $news_story['title']; ?></h4></a>
				<?php } ?>
				
				<div class="image">
				<a href="<?php echo $news_story['href']; ?>"><?php if ($news_story['thumb']) { ?><img  src="<?php echo $news_story['thumb']; ?>"><?php } ?></a>
				</div>
				
				<p class="info"><i class="fa fa-clock-o"></i><span> <?php echo $news_story['posted']; ?></span></p>
				
				<p class="description"><?php echo $news_story['description']; ?> .. </p>
				
				<p class="more"><a class="button" href="<?php echo $news_story['href']; ?>"> <?php echo $text_more; ?></a></p>
				
			</div>
		  <?php } ?>
		  
		  <?php if($showbutton) { ?>
			<div class="newsmore"><a href="<?php echo $newslist; ?>" class="button"><span><?php echo $buttonlist; ?></span></a></div>
		  <?php } ?>
		  
		</div>
		
	</div>



<?php } else { ?>

	<div style="margin-bottom:10px;">
		<?php foreach ($news as $news_story) { ?>
			<div class="box-news">
				<img  src="<?php echo $news_story['thumb']; ?>">
				<?php if ($show_headline) { ?>
					<a style="color: #000;text-decoration: none;" href="<?php echo $news_story['href']; ?>"><h4><?php echo $news_story['title']; ?></h4></a>
				<?php } ?>
				<?php echo $news_story['description']; ?> .. <br />
				<a href="<?php echo $news_story['href']; ?>"> <?php echo $text_more; ?></a>
				</p>
				<a class="newsa" href="<?php echo $news_story['href']; ?>"><img src="catalog/view/theme/default/image/message-news.png" alt="" /></a> 
				<span><b><?php echo $text_posted; ?></b> <?php echo $news_story['posted']; ?></span>
			</div>
		<?php } ?>
		<?php if($showbutton) { ?>
			<div style="text-align:right;">
				<a href="<?php echo $newslist; ?>" class="button"><span><?php echo $buttonlist; ?></span></a>
			</div>
		<?php } ?>
	</div>
	
<?php } ?>
<?php } ?>