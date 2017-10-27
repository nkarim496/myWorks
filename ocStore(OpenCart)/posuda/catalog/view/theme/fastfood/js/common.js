;(function($){var $window=$(window);var options={};var zindexvalues=[];var lastclicked=[];var scrollbarwidth;var bodymarginright=null;var opensuffix='_open';var closesuffix='_close';var stack=[];var transitionsupport=null;var opentimer;var iOS=/(iPad|iPhone|iPod)/g.test(navigator.userAgent);var methods={_init:function(el){var $el=$(el);var options=$el.data('popupoptions');lastclicked[el.id]=false;zindexvalues[el.id]=0;if(!$el.data('popup-initialized')){$el.attr('data-popup-initialized','true');methods._initonce(el)}if(options.autoopen){setTimeout(function(){methods.show(el,0)},0)}},_initonce:function(el){var $el=$(el);var $body=$('body');var $wrapper;var options=$el.data('popupoptions');var css;bodymarginright=parseInt($body.css('margin-right'),10);transitionsupport=document.body.style.webkitTransition!==undefined||document.body.style.MozTransition!==undefined||document.body.style.msTransition!==undefined||document.body.style.OTransition!==undefined||document.body.style.transition!==undefined;if(options.type=='tooltip'){options.background=false;options.scrolllock=false}if(options.backgroundactive){options.background=false;options.blur=false;options.scrolllock=false}if(options.scrolllock){var parent;var child;if(typeof scrollbarwidth==='undefined'){parent=$('<div style="width:50px;height:50px;overflow:auto"><div/></div>').appendTo('body');child=parent.children();scrollbarwidth=child.innerWidth()-child.height(99).innerWidth();parent.remove()}}if(!$el.attr('id')){$el.attr('id','j-popup-'+parseInt((Math.random()*100000000),10))}$el.addClass('popup_content');$body.prepend(el);$el.wrap('<div id="'+el.id+'_wrapper" class="popup_wrapper" />');$wrapper=$('#'+el.id+'_wrapper');$wrapper.css({opacity:0,visibility:'hidden',position:'absolute'});if(iOS){$wrapper.css('cursor','pointer')}if(options.type=='overlay'){$wrapper.css('overflow','auto')}$el.css({opacity:0,visibility:'hidden',display:'inline-block'});if(options.setzindex&&!options.autozindex){$wrapper.css('z-index','100001')}if(!options.outline){$el.css('outline','none')}if(options.transition){$el.css('transition',options.transition);$wrapper.css('transition',options.transition)}$el.attr('aria-hidden',true);if((options.background)&&(!$('#'+el.id+'_background').length)){$body.prepend('<div id="'+el.id+'_background" class="popup_background"></div>');var $background=$('#'+el.id+'_background');$background.css({opacity:0,visibility:'hidden',backgroundColor:options.color,position:'fixed',top:0,right:0,bottom:0,left:0});if(options.setzindex&&!options.autozindex){$background.css('z-index','100000')}if(options.transition){$background.css('transition',options.transition)}}if(options.type=='overlay'){$el.css({textAlign:'left',position:'relative',verticalAlign:'middle'});css={position:'fixed',width:'100%',height:'100%',top:0,left:0,textAlign:'center'};if(options.backgroundactive){css.position='relative';css.height='0';css.overflow='visible'}$wrapper.css(css);$wrapper.append('<div class="popup_align" />');$('.popup_align').css({display:'inline-block',verticalAlign:'middle',height:'100%'})}$el.attr('role','dialog');var openelement=(options.openelement)?options.openelement:('.'+el.id+opensuffix);$(openelement).each(function(i,item){$(item).attr('data-popup-ordinal',i);if(!item.id){$(item).attr('id','open_'+parseInt((Math.random()*100000000),10))}});if(!($el.attr('aria-labelledby')||$el.attr('aria-label'))){$el.attr('aria-labelledby',$(openelement).attr('id'))}if(options.action=='hover'){options.keepfocus=false;$(openelement).on('mouseenter',function(event){methods.show(el,$(this).data('popup-ordinal'))});$(openelement).on('mouseleave',function(event){methods.hide(el)})}else{$(document).on('click',openelement,function(event){event.preventDefault();var ord=$(this).data('popup-ordinal');setTimeout(function(){methods.show(el,ord)},0)})}if(options.closebutton){methods.addclosebutton(el)}if(options.detach){$el.hide().detach()}else{$wrapper.hide()}},show:function(el,ordinal){var $el=$(el);if($el.data('popup-visible'))return;if(!$el.data('popup-initialized')){methods._init(el)}$el.attr('data-popup-initialized','true');var $body=$('body');var options=$el.data('popupoptions');var $wrapper=$('#'+el.id+'_wrapper');var $background=$('#'+el.id+'_background');callback(el,ordinal,options.beforeopen);lastclicked[el.id]=ordinal;setTimeout(function(){stack.push(el.id)},0);if(options.autozindex){var elements=document.getElementsByTagName('*');var len=elements.length;var maxzindex=0;for(var i=0;i<len;i++){var elementzindex=$(elements[i]).css('z-index');if(elementzindex!=='auto'){elementzindex=parseInt(elementzindex,10);if(maxzindex<elementzindex){maxzindex=elementzindex}}}zindexvalues[el.id]=maxzindex;if(options.background){if(zindexvalues[el.id]>0){$('#'+el.id+'_background').css({zIndex:(zindexvalues[el.id]+1)})}}if(zindexvalues[el.id]>0){$wrapper.css({zIndex:(zindexvalues[el.id]+2)})}}if(options.detach){$wrapper.prepend(el);$el.show()}else{$wrapper.show()}opentimer=setTimeout(function(){$wrapper.css({visibility:'visible',opacity:1});$('html').addClass('popup_visible').addClass('popup_visible_'+el.id);$wrapper.addClass('popup_wrapper_visible')},20);if(options.scrolllock){$body.css('overflow','hidden');if($body.height()>$window.height()){$body.css('margin-right',bodymarginright+scrollbarwidth)}}if(options.backgroundactive){$el.css({top:($window.height()-($el.get(0).offsetHeight+parseInt($el.css('margin-top'),10)+parseInt($el.css('margin-bottom'),10)))/2+'px'})}$el.css({'visibility':'visible','opacity':1});if(options.background){$background.css({'visibility':'visible','opacity':options.opacity});setTimeout(function(){$background.css({'opacity':options.opacity})},0)}$el.data('popup-visible',true);methods.reposition(el,ordinal);$el.data('focusedelementbeforepopup',document.activeElement);if(options.keepfocus){$el.attr('tabindex',-1);setTimeout(function(){if(options.focuselement==='closebutton'){$('#'+el.id+' .'+el.id+closesuffix+':first').focus()}else if(options.focuselement){$(options.focuselement).focus()}else{$el.focus()}},options.focusdelay)}$(options.pagecontainer).attr('aria-hidden',true);$el.attr('aria-hidden',false);callback(el,ordinal,options.onopen);if(transitionsupport){$wrapper.one('transitionend',function(){callback(el,ordinal,options.opentransitionend)})}else{callback(el,ordinal,options.opentransitionend)}},hide:function(el){if(opentimer)clearTimeout(opentimer);var $body=$('body');var $el=$(el);var options=$el.data('popupoptions');var $wrapper=$('#'+el.id+'_wrapper');var $background=$('#'+el.id+'_background');$el.data('popup-visible',false);if(stack.length===1){$('html').removeClass('popup_visible').removeClass('popup_visible_'+el.id)}else{if($('html').hasClass('popup_visible_'+el.id)){$('html').removeClass('popup_visible_'+el.id)}}stack.pop();if($wrapper.hasClass('popup_wrapper_visible')){$wrapper.removeClass('popup_wrapper_visible')}if(options.keepfocus){setTimeout(function(){if($($el.data('focusedelementbeforepopup')).is(':visible')){$el.data('focusedelementbeforepopup').focus()}},0)}$wrapper.css({'visibility':'hidden','opacity':0});$el.css({'visibility':'hidden','opacity':0});if(options.background){$background.css({'visibility':'hidden','opacity':0})}$(options.pagecontainer).attr('aria-hidden',false);$el.attr('aria-hidden',true);callback(el,lastclicked[el.id],options.onclose);if(transitionsupport&&$el.css('transition-duration')!=='0s'){$el.one('transitionend',function(e){if(!($el.data('popup-visible'))){if(options.detach){$el.hide().detach()}else{$wrapper.hide()}}if(options.scrolllock){setTimeout(function(){$body.css({overflow:'visible','margin-right':bodymarginright})},10)}callback(el,lastclicked[el.id],options.closetransitionend)})}else{if(options.detach){$el.hide().detach()}else{$wrapper.hide()}if(options.scrolllock){setTimeout(function(){$body.css({overflow:'visible','margin-right':bodymarginright})},10)}callback(el,lastclicked[el.id],options.closetransitionend)}},toggle:function(el,ordinal){if($(el).data('popup-visible')){methods.hide(el)}else{setTimeout(function(){methods.show(el,ordinal)},0)}},reposition:function(el,ordinal){var $el=$(el);var options=$el.data('popupoptions');var $wrapper=$('#'+el.id+'_wrapper');var $background=$('#'+el.id+'_background');ordinal=ordinal||0;if(options.type=='tooltip'){$wrapper.css({'position':'absolute'});var $tooltipanchor;if(options.tooltipanchor){$tooltipanchor=$(options.tooltipanchor)}else if(options.openelement){$tooltipanchor=$(options.openelement).filter('[data-popup-ordinal="'+ordinal+'"]')}else{$tooltipanchor=$('.'+el.id+opensuffix+'[data-popup-ordinal="'+ordinal+'"]')}var linkOffset=$tooltipanchor.offset();if(options.horizontal=='right'){$wrapper.css('left',linkOffset.left+$tooltipanchor.outerWidth()+options.offsetleft)}else if(options.horizontal=='leftedge'){$wrapper.css('left',linkOffset.left+$tooltipanchor.outerWidth()-$tooltipanchor.outerWidth()+options.offsetleft)}else if(options.horizontal=='left'){$wrapper.css('right',$window.width()-linkOffset.left-options.offsetleft)}else if(options.horizontal=='rightedge'){$wrapper.css('right',$window.width()-linkOffset.left-$tooltipanchor.outerWidth()-options.offsetleft)}else{$wrapper.css('left',linkOffset.left+($tooltipanchor.outerWidth()/2)-($el.outerWidth()/2)-parseFloat($el.css('marginLeft'))+options.offsetleft)}if(options.vertical=='bottom'){$wrapper.css('top',linkOffset.top+$tooltipanchor.outerHeight()+options.offsettop)}else if(options.vertical=='bottomedge'){$wrapper.css('top',linkOffset.top+$tooltipanchor.outerHeight()-$el.outerHeight()+options.offsettop)}else if(options.vertical=='top'){$wrapper.css('bottom',$window.height()-linkOffset.top-options.offsettop)}else if(options.vertical=='topedge'){$wrapper.css('bottom',$window.height()-linkOffset.top-$el.outerHeight()-options.offsettop)}else{$wrapper.css('top',linkOffset.top+($tooltipanchor.outerHeight()/2)-($el.outerHeight()/2)-parseFloat($el.css('marginTop'))+options.offsettop)}}else if(options.type=='overlay'){if(options.horizontal){$wrapper.css('text-align',options.horizontal)}else{$wrapper.css('text-align','center')}if(options.vertical){$el.css('vertical-align',options.vertical)}else{$el.css('vertical-align','middle')}}},addclosebutton:function(el){var genericCloseButton;if($(el).data('popupoptions').closebuttonmarkup){genericCloseButton=$(options.closebuttonmarkup).addClass(el.id+'_close')}else{genericCloseButton='<button class="popup_close '+el.id+'_close" title="Close" aria-label="Close"><span aria-hidden="true">?</span></button>'}if($el.data('popup-initialized')){$el.append(genericCloseButton)}}};var callback=function(el,ordinal,func){var options=$(el).data('popupoptions');var openelement=(options.openelement)?options.openelement:('.'+el.id+opensuffix);var elementclicked=$(openelement+'[data-popup-ordinal="'+ordinal+'"]');if(typeof func=='function'){func.call($(el),el,elementclicked)}};$(document).on('keydown',function(event){if(stack.length){var elementId=stack[stack.length-1];var el=document.getElementById(elementId);if($(el).data('popupoptions').escape&&event.keyCode==27){methods.hide(el)}}});$(document).on('click',function(event){if(stack.length){var elementId=stack[stack.length-1];var el=document.getElementById(elementId);var closeButton=($(el).data('popupoptions').closeelement)?$(el).data('popupoptions').closeelement:('.'+el.id+closesuffix);if($(event.target).closest(closeButton).length){event.preventDefault();methods.hide(el)}if($(el).data('popupoptions').blur&&!$(event.target).closest('#'+elementId).length&&event.which!==2&&$(event.target).is(':visible')){methods.hide(el);if($(el).data('popupoptions').type==='overlay'){event.preventDefault()}}}});$(document).on('focusin',function(event){if(stack.length){var elementId=stack[stack.length-1];var el=document.getElementById(elementId);if($(el).data('popupoptions').keepfocus){if(!el.contains(event.target)){event.stopPropagation();el.focus()}}}});$.fn.popup=function(customoptions){return this.each(function(){$el=$(this);if(typeof customoptions==='object'){var opt=$.extend({},$.fn.popup.defaults,customoptions);$el.data('popupoptions',opt);options=$el.data('popupoptions');methods._init(this)}else if(typeof customoptions==='string'){if(!($el.data('popupoptions'))){$el.data('popupoptions',$.fn.popup.defaults);options=$el.data('popupoptions')}methods[customoptions].call(this,this)}else{if(!($el.data('popupoptions'))){$el.data('popupoptions',$.fn.popup.defaults);options=$el.data('popupoptions')}methods._init(this)}})};$.fn.popup.defaults={type:'overlay',autoopen:false,background:true,backgroundactive:false,color:'black',opacity:'0.5',horizontal:'center',vertical:'middle',offsettop:0,offsetleft:0,escape:true,blur:true,setzindex:true,autozindex:false,scrolllock:false,closebutton:false,closebuttonmarkup:null,keepfocus:true,focuselement:null,focusdelay:50,outline:false,pagecontainer:null,detach:false,openelement:null,closeelement:null,transition:null,tooltipanchor:null,beforeopen:null,onclose:null,onopen:null,opentransitionend:null,closetransitionend:null}})(jQuery);

