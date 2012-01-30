<?php $this->template('pages/header.tpl');?>
<script>

    $(document).ready(function() {
    $(document).pngFix();
        WidgetGallery.init('img_container', 'i_logo', 'l_arrow', 'r_arrow');
        $(".l_arrow a img").hover(function(){$(this).attr('src', 'images/l_arrow.gif');},
            function() {$(this).attr('src', 'images/l_arrow_noactive.gif');}
        );
        $(".r_arrow a img").hover(function(){$(this).attr('src', 'images/r_arrow.gif');},
            function() {$(this).attr('src', 'images/r_arrow_noactive.gif');}
        );
        $(".l_arrow2 a img").hover(function(){$(this).attr('src', 'images/l_arrow.gif');},
            function() {$(this).attr('src', 'images/l_arrow_noactive.gif');}
        );
        $(".r_arrow2 a img").hover(function(){$(this).attr('src', 'images/r_arrow.gif');},
            function() {$(this).attr('src', 'images/r_arrow_noactive.gif');}
        );
    });
</script>

</head>

<body>

<div class="l-main-container-logo w_bg">
	<div class="l-wrapper">
		<div class="l-header l-logo">
			<div class="l-header-i">
                <?php $this->template('pages/topmenu.tpl');?>
            </div>
		</div>
		<div class="l-container l-logo clrfix">
			<div class="b-top-info">
				<p>Мы НЕ занимается разработкой логотипов. Мы НЕ создаем фирменные стили. Мы ДЕЛАЕМ САЙТЫ. <br />
				НО КАКОЙ САЙТ МОЖЕТ ОБОЙТИСЬ БЕЗ ЛОГОТИПА? Пожалуй, никакой.</p>
				<blockquote>Логотипы - это важнейшая деталь в имидже фотографа, <br />
				GoPhotoWeb понимает это и знает, как сложно порой фотографу найти нужного дизайнера, <br />
				вырбать направления стиля и дождаться достойного результата.</blockquote>
				<blockquote>GoPhotoWeb старается облегчить вам эту задачу, и поэтому предоставляет каталог готовых логотипов, <br />
				каждый из которых может стать вашим всего за минуту. <br />
				<span>может быть и ваш лого живет здесь?</span></blockquote>
			</div>

			<h1>Каталог готовых логотипов</h1>

			<div class="logo_block">
				<ul class="tabs">
					<li><a href="#tab1">Лого с элементом</a></li>
					<li><a href="#tab2">Текствовое лого</a></li>
				</ul>
				<div class="tab_container">
					<div id="tab1" class="tab_content">
						<div class="main_c_block">
							<div class="v_rotator clrfix">
								<div class="v_rotator_i">
									<div class="img_container">
                                        <img src="<?=Config::get('path/host');?>logo-gallery/1.JPG" width="660" height="395" class="active" alt=""/>
                                        <img src="<?=Config::get('path/host');?>logo-gallery/2.JPG" width="660" height="395" style='display: none' alt=""/>
                                        <img src="<?=Config::get('path/host');?>logo-gallery/3.JPG" width="660" height="395" style='display: none' alt=""/>
										<img src="<?=Config::get('path/host');?>logo-gallery/4.JPG" width="660" height="395" style='display: none' alt=""/>
										<img src="<?=Config::get('path/host');?>logo-gallery/5.JPG" width="660" height="395" style='display: none' alt=""/>
										<img src="<?=Config::get('path/host');?>logo-gallery/6.JPG" width="660" height="395" style='display: none' alt=""/>
										<img src="<?=Config::get('path/host');?>logo-gallery/7.JPG" width="660" height="395" style='display: none' alt=""/>
										<img src="<?=Config::get('path/host');?>logo-gallery/8.JPG" width="660" height="395" style='display: none' alt=""/>
										<img src="<?=Config::get('path/host');?>logo-gallery/9.JPG" width="660" height="395" style='display: none' alt=""/>
										<img src="<?=Config::get('path/host');?>logo-gallery/10.JPG" width="660" height="395" style='display: none' alt=""/>
										<img src="<?=Config::get('path/host');?>logo-gallery/11.JPG" width="660" height="395" style='display: none' alt=""/>
										<img src="<?=Config::get('path/host');?>logo-gallery/12.JPG" width="660" height="395" style='display: none' alt=""/>
										<img src="<?=Config::get('path/host');?>logo-gallery/13.JPG" width="660" height="395" style='display: none' alt=""/>
										<div class="price"><img src="images/price.png" width="128" height="163" alt=""/></div>
									</div>
									<div class="l_arrow"><a href=""><img src="images/l_arrow_noactive.gif" width="29" height="31" alt=""/></a></div>
									<div class="r_arrow"><a href=""><img src="images/r_arrow_noactive.gif" width="29" height="31" alt=""/></a></div>
								</div>
							</div>

							<div class="v_notes">*В стоимость включена не только смена имени, мы также можем заменить цвета, если потребуется.</div>
						</div>
						<div class="img_logos_block">       
							<p>ВСЕ ЛОГОТИПЫ ЭКСКЛЮЗИВНЫ И ПРОДАЮТСЯ ЕДИНАЖДЫ. <br />
							как только у лого появляется хозяин, он тут же исчезает с нашего прилавка ( логотип исчезает, не хозяин .)</p>

							<div class="img_logos clrfix">
								<div class="i_logo active"><a href="#"><img src="logo-gallery/v1.gif" width="173" height="112" alt=""/></a></div>
								<div class="i_logo"><a href="#"><img src="logo-gallery/v2.gif" width="173" height="112" alt=""/></a></div>
								<div class="i_logo"><a href="#"><img src="logo-gallery/v3.gif" width="173" height="112" alt=""/></a></div>
								<div class="i_logo"><a href="#"><img src="logo-gallery/v4.gif" width="173" height="112" alt=""/></a></div>
								<div class="i_logo"><a href="#"><img src="logo-gallery/v5.gif" width="173" height="112" alt=""/></a></div>
								<div class="i_logo"><a href="#"><img src="logo-gallery/v6.gif" width="173" height="112" alt=""/></a></div>
								<div class="i_logo"><a href="#"><img src="logo-gallery/v7.gif" width="173" height="112" alt=""/></a></div>
								<div class="i_logo"><a href="#"><img src="logo-gallery/v8.gif" width="173" height="112" alt=""/></a></div>
								<div class="i_logo"><a href="#"><img src="logo-gallery/v9.gif" width="173" height="112" alt=""/></a></div>
								<div class="i_logo"><a href="#"><img src="logo-gallery/v10.gif" width="173" height="112" alt=""/></a></div>
								<div class="i_logo"><a href="#"><img src="logo-gallery/v11.gif" width="173" height="112" alt=""/></a></div>
								<div class="i_logo"><a href="#"><img src="logo-gallery/v12.gif" width="173" height="112" alt=""/></a></div>
								<div class="i_logo"><a href="#"><img src="logo-gallery/v13.gif" width="173" height="112" alt=""/></a></div>
								<div class="i_logo"></div>
								<div class="i_logo"></div>
							</div>
						</div>
					</div>
					<div id="tab2" class="tab_content">
					   <div class="main_c_block">
							<div class="v_rotator clrfix">
								<div class="v_rotator_i">
									<div class="img_container2">

                                        <!-- need for script, don't remove -->
                                        <div class="price"><img alt=""/></div>
									</div>
									<div class="l_arrow2"><a href=""><img src="images/l_arrow_noactive.gif" width="29" height="31" alt=""/></a></div>
									<div class="r_arrow2"><a href=""><img src="images/r_arrow_noactive.gif" width="29" height="31" alt=""/></a></div>
								</div>
							</div>

							<div class="v_notes">*В стоимость включена не только смена имени, мы также можем заменить цвета, если потребуется.</div>
						</div>
						<div class="img_logos_block">
							<p>ВСЕ ЛОГОТИПЫ ЭКСКЛЮЗИВНЫ И ПРОДАЮТСЯ ЕДИНАЖДЫ. <br />
							как только у лого появляется хозяин, он тут же исчезает с нашего прилавка ( логотип исчезает, не хозяин .)</p>

							<div class="img_logos clrfix">
								<div class="i_logo2"></div>
								<div class="i_logo2"></div>
								<div class="i_logo2"></div>
								<div class="i_logo2"></div>
								<div class="i_logo2 last_item"></div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<?php $this->template('pages/footer.tpl');?>

</body>
</html>


