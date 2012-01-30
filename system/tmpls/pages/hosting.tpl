<?php $this->template('pages/header.tpl');?>
<div class="foot">
<div class="l-main-container">
	<div class="l-wrapper-up">
	<div class="l-wrapper">
		<div class="l-header">
			<div class="l-header-i new-bg">
                                <?php $this->template('pages/topmenu.tpl');?>
				<!--<div class="b-head-img b-head-img-inner clrfix"> <img src="<?=Config::get('path/host')?>images/title-hosting.png" align="" class="fr" /> </div>-->
			</div>
		</div>
		<div class="l-container clrfix">
			<div class="r-sidebar">
				<div class="b-side">
					<div class="b-side-i"> Есть вопрос?<br />
						<a href="<?=Config::get('path/host');?>contacts.html">Задайте его нам!</a> </div>
				</div>
				<div class="b-side">
					<div class="b-side-choose scrin">
						<p>выбери СВОЙ сайт<br /> <a href="<?=Config::get('path/host');?>catalog.html" class="lnk-alt">в каталоге GoPhotoWeb</a></p>
                        <?php foreach ($preview as $item):?>
                            <a href="<?=Config::get('path/host');?>website-<?=$item[1]?>.html/">
                                <img src="<?=Config::get('path/host');?>storage/hosting/<?=$item[0]?>.jpg" width="232" height="135" alt="" />
                            </a>
                        <?php endforeach;?>
					</div>
				</div>
			</div>
			<div class="r-main">
				<div class="l-content">
                    <div class="l-content-head">
                        Покупка хостинга, выбор тарифного плана, своевременная
                        оплата и обслуживание своего сайта &mdash; это зачастую лишняя головная боль
                        для фотографа. Наша задача состоит в том, чтобы вы забыли, что такое хостинг вообще!
                    </div>
                    <div class="clear"></div>
                    <div id="price-hosting">
                        <h3>СТОИМОСТЬ УСЛУГИ</h3>
                        <span class="name">"хостинг и обслуживание":</span><br>
                        <span id="price" style="color:#F8AA01"> 75$ </span><span class="year">/ год</span>                      
                    </div>
                    <div class="clear"></div>
                    <div class="paramhosting">
                        <span class="title">Параметры хостинга:</span><br>
                        <table class="paramitem">
                            <tr>
                                <td><img src="<?=Config::get('path/host')?>images/paramitem.png" alt="">&nbsp;<span>2GB дискового пространства</span></td>
                                <td><img src="<?=Config::get('path/host')?>images/paramitem.png" alt="">&nbsp;<span>10 почтовых ящиков</span></td>
                            </tr>
                            <tr>
                                <td><img src="<?=Config::get('path/host')?>images/paramitem.png" alt="">&nbsp;<span>Неограниченный трафик</span></td>
                                <td><img src="<?=Config::get('path/host')?>images/paramitem.png" alt="">&nbsp;<span>Поддержка и консультации</span></td>
                            </tr>
                        </table>
                    </div>
                    <div class="preferences">
                        <span class="title">Преимущества хостинга и обслуживания от gophotoweb:</span><br>
                        <table class="prefitem">
                            <tr>
                                <td class="pict"><img src="<?=Config::get('path/host')?>images/pref1.png" alt=""></td>
                                <td class="cont">
                                    Современный Мир не стоит на месте и постоянно появляются новые возможности для вашего 
                                    сайта: версия для iPhone/iPad, настраиваемые flash-галереи, видео и пр. 
                                    GoPhotoWeb вышагивает рядом со всеми инновациями и позволяет вам не упустить ни одну 
                                    из предложенных возможностей.
                                    Сотрудничая с  GoPhotoWeb, вы можете не беспокоиться за будущее вашего сайта. 
                                    В любое время мы сможем изменить его, ориентируясь на ваши новые потребности.
                                </td>
                            </tr>
                            <tr>
                                <td class="pict"><img src="<?=Config::get('path/host')?>images/pref2.png" alt=""></td>
                                <td class="cont">
                                    Наши сервера служат для обеспечения максимальной производительности, мы всегда храним 
                                    резервные копии, а знакомый вам представитель поддержки gophotoweb будет вашим 
                                    постоянным консультантом по любым вопросам работы сайта и хостинга.
                                </td>
                            </tr>
                            <tr>
                                <td class="pict"><img src="<?=Config::get('path/host')?>images/pref3.png" alt=""></td>
                                <td class="cont">
                                    Скидки на будущие услуги от gophotoweb! <br>
                                    Если в будущем вы решите, что текущий сайт уже не соответствует вашим требованиям или 
                                    вашему стилю, то вы получите 25% скидку на покупку/создание нового сайта.
                                </td>
                            </tr>
                        </table>
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

