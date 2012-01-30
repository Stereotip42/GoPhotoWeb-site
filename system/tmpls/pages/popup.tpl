<script type="text/javascript">
    $(function(){
        $(".lnk-popup-close").hover(
        function(){
            $('img', this).attr("src", "<?=Config::get('path/host');?>images/a-btn-close-popup.png");
        },
        function(){
            $('img', this).attr("src", "<?=Config::get('path/host');?>images/btn-close-popup.png");
        });
    });
</script>
<div class="b-popup b-popup-buy" style="display:none;">
	<div class="b-popup-i">
		<div class="b-popup-head"><a href="#" class="lnk-popup-close" onclick="$.modal.close();"><img src="<?=Config::get('path/host');?>images/btn-close-popup.png" width="26" height="25" alt="" /></a>Процесс покупки/заказа сайта от GoPhotoWeb</div>
		<div class="b-popup-body b-buy-info">
			<table class="">
				<thead>
				<tr>
					<th>Готовый сайт из каталога</th>
					<th>Сайт доработками</th>
					<th>Эксклюзивный сайт</th>
				</tr>
				</thead>
				<tbody>
				<tr>
					<td><p><span>1.</span> Необходимо скачать <a href="<?=Config::get('path/host')?>storage/doc/zayavka-na-razrabotku-gotovogo-saita-gophotoweb.doc">заявку на покупку готового сайта из каталога gophotoweb</a>, заполнить ее, указав название понравившегося вам сайта, и прислать нам по адресу: hello@gophotoweb.ru</p></td>
					<td><p><span>1.</span> Необходимо скачать <a href="<?=Config::get('path/host')?>storage/doc/zayavka-na-razrabotku-saita-gophotoweb-s-dorabotkami.doc">заявку на сайт с доработками</a>, заполнить ее и подробно описать те изменения, которые вы хотели бы в него внести (например, изменение логотипа, фона, расположения меню, увеличение количества превью в галерее и т.д.), Прислать эту заявку нужно нам по адресу: hello@gophotoweb.ru</p>
					<p><small>*приглашаем вас посетить раздел “<a href="<?=Config::get('path/host')?>upgrade-my-site.html">улучшить сайт</a>”, чтобы вы могли ознакомиться с возможностями по доработкам сайтов и их стоимостью.</small></p></td>
					<td><p><span>1.</span> Необходимо скачать <a href="<?=Config::get('path/host')?>storage/doc/zayavka-na-razrabotku-exclusivnogo-saita-gophotoweb.doc">заявку на разработку сайта эксклюзивного сайта</a>, заполнить ее, описав подробно свои пожелания и требования и прислать эту заявку нам по адресу: hello@gophotoweb.ru</p></td>
				</tr>
				</tbody>
				<tfoot>
				<tr>
					<td colspan="3">
						<p><span>2.</span> В течение 1 рабочего дня с вами свяжется специалист GoPhotoWeb и уточнит все детали сотрудничества.</p>

						<p><span>3.</span> После подписания договора команда GoPhotoWeb приступает к разработке сайта. Если вы покупаете готовый сайт, то он будет предоставлен вам в течение 1 дня. Срок создания сайта с доработками - от 1 до 7 дней, эксклюзивного сайта - от 2 до 8 недель.</p>
					</td>
				</tr>
				</tfoot>
			</table>

		</div>
        <div class="b-popup-footer">Если у вас есть какие-либо вопросы о покупке сайта, <a href="<?=Config::get('path/host')?>contacts.html">задайте</a> их нашим специалистам</div>
	</div>
</div>