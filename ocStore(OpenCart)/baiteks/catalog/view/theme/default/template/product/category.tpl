<?php echo $header; ?>

<?php if($this->config->get('themer_subcategory_photo') != 'on') {?>
<style type="text/css">
  .category-list ul li img { display: none; }
  .category-list ul li span { background-color: #FAFAFA; }
</style>
<?php } ?>

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
<div id="content">
<?php echo $content_top; ?>

<div class="category-details">

	<div class="category-details-top">
    <?php if ($thumb) { ?>
    	<div class="image"><img src="<?php echo $thumb; ?>" alt="<?php echo $heading_title; ?>" /></div>
    <?php } ?>
  	<div class="category-h1"><h1><?php echo $heading_title; ?></h1></div>
	</div>


  <?php if ($thumb || $description) { ?>
  <div class="category-info">
    <?php if ($description) { ?>
    <?php echo $description; ?>
    <?php } ?>
  </div>
  <?php } ?>



  <?php if ($categories) { ?>
  <p class="refine-p"><?php echo $text_refine; ?></p>


  <div class="category-list">
    <?php if (count($categories)) { ?>
    <ul>
      <?php foreach ($categories as $category) { ?>
      <li><a href="<?php echo $category['href']; ?>"><img src="<?php echo $category['thumb']; ?>"><span><?php echo $category['name']; ?></a></span></li>
      <?php } ?>
    </ul>
    <?php } ?>
  </div>

  <?php } ?>

  <?php if ($products) { ?>
  <div class="product-filter">
    <div class="product-compare">
	<a href="<?php echo $compare; ?>" class="icon-compare"></a>
	<a href="<?php echo $compare; ?>" id="compare-total-2"><?php echo $text_compare; ?></a>
    </div>
    <div class="limit"><b class="limitb"><?php echo $text_limit; ?></b>
      <select onchange="location = this.value;">
        <?php foreach ($limits as $limits) { ?>
        <?php if ($limits['value'] == $limit) { ?>
        <option value="<?php echo $limits['href']; ?>" selected="selected"><?php echo $limits['text']; ?></option>
        <?php } else { ?>
        <option value="<?php echo $limits['href']; ?>"><?php echo $limits['text']; ?></option>
        <?php } ?>
        <?php } ?>
      </select>
    </div>
    <div class="sort"><b class="sortb"><?php echo $text_sort; ?></b>
      <select onchange="location = this.value;">
        <?php foreach ($sorts as $sorts) { ?>
        <?php if ($sorts['value'] == $sort . '-' . $order) { ?>
        <option value="<?php echo $sorts['href']; ?>" selected="selected"><?php echo $sorts['text']; ?></option>
        <?php } else { ?>
        <option value="<?php echo $sorts['href']; ?>"><?php echo $sorts['text']; ?></option>
        <?php } ?>
        <?php } ?>
      </select>
    </div>
  </div>

<div class="display"><a class="select"><?php echo $text_list; ?></a> <a class="notselect" onclick="display('grid');"><?php echo $text_grid; ?></a></div>

</div>
<div>
  <div class="product-list">
    <?php foreach ($products as $product) { ?>
    <div>
      <?php if ($product['thumb']) { ?>
      <div class="image">

      <?php if ($product['price']) { ?>
        <?php if (!$product['special']) { ?>
        	<?php } else { ?>
	<span class="sale">-<?php echo $product['saving']; ?>%</span>
        <?php } ?>
      <?php } ?>

<a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" title="<?php echo $product['name']; ?>" alt="<?php echo $product['name']; ?>" /></a></div>
      <?php } ?>
      <div class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></div>
      <div class="description"><?php echo $product['description']; ?></div>
      <?php if ($product['price']) { ?>
      <div class="price">
        <?php if (!$product['special']) { ?>
        <?php echo $product['price']; ?>
        <?php } else { ?>
        <span class="price-old"><?php echo $product['price']; ?></span> <span class="price-new"><?php echo $product['special']; ?></span>
        <?php } ?>
        <?php if ($product['tax']) { ?>
        <span class="price-tax"><?php echo $text_tax; ?> <?php echo $product['tax']; ?></span>
        <?php } ?>
      </div>
      <?php } ?>

      <?php if ($product['rating']) { ?>
	<div class="rating">
	<img src="catalog/view/theme/default/image/stars-<?php echo $product['rating']; ?>.png" alt="<?php echo $product['reviews']; ?>" />
	</div>
	<?php } else { ?>
	<div class="rating">
	<img src="catalog/view/theme/default/image/stars-0.png" alt="<?php echo $product['reviews']; ?>" />
	</div>
      <?php } ?>

      <div class="cart"><a title="<?php echo $button_cart; ?>" onclick="addToCart('<?php echo $product['product_id']; ?>');" class="button" /></a></div>
      <div class="wishlist"><a title="<?php echo $button_wishlist; ?>" onclick="addToWishList('<?php echo $product['product_id']; ?>');"></a></div>
      <div class="compare"><a title="<?php echo $button_compare; ?>" onclick="addToCompare('<?php echo $product['product_id']; ?>');"></a></div>
    </div>
    <?php } ?>
  </div>
  <div class="pagination"><?php echo $pagination; ?></div>
  <?php } ?>

  <?php if (!$categories && !$products) { ?>
  <div class="empty-content"><?php echo $text_empty; ?></div>
  <div class="buttons">
    <div class="right"><a href="<?php echo $continue; ?>" class="button"><i class="fa fa-share"></i><?php echo $button_continue; ?></a></div>
  </div>
  <?php } ?>

</div>

  <?php echo $content_bottom; ?></div>
<script type="text/javascript"><!--
function display(view) {
	if (view == 'list') {
		$('.product-grid').attr('class', 'product-list');
		
		$('.product-list > div').each(function(index, element) {
			html  = '<div class="right">';

			var price = $(element).find('.price').html();
			
			if (price != null) {
				html += '<div class="price">' + price  + '</div>';
			}

			html += '  <div class="list-button"><div class="cart">' + $(element).find('.cart').html() + '</div>';
			html += '  <div class="wishlist">' + $(element).find('.wishlist').html() + '</div>';
			html += '  <div class="compare">' + $(element).find('.compare').html() + '</div></div>';
			html += '</div>';			
			
			html += '<div class="left">';
			
			var image = $(element).find('.image').html();
			
			if (image != null) { 
				html += '<div class="image">' + image + '</div>';
			}
			
					
			html += '  <div class="name">' + $(element).find('.name').html() + '</div>';
			html += '  <div class="description">' + $(element).find('.description').html() + '</div>';
			
			var rating = $(element).find('.rating').html();
			
			if (rating != null) {
				html += '<div class="rating">' + rating + '</div>';
			}
				
			html += '</div>';
						
			$(element).html(html);
		});		
		
		$('.display').html('<a class="select"><?php echo $text_list; ?></a> <a class="notselect" onclick="display(\'grid\');"><?php echo $text_grid; ?></a>');
		
		$.totalStorage('display', 'list'); 
	} else {
		$('.product-list').attr('class', 'product-grid');
		
		$('.product-grid > div').each(function(index, element) {
			html = '';
			
			var image = $(element).find('.image').html();
			
			if (image != null) {
				html += '<div class="image">' + image + '</div>';
			}
			

			html += '<div class="grid-button"><div class="cart">' + $(element).find('.cart').html() + '</div>';
			html += '<div class="wishlist">' + $(element).find('.wishlist').html() + '</div>';
			html += '<div class="compare">' + $(element).find('.compare').html() + '</div></div>';

			html += '<div class="name">' + $(element).find('.name').html() + '</div>';
			html += '<div class="description">' + $(element).find('.description').html() + '</div>';

			var rating = $(element).find('.rating').html();
			
			if (rating != null) {
				html += '<div class="grid-table"><div class="rating">' + rating + '</div>';
			}


			var price = $(element).find('.price').html();
			
			if (price != null) {
				html += '<div class="price">' + price  + '</div></div>';
			}
			
			$(element).html(html);
		});	
					
		$('.display').html('<a class="notselect" onclick="display(\'list\');"><?php echo $text_list; ?></a> <a class="select"><?php echo $text_grid; ?></a>');
		
		$.totalStorage('display', 'grid');
	}
}

view = $.totalStorage('display');

if (view) {
  display(view);
} else {
  display('<?php echo $this->config->get('themer_products_view'); ?>');
}
//--></script> 

<?php if ($this->config->get('themer_category_desc') == 'on' and $page_number == 1) { ?>
<?php if ($description) { ?>
  <script type="text/javascript"><!--
    $(document).ready(function() {
    $('#content').after('<div style="clear:both;"></div><div id="bottom-description"></div>');

    $('#bottom-description').append('<div class="category-info-down"></div>');
    $('.category-info-down').append('<div class="category-details-top"><?php if ($thumb) { ?><span class="image"><img src="<?php echo $thumb; ?>"></span><?php } ?><span class="category-h3"><h3><?php echo $heading_title; ?></h3></span></div>');
    $('.category-info-down').append($('.category-info'));

    });
    //--></script> 
<?php } ?>
<?php } ?>

<?php echo $footer; ?>