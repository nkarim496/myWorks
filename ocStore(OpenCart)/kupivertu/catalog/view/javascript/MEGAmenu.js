(function($){	
	$(document).ready(function(){
		if ( ! ( $.browser.msie && ($.browser.version == 6) ) ){
		$("ul#topnav li:has(ul)").addClass("dropdown");
	}
		$("ul#topnav li.dropdown").hover(function () {
		$('ul:first', this).css({visibility: "visible",display: "none"}).slideDown('normal');
		}, function () {
		$('ul:first', this).css({visibility: "hidden"});
	});
});
})(window.jQuery);