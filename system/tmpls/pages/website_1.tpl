<?php $this->template('pages/header.tpl')?>
<script type="text/javascript">
    $(function(){
        $("#colors-pages img").bind('click', function(){
            var sites = new Array('sofia', 'jane', 'denis', 'kelly', 'joe');
            var id = $(this).attr('id').substr(1, $(this).attr('id').length);
            var numbSite = id.split('_');
            var ref = "http://demo." + sites[numbSite[0] - 1] + "-" + numbSite[1] + ".gophotoweb.ru";
            $("div.b-catalog-img a").attr("href", ref);
            $("p.b-catalog-btns a.btn-open").attr("href", ref);
            $('.b-catalog-colors img').removeClass('active');
            $(this).addClass('active');
            $(".site-photo img.current").removeClass("current");
            $("#i"+id+"_1").addClass("current");
            $(".b-catalog-pages img.current").removeClass("current");
            for (var i = 1; i <= 4; i++){
                $("#p" + id + '_' + i).addClass("current");
            }
            $("#p" + id + '_1').addClass("active");
        });
            
        $(".b-catalog-pages img").bind('click', function(){
            $(".b-catalog-pages img.current").removeClass("active");
            $(this).addClass("active");
            var id = $(this).attr('id').substr(1, $(this).attr('id').length);
            $(".site-photo img.current").removeClass("current");
            $("#i"+id).addClass("current");
        });
    });
