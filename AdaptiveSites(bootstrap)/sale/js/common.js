$(document).ready(function() {

	//flipclock
		// Берем сегодняшнюю дату
		var currentDate = new Date();

		// Установка дня до которого ведется отсчет
		var futureDate  = new Date('2016-01-11 23:59:59');

		// Вычисление оставшегося временя до намеченной даты
		var diff = futureDate.getTime() / 1000 - currentDate.getTime() / 1000;

		// Instantiate a coutdown FlipClock
		var clock = $('.countdown-clock').FlipClock(diff, {
			countdown: true,
			language: 'Russian'
		});

	//Smooth Scroll by Cferdinandi
	smoothScroll.init({
		speed: 1000,
		easing: 'easeInOutCubic',
	});

	//Magnific Popup
	$('.portfolio-box').magnificPopup({
  		delegate: 'a', // child items selector, by clicking on it popup will open
  		type: 'image'
  		// other options
	});

	//Цели для Яндекс.Метрики и Google Analytics
	$(".count_element").on("click", (function() {
		ga("send", "event", "goal", "goal");
		yaCounterXXXXXXXX.reachGoal("goal");
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
	$("#main-form").submit(function() {
		$.ajax({
			type: "POST",
			url: "mail.php",
			data: $(this).serialize()
		}).done(function() {
			alert("Спасибо за заявку!");
			setTimeout(function() {
				
				$("#main-form").trigger("reset");
			}, 1000);
		});
		return false;
	});
	$("#bottom-form").submit(function() {
		$.ajax({
			type: "POST",
			url: "mail.php",
			data: $(this).serialize()
		}).done(function() {
			alert("Спасибо за заявку!");
			setTimeout(function() {
				
				$("#bottom-form").trigger("reset");
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
