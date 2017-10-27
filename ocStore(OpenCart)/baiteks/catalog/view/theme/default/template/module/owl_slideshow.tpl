
<div class="slideshow">
<div id="owl-example<?php echo $module; ?>" class="owl-carousel owl-theme" style="display: block;">
  <?php foreach ($banners as $banner) { ?>
  <?php if ($banner['link']) { ?>
  <div><a href="<?php echo $banner['link']; ?>"><img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" /></a></div>
  <?php } else { ?>
  <div><img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" /></div>
  <?php } ?>
  <?php } ?>
</div>
</div>
<script type="text/javascript"><!--
$(document).ready(function() {

var time = 7; // time in seconds
var $progressBar,
$bar,
$elem,
isPause,
tick,
percentTime;
 
//Init the carousel
$("#owl-example<?php echo $module; ?>").owlCarousel({

       // Most important owl features
      itemsCustom : [[0, 1], [461, 1], [750, <?php echo $amount; ?>], [1000, <?php echo $amount; ?>], [1200, <?php echo $amount; ?>]],
//    singleItem : true, // Display only one item, in this case - always true.
       
      //Basic Speeds
      slideSpeed : 500, // Slide speed in milliseconds !
      paginationSpeed : 500, // Pagination speed in milliseconds ! 
      rewindSpeed : 1000,
       
      // Navigation
      navigation : false,
      rewindNav : true,
       
      //Pagination
      pagination : true,
      paginationNumbers: false,
	
      //Mouse Events
      dragBeforeAnimFinish : true,
      mouseDrag : true,
      touchDrag : true,
       
      //Callbacks
      afterInit: progressBar, // After initialization callback
      afterMove: moved, // After move callback
      startDragging : pauseOnDragging, // Call this function while dragging.
});
 
//Init progressBar where elem is $("#owl-demo")
function progressBar(elem){
      $elem = elem;
      //build progress bar elements
      buildProgressBar();
      //start counting
      start();
}
 
//create div#progressBar and div#bar then prepend to $("#owl-demo")
function buildProgressBar(){
      $progressBar = $("<div>",{
      id:"progressBar"
      });
      $bar = $("<div>",{
      id:"bar"
      });
      $progressBar.append($bar).prependTo($elem);
}
 
function start() {
      //reset timer
      percentTime = 0;
      isPause = false;
      //run interval every 0.01 second
      tick = setInterval(interval, 10);
};
 
function interval() {
      if(isPause === false) {
        percentTime += 1 / time;
        $bar.css({
           width: percentTime+"%"
        });
        //if percentTime is equal or greater than 100
        if(percentTime >= 100) {
          //slide to next item
          $elem.trigger('owl.next')
        }
      }
}
 
//pause while dragging
function pauseOnDragging(){
      isPause = true;
}
 
//moved callback
function moved(){
      //clear interval
      clearTimeout(tick);
      //start again
      start();
}

//pause on mouseover

 $elem.on('mouseover',function(){
 isPause = true;
 })
 $elem.on('mouseout',function(){
 isPause = false;
 })

});
--></script>