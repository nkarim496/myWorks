<script type="text/javascript" src="catalog/view/javascript/jquery/jquery.cookie.min.js"></script>
<div id="popup_window"> 
	<style type="text/css" scoped>
		#popup_window {display:none;background:#eee;padding:20px;border-radius:6px;max-width:600px;box-shadow: 0 0 15px #222;}
		#popup_window h1{margin:0 0 20px;padding:0;}
		#popup_window div {color:#222; line-height:1.5em;}
		#popup_window div:nth-child(3){margin-bottom:20px;}
		#popup_window div:nth-child(3) b{display:block;margin:20px 0 0;padding:3px 10px;background:#ddd;color:#f00;border-radius:6px;}
		#popup_window div:nth-child(4){text-align:right}
		#popup_window ul {list-style:none;}
		@media (max-width:640px){
			#popup_window {display:none !important}
		}
	</style>
	<script>
	$(document).ready(function() {
		$('#popup_window').popup({transition:'all 0.3s', scrolllock:true, blur:false, escape:false});
		
		if (!$.cookie('i_am_good') && $(window).width() > 640) {  
			$('#popup_window').popup('show');  
		}	
	});
	function set_cookie() { 
		$.cookie('i_am_good', true, {  
			expires: 0.1,  
			path: '/'  
		});
		$('#popup_window').popup('hide');
	}
	</script>
	<h1>Обращаю Ваше внимание!</h1>
	<div>
	Данный шаблон является коммерческим и распространяется исключительно на платной основе. 
	Варианты приобретения шаблона:
	<ul>
	<li>1 - <a href="https://opencartforum.com/files/file/2697-%D0%B0%D0%B4%D0%B0%D0%BF%D1%82%D0%B8%D0%B2%D0%BD%D1%8B%D0%B9-%D1%88%D0%B0%D0%B1%D0%BB%D0%BE%D0%BD-fastfood-%D0%B4%D0%BB%D1%8F-ocstore-%D0%B8-opencart-15/">http://opencartforum.com</a></li>
	<li>2 - напрямую у автора <a href="mail:sergey@oc-dev.ru">sergey@oc-dev.ru</a></li>
	<li>3 - для разработчиков существует расширенная лицензия и хорошая скидка</li>
	</ul>
	<b>Все прочие копии шаблона являются нелегальными, не будут иметь никакой поддержки автором и нарушают закон об авторском праве.</b>
	</div>
	<div>
	<input type="button" class="button" value="Я согласен с написанным выше" onclick="set_cookie()" />
	</div>
</div>