$(window).load(function(){
	menu();
	children_menu();
});

$(document).ready(function() {

	if($('input[name=\'quantity\']').val() > 1) {
		recalculateprice($('input[name=\'product_id\']').val());
	}
	
	$('.cart input[type=\'tel\']').each(function() {
		if($(this).val() > 1) {
			var p_id = $(this).attr('class').substr(9, 15);
			recalculateprice(p_id);
		}
	});
	
	$(window).scroll(function(){
		if($(window).width()>1090 && $('#footer input[name=\'fixheader\']').val() == 1) {
			if($(this).scrollTop()>70) {
				$('#header').addClass('scroll');
				$('.row.margin').addClass('margin-top');
			}else{
				$('#header').removeClass('scroll');
				$('.row.margin').removeClass('margin-top');
			}
		}
		
		if($(this).scrollTop()>170) {
			$('.scroll_up').addClass('show');
		}else{
			$('.scroll_up').removeClass('show');
		}
	});
	
	$('body').append('<i class="fa fa-chevron-up scroll_up" onclick="scroll_to(\'body\')"></i>');

	max_height_div('.product .name');
	max_height_div('.product .description');
	max_height_div('.product .option');
	max_height_div('.news_module .name');
	max_height_div('.news_module .description');
	
	$('#links .search, #menu .search').bind('click', function () {
		$('.hidden-sm #search').toggleClass('show'); 
		$('.hidden-sm #search input[name=\'search\']').focus();
	});
	
	$('.selected_category ul li').bind('click', function () {
		$('#search .selected_category > span span').text($(this).text());
		$('#search .selected_category input[name=\'filter_category_id\']').val($(this).attr('data-id'));
	});

	$('#cart_wrap').load('index.php?route=common/cart/info', function() {
		$('#cart').bind('click', function () {
			$('#cart, #cart_content').toggleClass('show');
			
			var time;
				
			$('#cart_content').mouseout(function() {
				time = setTimeout(function() { 
					$('#cart, #cart_content').removeClass('show');
				}, 3000);
			});		
			$('#cart_content').mouseover(function(){
				clearTimeout(time);
			});
			
			if ($('.cart_content .mini-cart-info tr').size() != 0) {
				$('.quick_order').addClass('show')
			}
		});
	});

	$('#menu .more').bind('click', function() {
		$(this).parent().find('<div>').toggleClass('show');
	});

	$('.category_sidebar .five').bind('click', function() {
		$(this).parent().find('.hidden').toggleClass('show');
		$(this).parent().find('.five i').toggleClass('show');
		var show_height = 0;
		$('.category_sidebar li.show').each(function() {
			show_height += 35;
		});
		if(show_height > 0) {
			$('.category_sidebar').css('margin-bottom', -(show_height+3)).toggleClass('show');
		} else {
			$('.category_sidebar').css('margin-bottom', 0).toggleClass('show');
		}
		//$('body').toggleClass('blur');
	});

	$('body').append('<div class="show_quick_view"></div>');
	$('.show_quick_view').popup({transition: 'all 0.3s', scrolllock: true});
	
	if($('#footer input[name=\'quickview\']').val() == 1) {
		add_quick_view();
	}
	
	$('body').append('<div class="show_callback"></div>');
	$('.show_callback').load('index.php?route=module/callback' , function() {
		$('#callback').popup({transition: 'all 0.3s', scrolllock: true});
	});
	
	$('body').on('click', '.button-search', function() {
		url = $('base').attr('href') + 'index.php?route=product/search';
		var value = $(this).parent().parent().find('input[name=\'search\']').val();
		if (value) {
			url += '&search=' + encodeURIComponent(value);
		}
		var filter_category_id = $(this).parent().parent().find('input[name=\'filter_category_id\']').val();
		if (filter_category_id > 0) {url += '&category_id=' + encodeURIComponent(filter_category_id);}
		location = url;
	});
	
	$('#header input[name=\'search\']').bind('keydown', function(e) {
		if (e.keyCode == 13) {
			$('.button-search').trigger('click');
		}
	});
	
	$('.success img, .warning img, .attention img, .information img').on('click', function() {
		$(this).parent().fadeOut('slow', function() {
			$(this).remove();
		});
	});
	
	$(window).resize(function(){
		//if($('.more > div > ul li').size() == 0) {
			menu();
		//}
	});
	
	$('body').on('click', '.success .close', function() {
		$('.success').remove();
	})
});

