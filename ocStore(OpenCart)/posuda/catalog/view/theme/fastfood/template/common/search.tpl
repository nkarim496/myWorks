<div id="search">
<div class="input-group">
	<div class="selected_category input-group-btn">
		<span><span>Везде</span><i class="fa fa-angle-double-right"></i></span>
		<input type="hidden" name="filter_category_id" value="" />
		<ul>
			<li>Везде</li>
			<?php foreach ($categories as $category) { ?>
				<li data-id="<?php echo $category['category_id']; ?>"><?php echo $category['name']; ?></li>
			<?php } ?>
		</ul>
	</div>
	<input type="text" name="search" placeholder="<?php echo $text_search; ?>" value="<?php echo $search; ?>" class="form-control" />
	<div class="button-search input-group-btn">Найти!</div>
</div>
</div>