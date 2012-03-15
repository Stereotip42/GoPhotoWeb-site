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
/**
 * @property ClientModel $client
 */
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


    public function agreement(){
        $this->setSeo();
        $this->displayPage('pages/agreement.tpl');
    }

    public function dogovor_oferta(){
        $this->setSeo();
        $this->displayPage('pages/dogovor-oferta.tpl');
    }
    
    public function catalog() {
       $this->setActiveMenu('site_for');
       $this->setSeo();
 /*        $this->load->model('websitecatalogue');
        $data['websites'] = (array)$this->websitecatalogue->getWebsiteList();
         $this->view->assign('data', $data);*/
        $this->displayPage('pages/catalog.tpl');
    }

    public function order() {
        $this->setSeo();
        $nameSite = $this->params['get']['name'];
        $idSite = $this->params['get']['site'];
        $this->load->model('client');
        $data = $this->client->getStaticData('order');
        $data['price'] = $this->client->getSite($nameSite, substr($idSite, 2,1));
        $data['options'] = $this->client->optionsProcessing($data['options'], $data['price']['id']);
        $this->view->assign('data', $data);
        $this->view->assign('name', $nameSite);
        $this->view->assign('site', $idSite);
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
/*
        $page = $this->getParam(0, 'int', 1);

        $this->load->model('clientsgallery');
        $count = $this->clientsgallery->getCoutClients();
        $paging = $this->paging->getPages($count, 10, 25, $page);
        $data = $this->clientsgallery->loadClientsData($page);
        $this->view->assign('data', $data);
        $this->view->assign('paging', $paging);*/
        $this->displayPage('pages/clients.tpl');
    }

    public function content_management_system() {
        $this->setActiveMenu('site_for');
        $this->setSeo();
        $this->displayPage('pages/cms.tpl');
    }

    public function scaler_option() {
        $this->setActiveMenu('site_for');
        $this->setSeo();
        $this->displayPage('pages/scaler_option.tpl');
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
    
    
    /**
     * Request details website page,
     * contains form with textfields,
     * where user can fill info about every main site's page
     */
    public function upgrade_website_request_details(){ 
        $this->load->model('upgradewebsite');
        
        $data = array();
        $data['id'] = $this->getParam(2, 'int');
        
        if ($data['id']){
            
            $upgrade_orders_list = (array)json_decode($_COOKIE['upgrade_orders_list'], true);
            if (!in_array($data['id'], $upgrade_orders_list)){
                 $this->redirect('/');
            }

            $data = $this->upgradewebsite->getDataById($data['id']);          
        }else{
            $data['website'] =  $this->getParam(0, 'string');
            $data['tint'] = $this->getParam(1, 'string');
        }                          
        
        $this->view->assign('data', $data);
        $this->displayPage('pages/upgrade_website_request_details.tpl');
    }
    
    /**
     * 
     */
    public function update_upgrade_data(){
        $this->load->extension('input');        
        $this->load->model('upgradewebsite');
        
        $data = $this->input->getData('data', 'array', NULL);
        $upgrade_orders_list = (array)json_decode($_COOKIE['upgrade_orders_list'], true);        
     
        switch($data['form']){
            case 'request_details':
                    
                if ($data['id'] && !in_array($data['id'], $upgrade_orders_list)){
                    
                    $redirectUrl = '/';
                }else{
                    
                    $id = $this->upgradewebsite->saveUpgradeDetails($data);
                    if (!in_array($id, $upgrade_orders_list)){
                        $upgrade_orders_list[] = $id;
                        setcookie("upgrade_orders_list", json_encode($upgrade_orders_list), 0);
                    }                    
                    $redirectUrl = "upgrade_website_order_{$id}.html";
                }
                
                break;
            case 'user_details':
                if (!in_array($data['id'], $upgrade_orders_list)){
                    $redirectUrl = '/';
                }else{
                    $data['hosting'] = $this->input->getData('hosting');                
                    $this->upgradewebsite->saveUserDetails($data);
                    $redirectUrl = "upgrade_request_details_{$data['id']}.html";                                
                }
                break;
            case 'order_complited':
                if (!in_array($data['id'], $upgrade_orders_list)){
                    $redirectUrl = '/';
                }else{
                    $data['hosting'] = $this->input->getData('hosting');
                    $this->upgradewebsite->saveUserDetails($data);
                    $data = $this->upgradewebsite->getDataById($data['id']);
                    $this->upgradewebsite->upgradeOrderComplite($data);
                    $new_upgrade_orders_list = array();
                    foreach ((array)$upgrade_orders_list as $item){
                        if ((int)$item!=(int)$data['id']){
                            $new_upgrade_orders_list[] = $item;
                        }
                    }
                    setcookie("upgrade_orders_list", json_encode($new_upgrade_orders_list), 0);
                    $redirectUrl = 'order_success.html';
                }
                break;
        }
        
       $this->redirect($redirectUrl);
    }          
    public function test(){
        $upgrade_orders_list = (array)json_decode($_COOKIE['upgrade_orders_list'], true);
        print_r($upgrade_orders_list);                
    }
    
    /**
     * This page contains contact form which is filling
     * at the end of upgrade website order
     */
    public function upgrade_website_order(){
        $data['id'] = $this->getParam(0, 'string');
        
        $upgrade_orders_list = (array)json_decode($_COOKIE['upgrade_orders_list'], true);
        
        if (!in_array($data['id'], $upgrade_orders_list)){
             $this->redirect('/');
        }
        
        $this->load->model('upgradewebsite');        
        $data = $this->upgradewebsite->getDataById($data['id']);
        $data['lands'] = require_once(Config::get('path/config').'lands.php');
        $this->view->assign('data', $data);
        $this->displayPage('pages/upgrade_order.tpl');
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

    public function send_site_new(){
        if (isset($_POST['name']) && isset($_POST['phone']) && isset($_POST['email']) && isset($_POST['namesite']) && isset($_POST['from'])) {
            $title = '=?UTF-8?B?'.base64_encode('Заказ сайта').'?=';
            $name = '=?UTF-8?B?'.base64_encode(trim($_POST['name'])).'?=';
            $message = trim($_POST['mess']);
            $phone = $_POST['phone'];
            $skype = $_POST['skype'];
            $from = trim($_POST['email']);
            $url = $_POST['url'];
            $mwPro = ($_POST['discount'] == 'y') ? 'Состоит в MyWed PRO' : '';
            $from2 = $_POST['from'];
            $sitename = $_POST['namesite'];
            $communication = $_POST['communication'];
            $other = $_POST['other'];
            $country = $_POST['country'];
            $this->load->model('client');
            $siteId = explode('-', $sitename);
            $siteId = $this->client->getSite($siteId[0], $siteId[1]);
            $id = $this->client->newOrder($_POST['name'], $from, $skype, $phone, $country, $communication, $other, $from2, $siteId['id'], $message, $url);
            $options = $this->client->convertOptionsIdToOptionsText($other);
            $mess = 'Название сайта: '.$sitename."\n\nФИО: ".$_POST['name']."\n\nEmail: ".$_POST['email'].
                    "\n\nТелефон: ".$phone."\n\nSkype: ".$skype."\n\nХостинг: ".$options['hosting'].
                    "\n\nЛоготип: ".$options['logo']."\n\nДополнительные опции: ".$options['other'].
                    "\n\nКомментарий к заказу: ".$message."\n\n".$mwPro;
            $mess = strip_tags($mess);
            $clientMess = "Вас приветствует компания GoPhotoWeb.\n\n
            Мы получили Вашу заявку на разработку сайта и свяжемся с Вами в течение 1 рабочего дня для уточнения всех деталей.\n\n

            Пожалуйста, проверьте детали вашей заявки:\n\n
            ====================================\n
            Название сайта: ".$sitename." \n
            ФИО: ".$_POST['name']." \n
            Email: ".$_POST['email']." \n
            Телефон: ".$phone."\n
            Skype: ".$skype."\n
            Хостинг: ".$options['hosting']."\n
            Логотип: ".$options['logo']."\n
            Дополнительные опции: ".$options['other']."\n
            Комментарий к заказу: ".$message."\n
            =====================================\n\n
            С уважением,\n
            команда GoPhotoWeb\n\n
            Gophotoweb - сайты для фотографов\n
            www.gophotoweb.ru\n
            hello@gophotoweb.ru\n
            Skype: gophotoweb";
            $headers="From: \"Gophotoweb\"<hello@gophotoweb.ru>\r\n";
            //$headers.="Content-type: text/plain; charset=\"utf-8\"";
            //$clientTitle = '=?UTF-8?B?'.base64_encode('Подтверждение получения заявки на разработку сайта').'?=';
            $this->sender('diffmike@gmail.com', $from, $headers, strip_tags($clientMess), 'Подтверждение получения заявки на разработку сайта');
            $headers="From: \"$name\"<$from>\r\n";
            if($this->sender('diffmike@gmail.com', $from, $headers, $mess, "Сообщение с сайта.")) {
                print ('ok');
            }
        }
    }

	
    public function dont_agree(){
        if (isset($_POST['name']) && isset($_POST['phone']) && isset($_POST['email']) && isset($_POST['namesite']) && isset($_POST['from'])) {
            $message = trim($_POST['mess']);
            $phone = $_POST['phone'];
            $skype = $_POST['skype'];
            $from = trim($_POST['email']);
            $from2 = $_POST['from'];
            $url = $_POST['url'];
            $sitename = $_POST['namesite'];
            $communication = $_POST['communication'];
            $other = $_POST['other'];
            $country = $_POST['country'];
            $this->load->model('client');
            $siteId = explode('-', $sitename);
            $siteId = $this->client->getSite($siteId[0], $siteId[1]);
            $this->client->newOrder($_POST['name'], $from, $skype, $phone, $country, $communication, $other, $from2, $siteId['id'], $message, $url, "_dont_agree");
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

    public function sender($to, $email, $name, $message, $subject) {
        $this->load->library('phpmailer/phpmailer.class.php', 'PHPMailerLite', 'mail');
        $this->mail->IsHTML(false);
        $this->mail->CharSet = 'utf-8';

        $this->mail->From = $email;
        $this->mail->FromName = $name;
        $this->mail->Subject = $subject;
        $this->mail->AddAddress($to);
        $this->mail->Body = $message;

        $this->mail->Send();
        $this->mail->ClearAddresses();
        return true;
    }
}