function menu() {
	if($(window).width()>970) {
		var menu_width = $('#menu').width();
		var total_width = -20;
		$('.more > div > ul li').remove();
	
		$('#menu > ul > li').each(function() {		
			total_width += $(this).width()+20;

			if ((total_width+$(this).next().width()) > menu_width && (total_width+40) > menu_width) {
				$('#menu ul li:last').after('<li class="more"><a class="show_more" title=""><i class="fa fa-angle-double-right"></i></a><div><ul></ul></div></li>');
				$(this).clone().appendTo('.more > div > ul');
				$('.more .more').remove();
				$(this).addClass('hidden');
				children_menu();
			} else {
				$('.more').remove();
				$(this).removeClass('hidden');
			}
			
			$(this).attr('data-width', total_width)
		});
	}
}

function children_menu() {
	$('#menu ul > li > a + div').each(function() {	
		var menu = $('#menu').offset();
		var dropdown = $(this).parent().offset();
		
		i = (dropdown.left + $(this).outerWidth()) - (menu.left + $('#menu').outerWidth());
		
		if (i > 0) {
			$(this).css('margin-left', '-' + (i + 0) + 'px');
		}
	});
}

function quantity(p_id, minimum, flag) {
    var input = $('.quantity_'+p_id+' input');
	if(flag == '+') {
		input.val(Number(input.val())+1);
	}
	if(flag == '-') {
		if(parseFloat(input.val()) > minimum) {
			input.val(Number(input.val())-1);
		}
	}
	recalculateprice(p_id);
}

