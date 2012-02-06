// JavaScript Document

/*$(document).ready(function() {	
	if (jQuery.browser.msie && jQuery.browser.version == '6.0') {     
		$('.l-home .l-col:first').addClass('first');		
     };
});*/


var timeout    = 500;
var closetimer = 0;
var ddmenuitem = 0;

function jsddm_open()
{jsddm_canceltimer();
   jsddm_close();
   ddmenuitem = $(this).find('ul').css('visibility', 'visible');}

function jsddm_close()
{if(ddmenuitem) ddmenuitem.css('visibility', 'hidden');}


function jsddm_timer()
{closetimer = window.setTimeout(jsddm_close, timeout);}

function jsddm_canceltimer()
{if(closetimer)
   {window.clearTimeout(closetimer);
      closetimer = null;}}

WidgetGallery = {
        next: false,
        prev: true,
        action: false,
        size: 0,
        options: {'img_container':'', 'i_logo':'', 'l_arrow':'', 'r_arrow': ''},
        time: 200,
        init: function(container, i_logo, l_arrow, r_arrow) {
            WidgetGallery.options.img_container = container;
            WidgetGallery.options.i_logo = i_logo;
            WidgetGallery.options.l_arrow = l_arrow;
            WidgetGallery.options.r_arrow = r_arrow;
            WidgetGallery.size = $('.'+container + ' img').size() - 1;

            $('.' + WidgetGallery.options.l_arrow).live('click', function() {
            var active = $('.' + WidgetGallery.options.img_container + ' img.active').index();
            WidgetGallery.slideImage(active - 1);
            return false;
            });
            $('.' + WidgetGallery.options.r_arrow).live('click', function() {
                var active = $('.' + WidgetGallery.options.img_container + ' img.active').index();
                WidgetGallery.slideImage(active + 1);
                return false;
            });
            $('.' + WidgetGallery.options.i_logo + ' a').live('click', function() {
                var links = $('.' + WidgetGallery.options.i_logo + ' a');
                var index = $(links).index(this);
                WidgetGallery.slideImage(index);
                return false;
            });
        },
        slideImage: function(index) {
            if (index >= 0 && index < WidgetGallery.size && WidgetGallery.action == false) {
                WidgetGallery.action = true;
                $('.' + WidgetGallery.options.img_container + ' .active').fadeOut(WidgetGallery.time, function() {
                    $(this).removeClass('active');
                    $('.' + WidgetGallery.options.i_logo + '.active').removeClass('active');
                    $('.' + WidgetGallery.options.i_logo).eq(index).addClass('active');

                    if (index == 0) {
                        WidgetGallery.prev = true;
                        $('.' + WidgetGallery.options.l_arrow).fadeOut(WidgetGallery.time);
                        if (WidgetGallery.next == true) $('.' + WidgetGallery.options.r_arrow).fadeIn(WidgetGallery.time);
                    }
                    else if (index == (WidgetGallery.size - 1)) {
                        WidgetGallery.next = true;
                        $('.' + WidgetGallery.options.r_arrow).fadeOut(WidgetGallery.time);
                        if (WidgetGallery.prev == true) $('.' + WidgetGallery.options.l_arrow).fadeIn(WidgetGallery.time);
                    }
                    else {
                        if (WidgetGallery.prev == true) $('.' + WidgetGallery.options.l_arrow).fadeIn(WidgetGallery.time);
                        if (WidgetGallery.next == true) $('.' + WidgetGallery.options.r_arrow).fadeIn(WidgetGallery.time);
                    }
                    $('.' + WidgetGallery.options.img_container +' img').eq(index).fadeIn(WidgetGallery.time, function() {
                        $(this).addClass('active');
                        WidgetGallery.action = false;
                    });
                });
            }
        }
    }

