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

<div class="l-main-container w_bg">

    <div class='l-wrapper-up'">
	<div class="l-wrapper">
		<div class="l-header l-logo">
			<div class="l-header-i">
                <?php $this->template('pages/topmenu.tpl');?>
            </div>
		</div>
		<div class="l-container l-logo clrfix">
			<div class="b-top-info">
				<p>Логотипы&nbsp;&mdash; это важнейшая деталь в&nbsp;имидже фотографа.<br>
                    <span style='color: #7b8c91; padding-top: 5px'>Мы&nbsp;знаем это и&nbsp;стараемся максимально облегчить задачу его создания. <br>
                    Именно поэтому наши дизайнеры разработали каталог готовых логотипов, каждый из которых может стать вашим уже сейчас.</span> </p>
                <!--p style="text-align: left; background: #f4fcfc; color: #3a545c; padding-bottom: 16px;">Однако так часто бывает, что фотограф не может определиться с требованиями к своему логотипу, не может представить,
каким он должен быть.  В помощь  таким фотографам наши дизайнеры разработали  каталог  готовых логотипов, каждый из
которых может стать вашим уже сейчас. </p-->
			</div>

			<h1>Каталог готовых логотипов</h1>

			<div class="logo_block">
				<ul class="tabs">
					<li><a href="#tab1">Лого с элементом - 75$</a></li>
					<li><a href="#tab2">Шрифтовые лого - 0$</a></li>
				</ul>
				<div class="tab_container">
					<div id="tab1" class="tab_content">
						<div class="main_c_block">
							<div class="v_rotator clrfix">
								<div class="v_rotator_i">
									<div class="img_container">
                                        <img src="<?=Config::get('path/host');?>logo-gallery/3.JPG" width="660" height="395" class="active" alt=""/>
										<img src="<?=Config::get('path/host');?>logo-gallery/4.JPG" width="660" height="395" style='display: none' alt=""/>
										<img src="<?=Config::get('path/host');?>logo-gallery/5.JPG" width="660" height="395" style='display: none' alt=""/>
										<img src="<?=Config::get('path/host');?>logo-gallery/9.JPG" width="660" height="395" style='display: none' alt=""/>
										<img src="<?=Config::get('path/host');?>logo-gallery/11.JPG" width="660" height="395" style='display: none' alt=""/>
										<img src="<?=Config::get('path/host');?>logo-gallery/12.JPG" width="660" height="395" style='display: none' alt=""/>
										<img src="<?=Config::get('path/host');?>logo-gallery/14.jpg" width="660" height="395" style='display: none' alt=""/>
										<img src="<?=Config::get('path/host');?>logo-gallery/15.jpg" width="660" height="395" style='display: none' alt=""/>
										<img src="<?=Config::get('path/host');?>logo-gallery/16.jpg" width="660" height="395" style='display: none' alt=""/>
										<img src="<?=Config::get('path/host');?>logo-gallery/17.jpg" width="660" height="395" style='display: none' alt=""/>
										<img src="<?=Config::get('path/host');?>logo-gallery/18.jpg" width="660" height="395" style='display: none' alt=""/>
										<img src="<?=Config::get('path/host');?>logo-gallery/19.jpg" width="660" height="395" style='display: none' alt=""/>
										<img src="<?=Config::get('path/host');?>logo-gallery/21.jpg" width="660" height="395" style='display: none' alt=""/>
										<img src="<?=Config::get('path/host');?>logo-gallery/22.jpg" width="660" height="395" style='display: none' alt=""/>
										<img src="<?=Config::get('path/host');?>logo-gallery/24.jpg" width="660" height="395" style='display: none' alt=""/>
										<img src="<?=Config::get('path/host');?>logo-gallery/28.JPG" width="660" height="395" style='display: none' alt=""/>
										<img src="<?=Config::get('path/host');?>logo-gallery/29.jpg" width="660" height="395" style='display: none' alt=""/>
										<img src="<?=Config::get('path/host');?>logo-gallery/30.jpg" width="660" height="395" style='display: none' alt=""/>
										<img src="<?=Config::get('path/host');?>logo-gallery/32.jpg" width="660" height="395" style='display: none' alt=""/>
										<img src="<?=Config::get('path/host');?>logo-gallery/33.jpg" width="660" height="395" style='display: none' alt=""/>
										<img src="<?=Config::get('path/host');?>logo-gallery/34.jpg" width="660" height="395" style='display: none' alt=""/>
										<img src="<?=Config::get('path/host');?>logo-gallery/36.jpg" width="660" height="395" style='display: none' alt=""/>
										<img src="<?=Config::get('path/host');?>logo-gallery/37.jpg" width="660" height="395" style='display: none' alt=""/>
										<img src="<?=Config::get('path/host');?>logo-gallery/40.jpg" width="660" height="395" style='display: none' alt=""/>
										<img src="<?=Config::get('path/host');?>logo-gallery/41.jpg" width="660" height="395" style='display: none' alt=""/>
										<img src="<?=Config::get('path/host');?>logo-gallery/42.jpg" width="660" height="395" style='display: none' alt=""/>
										<img src="<?=Config::get('path/host');?>logo-gallery/43.jpg" width="660" height="395" style='display: none' alt=""/>
										<div class="price-logo"><img src="images/price.png" width="128" height="163" alt=""/></div>
									</div>
									<div class="l_arrow"><a href=""><img src="images/l_arrow_noactive.gif" width="29" height="31" alt=""/></a></div>
									<div class="r_arrow"><a href=""><img src="images/r_arrow_noactive.gif" width="29" height="31" alt=""/></a></div>
								</div>
							</div>
						</div>
						<div class="img_logos_block">
                        <p style='font-size: 14px; padding-bottom: 10px'><span style='color: #1b263d;'> Стоимость каждого логотипа с элементом - <span style='font-size: 19px'>75$</span>.<br>