function scroll_to(hash) {		
	if($(window).width()>1090) {
		var destination = $(hash).offset().top-150;
	} else {
		var destination = $(hash).offset().top;
	}
	$('html, body').animate({scrollTop: destination}, 400);
}

function add_quick_view() {
	$('.image').each(function () {		
		if ($(this).find('img').attr('data-id')) {
			id = $(this).find('img').attr('data-id');
			$(this).prepend('<div class="open_quick_view" onclick="open_quick_view(\''+id+'\');" title="Быстрый просмотр"><i class="fa fa-search-plus"></i></div>');
		}
	});
}
	
function open_quick_view(p_id) {
	$('.show_quick_view').load('index.php?route=product/quick_view&id='+p_id, function() {
		$('.show_quick_view').popup('show');	
		$('.image-additional img').bind('click', function (){
			$('.quick_view .image > img').attr('src', $(this).attr('data-thumb'));
		});
	
		$('.quick_view .options input[type="checkbox"]').bind('change', function() { recalculateprice(p_id); });
		$('.quick_view .options input[type="radio"]').bind('change', function() { recalculateprice(p_id); });
		$('.quick_view .options select').bind('change', function() { recalculateprice(p_id); });
	});		
}

var cart = {
	'add': function(product_id, quantity, flag) {
		if (!$('input[name=\'product_id\']').length || flag) {
			var options = $('#option_'+product_id+' input[type=\'text\'], #option_'+product_id+' input[type=\'radio\']:checked, #option_'+product_id+' input[type=\'checkbox\']:checked, #option_'+product_id+' select, #option_'+product_id+' textarea');
		} else {
			var options = $('.options input[type=\'text\'], .options input[type=\'radio\']:checked, .options input[type=\'checkbox\']:checked, .options select, .options textarea');
		}
		
		if (options.length) {
			var data = options.serialize() + '&product_id=' + product_id + '&quantity=' + quantity;
		} else {
			var data = 'product_id=' + product_id + '&quantity=' + quantity;
		}
		
		var quantity = typeof(quantity) != 'undefined' ? quantity : 1;

		$.ajax({
			url: 'index.php?route=checkout/cart/add',
			type: 'post',
			data: data,
			dataType: 'json',
			success: function(json) {	
				if (json['error']) {
					if (json['error']['option']) {
						for (i in json['error']['option']) {
							//$('#option-' + i).after($('<span class="error">' + json['error']['option'][i] + '</span>').fadeIn().delay('2000').fadeOut(function() {$(this).remove()}));
							$('#input-option' + i).parent().after($('<span class="error">' + json['error']['option'][i] + '</span>').fadeIn().delay('5000').fadeOut(function() {$(this).remove()}));
						}
					}
				}
			
				if ($('input[name=\'product_id\']').val() != product_id && json['redirect'] || !options && json['redirect']) {
					//location = json['redirect'];
				}
			
				if (json['success']) {
					$('.show_quick_view').popup('hide');
					$('#cart-total').html(json['total_items']);	
				
					$('.cart_content').load('index.php?route=common/cart/info .cart_content > *', function() {
						if	(!$('#cart_content').hasClass('show')) {
							$('#cart, #cart_content').addClass('show')
						}
						if ($('.cart_content .mini-cart-info tr').size() != 0) {
							$('.quick_order').addClass('show')
						}
					});
				
					var width = $(window).width();
					var time;
				
					if (width > 1024) {
						time = setTimeout(function() { 
							$('#cart, #cart_content').removeClass('show');
						}, 7000);
				
						$('#cart_content').mouseover(function(){
							clearTimeout(time);
						});
					}
				
					if (width < 780) {
						scroll_to('#cart');
					}
				}	
			}
		});
	},
	'update': function(key, quantity, minimum) {
		if (quantity != 0 && quantity != 'undefined' && quantity >= minimum) {
			$.ajax({
				type: 'post',
				data: 'quantity['+key+']='+quantity,
				url: 'index.php?route=checkout/cart/edit',
				dataType: 'html',
				success: function(data) {
					$('#cart').load('index.php?route=common/cart/info #cart > *');
					$('.cart_content').load('index.php?route=common/cart/info .cart_content > *', function() {
						if ($('.cart_content .mini-cart-info tr').size() == 0) {
							$('.quick_order').removeClass('show')
						}
					});
				}
			});
		} else {
			$('#cart_content input[name=\'quantity['+key+']\']').val(minimum);
		}
	},
	'remove': function(key) {
		$.ajax({
			type: 'post',
			data: 'key=' + key,
			url: 'index.php?route=checkout/cart/remove',
			dataType: 'html',
			success: function() {
				$('#cart').load('index.php?route=common/cart/info #cart > *');
				$('.cart_content').load('index.php?route=common/cart/info .cart_content > *', function() {
					if ($('.cart_content .mini-cart-info tr').size() == 0) {
						$('.quick_order').removeClass('show')
					}
				});
			}
		});
	}
}

