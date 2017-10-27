$(document).ready(function () {
	$("ul.menu_body li:even").addClass("alt");
    $('a.menu_head').click(function () {
    $('ul.menu_body1').css('display','none');
    $('ul.menu_body2').css('display','none');
    $('ul.menu_body3').css('display','none');
	$('ul.menu_body').slideToggle(0);
    });
    $('a.menu_name').click(function () {
    $('ul.menu_body1').css('display','none');
    $('ul.menu_body2').css('display','none');
    $('ul.menu_body3').css('display','none');
	$('ul.menu_body').slideToggle(0);
    });
	$('ul.menu_body li a').mouseover(function () {
	$(this).animate({ fontSize: "12px" }, 50 );
    });
	$('ul.menu_body li a').mouseout(function () {
	$(this).animate({ fontSize: "12px" }, 50 );
    });

	$("ul.menu_body1 li:even").addClass("alt");
    $('a.menu_head1').click(function () {
    $('ul.menu_body').css('display','none');
    $('ul.menu_body2').css('display','none');
    $('ul.menu_body3').css('display','none');
	$('ul.menu_body1').slideToggle(0);
    });
    $('a.menu_name1').click(function () {
    $('ul.menu_body').css('display','none');
    $('ul.menu_body2').css('display','none');
    $('ul.menu_body3').css('display','none');
	$('ul.menu_body1').slideToggle(0);
    });
	$('ul.menu_body1 li a').mouseover(function () {
	$(this).animate({ fontSize: "12px" }, 50 );
    });
	$('ul.menu_body1 li a').mouseout(function () {
	$(this).animate({ fontSize: "12px" }, 50 );
    });
    
    $("ul.menu_body2 li:even").addClass("alt");
    $('a.menu_head2').click(function () {
    $('ul.menu_body').css('display','none');
    $('ul.menu_body1').css('display','none');
    $('ul.menu_body3').css('display','none');
	$('ul.menu_body2').slideToggle(0);
    });
    $('a.menu_name2').click(function () {
    $('ul.menu_body').css('display','none');
    $('ul.menu_body1').css('display','none');
    $('ul.menu_body3').css('display','none');
	$('ul.menu_body2').slideToggle(0);
    });
	$('ul.menu_body2 li a').mouseover(function () {
	$(this).animate({ fontSize: "12px" }, 50 );
    });
	$('ul.menu_body2 li a').mouseout(function () {
	$(this).animate({ fontSize: "12px" }, 50 );
    });
    
    $("ul.menu_body3 li:even").addClass("alt");
    $('a.menu_head3').click(function () {
    $('ul.menu_body').css('display','none');
    $('ul.menu_body1').css('display','none');
    $('ul.menu_body2').css('display','none');
	$('ul.menu_body3').slideToggle(0);
    });
    $('a.menu_name3').click(function () {
    $('ul.menu_body').css('display','none');
    $('ul.menu_body1').css('display','none');
    $('ul.menu_body2').css('display','none');
	$('ul.menu_body3').slideToggle(0);
    });
	$('ul.menu_body3 li a').mouseover(function () {
	$(this).animate({ fontSize: "12px" }, 50 );
    });
	$('ul.menu_body3 li a').mouseout(function () {
	$(this).animate({ fontSize: "12px" }, 50 );
    });
});