В стоимость включено:</span>  замена цвета, текста и общего построения, если это будет необходимо.<br>
Каждый такой логотип <span style='color: #1b263d;'>продается лишь один раз</span>, то есть, как только у него появляется хозяин, мы убираем его с прилавка.<br>
Каталог  будет постоянно обновляться нашими дизайнерами. </p>
							<div class="img_logos clrfix">
								<div class="i_logo active"><a href="#"><img src="logo-gallery/v3.gif" width="173" height="112" alt=""/></a></div>
								<div class="i_logo"><a href="#"><img src="logo-gallery/v4.gif" width="173" height="112" alt=""/></a></div>
								<div class="i_logo"><a href="#"><img src="logo-gallery/v5.gif" width="173" height="112" alt=""/></a></div>
								<div class="i_logo"><a href="#"><img src="logo-gallery/v9.gif" width="173" height="112" alt=""/></a></div>
								<div class="i_logo"><a href="#"><img src="logo-gallery/v11.gif" width="173" height="112" alt=""/></a></div>
								<div class="i_logo"><a href="#"><img src="logo-gallery/v12.gif" width="173" height="112" alt=""/></a></div>
								<div class="i_logo"><a href="#"><img src="logo-gallery/v14.jpg" width="173" height="112" alt=""/></a></div>
								<div class="i_logo"><a href="#"><img src="logo-gallery/v15.jpg" width="173" height="112" alt=""/></a></div>
								<div class="i_logo"><a href="#"><img src="logo-gallery/v16.jpg" width="173" height="112" alt=""/></a></div>
								<div class="i_logo"><a href="#"><img src="logo-gallery/v17.jpg" width="173" height="112" alt=""/></a></div>
								<div class="i_logo"><a href="#"><img src="logo-gallery/v18.jpg" width="173" height="112" alt=""/></a></div>
								<div class="i_logo"><a href="#"><img src="logo-gallery/v19.jpg" width="173" height="112" alt=""/></a></div>
								<div class="i_logo"><a href="#"><img src="logo-gallery/v21.jpg" width="173" height="112" alt=""/></a></div>
								<div class="i_logo"><a href="#"><img src="logo-gallery/v22.jpg" width="173" height="112" alt=""/></a></div>
								<div class="i_logo"><a href="#"><img src="logo-gallery/v24.jpg" width="173" height="112" alt=""/></a></div>
								<div class="i_logo"><a href="#"><img src="logo-gallery/v28.jpg" width="173" height="112" alt=""/></a></div>
								<div class="i_logo"><a href="#"><img src="logo-gallery/v29.jpg" width="173" height="112" alt=""/></a></div>
								<div class="i_logo"><a href="#"><img src="logo-gallery/v30.jpg" width="173" height="112" alt=""/></a></div>
								<div class="i_logo"><a href="#"><img src="logo-gallery/v32.jpg" width="173" height="112" alt=""/></a></div>
								<div class="i_logo"><a href="#"><img src="logo-gallery/v33.jpg" width="173" height="112" alt=""/></a></div>
								<div class="i_logo"><a href="#"><img src="logo-gallery/v34.jpg" width="173" height="112" alt=""/></a></div>
								<div class="i_logo"><a href="#"><img src="logo-gallery/v36.jpg" width="173" height="112" alt=""/></a></div>
								<div class="i_logo"><a href="#"><img src="logo-gallery/v37.jpg" width="173" height="112" alt=""/></a></div>
								<div class="i_logo"><a href="#"><img src="logo-gallery/v40.jpg" width="173" height="112" alt=""/></a></div>
								<div class="i_logo"><a href="#"><img src="logo-gallery/v41.jpg" width="173" height="112" alt=""/></a></div>
								<div class="i_logo"><a href="#"><img src="logo-gallery/v42.jpg" width="173" height="112" alt=""/></a></div>
								<div class="i_logo"><a href="#"><img src="logo-gallery/v43.jpg" width="173" height="112" alt=""/></a></div>

							</div>
						</div>
					</div>
					<div id="tab2" class="tab_content">
					   <div class="main_c_block">
							<div class="v_rotator clrfix">
								<div class="v_rotator_i">
									<div class="img_container2">
										<img src="<?=Config::get('path/host');?>logo-gallery/text/01.jpg" width="660" height="395"  class="active" alt=""/>
										<img src="<?=Config::get('path/host');?>logo-gallery/text/02.jpg" width="660" height="395" style='display: none' alt=""/>
										<img src="<?=Config::get('path/host');?>logo-gallery/text/03.jpg" width="660" height="395" style='display: none' alt=""/>
										<img src="<?=Config::get('path/host');?>logo-gallery/text/04.jpg" width="660" height="395" style='display: none' alt=""/>
										<img src="<?=Config::get('path/host');?>logo-gallery/text/05.jpg" width="660" height="395" style='display: none' alt=""/>
										<img src="<?=Config::get('path/host');?>logo-gallery/text/06.jpg" width="660" height="395" style='display: none' alt=""/>
										<img src="<?=Config::get('path/host');?>logo-gallery/text/07.jpg" width="660" height="395" style='display: none' alt=""/>
										<img src="<?=Config::get('path/host');?>logo-gallery/text/08.jpg" width="660" height="395" style='display: none' alt=""/>
										<img src="<?=Config::get('path/host');?>logo-gallery/text/09.jpg" width="660" height="395" style='display: none' alt=""/>
										<img src="<?=Config::get('path/host');?>logo-gallery/text/10.jpg" width="660" height="395" style='display: none' alt=""/>
										<img src="<?=Config::get('path/host');?>logo-gallery/text/11.jpg" width="660" height="395" style='display: none' alt=""/>
										<img src="<?=Config::get('path/host');?>logo-gallery/text/12.jpg" width="660" height="395" style='display: none' alt=""/>
										<img src="<?=Config::get('path/host');?>logo-gallery/text/13.jpg" width="660" height="395" style='display: none' alt=""/>
										<img src="<?=Config::get('path/host');?>logo-gallery/text/14.jpg" width="660" height="395" style='display: none' alt=""/>
										<img src="<?=Config::get('path/host');?>logo-gallery/text/15.jpg" width="660" height="395" style='display: none' alt=""/>
										<img src="<?=Config::get('path/host');?>logo-gallery/text/16.jpg" width="660" height="395" style='display: none' alt=""/>
										<img src="<?=Config::get('path/host');?>logo-gallery/text/17.jpg" width="660" height="395" style='display: none' alt=""/>
										<img src="<?=Config::get('path/host');?>logo-gallery/text/18.jpg" width="660" height="395" style='display: none' alt=""/>
										<img src="<?=Config::get('path/host');?>logo-gallery/text/19.jpg" width="660" height="395" style='display: none' alt=""/>
										<img src="<?=Config::get('path/host');?>logo-gallery/text/20.jpg" width="660" height="395" style='display: none' alt=""/>
										<img src="<?=Config::get('path/host');?>logo-gallery/text/21.jpg" width="660" height="395" style='display: none' alt=""/>
										<img src="<?=Config::get('path/host');?>logo-gallery/text/22.jpg" width="660" height="395" style='display: none' alt=""/>
										<img src="<?=Config::get('path/host');?>logo-gallery/text/23.jpg" width="660" height="395" style='display: none' alt=""/>
										<img src="<?=Config::get('path/host');?>logo-gallery/text/24.jpg" width="660" height="395" style='display: none' alt=""/>
										<img src="<?=Config::get('path/host');?>logo-gallery/text/25.jpg" width="660" height="395" style='display: none' alt=""/>
										<img src="<?=Config::get('path/host');?>logo-gallery/text/26.jpg" width="660" height="395" style='display: none' alt=""/>
										<img src="<?=Config::get('path/host');?>logo-gallery/text/27.jpg" width="660" height="395" style='display: none' alt=""/>
										<img src="<?=Config::get('path/host');?>logo-gallery/text/28.jpg" width="660" height="395" style='display: none' alt=""/>
										<img src="<?=Config::get('path/host');?>logo-gallery/text/29.jpg" width="660" height="395" style='display: none' alt=""/>
										<img src="<?=Config::get('path/host');?>logo-gallery/text/30.jpg" width="660" height="395" style='display: none' alt=""/>
										<img src="<?=Config::get('path/host');?>logo-gallery/text/31.jpg" width="660" height="395" style='display: none' alt=""/>
										<img src="<?=Config::get('path/host');?>logo-gallery/text/32.jpg" width="660" height="395" style='display: none' alt=""/>
										<img src="<?=Config::get('path/host');?>logo-gallery/text/33.jpg" width="660" height="395" style='display: none' alt=""/>
										<img src="<?=Config::get('path/host');?>logo-gallery/text/34.jpg" width="660" height="395" style='display: none' alt=""/>
										<img src="<?=Config::get('path/host');?>logo-gallery/text/35.jpg" width="660" height="395" style='display: none' alt=""/>
										<img src="<?=Config::get('path/host');?>logo-gallery/text/36.jpg" width="660" height="395" style='display: none' alt=""/>
										<img src="<?=Config::get('path/host');?>logo-gallery/text/37.jpg" width="660" height="395" style='display: none' alt=""/>
										<img src="<?=Config::get('path/host');?>logo-gallery/text/38.jpg" width="660" height="395" style='display: none' alt=""/>
										<img src="<?=Config::get('path/host');?>logo-gallery/text/39.jpg" width="660" height="395" style='display: none' alt=""/>
										<img src="<?=Config::get('path/host');?>logo-gallery/text/40.jpg" width="660" height="395" style='display: none' alt=""/>
										<img src="<?=Config::get('path/host');?>logo-gallery/text/41.jpg" width="660" height="395" style='display: none' alt=""/>
										<img src="<?=Config::get('path/host');?>logo-gallery/text/42.jpg" width="660" height="395" style='display: none' alt=""/>
										<img src="<?=Config::get('path/host');?>logo-gallery/text/43.jpg" width="660" height="395" style='display: none' alt=""/>
										<img src="<?=Config::get('path/host');?>logo-gallery/text/44.jpg" width="660" height="395" style='display: none' alt=""/>
										<img src="<?=Config::get('path/host');?>logo-gallery/text/45.jpg" width="660" height="395" style='display: none' alt=""/>
										<img src="<?=Config::get('path/host');?>logo-gallery/text/46.jpg" width="660" height="395" style='display: none' alt=""/>
										<img src="<?=Config::get('path/host');?>logo-gallery/text/47.jpg" width="660" height="395" style='display: none' alt=""/>
										<img src="<?=Config::get('path/host');?>logo-gallery/text/48.jpg" width="660" height="395" style='display: none' alt=""/>
										<img src="<?=Config::get('path/host');?>logo-gallery/text/49.jpg" width="660" height="395" style='display: none' alt=""/>
										<img src="<?=Config::get('path/host');?>logo-gallery/text/50.jpg" width="660" height="395" style='display: none' alt=""/>
										<img src="<?=Config::get('path/host');?>logo-gallery/text/51.jpg" width="660" height="395" style='display: none' alt=""/>
										<img src="<?=Config::get('path/host');?>logo-gallery/text/52.jpg" width="660" height="395" style='display: none' alt=""/>
										<img src="<?=Config::get('path/host');?>logo-gallery/text/53.jpg" width="660" height="395" style='display: none' alt=""/>
										<img src="<?=Config::get('path/host');?>logo-gallery/text/54.jpg" width="660" height="395" style='display: none' alt=""/>
										<img src="<?=Config::get('path/host');?>logo-gallery/text/55.jpg" width="660" height="395" style='display: none' alt=""/>
										<img src="<?=Config::get('path/host');?>logo-gallery/text/56.jpg" width="660" height="395" style='display: none' alt=""/>
										<img src="<?=Config::get('path/host');?>logo-gallery/text/57.jpg" width="660" height="395" style='display: none' alt=""/>
										<img src="<?=Config::get('path/host');?>logo-gallery/text/58.jpg" width="660" height="395" style='display: none' alt=""/>
										<img src="<?=Config::get('path/host');?>logo-gallery/text/59.jpg" width="660" height="395" style='display: none' alt=""/>
										<img src="<?=Config::get('path/host');?>logo-gallery/text/60.jpg" width="660" height="395" style='display: none' alt=""/>
										<img src="<?=Config::get('path/host');?>logo-gallery/text/61.jpg" width="660" height="395" style='display: none' alt=""/>
										<img src="<?=Config::get('path/host');?>logo-gallery/text/62.jpg" width="660" height="395" style='display: none' alt=""/>
										<img src="<?=Config::get('path/host');?>logo-gallery/text/63.jpg" width="660" height="395" style='display: none' alt=""/>

                                        <div class="price-logo"><img src="images/price0.png" width="128" height="163" alt=""/></div>
									</div>
									<div class="l_arrow2"><a href=""><img src="images/l_arrow_noactive.gif" width="29" height="31" alt=""/></a></div>
									<div class="r_arrow2"><a href=""><img src="images/r_arrow_noactive.gif" width="29" height="31" alt=""/></a></div>
								</div>
							</div>
						</div>
						<div class="img_logos_block">
							<p style='font-size: 14px; padding-bottom: 10px'><span style='color: #1b263d;'>Каждый текстовый логотип <span style='font-size: 17px'>абсолютно бесплатный.</span></span>  Возможна замена цвета и текста, но не оформления.<br>