function getURLVar(key) {
	var value = [];
	
	var query = String(document.location).split('?');
	
	if (query[1]) {
		var part = query[1].split('&');

		for (i = 0; i < part.length; i++) {
			var data = part[i].split('=');
			
			if (data[0] && data[1]) {
				value[data[0]] = data[1];
			}
		}
		
		if (value[key]) {
			return value[key];
		} else {
			return '';
		}
	}
} 

function updateCart(key, quantity, minimum) {
if (quantity != 0 && quantity != 'undefined' && quantity >= minimum) {
	$.ajax({
		type: 'post',
		data: 'quantity['+key+']='+quantity,
		url: 'index.php?route=checkout/cart',
		dataType: 'html',
		success: function(data) {
			$('#cart').load('index.php?route=common/cart/info #cart > *');
			$('.cart_content').load('index.php?route=common/cart/info .cart_content > *', function() {
				if ($('.cart_content .mini-cart-info tr').size() == 0) {
					$('.quick_order').removeClass('show')
				}
			});
		}
	});
} else {
	$('#cart_content input[name=\'quantity['+key+']\']').val(minimum);
}
}

function deletefromCart(key) {
	$.ajax({
		type: 'post',
		url: 'index.php?route=common/cart/info&remove='+key,
		dataType: 'html',
		success: function() {
			$('#cart').load('index.php?route=common/cart/info #cart > *');
			$('.cart_content').load('index.php?route=common/cart/info .cart_content > *', function() {
				if ($('.cart_content .mini-cart-info tr').size() == 0) {
					$('.quick_order').removeClass('show')
				}
			});
		}
	});
}

