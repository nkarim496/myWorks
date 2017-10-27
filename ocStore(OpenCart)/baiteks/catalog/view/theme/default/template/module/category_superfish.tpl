<link rel="stylesheet" type="text/css" media="screen" href="<?=$superfish_path?>/superfish/css/superfish.css" /> 
<link rel="stylesheet" type="text/css" media="screen" href="<?=$superfish_path?>/superfish/css/superfish-vertical.css" /> 
<script type="text/javascript" src="<?=$superfish_path?>/superfish/js/hoverIntent.js"></script> 
<script type="text/javascript" src="<?=$superfish_path?>/superfish/js/superfish.js"></script> 
<script type="text/javascript"> 
	$(document).ready(function(){ 
		$("ul.sf-menu").superfish();
	}); 
</script>
<div class="box">
  <div class="box-heading"><i class="fa fa-bars"></i> <?php echo $heading_title; ?></div>
  <div class="middle" style='padding:0;margin:0;height:auto;'>
  
	<div class="sf-vertical" style='padding:0;margin:0;'>
		<ul id="sample-menu-1" class="sf-menu" style='padding:0;margin:0;width:100%'>
			<?=$category_superfish?>

<script type="text/javascript"><!-- 
$('ul#sample-menu-1 li').each(function () {if (this.getElementsByTagName("a")[0].href == location.href) this.className = "active";});
//--></script>

		</ul>
	</div>  
  
  </div>
  <div style='clear:left'></div>
  <div class="bottom">&nbsp;</div>
</div>

<style type="text/css">
#sample-menu-1{	border-bottom: 10px solid #F5F5F5;}
#sample-menu-1 li.active {background-color: #22B699;}
#sample-menu-1 li.active a b {color: #fff;}
#sample-menu-1 li.active:hover a b {color: #000;}
</style>