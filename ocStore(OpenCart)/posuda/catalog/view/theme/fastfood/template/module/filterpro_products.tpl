<?php foreach ($products as $product) { ?>
<div class="product product-layout">
<?php if ($product['bestseller_sticker']) { ?><div class="sticker st_bestseller"><?php echo $product['bestseller_sticker_text']; ?></div><?php } ?>
<?php if ($product['new_sticker']) { ?><div class="sticker st_new"><?php echo $product['new_sticker_text']; ?></div><?php } ?>
<?php if ($product['special_sticker']) { ?><div class="sticker st_special"><?php echo $product['special_sticker']; ?></div><?php } ?>
<?php if ($product['thumb']) { ?>
<div class="image">
<a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" title="<?php echo $product['name']; ?>" alt="<?php echo $product['name']; ?>" /></a>
<?php if ($product['rating']) { ?>
<div class="rating"><?php for ($i = 1; $i <= 5; $i++) { ?><?php if ($product['rating'] < $i) { ?><i class="fa fa-star-o"></i><?php } else { ?><i class="fa fa-star"></i><?php } ?><?php } ?>
<sup onclick="location='<?php echo $product['href']; ?>#tab-review'"><?php echo $product['num_reviews']; ?></sup>
</div>
<?php } ?>
</div>
<?php } ?>
<div class="desc">
<div class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></div>
<div class="description"><?php echo $product['short_description']; ?></div>
<?php if($product['weight_value'] > 0) { ?>
<div class="weight weight_<?php echo $product['product_id']; ?>_cp" data-weight="<?php echo $product['weight_value']; ?>" data-weight-unit="<?php echo $product['weight_unit']; ?>"><?php echo $product['weight']; ?></div>
<?php } ?>
<?php if ($product['price']) { ?>
<div class="price">
<?php if (!$product['special']) { ?>
<span class="price_<?php echo $product['product_id']; ?>_cp" data-price="<?php echo $product['price_value']; ?>"><?php echo $product['price']; ?></span>
<?php } else { ?>
<span class="price-old price_<?php echo $product['product_id']; ?>_cp" data-price="<?php echo $product['price_value']; ?>"><?php echo $product['price']; ?></span> 
<span class="price-new special_<?php echo $product['product_id']; ?>_cp" data-price="<?php echo $product['special_value']; ?>"><?php echo $product['special']; ?></span>
<?php } ?>
</div>
<?php } ?>
<div class="cart">
<?php if ($product['quantity'] > 0) { ?>
<?php if ($show_quantity) { ?>
<input type="tel" value="1" onchange="recalculateprice('<?php echo $product['product_id']; ?>_cp');" class="quantity_<?php echo $product['product_id']; ?>_cp" />
<?php } ?>
<input type="button" value="<?php echo $button_cart; ?>" onclick="cart.add('<?php echo $product['product_id']; ?>');" class="button" />
<?php } else { ?>
<input type="button" value="<?php echo $button_cart_disabled; ?>" class="button disabled" />
<?php } ?>
</div>
<div class="wishlist"><a onclick="addToWishList('<?php echo $product['product_id']; ?>');" title="<?php echo $button_wishlist; ?>"><i class="fa fa-heart"></i></a></div>
<div class="compare"><a onclick="addToCompare('<?php echo $product['product_id']; ?>');" title="<?php echo $button_compare; ?>"><i class="fa fa-bar-chart-o"></i></a></div></div>
</div>
<?php } ?>