function addToWishList(product_id) {
	$.ajax({
		url: 'index.php?route=account/wishlist/add',
		type: 'post',
		data: 'product_id=' + product_id,
		dataType: 'json',
		success: function(json) {
			$('.success, .warning, .attention, .information').remove();
						
			if (json['success']) {
				$('#notification').html('<div class="success" style="display: none;">' + json['success'] + '<i class="fa fa-times close" /></div>');
				
				$('.success').fadeIn('slow');
				
				$('#wishlist-total').html(json['total']);
				
				$('html, body').animate({ scrollTop: 0 }, 'slow');
			}	
		}
	});
}

function addToCompare(product_id) { 
	$.ajax({
		url: 'index.php?route=product/compare/add',
		type: 'post',
		data: 'product_id=' + product_id,
		dataType: 'json',
		success: function(json) {
			$('.success, .warning, .attention, .information').remove();
						
			if (json['success']) {
				$('#notification').html('<div class="success" style="display: none;">' + json['success'] + '<i class="fa fa-times close" /></div>');
				
				$('.success').fadeIn('slow');
				
				$('#compare-total').html(json['total']);
				
				$('html, body').animate({ scrollTop: 0 }, 'slow'); 
			}	
		}
	});
}

function send_quick_order() {
	$.ajax({
		url: 'index.php?route=module/quick_order',
		type: 'post',
		data: $('.quick_order input, .quick_order textarea').serialize(),
		dataType: 'json',
		success: function(json) {				
			if (json['success']) {
				$('.quick_order').html($('<div class="quick_order_success">'+json['success']+'</div>').fadeIn());
				$('#cart').load('index.php?route=common/cart/info #cart > *');
				$('.mini-cart-info, .mini-cart-total').fadeOut();
			}
			if (json['error']) {
				$('.quick_order_button').before($('<div class="quick_order_warning">'+json['error']+'</div>').fadeIn().delay(3000).fadeOut());
			}
		}
	});
}

