<?php $this->template('pages/header.tpl');?>
<div class="foot">
<div class="l-main-container">
	<div class="l-wrapper-up">
	<div class="l-wrapper">
		<div class="l-header l-sites">
			<div class="l-header-i">
                 <?php $this->template('pages/topmenu.tpl');?>
				<div class="b-head-img b-head-img-inner clrfix">

				</div>
			</div>
		</div>
		<div class="l-container">
			<div class="b-content">
				<div class="b-sites-intro">
					<h2>Сайт от Gophotoweb</h2>
					<p>Gophotoweb предоставляет услуги по&nbsp;созданию стильных и&nbsp;современных сайтов для тех,<br />
						кто может презентовать свою работу с&nbsp;помощью фотографий и&nbsp;<nobr>видео-роликов</nobr>.</p>

					<blockquote><p>Мы&nbsp;представляем нашу продукцию как <nobr>&laquo;фото-сайты&raquo;</nobr>, однако это не&nbsp;значит, что подходят они только фотографам.<br />
					С&nbsp;помощью сайтов GoPhotoWeb сделать свой бизнес более успешным смогут как фотографы и&nbsp;<nobr>видео-операторы</nobr>,<br />
					так и&nbsp;стилисты, визажисты, архитекторы, модельеры, дизайнеры и другие творческие профессионалы. </p></blockquote>

					<p>Каждый сайт от&nbsp;GoPhotoWeb оснащен удобной системой управления, позволяющей самостоятельно управлять фото и&nbsp;<nobr>видео-галереями</nobr>,<br />
					текстовыми страницами, меню и&nbsp;прочим функционалом вашего сайта.</p>
				</div>
				<div class="b-sites clrfix">
					<div class="l-col b-ready-site">
						<div class="b-sites-text">
							<h3>1. Готовые сайты.</h3>
							<p>Команда GoPhotoWeb разработала	каталог таких готовых сайтов, каждый из&nbsp;которых не&nbsp;только станет стильным	оформлением ваших работ, но&nbsp;и&nbsp;будет	радовать вас и&nbsp;ваших клиентов удобством пользования.</p>	<p>Сайт GoPhotoWeb&nbsp;&mdash; это новый шаг к&nbsp;еще	большему успеху и&nbsp;процветанию вашего бизнеса.</p>
						</div>
						<div class="b-sites-img">
                            <p><a href="<?=Config::get('path/host')?>catalog.html">Посмотреть галерею сайтов</a></p>
							<a href="<?=Config::get('path/host')?>catalog.html"><img src="<?=Config::get('path/host')?>images/site-01.jpg" width="240" height="169" alt="" /></a>
						</div>
						<div class="b-sites-price">290 $</div>
					</div>
					
					<div class="l-col b-rework-site">
						<div class="b-sites-text">
							<h3>2. Платные опции</h3>
							<p>Любому сайту, выбранному из каталога GoPhotoWeb вы можете  в любое время заказать платные опции:</p>
                            <p>Музыка придаст сайту настроение,<br />
                            Видео сможет более развернуто показать вашу работу,<br />
                            Подстройка под экран сделает удобным просмотр каждого вашего посетителя,<br />
                            ну а Мультиязычность откроет новые возможности в бизнесе.<br /></p>
						</div>
						<div class="b-sites-img">
							<p><a href="<?=Config::get('path/host')?>upgrade-my-site.html">узнать больше об опциях</a></p>
							<a href="<?=Config::get('path/host')?>upgrade-my-site.html"><img src="<?=Config::get('path/host')?>images/site-02.jpg" width="239" height="169" alt="" /></a>
						</div>
						<div class="b-sites-price">от 320 $</div>
					</div>
					<div class="l-col b-unical-site">
						<div class="b-sites-text">
							<h3>3. Разработка уникального сайта</h3>
						<p>Дизайнеры и&nbsp;разработчики GoPhtoWeb	создали уже не&nbsp;один десяток успешных	проектов для известных творческих личностей.	Следующим счастливым обладателем	персонального сайта можете стать вы!</p>
						</div>
						<div class="b-sites-img">
							<p><a href="<?=Config::get('path/host')?>gallery-of-clients.html">посмотреть галерею клиентов</a></p>
							<a href="<?=Config::get('path/host')?>gallery-of-clients.html"><img src="<?=Config::get('path/host')?>images/site-03.jpg" width="242" height="169" alt="" /></a>
						</div>
						<div class="b-sites-price">от 1000 $</div>
					</div>
				</div>
			</div>
		</div>
		<div class="l-container l-sites-info clrfix">
			<div class="l-main">
				<div class="l-content b-sites-benefits">
					<h2>Преимущества работы с GoPhotoWeb:</h2>
					<ul class="nav">
						<li>Быстрые сроки и доступные цены</li>
						<li class="even">Удобная система управления всем содержимым вашего сайта</li>
						<li>Оптимизация сайта для систем поиска</li>
						<li class="even">Неограниченное количество фотографий и галерей</li>
						<li>Профессиональная поддержка от консультантов Gophotoweb</li>
						<li class="even">Выгодное предложение хостинга и обслуживания вашего сайта</li>
					</ul>
				</div>
			</div>
			<div class="l-sidebar">
				<div class="b-side">
					<div class="b-side-i">
						<strong>ЕСТЬ ВОПРОС?</strong><br />
						посетите наш раздел <br />
						<a href="<?=Config::get('path/host')?>faq.html">“ЧТО и КАК?”</a><br />
						или задайте вопрос <br />
						<a href="<?=Config::get('path/host')?>contacts.html">консультанту<br />
						GoPhotoWeb</a>
					</div>
				</div>
				<div class="b-side b-hosting">
					<a href="<?=Config::get('path/host')?>hosting-and-support.html">Нужен хостинг?</a>
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


