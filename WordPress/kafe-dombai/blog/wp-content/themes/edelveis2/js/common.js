$(document).ready(function() {

	//Аякс отправка форм
	//Документация: http://api.jquery.com/jquery.ajax/
	$("#order").submit(function() {
		$.ajax({
			type: "POST",
			url: "mail.php",
			data: $(this).serialize()
		}).done(function() {
			alert("Спасибо за заявку!");
			setTimeout(function() {
				
				$("#order").trigger("reset");
			}, 1000);
		});
		return false;
	});

	//Magnific popup
	//Документация http://dimsemenov.com/plugins/magnific-popup/documentation.html#initializing-popup
	$('.thumbs-box').magnificPopup(
		{
  		delegate: 'a', // child items selector, by clicking on it popup will open
  		type: 'image',
  		gallery:{
    		enabled:true
  		}	
	});
	$('.gallery-box').magnificPopup(
		{
  		delegate: 'a', // child items selector, by clicking on it popup will open
  		type: 'image',
  		gallery:{
    		enabled:true
  		}	
	});
});