function add_quick_order() {
	$.ajax({
		url: 'index.php?route=module/quick_order/add_order',
		type: 'post',
		data: $('.quick_order input, .quick_order textarea').serialize(),
		dataType: 'json',
		success: function(json) {				
			if (json['success']) {
				$('.quick_order').removeClass('show');
				$('#cart').load('index.php?route=common/cart/info #cart > *');
				$('.cart_content').load('index.php?route=common/cart/info .cart_content > *', function() {
					$('.cart_content .empty').css('display', 'none').delay(5000).fadeIn();
					$('.quick_order').after($('<div class="quick_order_success">'+json['success']+'</div>').fadeIn().delay(4000).fadeOut());
				});
			}
			if (json['error']) {
				$('.quick_order_button').before($('<div class="quick_order_warning">'+json['error']+'</div>').fadeIn().delay(3000).fadeOut());
			}
		}
	});
}

function send_callback() {
	$.ajax({
		url: 'index.php?route=module/callback/mail',
		type: 'post',
		data: $('.callback input, .callback textarea').serialize(),
		dataType: 'json',
		success: function(json) {				
			if (json['success']) {
				$('.callback').html($('<div class="callback_success">'+json['success']+'</div>').fadeIn());
			}
			if (json['error']) {
				$('.callback_button').before($('<div class="callback_warning">'+json['error']+'</div>').fadeIn().delay(3000).fadeOut());
			}
		}
	});
}