$(document).ready(function() {
	$('#navTop > li').bind('mouseover', jsddm_open)
        $('#navTop > li').bind('mouseout',  jsddm_timer)

        $('.b-faq-answer').hide();
	//$('.b-faq-answer:first').show();
	
        $('a.lnk-faq').click(function(){
                var state = false;
                if($(this).parent().next('.b-faq-answer').css('display') == 'block'){
                    state = true;
                }
                $('.b-faq-answer').slideUp('fast');
                if (state){
                    $(this).parent().next('.b-faq-answer').slideUp('fast');
                } else {
                    $(this).parent().next('.b-faq-answer').slideDown('fast')
                }
                return false;
	});
	$('.b-faq-all a').toggle(function(){
            $('.b-faq-answer').slideDown('fast');
            $(this).html('скрыть все ответы');
                   return false;
	},
	function(){
            $('.b-faq-answer').slideUp('fast');
            $(this).html('открыть все ответы');
		return false;
	}
	);
//	 $('.btn-buy').click( function() {
//         var h = $(window).height();
//         var margin = $(window).height() /2  - $('.b-popup-buy').height() / 2
//         if ($('.b-popup-buy').height() < $(window).height()){
//            $('.b-popup-buy').css('margin-top', margin);
//         }
//		$('.b-popup-buy').modal({
//			  overlayCss: {
//					backgroundColor: '#000'
//			  },
//			  containerCss: {
//					height: h,
//					width: '840'
//			  }
//			});
//	 });

    //When page loads...
	$(".tab_content").hide(); //Hide all content
	$("ul.tabs li:first").addClass("active").show(); //Activate first tab
	$(".tab_content:first").show(); //Show first tab content


	//On Click Event
	$("ul.tabs li").click(function() {

		$("ul.tabs li").removeClass("active"); //Remove any "active" class
		$(this).addClass("active"); //Add "active" class to selected tab
		$(".tab_content").hide(); //Hide all tab content

		var activeTab = $(this).find("a").attr("href"); //Find the href attribute value to identify the active tab + content
        if (activeTab == "#tab1")
            WidgetGallery.init('img_container', 'i_logo', 'l_arrow', 'r_arrow');
        else
            WidgetGallery.init('img_container2', 'i_logo2', 'l_arrow2', 'r_arrow2');
		$(activeTab).show(); //Fade in the active ID content

		return false;
	});
 });

document.onclick = jsddm_close;

