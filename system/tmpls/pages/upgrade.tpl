<?php $this->template('pages/header.tpl');?>
<div class="foot">
<div class="l-main-container">
    <div class='l-wrapper-up'>
	<div class="l-wrapper">
		<div class="l-header">
			<div class="l-header-i new-bg">
                                <?php $this->template('pages/topmenu.tpl');?>
			</div>
		</div>
		<div class="l-container l-upgrade">
            <div class="head-description">
                <!--К каждому клиенту, к каждой задаче, к разработке каждого из сайтов мы подходим индивидуально.<br>
                Именно поэтому нам очень важно, чтобы сайт полностью отражал ваш стиль в работе и был неповторимым.<br>
                Внеся небольшие поправки в уже готовые дизайны сайтов из каталога GoPhotoWeb,<br>
                можно с легкостью изменить готовый сайт из каталога до неузнаваемости!-->
                Здесь вы можете выбрать одну из возможных платных опций вашего сайта. <br />
                Те опции, которые указаны без цены мы планируем реализовать в самые ближайшие сроки.
            </div>
            <div class="clear"></div>
            <!--div class="before-block">
Ниже описана стоимость каждого элемента доработки. Цены указаны в минимальной величине.<br>
Более детально рассчитать заказ сможет специалист GoPhotoWeb, который будет заниматься вашим проектом.
            </div-->
            <div class="clear"></div>
            <div id="blocks">

                    <div class="block-item" style="background-color: #c2dee1">
                        <br><br>
                        <span class="title">Музыка</span>
                        <!--span class="text">добавление и управление.</span-->
                        <span class="text"></span>
                        <span class="price"><strike style="color:#557B82">от 150$</strike> 50$</span>
                    </div>
                    <div class="block-item" style="background-color: #d9eaed">
                        <br><br>
                        <span class="title">Видео-галереи</span>
                        <!--span class="text">варианты размещения.</span-->
                        <span class="text"></span>
                        <span class="price"><strike style="color:#557B82">от 200$</strike> 50$</span>
                    </div>
                    <div onclick="location.href='<?=Config::get('path/host')?>scaler-option.html'" class="block-item" style="background-color: #d2e6e9; cursor: pointer;">
                        <br><br>
                        <span class="title"><a href="<?=Config::get('path/host')?>scaler-option.html" style="text-decoration:underline; color: #557B82">Подстройка под экран</a></span>
                        <!--span class="text">варианты размещения.</span-->
                        <span class="text"></span>
                        <span class="price">90$</span>
                    </div>
                    <div class="block-item" style="background-color: #ebf4f6">
                        <br>
                        <span class="title">Один сайт - несколько языков.</span>
                        <span class="text"></span>
                        <span class="price">от 100 $</span>
                    </div>
                    <div class="block-item" style="background-color: #c2dee1">
                        <br>
                        <span class="title">Блог на Wordpress</span>
                        <span class="text">эта опция появится в самое ближайшее время</span>
                        <span class="price"></span>
                    </div>
                    <div class="block-item" style="background-color: #ebf4f6">
                        <br>
                        <span class="title">Календарь занятости</span>
                        <span class="text">эта опция появится в самое ближайшее время</span>
                        <span class="price"></span>
                    </div>
            </div>
            <div class="clear"></div>
            <div class="after-block">
                Если у вас есть другие пожелания, предложения и дополнения по дополнительным опциям вашего сайта, будем рады их рассмотреть и реализовать!
            </div>
		</div>
	</div>
	</div>
<?php $this->template('pages/footer.tpl');?>
</div>
</div>
</body>
</html>

