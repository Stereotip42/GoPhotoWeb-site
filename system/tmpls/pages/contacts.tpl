<?php $this->template('pages/header.tpl');?>
<script type="text/javascript">
$(document).ready(function() {
    var el = $('#contact-form');
    el.find('input[type=text]').bind('focus', function() {
        if ($(this).val() == $(this).attr('tooltip') || $(this).val() == $(this).attr('error') || $(this).val() == "Неправильный email") {
            $(this).val('');
        }
    }).bind('blur', function() {
        if ($(this).val() == '') {
            $(this).val($(this).attr('tooltip'));
        }
    });
    el.find('textarea').bind('focus', function() {
        if ($(this).val() == $(this).attr('tooltip') || $(this).val() == $(this).attr('error')) {
            $(this).val('');
        }
    }).bind('blur', function() {
        if ($(this).val() == '') {
            $(this).val($(this).attr('tooltip'));
        }
    });
    el.find('input[type=button]').bind("click", function() {
        $(".textbox").removeClass("error");
        $('#msgbox').html('').css('visibility', 'hidden');
        var flag = true;
        var name = $('#name');
        if ($(name).val() == $(name).attr('tooltip') || $(name).val() == '') {
            flag = false;
            $(name).val("Введите имя");
            $(name).addClass("error");
        }
        var email = $('#email');
        var emailrule = new RegExp('^[a-zA-Z0-9._-]+@[a-zA-Z0-9_-]+[\.][a-zA-Z0-9._-]+$');
        if ($(email).val() == $(email).attr('tooltip') || $(email).val() == '') {
            flag = false;
            $(email).val("Введите email");
            $(email).addClass("error");
        }
        else if (! emailrule.test($(email).val())) {
            flag = false;
            $(email).val("Неправильный email");
            $(email).addClass("error");
        }
        var text = $('#message');
        if ($(text).val() == $(text).attr('tooltip') || $(text).val() == '') {
            flag = false;
            $(text).val('Введите сообщение');
            $(text).addClass("error");
        }
        if (flag) {
            name = $("#name").val();
            email = $("#email").val();
            if ($("#phone").val() == $("#phone").attr('tooltip')){
                var phone = 'не указан';
            } else {
                var phone = $("#phone").val();
            }
            mess = $("#message").val();
            $.post("<?=Config::get('path/host')?>send.html", {name:name, mess:mess, email:email, phone:phone}, function(response){
                if (response==="ok")
                {
                   msg = 'Сообщение отправлено.';
                   $('#msgbox').html(msg).css('visibility', 'visible').css('color', 'green');
                   $('#name').val($('#name').attr('tooltip'));
                   $('#email').val($('#email').attr('tooltip'));
                   $('#message').val($('#message').attr('tooltip'));
                   $('#phone').val($('#phone').attr('tooltip'))
                } else {
                    msg = 'Ошибка при отправке сообщения.';
                    $('#msgbox').html(msg).css('visibility', 'visible').css('color', 'red');
                }
            });
        }
    });

});
</script>
<div class="foot">
<div class="l-main-container">
	<div class="l-wrapper-up">
	<div class="l-wrapper">
		<div class="l-header">
			<div class="l-header-i new-bg">
                                <?php $this->template('pages/topmenu.tpl')?>
				<!--<div class="b-head-img b-head-img-inner clrfix">
					<img src="<?=Config::get('path/host');?>images/title-feedback.png" width="274" height="22" align="" class="fr" />
				</div>-->
			</div>
		</div>
		<div class="l-container">
			<div class="l-contacts">
				<div class="b-addres">
					<h3>С нами можно связаться</h3>
					<p>по электронной почте: <a href="mailto:hello@gophotoweb.ru">hello@gophotoweb.ru</a>, <br />
					по скайпу: <span>gophotoweb</span>,<br />
					или по телефону <span>+375.172.072.002</span> </p>	
					<p><span>с 10.00 до 18.00 в рабочие дни.</span></p>
					<p>Наш адрес: г. Минск, ул. Бирюзова 10А, офис 504</p>
				</div>
				<div class="f-contacts clrfix" id="contact-form">
					<div class="f-contacts-text">
                        <div id="msgbox"></div>
						<blockquote>
						<h3>Есть вопросы?</h3>
						посетите наш раздел <a href="<?=Config::get('path/host');?>faq.html/">“ЧТО и КАК?”</a></blockquote>
						
						<p>Если там не нашлось ответа на  какой-либо 
						из ваших вопросов, воспользуйтесь формой 
						справа, чтобы задать его.<br /> 
						Наши сотрудники постараются ответить Вам 
						в кратчайшие сроки.</p>
					</div>
                    <div class="f-contacts-fields">
						<input type="text" class="textbox" value="Ваше имя" id="name" tooltip="Ваше имя" error="Введите имя"/>
                            <input type="text" class="textbox" value="Ваш email адрес" id="email" tooltip="Ваш email адрес" error="Введите email"/>
						<input type="text" class="textbox" value="Ваш телефон (не обязательно)" id="phone" tooltip="Ваш телефон (не обязательно)"/>
						<textarea class="textbox" rows="" cols="" id="message" tooltip="Ваше сообщение" error="Введите сообщение">Ваше сообщение</textarea>
					</div>
					<div class="f-contacts-btn">
						<input type="button" class="button btn-send" value="" />
					</div>
				</div>
				<div class="b-lets-grow">
					<div class="b-lets-grow-i">
						<h3>Давайте делать совершенный продукт вместе!</h3>
						<p>Чтобы становиться лучше, нам необходимо знать свои недостатки. 
						Именно поэтому для нас очень важен каждый Ваш отзыв. 
						Присылайте нам свои пожелания об изменениях, которые 
						Вы хотели бы видеть в нашем сервисе, и мы сделаем это для Вас.</p>
					</div>
				</div>
            </div>
			</div>
		</div>	
	</div>
<?php $this->template('pages/footer.tpl');?>
</div>
    </div>
</body>
</html>



