<div class="menu">

<?php echo $cart; ?>
      <?php 
 
$this->load->model('catalog/category');
$this->load->model('tool/image');
 
$categories_1 = $this->model_catalog_category->getCategories(0);  											
 
if ($categories_1) {$output = '<ul id="topnav"><li class="home"><a href="index.php?route=common/home"></a></li>';}  															
 
foreach ($categories_1 as $category_1) {																			
	$output .= '<li>';
    $testPath = $base.'image/';
    $picCat = $this->model_tool_image->resize($category_1['image'],  80, 80);
	$unrewritten  = $this->url->link('product/category', 'path=' . $category_1['category_id']);
    $output .= '<a href="'.($unrewritten).'">' . $category_1['name'] . '</a>';								
 
	$categories_2 = $this->model_catalog_category->getCategories($category_1['category_id']);
 
	if ($categories_2) {$output .= '<ul class="children">';}												
 
	foreach ($categories_2 as $category_2) {
    	$subTestPath = $base.'image/';
        if ($category_2['image']) {
    $picSubCat = $this->model_tool_image->resize($category_2['image'],  115, 100);
    } else {
    $picSubCat = $base.'image/no_image.jpg';
    };
    																	
		$output .= '<li>';
		$sub_unrewritten = $this->url->link('product/category', 'path=' . $category_1['category_id'] . '_' . $category_2['category_id']);
		$output .= '<a href="'.($sub_unrewritten).'"><img src="'.$picSubCat.'" alt="' . $category_2['name'].'"/><span>' . $category_2['name'] . '</span></a>';
 		
		$categories_3 = $this->model_catalog_category->getCategories($category_2['category_id']);
 
		if ($categories_3) {$output .= '<ul class="children2">';}
 
		foreach ($categories_3 as $category_3) {
			$output .= '<li>';
			$third_sub_unrewritten = $this->url->link('product/category', 'path=' . $category_1['category_id'] . '_' . $category_2['category_id'] . '_' . $category_3['category_id']);
			$output .= '<a href="'.($third_sub_unrewritten).'">'.$category_3['name'].'</a>';
			$output .= '</li>';
		}
 
		if ($categories_3) {$output .= '</ul>';}
			$output .= '</li>';
	}
	if ($categories_2) {$output .= '</ul>';}
		$output .= '</li>';
}
if ($categories_1) {$output .= '</ul>';}
echo $output;
?>
<div class="phone"><span>+7(929)992-77-77</span></div>
    </div>