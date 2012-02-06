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
					<p><b> Что такое хостинг? </b></p>
					<p style="text-align: justify;"> Хостинг — это услуга по размещению вашего сайта в сети Интернет. От хостинга зависят две важные вещи: будет ли ваш сайт всегда доступен для посетителей и насколько быстро ваш сайт будет работать. Как правило, в услугу хостинга также входит предоставление места для электронной почты, баз данных и файлового хранилища.</p>
					<p><b>Можно ли использовать для размещения сайта свой хостинг?</b> </p>
					<p style="text-align: justify;"> Конечно. Для работы любого сайта из каталога GoPhotoWeb достаточно стандартных характеристик обычного хостинга: Unix-хостинг, веб-сервер Apache (mod_rewrite), поддержка PHP 5.2, одна база данных MySQL 5. Стоимость переноса и настройки работы сайта на стороннем хостинге составляет 75$.</p>
					<p><b>Где расположены ваши сервера?</b> </p>
					<p style="text-align: justify;">Сервера GoPhotoWeb расположены в дата-центре «Агава-Север», который находится в 4 км от МКАД — в городе Долгопрудном. Это один из самых современных и надежных центров обработки данных, позволяющий обеспечить максимальное время доступности (uptime) серверов и их безопасность.</p>
					
					
				</div>
			</div>
			<div class="r-main">
				<div class="l-content">
					<p>Мы&nbsp;хотим, чтобы вы&nbsp;забыли о&nbsp;том, что для сайта нужно еще искать хостинговую компанию, читать о&nbsp;ней отзывы, узнавать требования, выбирать тариф, заботиться о&nbsp;резервном копировании данных <nobr>и т.д.</nobr> Все это не&nbsp;так сложно, но&nbsp;занимает немалое время. Именно поэтому мы&nbsp;сделали все это за&nbsp;вас!</p>
                    <p style="text-align:center;"> <b> Если у вас уже есть предоплаченный период за услуги хостинга в другом месте, то при выборе хостинга от GoPhotoWeb вы можете размещать сайт на нашей площадке <span style="color:#F8AA01">БЕСПЛАТНО</span> в течение этого периода (но не более одного года).</b> </p>
					
					<div class="clear"></div>
					<div id="price-hosting">
                        <h3>СТОИМОСТЬ УСЛУГИ</h3>
                        <span class="name"></span><br>
                        <span id="price" style="color:#F8AA01"> 75$ </span><span class="year">/ год</span>                      
                    </div>
                    <div class="clear"></div>
                    <div class="paramhosting">
                        <span class="title">Характеристики хостинга:</span><br>
                        <table class="paramitem">
                            <tr>
                                <td><img src="<?=Config::get('path/host')?>images/paramitem.png" alt="">&nbsp;<span>3GB дискового пространства</span></td>
                                <td><img src="<?=Config::get('path/host')?>images/paramitem.png" alt="">&nbsp;<span>10 почтовых ящиков</span></td>
                            </tr>
                            <tr>
                                <td><img src="<?=Config::get('path/host')?>images/paramitem.png" alt="">&nbsp;<span>Неограниченный трафик</span></td>
                                <td><img src="<?=Config::get('path/host')?>images/paramitem.png" alt="">&nbsp;<span>Поддержка и консультации</span></td>
                            </tr>
                            <tr>
                                <td><img src="<?=Config::get('path/host')?>images/paramitem.png" alt="">&nbsp;<span>Статистика сайта от Google Analytics</span></td>
                                <td><img src="<?=Config::get('path/host')?>images/paramitem.png" alt="">&nbsp;<span>Резервное копирование данных</span></td>
                            </tr>
                        </table>
                    </div>
                    <div class="preferences">
                       <span class="title">Преимущества хостинга от GoPhotoWeb:</span><br>
                       <b>
                       <p style="text-align:left;"> 1. Все клиенты нашего хостинга получают 25% скидку на покупку нового сайта.</p>
                       <p style="text-align:left;">	2. Стоимость замены расцветки сайта в несколько раз ниже. </p>
                       <p style="text-align:left;"> 3. Возможность получать все новые опции сайтов первыми и на бонусных условиях.</p>
                       <p style="text-align:left;"> 4. Возможность выиграть призы от компании Apple в ежегодном розыгрыше среди клиентов. </p>                      
                       <p style="text-align:left;"> 5. Быстрая работа сайта (скорость загрузки страниц). </p>
					   <p style="text-align:left;"> 6. Мы следим за качеством работы исходного кода наших сайтов и безопасностью всех сайтов на площадке GoPhotoWeb.</p>
					   <p style="text-align:left;"> 7. Более высокие минимальные ограничения по лимитам размеров закачиваемых файлов, времени работы скриптов по сравнению со стандартными хостингами. </p>
                       </b>
                       <br />
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

