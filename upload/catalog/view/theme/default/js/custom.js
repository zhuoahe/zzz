$(window).scroll(function() {
    if ($(this).scrollTop() > 67) {
        $('header').addClass("sticky");
    } else {
        $('header').removeClass("sticky");
    }
});

$(function(){
	$('ul li.dropdown').mouseenter(function(){
		$(this).find('.dropdown-menu').show();
	}).mouseleave(function(){
		$('.dropdown-menu').hide();
	});
});

$(function(){
	$('#cart').mouseenter(function(){
		$('.cartInfo').show();
	}).mouseleave(function(){
		$('.cartInfo').hide();
	});
});

$(function(){
	//Select Option Image
	/*if($('body').has('.imgOption')){
		$('.selectField').hide();	
	}
	$('ul.imgOption li a img').click(function(){
		var value = $(this).attr('id');
		$('.selectField').find('option').removeAttr('selected');
		$('.selectField').find('option[value="' + value + '"]').attr('selected','selected');
		$('ul.imgOption li a').removeClass('selected');
		$(this).parent('a').addClass('selected');
	});*/
});

$(function(){
	$('li.parentM').click(function(){
		$(this).find('ul').show();
	}).mouseleave(function(){
		$(this).find('ul').hide();
	});
});