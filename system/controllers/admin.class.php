<?php
/**
 * AdminController class file.
 *
 */
require_once(PATH_BASE.'controller.class.php');
/**
 * @property ClientModel $client
 * @property Loader $load
 * @property View $view
 * @property AjaxExtension $ajax
 * @property InputExtension $input
 */
class AdminController extends Controller {

    public function __construct() {
        parent::__construct();
        $this->checkAdmin();
    }

    /**
     * Load all clients info
     *
     * @return void
     */
    public function index() {
        if (isset($_POST['logout'])) {
            $this->checkAdmin();
        }
        $this->load->model('client');
        $clients = $this->client->getCertainNumClients();
        $countClients = $this->client->getClientsCount();
        $statuses = $this->client->getAllStatuses();
        $this->view->assign('countClients', ($countClients));
        $this->view->assign('clients', $clients);
        $this->view->assign('statuses', $statuses);
        $this->displayPage('admin/index.tpl');
    }

    /**
     * Add new client info
     *
     * @return int
     */

    public function add() {
        $this->load->model('client');
        if (isset($_POST['addClient'])) {
            $this->client->addEditClient('add');
            $this->redirect('../admin');
        }
        $number = $this->client->getClientsCount(0, "MAX");
        $data = $this->client->getStaticData();
        $this->view->assign('data', $data);
        $this->view->assign('number', $number+1);
        $this->displayPage('admin/add-edit.tpl');
    }

    /**
     * Edit client info
     *
     * @return int
     */

    public function edit() {
        $id = $this->getParam(0, 'string', 0);
        $this->load->model('client');
        if (isset($_POST['addClient'])) {
            $this->client->addEditClient('edit', $id);
            $this->redirect('/admin');
        }
        $client = $this->client->getClient($id);
        $data = $this->client->getStaticData();
        $this->view->assign('data', $data);
        $this->view->assign('number', $client['id']);
        $this->view->assign('client', $client);
        $this->displayPage('admin/add-edit.tpl');
    }

    public function getSomeClients() {
        $this->load->extension('input');
        $count = $this->input->getData('count', 'int', 400);
        $page = $this->input->getData('page', 'int', 1);
        $status = $this->input->getData('status', 'int', 0);
        $sort = $this->input->getData('sort', 'string', 'id');
        $isDesc = $this->input->getData('desc', 'string', ' DESC');
        $this->load->extension('ajax');
        $this->load->model('client');
        $clients = $this->client->getCertainNumClients($count, $page, $status, $sort, $isDesc);
        $countClients = $this->client->getClientsCount($status);
        $html = array();
        header('Content-type: json; charset=utf-8');
        $this->view->assign('clients', $clients);
        $html['body'] = $this->view->fetch('admin/clients.tpl');
        $html['count'] = $countClients;
        $this->ajax->sendData($html);
    }

    public function addComment() {
        $this->load->extension('input');
        $text = $this->input->getData('comment', 'string', '');
        $id_client = $this->input->getData('id', 'int', '0');
        $date = time();
        $comment['date'] = date('d-m-y H:i', $date);
        $this->load->model('client');
        $comment['login'] = $this->client->addComment($text, $date, $id_client);
        $this->load->extension('ajax');
        $this->ajax->sendData($comment);
    }

    public function delete() {
        $id = $this->getParam(0, 'string', 0);
        $this->load->model('client');
        $this->client->deleteClient($id);
        $this->redirect('/admin');
    }

    private function checkAdmin() {
        if (!isset($_SERVER['PHP_AUTH_USER']) || ($_POST['SeenBefore'] == 1 && $_POST['OldAuth'] == $_SERVER['PHP_AUTH_USER'])) {
            header('WWW-Authenticate: Basic realm="Only for GoPhotoWeb"');
            header('HTTP/1.0 401 Unauthorized');
            echo "<html><body><h1>Ошибка аутентификации</h1></body></html>";
            exit;
        }
        else {
            $this->load->model('client');
            $this->client->login();
        }
    }

    public function search() {
        $this->load->extension('input');
        $this->load->extension('ajax');
        $query = $this->input->getData('query', 'string', NULL);
        $this->load->model('client');
        $clients = $this->client->searchClients($query);
        $html = array();
        $this->view->assign('clients', $clients);
        $html['body'] = $this->view->fetch('admin/clients.tpl');
        $this->ajax->sendData($html);
    }

    public function sorting() {
        $type = $this->getParam(0, 'string', 0);
        $this->load->model('client');
        $clients = $this->client->getCertainNumClients(50, 1, 0, $type);
        $countClients = $this->client->getClientsCount();
        $statuses = $this->client->getAllStatuses();
        $this->view->assign('countClients', ($countClients));
        $this->view->assign('clients', $clients);
        $this->view->assign('statuses', $statuses);
        $this->displayPage('admin/index.tpl');
    }
}