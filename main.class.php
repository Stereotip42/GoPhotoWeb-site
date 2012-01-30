<?php
/**
 * MainController class file.
 *
 * @author Dmitry Avseyenko <polsad@gmail.com>
 * @package system.controller
 * @copyright Copyright &copy; 2008-2011 Inspirativ
 * @license http://weegbo.com/license/
 * @since 0.8
 */
require_once(PATH_BASE.'controller.class.php');
class MainController extends Controller {

    public function __construct() {
        parent::__construct();
    }

    public function index() {
        $this->setSeo();
        $pictures = null;
        for($i = 0; $i < Config::get('pictures/preview_count'); $i++){
            $pictures[$i] = $i+1;
        }
        mt_srand(time());
        for ($i = 0; $i < 5; $i++){
            $index = mt_rand(0, count($pictures) - 1);
            $preview[] = array(
                '0' => $pictures[$index],
                '1' => Config::get('pictures/preview_link/'.$pictures[$index]));
            array_splice($pictures,$index,1);
        }
        $this->view->assign('preview', $preview);
        $this->displayPage('pages/index.tpl');
    }

    public function catalog() {
        $this->setActiveMenu('site_for');
        $this->setSeo();
        $this->displayPage('pages/catalog.tpl');
    }

    public function catalognew() {
        $this->setSeo();
        $this->displayPage('pages/catalogNew.tpl');
    }

    public function catalognew_slide() {
        $this->setSeo();
        $this->displayPage('pages/catalogNew_slide.tpl');
    }

    public function order() {
        $this->setSeo();
        $this->view->assign('name', $this->params['get']['name']);
        $this->view->assign('site', $this->params['get']['site']);
        $this->displayPage('pages/order.tpl');
    }

    public function logo_gallery() {
        $this->setActiveMenu('logo');
        $this->setSeo();
        $this->displayPage('pages/logo-gallery.tpl');
    }

    public function gallery_of_clients() {
        $this->setActiveMenu('clients');
        $this->setSeo();
        $this->displayPage('pages/clients.tpl');
    }

    public function content_management_system() {
        $this->setActiveMenu('site_for');
        $this->setSeo();
        $this->displayPage('pages/cms.tpl');
    }

    public function contacts() {
        $this->setActiveMenu('contacts');
        $this->setSeo();
        $this->displayPage('pages/contacts.tpl');
       
    }

    public function faq() {
        $this->setActiveMenu('faq');
        $this->setSeo();
        $this->displayPage('pages/faq.tpl');
    }

    public function website_1() {
        $this->setActiveMenu('site_for');
        $this->setSeo();
        $this->displayPage('pages/website_1.tpl');
    }
    public function website_2() {
        $this->setActiveMenu('site_for');
        $this->setSeo();
        $this->displayPage('pages/website_2.tpl');
    }
    public function website_3() {
        $this->setActiveMenu('site_for');
        $this->setSeo();
        $this->displayPage('pages/website_3.tpl');
    }
    public function website_4() {
        $this->setActiveMenu('site_for');
        $this->setSeo();
        $this->displayPage('pages/website_4.tpl');
    }
    public function website_5() {
        $this->setActiveMenu('site_for');
        $this->setSeo();
        $this->displayPage('pages/website_5.tpl');
    }
    public function order_success() {
        $this->setActiveMenu('catalog');
        $this->setSeo();
        $this->displayPage('pages/order_success.tpl');
    }

    public function website_for_photographer() {
        $this->setActiveMenu('site_for');
        $this->setSeo();
        $this->displayPage('pages/sites.tpl');
    }

    public function hosting_and_support(){
        $this->setActiveMenu('hosting');
        $this->setSeo();
        $pictures = null;
        for($i = 0; $i < Config::get('pictures/preview_count'); $i++){
            $pictures[$i] = $i+1;
        }
        mt_srand(time());
        for ($i = 0; $i < 3; $i++){
            $index = mt_rand(0, count($pictures) - 1);
            $preview[] = array(
                '0' => $pictures[$index],
                '1' => Config::get('pictures/preview_link/'.$pictures[$index]));
            array_splice($pictures,$index,1);
        }
        $this->view->assign('preview', $preview);
        $this->displayPage('pages/hosting.tpl');
    }