OrderModel = {
    id: '',
    flag: true,
    path: '',
    discount: 1,
    init: function(path, id) {

        $('.jstyling-radio').css('margin-right', '6px');
        OrderModel.id = id;
        OrderModel.path = path;
        $('.b-order-img img').attr('src', path+"storage/full_description_big/" + id + ".jpg");
        var sub = id.substr(0, 1);
        if (sub != 6 && sub != 5 && sub != 8) {
            $('.b-order-colors > label:last').hide();
        }

        $('#send').click(function(){ OrderModel.validate() });

        id = id.substr(2);
        id = id.substr(0,1);
        $('#'+id).children().children('input').attr('checked', 'checked');
        $('#'+id).children().addClass('active');

        $('.b-order-colors label').bind('click', function(){
            id = $(this).attr('id');
            $('.b-order-img img').attr('src', path+"storage/full_description_big/"+ OrderModel.id.substr(0, 1) + '_' + id + "_1.jpg");
        });

        $('.lnk-order-tooltip').click(function(){
            $('.b-order-tooltip').hide();
            $(this).parent().find('.b-order-tooltip').show();
            return false;
        }).hover(function(){
                $(this).parent().children('a').css('text-decoration','underline');
            },function(){
                $(this).parent().children('a').css('text-decoration','none');
            });
        $('.b-tooltip-close').click(function(){
            $(this).parent().parent('.b-order-tooltip').hide();
            return false;
        });
        $('.btn-back').click(function(){  window.location = 'http://gophotoweb.ru/catalog.html'; });
        $('.b-order-tooltip-i a').click(function(){
            var href = $(this).attr('href');
            if ($(this).attr('target') == '_blank')
                window.open(href, '_blank');
            else
                window.location = href;
        });
        $('.f-order-new').find('input[type=text]').bind('focus', function() {
            if ($(this).val() == $(this).attr('tooltip') || $(this).val() == $(this).attr('error') || $(this).val() == "Неправильный email") {
                $(this).val('');
            }
        }).bind('blur', function() {
            if ($(this).val() == '') {
                $(this).val($(this).attr('tooltip'));
            }
        });
        OrderModel.priceRefresh(1);
        $('input[name=discount]').click(function(){
            if ($(this).is(':checked')) {
                OrderModel.discount = 0.7;
            }
            else {
                OrderModel.discount = 1;
            }
            OrderModel.priceRefresh(OrderModel.discount);
        });
        $('input[type=radio], input[type=checkbox]').bind('click', function(){ OrderModel.priceRefresh(OrderModel.discount); });
    },
    priceRefresh: function(discount) {
        var sitePrice = parseInt($('.price:first').html());
        var otherPrice = 0;
        $('.line > label > input:checked').parent().parent().children('.price').each(function(){
            otherPrice += (parseInt($(this).html()));

        });
        otherPrice += (parseInt($('.line > label > div > input:checked:last').parent().parent().parent().children('.price').html()));
        var hostingPrice = parseInt($('.line > label > div > input:checked:first').parent().parent().parent().children('.price').html());
        $('.price:last').html((parseInt((sitePrice + otherPrice + hostingPrice) * discount)) + '<sup>$</sup>');
    },
    validate: function() {
        $('#name, #phone, #email').removeClass('error');

        var flag = true;
        var name = $('#name');
        if ($(name).val() == $(name).attr('tooltip') || $(name).val() == $(name).attr('error') || $(name).val() == '') {
            flag = false;
            $(name).val("Введите ФИО");
            $(name).addClass("error");
        }
        var phone = $('#phone');
        if ($(phone).val() == $(phone).attr('tooltip') || $(phone).val() == $(phone).attr('error') || $(phone).val() == '') {
            flag = false;
            $(phone).val("Введите телефон");
            $(phone).addClass("error");
        }
        var email = $('#email');
        var emailrule = new RegExp('^[a-zA-Z0-9._-]+@[a-zA-Z0-9_-]+[\.][a-zA-Z0-9._-]+$');
        if ($(email).val() == $(email).attr('tooltip') || $(email).val() == $(email).attr('error') || $(email).val() == '') {
            flag = false;
            $(email).val("Введите Email");
            $(email).addClass("error");
        }
        else if (! emailrule.test($(email).val())) {
            flag = false;
            $(email).val("Неправильный email");
            $(email).addClass("error");
        }

        var country = $('#country');
        if ($('#country option:selected').val() == 0) {
            flag = false;
            $(country).addClass("error");
        }
        else
            $(country).removeClass('error');

        if ($('#agreement > input').is(':checked') == false) {
            $('#error').show();
        }
        else {
            $('#error').hide();
        }
        if (flag == true) {
            name = $("#name").val();
            email = $("#email").val();
            phone = $("#phone").val();
            var skype = ($("#skype").val() == 'Skype') ? '' : $("#skype").val();
            var url = ($("#url").val() == $("#url").attr('tooltip')) ? '' : $("#url").val();
            var mess = $("#message").val();
            var communication = $('#communication option:selected').val();
            var source = $('#source option:selected').val();
            country = $('#country option:selected').val();
            var hosting = $('input[name=hosting]:checked').val();
            var logo = $('input[name=logo]:checked').val();
            var namesite = $('.b-order-name > h2 > span').html()+'-'+$('.b-order-colors > label > div > input:checked').parent().parent('label').attr('id');
            var other = [];
            var discount = $('input[name=discount]').is(':checked') ? 'y' : 'n';
            $('input[name=other]:checked').each(function(){
                other.push($(this).val());
            });
            other.push(hosting);
            other.push(logo);
            if ($('#agreement > input').is(':checked') == false) {
                $.post(OrderModel.path+"dont_agree.html",
                    {name:name, mess:mess, email:email, phone:phone, skype:skype, communication:communication,
                        from:source, namesite:namesite, country:country, other:other, url:url}, function(){
                            $('#error').show();
                });
                return false;
            }
            else {
                $.post(OrderModel.path+"send_site_new.html",
                    {name:name, mess:mess, email:email, phone:phone, skype:skype, communication:communication,
                        from:source, namesite:namesite, country:country, other:other, url:url, discount:discount}, function(response){
                            if (response === "ok") {
                                window.location = OrderModel.path+"order_success.html";
                            }
                            else {
                                var msg = 'Ошибка при отправке заявки. Пожалуйста, заполните поля заявки еще раз и нажмите кнопку отправить.';
                                $('#msgbox').html(msg).css('visibility', 'visible').css('color', 'red');
                            }
                });
                $('#error').hide();
            }
        }
    }
};