</script>
<div class="l-main-container">
    <div class="l-wrapper">
        <div class="l-header">
            <div class="l-header-i new-bg">
                <?php $this->template('pages/topmenu.tpl');?>
                <div class="b-head-img b-head-img-inner clrfix">
                    <div class="nav-back">
						<span><a href="<?=Config::get('path/host')?>catalog.html">&laquo; вернуться в каталог сайтов </a>
						</span>
                    </div>
                </div>
            </div>
        </div>
        <div class="l-container">
            <div class="l-catalog clrfix">
                <div class="b-catalog-item b-catalog-info clrfix">
                    <div class="b-catalog-img">
                        <a href="http://demo.sofia-1.gophotoweb.ru" target="_blank">
                            <div class="site-photo">
                                <img src="<?=Config::get('path/host')?>storage/full_description_big/1_1_1.jpg" width="703" height="408" alt="" id = "i1_1_1" class="current"/>
                                <img src="<?=Config::get('path/host')?>storage/full_description_big/1_1_2.jpg" width="703" height="408" alt="" id = "i1_1_2"/>
                                <img src="<?=Config::get('path/host')?>storage/full_description_big/1_1_3.jpg" width="703" height="408" alt="" id = "i1_1_3"/>
                                <img src="<?=Config::get('path/host')?>storage/full_description_big/1_1_4.jpg" width="703" height="408" alt="" id = "i1_1_4"/>
                                <img src="<?=Config::get('path/host')?>storage/full_description_big/1_2_1.jpg" width="703" height="408" alt="" id = "i1_2_1"/>
                                <img src="<?=Config::get('path/host')?>storage/full_description_big/1_2_2.jpg" width="703" height="408" alt="" id = "i1_2_2"/>
                                <img src="<?=Config::get('path/host')?>storage/full_description_big/1_2_3.jpg" width="703" height="408" alt="" id = "i1_2_3"/>
                                <img src="<?=Config::get('path/host')?>storage/full_description_big/1_2_4.jpg" width="703" height="408" alt="" id = "i1_2_4"/>
                                <img src="<?=Config::get('path/host')?>storage/full_description_big/1_3_1.jpg" width="703" height="408" alt="" id = "i1_3_1"/>
                                <img src="<?=Config::get('path/host')?>storage/full_description_big/1_3_2.jpg" width="703" height="408" alt="" id = "i1_3_2"/>
                                <img src="<?=Config::get('path/host')?>storage/full_description_big/1_3_3.jpg" width="703" height="408" alt="" id = "i1_3_3"/>
                                <img src="<?=Config::get('path/host')?>storage/full_description_big/1_3_4.jpg" width="703" height="408" alt="" id = "i1_3_4"/>
                            </div>
                        </a>
                    </div>
                    <div class="b-catalog-desc">
                        <div class="b-catalog-head clrfix">
                            <h2>Sofia</h2>
                        </div>
                        <div class="b-price">290$</div>
                        <div class="b-catalog-colors clrfix">
                            <div class="b-catalog-pages">
                                <h6>Дизайн страниц сайта:</h6>
                                <p>
                                    <img src="<?=Config::get('path/host')?>storage/full_description_pages/1_1_1.jpg" width="98" height="55" alt="" id = "p1_1_1" class="current active"/>
                                    <img src="<?=Config::get('path/host')?>storage/full_description_pages/1_2_1.jpg" width="98" height="55" alt="" id = "p1_2_1"/>
                                    <img src="<?=Config::get('path/host')?>storage/full_description_pages/1_3_1.jpg" width="98" height="55" alt="" id = "p1_3_1"/>

                                    <img src="<?=Config::get('path/host')?>storage/full_description_pages/1_1_2.jpg" width="98" height="55" alt="" id = "p1_1_2" class="current"/>
                                    <img src="<?=Config::get('path/host')?>storage/full_description_pages/1_2_2.jpg" width="98" height="55" alt="" id = "p1_2_2"/>
                                    <img src="<?=Config::get('path/host')?>storage/full_description_pages/1_3_2.jpg" width="98" height="55" alt="" id = "p1_3_2"/>

                                    <img src="<?=Config::get('path/host')?>storage/full_description_pages/1_1_3.jpg" width="98" height="55" alt="" id = "p1_1_3" class="current"/>
                                    <img src="<?=Config::get('path/host')?>storage/full_description_pages/1_2_3.jpg" width="98" height="55" alt="" id = "p1_2_3"/>
                                    <img src="<?=Config::get('path/host')?>storage/full_description_pages/1_3_3.jpg" width="98" height="55" alt="" id = "p1_3_3"/>

                                    <img src="<?=Config::get('path/host')?>storage/full_description_pages/1_1_4.jpg" width="98" height="55" alt="" id = "p1_1_4"class="current"/>
                                    <img src="<?=Config::get('path/host')?>storage/full_description_pages/1_2_4.jpg" width="98" height="55" alt="" id = "p1_2_4"/>
                                    <img src="<?=Config::get('path/host')?>storage/full_description_pages/1_3_4.jpg" width="98" height="55" alt="" id = "p1_3_4"/>
                                </p>
                            </div>
                        </div>
                        <div class="b-catalog-colors clrfix">
                            <div id="colors-pages">
                                <h6>Варианты расцветок:</h6>
                                <p>
                                    <img src="<?=Config::get('path/host')?>storage/full_description_colors/1_1.jpg" width="61" height="33" alt="" id="c1_1" class="active"/>
                                    <img src="<?=Config::get('path/host')?>storage/full_description_colors/1_2.jpg" width="61" height="33" alt="" id="c1_2"/>
                                    <img src="<?=Config::get('path/host')?>storage/full_description_colors/1_3.jpg" width="61" height="33" alt="" id="c1_3"/>
                                </p>
                            </div>
                        </div>

                    </div>
                    <div class="b-catalog-text clrfix">
                        <div class="b-catalog-params">
                            <h6>Параметры:</h6>
                            <ul class="nav">
                                <li>Слайдшоу на главной странице. Размер изображения: 950х500 px.</li>
                                <li>Размер фотографии в галерее: 750х500 px.</li>
                                <li>Расположение логотипа: справа вверху.</li>
                                <li>Расположение превью: справа в столбец.</li>
                                <li>Возможность подменю: есть.</li>
                                <li>Вид подменю: всплывающее окно.</li>
                            </ul>
                        </div>
                        <p class="b-catalog-btns"><a href="http://demo.sofia-1.gophotoweb.ru" target="_blank" class="button btn-open"></a>
                            <a href="<?=Config::get('path/host')?>upgrade-my-site.html" class="button btn-upgrade"></a><a href="#" class="button btn-buy"></a></p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <?php $this->template('pages/footer.tpl');?>
</div>

<?php $this->template('pages/popup.tpl');?>

</body>
</html>



