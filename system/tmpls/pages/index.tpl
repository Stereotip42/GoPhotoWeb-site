<?php $this->template('pages/header.tpl')?>

<script type="text/javascript">
    Slider = {
        flag : true,
        action: false,
        isClicked : false,
        manualSlide: function(id) {
           if (Slider.flag == true) {
               Slider.flag = false;
               var el1 = $('#slideblock-slider img').eq(0);
               var el2 = $('#i'+id);
               $(el1).after(el2);
               $('#slideblock-slider').animate({left: '-994px'}, 800, function(){
                   $(el2).after(el1);
                   $('#slideblock-slider').css('left', 0);
                   Slider.flag = true;
                   Slider.action = false;
                   if (Slider.isClicked == false) {
                        $('#slideblock-slider').oneTime('10000ms','sliderTimer', function() {
                            Slider.autoSlide();
                        });
                   }
               });
           }
        },
        autoSlide: function() {
            var size = $('#slideblock-controls a').size();
            var index = $('#slideblock-controls a.active').index('#slideblock-controls a') + 1;
            index = (index < size) ? index : 0;
            if (index == 1)
                $('.l-header-i > a').attr('href', '<?=$path_host?>catalog.html');
            else
                $('.l-header-i > a').attr('href', 'http://blog.gophotoweb.ru/mywed-pro/');
            $('#slideblock-controls a.active').removeClass('active');
            $('#slideblock-controls a').eq(index).addClass('active');
            Slider.manualSlide(index+1);
        }
    };
    $(document).ready(function() {
        $('#slideblock-controls a').click(function() {
            if (false == $(this).is('.active') && Slider.action == false) {
                Slider.action = true;
                $('#slideblock-slider').stopTime('sliderTimer');
                $('#slideblock-controls a.active').removeClass('active');
                $(this).addClass('active');
                if ($(this).index() == 1)
                    $('.l-header-i > a').attr('href', '<?=$path_host?>catalog.html');
                else
                    $('.l-header-i > a').attr('href', 'http://blog.gophotoweb.ru/mywed-pro/');
                Slider.manualSlide($(this).index() + 1);
                Slider.isClicked = true;
            }
            return false;
        });
       $('#slideblock-slider').oneTime('10000ms','sliderTimer', function() {
            Slider.autoSlide();
       });        
    });

</script>
<div class="foot" style="min-height: 160%">
<div class="l-main-container">
    <div class='l-wrapper-up'">
        <div class="l-wrapper" style="padding-bottom: 0">
            <div class="l-header" style="margin-top: -464px; background: url(../images/hears.png) no-repeat 50% 493px; overflow: hidden;">
                <div id='slideblock'>
                    <div id="slideblock-slider">
                    	<img id='i1' class="slide" src="<?=Config::get('path/host');?>images/slide1.jpg"/>
                        <img id='i2' class="slide" src="<?=Config::get('path/host');?>images/slide2.jpg"/>
                    </div>
                    
                    
                     <div id="slideblock-controls">
                        <a href="#" id="p1" class="active">
                            <img src="<?=Config::get('path/host');?>images/i.gif" width="17" height="15">
                        </a>
                        <a href="#" id="p2">
                            <img src="<?=Config::get('path/host');?>images/i.gif" width="17" height="15">
                        </a>
                    </div>
                </div>
                <div class="l-header-i index-h">
                    <?php $this->template('pages/topmenu.tpl')?>
                    <!--<div class="b-head-img index-header clrfix"></div>-->
                    <a href="http://blog.gophotoweb.ru/mywed-pro/"><div class="b-head-img index-header clrfix">
                        <div id='more'></div>
                    </div></a>
            </div>
            <div class="space"></div>
            <div class="l-home clrfix">
                <div class="l-col">
                    <div class="b-col">
                        <h3>Что такое сайт от Gophotoweb?</h3>
                        <p>Сайт от Gophotoweb это прежде всего стильный и элегантный дизайн, доступные цены, удобство в управлении сайтом, и все это в короткие сроки. Всего за 290$ вы можете приобрести готовый сайт из каталога gophotoweb. Каждый сайт в каталоге предоставлен в нескольких цветовых решениях.</p>
                        <p class="b-more"><a href="website-for-photographer.html">подробнее &raquo;</a></p>
                    </div>
                </div>
                <div class="l-col">
                    <div class="b-col">
                        <h3>Дополнительные опции</h3>
                        <p>Ваш сайт может стать более функциональным и&nbsp;удобным&nbsp;&mdash; все это благодаря дополнительным опциям, которые вы&nbsp;можете заказать к&nbsp;любому сайту из&nbsp;каталога Gophotoweb: музыка, <nobr>видео-галереи</nobr> (интеграция с&nbsp;Vimeo/Youtube), подстройка сайта под экран, несколько языковых версий сайта.</p>
                        <p class="b-more"><a href="upgrade-my-site.html">подробнее &raquo;</a></p>
                    </div>
                </div>
                <div class="l-col">
                    <div class="b-col">
                        <h3>Система управления сайтом</h3>
                        <p>Каждый сайт от Gophotoweb оснащен системой управления, с помощью которой можно самостоятельно управлять всем содержимым сайта и значительно экономить свое время. Cоздавать фотогалереи, обновлять портфолио, добавлять страницы на сайте &mdash; теперь все это действительно просто!</p>
                        <p class="b-more"><a href="content-management-system.html">подробнее &raquo;</a></p>
                    </div>
                </div>
                <div class="l-col">
                    <div class="b-col">
                        <h3>Хостинг и обслуживание</h3>
                        <p>Покупка хостинга, выбор тарифного плана, своевременная оплата и обслуживание своего сайта — это зачастую лишняя головная боль для фотографа. Наша задача состоит в том, чтобы вы забыли что такое хостинг вообще, а ваш сайт был всегда доступен для ваших потенциальных клиентов. </p>
                        <p class="b-more"><a href="hosting-and-support.html">подробнее &raquo;</a></p>
                    </div>
                </div>
            </div>
        </div>
        <div class="l-footer clrfix">
            <div class="b-choose-site-box">
                <div class="b-choose-site-i">
                    <div class="b-choose-site">
                        <h3>Выбери свой сайт</h3>
                        <div class="b-choose-prev clrfix">
                            <?php foreach($preview as $item):?>
                            <a href="<?=Config::get('path/host');?>website-<?=$item[1]?>.html">
                                <img src="<?=Config::get('path/host');?>storage/home/<?=$item[0]?>.jpg" width="176" height="101" alt="" />
                            </a>
                            <?php endforeach;?>
                        </div>
                    </div>
                </div>
            </div>
            <div class="nav-foot"><a href="<?=Config::get('path/host')?>website-for-photographer.html">Cайты для фотографов от GoPhotoWeb </a>  <span>|</span>  <a href="<?=Config::get('path/host')?>content-management-system.html">Cистема управления сайтом </a>  <span>|</span>  <a href="<?=Config::get('path/host')?>hosting-and-support.html">Хостинг и обслуживание </a>  <span>|</span> <a href="<?=Config::get('path/host')?>contacts.html">Контакты</a></div>
            <div class="b-copy">&copy; <?=date('Y');?> gophotoweb</div>
        </div>
    </div>
    </div>
</div>
</body>
</html>


