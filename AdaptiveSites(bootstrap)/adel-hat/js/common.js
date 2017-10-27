$(document).ready(function() {

	// Owl Slider
	$("#owl-example").owlCarousel({

		singleItem:true,
		autoPlay: 5000,
		pagination: false,
		itemsScaleUp: true,
		transitionStyle: "fadeUp",

	});

	//Toggle Menu
	$(".drop-menu").click(function () {
      $("#t-menu").toggle();
    });
    $(".mob-menu ul li a").click(function () {
      $("#t-menu").toggle();
    });

	//Magnific Popup
  	$('.popup-link').magnificPopup({
  		type: 'image'
  	});

  	$('.form-popup-link').magnificPopup({
  		type:'inline',
  		closeBtnInside:true,
  		midClick: true // Allow opening popup on middle mouse click. Always set it to true if you don't provide alternative source in href.
	});

	//Smooth Scroll by Cferdinandi
	smoothScroll.init({
		speed: 1000,
		easing: 'easeInOutCubic',
		offset: 70
	});

	//Цели для Яндекс.Метрики и Google Analytics
	$("#download-button").on("click", (function() {
		ga("send", "event", "goal", "goal");
		yaCounter39158605.reachGoal("catalogDownload");
		return true;
	}));

	//SVG Fallback
	if(!Modernizr.svg) {
		$("img[src*='svg']").attr("src", function() {
			return $(this).attr("src").replace(".svg", ".png");
		});
	};

	//Аякс отправка форм
	//Документация: http://api.jquery.com/jquery.ajax/
	$("#m-form").submit(function() {
		$.ajax({
			type: "POST",
			url: "mail.php",
			data: $(this).serialize()
		}).done(function() {
			alert("Спасибо за заявку!");
			setTimeout(function() {
				
				$("#m-form").trigger("reset");
			}, 1000);
		});
		return false;
	});
	$("#u-form").submit(function() {
		$.ajax({
			type: "POST",
			url: "mail.php",
			data: $(this).serialize()
		}).done(function() {
			alert("Спасибо за заявку!");
			setTimeout(function() {
				
				$("#u-form").trigger("reset");
			}, 1000);
		});
		return false;
	});

	//Chrome Smooth Scroll
	try {
		$.browserSelector();
		if($("html").hasClass("chrome")) {
			$.smoothScroll();
		}
	} catch(err) {

	};

	$("img, a").on("dragstart", function(event) { event.preventDefault(); });
	
});

$(window).load(function() {

	$(".loader_inner").fadeOut();
	$(".loader").delay(400).fadeOut("slow");

});