    public function upgrade_my_site(){
        $this->setActiveMenu('site_for');
        $this->setSeo();
        $this->displayPage('pages/upgrade.tpl');
    }

    public function send(){
        if (isset($_POST['name']) && isset($_POST['mess'])&& isset($_POST['email'])) {
            $title = '=?UTF-8?B?'.base64_encode('Сообщение с сайта').'?=';
            $name = '=?UTF-8?B?'.base64_encode(trim($_POST['name'])).'?=';
            $mess = trim($_POST['mess']);
            $phone = $_POST['phone'];
            $from = trim($_POST['email']);
            $mess = 'От: '.$_POST['name'].'<'.$_POST['email'].'>. Телефон: '.$phone.". \n".$mess;
            $headers="From: \"$name\"<$from>\r\n";
            $headers.="Content-type: text/plain; charset=\"utf-8\"";
            if(mail ('hello@gophotoweb.ru', $title, $mess, $headers)) {
                print ('ok');
            }
        }
    }

    public function send_site(){
        if (isset($_POST['name']) && isset($_POST['phone']) && isset($_POST['email']) && isset($_POST['namesite']) && isset($_POST['hosting']) && isset($_POST['communication']) && isset($_POST['skype']) && isset($_POST['from']) && isset($_POST['mess'])) {
            $title = '=?UTF-8?B?'.base64_encode('Заказ сайта').'?=';
            $name = '=?UTF-8?B?'.base64_encode(trim($_POST['name'])).'?=';
            $message = trim($_POST['mess']);
            $phone = $_POST['phone'];
            $skype = $_POST['skype'];
            $from = trim($_POST['email']);
            $from2 = $_POST['from'];
            $sitename = $_POST['namesite'];
            $communication = $_POST['communication'];
            $hosting = $_POST['hosting'];
            $country = $_POST['country'];
            $mess = 'Название сайта: '.$sitename."\n\nХостинг: ".$hosting."\n\nФИО: ".$_POST['name']."\n\nEmail: ".$_POST['email']."\n\nТелефон: ".$phone."\n\nSkype: ".$skype."\n\nСтрана проживания: ".$country."\n\nПредпочтительно связаться по: ".$communication."\n\nУзнали о нас: ".$from2."\n\nИзменения: ".$message."\n";
            $headers="From: \"$name\"<$from>\r\n";
            $headers.="Content-type: text/plain; charset=\"utf-8\"";
            if(mail ('hello@gophotoweb.ru', $title, $mess, $headers)) {
                print ('ok');
            }
        }
    }

    public function get_page(){
        $url = $this->getParam(0, 'string', '');
        if ($url != ''){
            $url = str_replace('-', '_', $url);
            if (is_callable(array('MainController', $url))){
                print $this->$url();
            } else {
                $this->displayErrorPage('404');
            }
        } else {
            $this->displayErrorPage('404');
        }
    }

    public function get_error_page()
    {
        $this->displayErrorPage('404');
    }

    public function setSeo($title = "Gophotoweb &mdash; сайты для фотографов",
                           $description = "Gophotoweb &mdash; первый специализированный интернет&ndash;сервис для фотографов: создание сайтов для фотографов, удобная система управления для фото-сайта, услуги хостинга и обслуживания сайта",
                           $tags = "Gophotoweb, сайт для фотографа, создание сайтов для фотографов, система управления сайтом для фотографов, хостинг и обслуживание"){
        $seo = array($title, $description, $tags);
        $this->view->assign('seo', $seo);
    }

    public function setActiveMenu($activ){
        $this->view->assign('activemenu', $activ);
    }
}