function recalculateprice(p_id, minimum) {
	var input_quantity = Number($('.quantity_'+p_id+' input').val());
	
	if (input_quantity == 0 || input_quantity < minimum) {
		var input_quantity = minimum;
		$('body').find('.quantity_'+p_id+' input').val(input_quantity);
	}

    var main_price = Number($('.price_'+p_id).attr('data-price'));
    var special = Number($('.special_'+p_id).attr('data-price'));
	var points = Number($('.points_'+p_id).attr('data-points'));
	var weight = parseFloat($('.weight_'+p_id).attr('data-weight'));
	var weight_unit = $('.weight_'+p_id).attr('data-weight-unit');
    var tax = 0;
    
    if (isNaN(input_quantity)) {
		var input_quantity = Number($('.quantity_'+p_id).val());
		if (input_quantity == 0 || input_quantity < minimum) {
			var input_quantity = minimum;
			$('body').find('.quantity_'+p_id).val(input_quantity);
		} else {
			//var input_quantity = 1;
		}
	}
	
	if ($('input[name=\'product_id\']').val() == p_id) {
	console.log(main_price)
		special = process_discounts(special, input_quantity);
		main_price = process_discounts(main_price, input_quantity);
	}
	
    $('.option input:checked, .option option:selected').each(function() {
       points += Number($(this).attr('data-points'));
    });
	
	points = points*input_quantity;
	
	$('.points_'+p_id).html(points);
	
	$('.tax_'+p_id).html(price_format(tax));
	
    $('.product_'+p_id+' .option input:checked, .product_'+p_id+' .option option:selected').each(function() {
        weight += Number($(this).attr('data-weight'));
    });
	
	if (isNaN(weight)) {
		var weight = 0;
	} else {
		weight *= input_quantity;
		$('.weight_'+p_id).html(weight_format(weight, weight_unit));
    }
	
    var option_price = 0;
    
    $('.product_'+p_id+' .option input:checked, .product_'+p_id+' .option option:selected').each(function() {
		if ($(this).attr('data-price_prefix') == '+') {
			option_price += Number($(this).attr('data-price'));
			tax -= Number($(this).attr('data-price'));
		}
		if ($(this).attr('data-price_prefix') == '-') {
			option_price -= Number($(this).attr('data-price'));
			tax -= Number($(this).attr('data-price'));
		}
		if ($(this).attr('data-price_prefix') == '*') {
			option_price *= Number($(this).attr('data-price'));
			main_price *= Number($(this).attr('data-price'));
			special *= Number($(this).attr('data-price'));
		}
		if ($(this).attr('data-price_prefix') == '=') {
			option_price += Number($(this).attr('data-price'));
			main_price = 0;
			special = 0;
		}
    });
	
	console.log(option_price)
    
    special += option_price;
    main_price += option_price;

    main_price *= input_quantity;
    special *= input_quantity;
    tax *= input_quantity;
	
	console.log(main_price)
	
	var start_price = $('.price_'+p_id).html().replace(/\s+/g, '');
	var start_price = start_price.match(/(\d+)/g);
	var start_price = parseFloat(start_price);
	
	$({val:start_price}).animate({val:main_price}, {
		duration:500,
		easing:'swing',
		step: function(val) {
			$('.price_'+p_id).html(price_format(val));
		}
	});
	
	if($('.special_'+p_id).size()) {
		var start_special = $('.special_'+p_id).html().replace(/\s+/g, '');
		var start_special = start_special.match(/(\d+)/g);
		var start_special = parseFloat(start_special);
		
		$({val:start_special}).animate({val:special}, {
			duration:500,
			easing:'swing',
			step: function(val) {
				$('.special_'+p_id).html(price_format(val));
			}
		});
	}
}

function max_height_div(div) {
	var maxheight = 0;
	$(div).each(function(){
		if($(this).height() > maxheight) {
			maxheight = $(this).height(); 
		}
	});
	$(div).height(maxheight);
}