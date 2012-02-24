
        var catalogItem = $('div.b-catalog-item-new.clrfix');
        var catalogImage = $('div.b-catalog-img-new');
        var catalogDesc = $('div.b-catalog-desc-new');
        var catalogPager = $('div.b-catalog-pager-new');
        var catalogColors = $('div.b-catalog-colors-new');
        var catalogButtons = $('div.b-catalog-btns-new');
        $('.catalog-photo').removeClass('loading');

        $(".b-catalog-pages img").click(function(){
            var id = $(this).attr('id');
            if (id != ''){
                var earlier = $(this).parents(catalogItem).children(catalogImage).children(catalogPager).children('span.active').attr('id');
                $('#p'+earlier.substr(1)).animate({borderColor: '#fff'});
                $(this).parent('p').children('img').removeClass('active');
                var iid = 'i' + id.substring(1, id.length);
                $(this).parents(catalogItem).children(catalogImage).children('a').children('div.catalog-photo').children('img.current').fadeOut(300, function(){
                    $(this).parents(catalogItem).children(catalogImage).children('a').children('div.catalog-photo').children('img.current').css('display','none').removeClass("current");
                    $('#'+iid).fadeIn(300).addClass('current');
                });

                $(this).addClass('active');
                $(this).parents(catalogItem).children(catalogImage).children(catalogPager).children('span').removeClass('active');
                var bid = 'b' + id.substring(1, id.length);
                $('#'+bid).addClass('active');
            }
        }, function(){}).hover(function(){
            $(this).animate({borderColor: '#f8c301'});}, function(){
                if (!$(this).is('.active'))
                    $(this).animate({borderColor: '#fff'});});


        $(".b-catalog-pager-new span").bind('click', function(){
            var id = $(this).attr('id');
            if (id != '') {
                $(this).parents(catalogItem).children(catalogDesc).children(catalogColors).children('p.b-catalog-pages').children('img').removeClass('active').animate({borderColor: '#fff'}, 'fast');;
            var iid = 'i' + id.substring(1, id.length);
            $(this).parents(catalogItem).children(catalogImage).children('a').children('div.catalog-photo').children('img.current').fadeOut(300, function(){
                $(this).parents(catalogItem).children(catalogImage).children('a').children('div.catalog-photo').children('img.current').css('display','none').removeClass("current");
                $('#'+iid).fadeIn(300).addClass('current');
            });
            var pid = id.substring(1, id.length);
            $("#p" + pid).addClass("active").animate({borderColor: '#f8c301'}, 'fast');
            $(this).parents(catalogItem).children(catalogImage).children(catalogPager).children('span').removeClass('active');
            var bid = 'b' + id.substring(1, id.length);
            $('#'+bid).addClass('active');
            }
        });
        $(".catalog-pages img").hover(function(){
            var sites = new Array('Sofia', 'Jane', 'Denis', 'Kelly', 'Joe', 'Mira', 'Mika', 'Anna','Alex');
            var id = $(this).attr('id').substr(1, $(this).attr('id').length);
            var numbSite = id.split('_');
            var ref = "http://demo." + sites[numbSite[0] - 1] + "-" + numbSite[1] + ".gophotoweb.ru";
            $(this).parents('.b-catalog-item-new').children('.b-catalog-img-new').children('a').attr('href', ref);
            var refget = "order.html?site="+id+"_1&name=" + sites[numbSite[0] - 1];
            $(this).parents(catalogItem).children(catalogDesc).children(catalogButtons).children('a.a1').attr('href', ref);
            $(this).parents(catalogItem).children(catalogDesc).children(catalogButtons).children('a.b1').attr('href', refget);
            $('.b-catalog-colors img').removeClass('active');
            $(this).parent('a').parent('.catalog-pages').children('a').children('img').removeClass('active');
            $(this).addClass('active');
            var t = $(this).parents(catalogItem).children(catalogImage).children(catalogPager).children('span.active').attr('id');
            t = t.substr(5, t.length);
            $(this).parents(catalogItem).children(catalogImage).children('a').children('div.catalog-photo').children('img.current').css('display','none').removeClass("current");
            $("#i"+id+"_"+t).fadeIn(600).addClass('current');
            $(this).parents(catalogItem).children(catalogDesc).children(catalogColors).children('p.b-catalog-pages').children("img").removeClass("current");
            $(this).parents(catalogItem).children(catalogImage).children(catalogPager).children('span').hide();
            for (var i = 1; i <= 5; i++){
                $("#p" + id + '_' + i).animate({borderColor: '#fff'});
                $("#p" + id + '_' + i).addClass("current").removeClass('active');
                $(this).parents(catalogItem).children(catalogImage).children(catalogPager).children('span#b'+id+'_'+i).show();
            }

            $(this).parents(catalogItem).children(catalogImage).children(catalogPager).children('span').removeClass('active');
            $(this).parents(catalogItem).children(catalogImage).children(catalogPager).children('span#b'+id+'_'+t).addClass('active');

            $("#p" + id + '_'+t).addClass("active");
            $("#p" + id + '_' + t).animate({borderColor: '#f8c301'}, 'fast');
        }, function(){});
