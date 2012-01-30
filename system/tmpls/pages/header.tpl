<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title><?=$seo[0]?></title>
<meta name="keywords" content="<?=$seo['1']?>">
<meta name="description" content="<?=$seo['2']?>">
<meta name='yandex-verification' content='6ba007c0c51ded64' />
<link rel="stylesheet" type="text/css" href="<?=Config::get('path/host');?>css/styles.css" />
<link rel="stylesheet" type="text/css" href="<?=Config::get('path/host');?>css/jstyling.css" />
<!--[if lte IE 7]>
	<link rel="stylesheet" type="text/css" href="<?=Config::get('path/host');?>css/ie7Fixes.css" />
<![endif]-->
<!--[if lte IE 6]>
	<link rel="stylesheet" type="text/css" href="<?=Config::get('path/host');?>css/ie6Fixes.css" />
<![endif]-->
<script type="text/javascript" src="<?=Config::get('path/host');?>scripts/jquery/jquery-1.4.4.min.js"></script>
<script type="text/javascript" src="<?=Config::get('path/host');?>scripts/jquery/jquery.pngFix.js"></script>
<script type="text/javascript" src="<?=Config::get('path/host');?>scripts/jquery/jquery.simplemodal.js"></script>
<script type="text/javascript" src="<?=Config::get('path/host');?>scripts/jquery/jquery.timer.js"></script>
<script type="text/javascript" src="<?=Config::get('path/host');?>scripts/jquery/jquery.jstyling.min.js"></script>
<script type="text/javascript" src="<?=Config::get('path/host');?>scripts/scripts.js"></script>
<script type="text/javascript">
    $(document).ready(function(){
        $(document).pngFix();
        var menu = '<?php echo $activemenu; ?>';
        if (menu){
            $('#'+menu).addClass('active');
        }
    });
</script>

        <script type="text/javascript">

  			var _gaq = _gaq || [];
  			_gaq.push(['_setAccount', 'UA-4820623-7']);
  			_gaq.push(['_trackPageview']);

  			(function() {
   				 var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    			 ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    			 var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  			})();

		</script>
        <script type="text/javascript">
            $(document).ready(function() {
                $.jStyling.createRadio($('input[type=radio]'));
            });
        </script>
		
</head>
<body>

