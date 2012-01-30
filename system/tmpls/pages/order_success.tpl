<?php $this->template('pages/header.tpl')?>
<div class="foot">
<div class="l-main-container" style="background:url(../images/hears.png) no-repeat 50% 29px;">
	<div class="l-wrapper-up">
	<div class="l-wrapper">
		<div class="l-header" style="background:url(../images/hears.png) no-repeat 50% 29px;">
			<div class="l-header-i new-bg">
                                <?php $this->template('pages/topmenu.tpl')?>
                               <!-- <div class="b-head-img b-head-img-inner clrfix">
					<img src="<?=Config::get('path/host');?>images/title-catalog.png" width="302" height="22" align="" class="fr" />
				</div>-->
			</div>
		</div>
		<div class="l-container">
            <div style="text-align: center; padding: 150px 0 160px 0;">
                <img style='float: left; margin-left: 313px;' src="<?=Config::get('path/host')?>images/v.jpg"/>
                <p style="font-family: Century Gothic; font-size: 16px; color: #658d96; padding: 13px 391px 0 0;">Спасибо, Ваш заказ принят.</p>
                <p>В течение 1 рабочего дня с вами свяжется специалист GoPhotoWeb и уточнит все детали сотрудничества.</p>
            	<p>Сайт будет предоставлен вам в течение 3 рабочих дней с момента оплаты.</p>
            </div>
		</div>
	</div>
</div>
</div>
<?php $this->template('pages/footer.tpl');?>
</div>
</div>
<?php $this->template('pages/popup.tpl');?>

</body>
</html>