Любые доработки (добавление элементов, слов и тп.)  платные,  их стоимость высчитывается исходя из конкретных требований.
<br>Эти логотипы <span style='color: #1b263d;'>НЕ продаются в единичном экземпляре. <br /><br />
                            Важно! Мы не предоставляем на выбор несколько вариантов написания вашего имени. Вы можете лишь указать понравившийся вам шрифт.</span></p>

							<div class="img_logos clrfix">
										<div class="i_logo2 active"><a href="#"><img src="<?=Config::get('path/host');?>logo-gallery/text/v1.jpg" width="173" height="112" alt=""/></a></div>
										<div class="i_logo2"><a href="#"><img src="<?=Config::get('path/host');?>logo-gallery/text/v2.jpg" width="173" height="112" alt=""/></a></div>
										<div class="i_logo2"><a href="#"><img src="<?=Config::get('path/host');?>logo-gallery/text/v3.jpg" width="173" height="112" alt=""/></a></div>
										<div class="i_logo2"><a href="#"><img src="<?=Config::get('path/host');?>logo-gallery/text/v4.jpg" width="173" height="112" alt=""/></a></div>
										<div class="i_logo2"><a href="#"><img src="<?=Config::get('path/host');?>logo-gallery/text/v5.jpg" width="173" height="112" alt=""/></a></div>
										<div class="i_logo2"><a href="#"><img src="<?=Config::get('path/host');?>logo-gallery/text/v6.jpg" width="173" height="112" alt=""/></a></div>
										<div class="i_logo2"><a href="#"><img src="<?=Config::get('path/host');?>logo-gallery/text/v7.jpg" width="173" height="112" alt=""/></a></div>
										<div class="i_logo2"><a href="#"><img src="<?=Config::get('path/host');?>logo-gallery/text/v8.jpg" width="173" height="112" alt=""/></a></div>
										<div class="i_logo2"><a href="#"><img src="<?=Config::get('path/host');?>logo-gallery/text/v9.jpg" width="173" height="112" alt=""/></a></div>
										<div class="i_logo2"><a href="#"><img src="<?=Config::get('path/host');?>logo-gallery/text/v10.jpg" width="173" height="112" alt=""/></a></div>
										<div class="i_logo2"><a href="#"><img src="<?=Config::get('path/host');?>logo-gallery/text/v11.jpg" width="173" height="112" alt=""/></a></div>
										<div class="i_logo2"><a href="#"><img src="<?=Config::get('path/host');?>logo-gallery/text/v12.jpg" width="173" height="112" alt=""/></a></div>
										<div class="i_logo2"><a href="#"><img src="<?=Config::get('path/host');?>logo-gallery/text/v13.jpg" width="173" height="112" alt=""/></a></div>
										<div class="i_logo2"><a href="#"><img src="<?=Config::get('path/host');?>logo-gallery/text/v14.jpg" width="173" height="112" alt=""/></a></div>
										<div class="i_logo2"><a href="#"><img src="<?=Config::get('path/host');?>logo-gallery/text/v15.jpg" width="173" height="112" alt=""/></a></div>
										<div class="i_logo2"><a href="#"><img src="<?=Config::get('path/host');?>logo-gallery/text/v16.jpg" width="173" height="112" alt=""/></a></div>
										<div class="i_logo2"><a href="#"><img src="<?=Config::get('path/host');?>logo-gallery/text/v17.jpg" width="173" height="112" alt=""/></a></div>
										<div class="i_logo2"><a href="#"><img src="<?=Config::get('path/host');?>logo-gallery/text/v18.jpg" width="173" height="112" alt=""/></a></div>
										<div class="i_logo2"><a href="#"><img src="<?=Config::get('path/host');?>logo-gallery/text/v19.jpg" width="173" height="112" alt=""/></a></div>
										<div class="i_logo2"><a href="#"><img src="<?=Config::get('path/host');?>logo-gallery/text/v20.jpg" width="173" height="112" alt=""/></a></div>
										<div class="i_logo2"><a href="#"><img src="<?=Config::get('path/host');?>logo-gallery/text/v21.jpg" width="173" height="112" alt=""/></a></div>
										<div class="i_logo2"><a href="#"><img src="<?=Config::get('path/host');?>logo-gallery/text/v22.jpg" width="173" height="112" alt=""/></a></div>
										<div class="i_logo2"><a href="#"><img src="<?=Config::get('path/host');?>logo-gallery/text/v23.jpg" width="173" height="112" alt=""/></a></div>
										<div class="i_logo2"><a href="#"><img src="<?=Config::get('path/host');?>logo-gallery/text/v24.jpg" width="173" height="112" alt=""/></a></div>
										<div class="i_logo2"><a href="#"><img src="<?=Config::get('path/host');?>logo-gallery/text/v25.jpg" width="173" height="112" alt=""/></a></div>
										<div class="i_logo2"><a href="#"><img src="<?=Config::get('path/host');?>logo-gallery/text/v26.jpg" width="173" height="112" alt=""/></a></div>
										<div class="i_logo2"><a href="#"><img src="<?=Config::get('path/host');?>logo-gallery/text/v27.jpg" width="173" height="112" alt=""/></a></div>
										<div class="i_logo2"><a href="#"><img src="<?=Config::get('path/host');?>logo-gallery/text/v28.jpg" width="173" height="112" alt=""/></a></div>
										<div class="i_logo2"><a href="#"><img src="<?=Config::get('path/host');?>logo-gallery/text/v29.jpg" width="173" height="112" alt=""/></a></div>
										<div class="i_logo2"><a href="#"><img src="<?=Config::get('path/host');?>logo-gallery/text/v30.jpg" width="173" height="112" alt=""/></a></div>
										<div class="i_logo2"><a href="#"><img src="<?=Config::get('path/host');?>logo-gallery/text/v31.jpg" width="173" height="112" alt=""/></a></div>
										<div class="i_logo2"><a href="#"><img src="<?=Config::get('path/host');?>logo-gallery/text/v32.jpg" width="173" height="112" alt=""/></a></div>
										<div class="i_logo2"><a href="#"><img src="<?=Config::get('path/host');?>logo-gallery/text/v33.jpg" width="173" height="112" alt=""/></a></div>
										<div class="i_logo2"><a href="#"><img src="<?=Config::get('path/host');?>logo-gallery/text/v34.jpg" width="173" height="112" alt=""/></a></div>
										<div class="i_logo2"><a href="#"><img src="<?=Config::get('path/host');?>logo-gallery/text/v35.jpg" width="173" height="112" alt=""/></a></div>
										<div class="i_logo2"><a href="#"><img src="<?=Config::get('path/host');?>logo-gallery/text/v36.jpg" width="173" height="112" alt=""/></a></div>
										<div class="i_logo2"><a href="#"><img src="<?=Config::get('path/host');?>logo-gallery/text/v37.jpg" width="173" height="112" alt=""/></a></div>
										<div class="i_logo2"><a href="#"><img src="<?=Config::get('path/host');?>logo-gallery/text/v38.jpg" width="173" height="112" alt=""/></a></div>
										<div class="i_logo2"><a href="#"><img src="<?=Config::get('path/host');?>logo-gallery/text/v39.jpg" width="173" height="112" alt=""/></a></div>
										<div class="i_logo2"><a href="#"><img src="<?=Config::get('path/host');?>logo-gallery/text/v40.jpg" width="173" height="112" alt=""/></a></div>
										<div class="i_logo2"><a href="#"><img src="<?=Config::get('path/host');?>logo-gallery/text/v41.jpg" width="173" height="112" alt=""/></a></div>
										<div class="i_logo2"><a href="#"><img src="<?=Config::get('path/host');?>logo-gallery/text/v42.jpg" width="173" height="112" alt=""/></a></div>
										<div class="i_logo2"><a href="#"><img src="<?=Config::get('path/host');?>logo-gallery/text/v43.jpg" width="173" height="112" alt=""/></a></div>
										<div class="i_logo2"><a href="#"><img src="<?=Config::get('path/host');?>logo-gallery/text/v44.jpg" width="173" height="112" alt=""/></a></div>
										<div class="i_logo2"><a href="#"><img src="<?=Config::get('path/host');?>logo-gallery/text/v45.jpg" width="173" height="112" alt=""/></a></div>
										<div class="i_logo2"><a href="#"><img src="<?=Config::get('path/host');?>logo-gallery/text/v46.jpg" width="173" height="112" alt=""/></a></div>
										<div class="i_logo2"><a href="#"><img src="<?=Config::get('path/host');?>logo-gallery/text/v47.jpg" width="173" height="112" alt=""/></a></div>
										<div class="i_logo2"><a href="#"><img src="<?=Config::get('path/host');?>logo-gallery/text/v48.jpg" width="173" height="112" alt=""/></a></div>
										<div class="i_logo2"><a href="#"><img src="<?=Config::get('path/host');?>logo-gallery/text/v49.jpg" width="173" height="112" alt=""/></a></div>
										<div class="i_logo2"><a href="#"><img src="<?=Config::get('path/host');?>logo-gallery/text/v50.jpg" width="173" height="112" alt=""/></a></div>
										<div class="i_logo2"><a href="#"><img src="<?=Config::get('path/host');?>logo-gallery/text/v51.jpg" width="173" height="112" alt=""/></a></div>
										<div class="i_logo2"><a href="#"><img src="<?=Config::get('path/host');?>logo-gallery/text/v52.jpg" width="173" height="112" alt=""/></a></div>
										<div class="i_logo2"><a href="#"><img src="<?=Config::get('path/host');?>logo-gallery/text/v53.jpg" width="173" height="112" alt=""/></a></div>
										<div class="i_logo2"><a href="#"><img src="<?=Config::get('path/host');?>logo-gallery/text/v54.jpg" width="173" height="112" alt=""/></a></div>
										<div class="i_logo2"><a href="#"><img src="<?=Config::get('path/host');?>logo-gallery/text/v55.jpg" width="173" height="112" alt=""/></a></div>
										<div class="i_logo2"><a href="#"><img src="<?=Config::get('path/host');?>logo-gallery/text/v56.jpg" width="173" height="112" alt=""/></a></div>
										<div class="i_logo2"><a href="#"><img src="<?=Config::get('path/host');?>logo-gallery/text/v57.jpg" width="173" height="112" alt=""/></a></div>
										<div class="i_logo2"><a href="#"><img src="<?=Config::get('path/host');?>logo-gallery/text/v58.jpg" width="173" height="112" alt=""/></a></div>
										<div class="i_logo2"><a href="#"><img src="<?=Config::get('path/host');?>logo-gallery/text/v59.jpg" width="173" height="112" alt=""/></a></div>
										<div class="i_logo2"><a href="#"><img src="<?=Config::get('path/host');?>logo-gallery/text/v60.jpg" width="173" height="112" alt=""/></a></div>
										<div class="i_logo2"><a href="#"><img src="<?=Config::get('path/host');?>logo-gallery/text/v61.jpg" width="173" height="112" alt=""/></a></div>
										<div class="i_logo2"><a href="#"><img src="<?=Config::get('path/host');?>logo-gallery/text/v62.jpg" width="173" height="112" alt=""/></a></div>
										<div class="i_logo2"><a href="#"><img src="<?=Config::get('path/host');?>logo-gallery/text/v63.jpg" width="173" height="112" alt=""/></a></div>
							</div>
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


