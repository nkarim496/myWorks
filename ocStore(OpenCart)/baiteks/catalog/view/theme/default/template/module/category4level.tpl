<div class="box">
  <div class="box-heading"><i class="fa fa-bars"></i> <?php echo $heading_title; ?></div>
  <div class="box-content">
    <ul class="box-category-openchild">
        <?php foreach ($categories as $category) { ?>
        <li>
          <?php if ($category['category_id'] == $category_id) { ?>
          <a href="<?php echo $category['href']; ?>" class="active"><?php echo $category['name']; ?></a>
          <?php } else { ?>
          <a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a>
          <?php } ?>
          <?php if ($category['children']) { ?>
          <ul>
            <?php foreach ($category['children'] as $child) { ?>
            <li>
              <?php if ($child['category_id'] == $child_id) { ?>
              <a href="<?php echo $child['href']; ?>" class="active"><?php echo $child['name']; ?></a>
              <?php } else { ?>
              <a href="<?php echo $child['href']; ?>"><?php echo $child['name']; ?></a>
              <?php } ?>
            </li>
            <?php } ?>
          </ul>
          <?php } ?>
        </li>
        <?php } ?>
      </ul>
  </div>
</div>

<style type="text/css">

/* box-category-openchild */

ul.box-category-openchild {
	margin: -12px 0px -10px!important;
	list-style: none;
	padding: 0;
}
ul.box-category-openchild ul {
	list-style: none;
	margin: 0;
	padding: 0;
}
ul.box-category-openchild > li > a {
	padding: 8px 8px 8px 14px;
	display: block;
	text-decoration: none;
	color: #333;
	margin: -1px -10px;
	border-top: 1px solid #EEE;
	border-bottom: 1px solid #EEE;
	font-family: "Open Sans", "Arial", "Helvetica", "Ubuntu", sans-serif;
	font-weight: 600;
	position: relative;
	background-color: #f9f9f9;
}
ul.box-category-openchild > li > a:hover {
	text-decoration: none;
	color: #333;
	background-color: #f6f6f6;
	-moz-transition: all 0.2s ease;
  	-webkit-transition: all 0.2s ease-in-out;
	transition: all 0.2s ease-in-out;
	-o-transition: all 0.2s ease;
	-MS-transition: all 0.2s ease;
}
ul.box-category-openchild > li > a .kolvo{
	opacity: 0;
	vertical-align:super;
	font-size:0.8em;
	margin-left: 2px;
}
ul.box-category-openchild > li > a:hover .kolvo{
	opacity: 1;
	color: #404040;
	text-shadow: 0px 1px 0px #ccc;
	-moz-transition: all 0.2s ease;
  	-webkit-transition: all 0.2s ease-in-out;
	transition: all 0.2s ease-in-out;
	-o-transition: all 0.2s ease;
	-MS-transition: all 0.2s ease;
}
ul.box-category-openchild > li ul {
	display: block;
}
ul.box-category-openchild > li > a.active {
	font-weight: 600;
	text-decoration: none;
	color: #fafafa;
	background-color: #22B699;
}
ul.box-category-openchild > li > a.active .kolvo{
	opacity: 1;
	color: #fafafa;
	text-shadow: 0px 1px 0px #ccc;
}
ul.box-category-openchild > li a.active + ul {
	display: block;
}

/********* Подкатегории ************/
ul.box-category-openchild > li ul{
	position: relative;
	padding: 0px;
	margin: 0px -10px;
	overflow: hidden;
}
ul.box-category-openchild > li > a + ul:before {
	content:"";
	right: 30px;
	top: -5px;
	position: absolute;
	background-color: #eee;
	display: block;
	height: 12px;
	margin: 0px 0px 0px -8px;
	-webkit-transform: rotate(45deg);
	-moz-transform: rotate(45deg);
	-o-transform: rotate(45deg);
	-ms-transform: rotate(45deg);
	transform: rotate(45deg);
	width: 12px;
}
ul.box-category-openchild > li > a + ul:after {
	content:"";
	right: 30px;
	top: -7px;
	position: absolute;
	background-color: #f9f9f9;
	display: block;
	height: 12px;
	margin: 0px 0px 0px -8px;
	-webkit-transform: rotate(45deg);
	-moz-transform: rotate(45deg);
	-o-transform: rotate(45deg);
	-ms-transform: rotate(45deg);
	transform: rotate(45deg);
	width: 12px;
}
ul.box-category-openchild > li > a:hover + ul:after {
	background-color: #f6f6f6;
}
ul.box-category-openchild > li > a.active + ul:before {
	content:"";
	right: 30px;
	top: -6px;
	position: absolute;
	background-color: #22B699;
	display: block;
	height: 12px;
	margin: 0px 0px 0px -8px;
	-webkit-transform: rotate(45deg);
	-moz-transform: rotate(45deg);
	-o-transform: rotate(45deg);
	-ms-transform: rotate(45deg);
	transform: rotate(45deg);
	width: 12px;
}
ul.box-category-openchild > li > a.active + ul:after {
	content:"";
	right: 30px;
	top: -6px;
	position: absolute;
	background-color: #22B699;
	display: block;
	height: 12px;
	margin: 0px 0px 0px -8px;
	-webkit-transform: rotate(45deg);
	-moz-transform: rotate(45deg);
	-o-transform: rotate(45deg);
	-ms-transform: rotate(45deg);
	transform: rotate(45deg);
	width: 12px;
}
ul.box-category-openchild > li ul > li > a:hover {
	text-decoration: none;
	color: #333;
	background-color: #F6F6F6;
	-moz-transition: all 0.2s ease;
  	-webkit-transition: all 0.2s ease-in-out;
	transition: all 0.2s ease-in-out;
	-o-transition: all 0.2s ease;
	-MS-transition: all 0.2s ease;
}
ul.box-category-openchild > li ul > li > a .kolvo{
	opacity: 0;
	vertical-align:super;
	font-size:0.8em;
	margin-left: 2px;
}
ul.box-category-openchild > li ul > li > a:hover .kolvo{
	opacity: 1;
	color: #404040;
	text-shadow: 0px 1px 0px #ccc;
	-moz-transition: all 0.2s ease;
  	-webkit-transition: all 0.2s ease-in-out;
	transition: all 0.2s ease-in-out;
	-o-transition: all 0.2s ease;
	-MS-transition: all 0.2s ease;
}
ul.box-category-openchild > li ul > li {
	border-top: 1px dotted #eee;
	padding: 0px;
}
ul.box-category-openchild > li ul > li:first-child {
	border-top: 0px;
}
ul.box-category-openchild > li ul > li > a{
	padding: 8px 8px 8px 30px;
	display: block;
	text-decoration: none;
	color: #22B699;
	margin: 0px 0px;
	font-family: "Open Sans", "Arial", "Helvetica", "Ubuntu", sans-serif;
}
ul.box-category-openchild > li ul > li > a.active {
	font-weight: 600;
	background-color: #EEEEEE;
	color: #404040;
}
ul.box-category-openchild > li ul > li > a.active .kolvo{
	opacity: 1;
	color: #404040;
	text-shadow: 0px 1px 0px #ccc;
}

</style>