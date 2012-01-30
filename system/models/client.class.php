<?php
require_once(PATH_BASE.'model.class.php');
/**
 * Gophotoweb Client - model for admin panel
 * 
 * @property Db $db
 */
class ClientModel extends Model {

    /**
     * Construct
     *
     */
    public function __construct() {
    }

    public function getStaticData($mode = 'all') {
        $data = array();
        switch ($mode) {
            case 'all':
                $data['sites'] = $this->getAllSites();
                $data['statuses'] = $this->getAllStatuses();
                break;
        }
        $data['options'] = $this->getAllOptions();
        $data['sources'] = $this->getAllSources();
        $data['lands'] = $this->getAllLands();
        return $data;
    }

    public function getAllStatuses() {
        $statuses = $this->db->select('SELECT * FROM ?_statuses');
        return $statuses;
    }

    public function getAllSites() {
        $sites = $this->db->select('SELECT * FROM ?_sites');
        return $sites;
    }

    public function getAllLands() {
        $lands = $this->db->select('SELECT * FROM ?_lands ORDER BY id');
        return $lands;
    }

    public function getAllOptions() {
        $options['hosting'] = $this->db->select('SELECT * FROM ?_options WHERE type_id = 2');
        $options['logo'] = $this->db->select('SELECT * FROM ?_options WHERE type_id = 3');
        $options['other'] = $this->db->select('SELECT * FROM ?_options WHERE type_id = 1');
        return $options;
    }

    public function getAllSources() {
        $sources = $this->db->select('SELECT * FROM ?_sources ORDER BY id');
        return $sources;
    }

    public function getClientsCount($status = 0, $mode = "COUNT") {
        $where = $status == 0 ? '' : ' WHERE status_id = '.$status;
        $count = $this->db->selectrow('SELECT '.$mode.'(id) FROM ?_clients'.$where);
        $count[$mode.'(id)'] = $count[$mode.'(id)'] == 0 ? 1 : $count[$mode.'(id)'];
        return $count[$mode.'(id)'];
    }

    public function getClient($id) {
        $client = $this->db->selectrow('SELECT a.*, b.country, c.site_name, c.site_id AS site_num, d.source, e.status
            FROM ?_clients a, ?_lands b, ?_sites c, ?_sources d, ?_statuses e
            WHERE c.id = a.site_id AND b.id = a.country_id AND d.id = a.source_id AND e.id = a.status_id AND ?d = a.id', $id);
        $options = $this->db->select("SELECT b.name_admin FROM ?_clients_options a, ?_options b
            WHERE ?d = a.client_id AND a.option_id = b.id AND b.type_id = 1", $id);
        $client['logo'] = $this->db->selectCell("SELECT b.name_admin FROM ?_clients_options a, ?_options b
            WHERE ?d = a.client_id AND a.option_id = b.id AND b.type_id = 3", $id);
        $client['hosting'] = $this->db->selectCell("SELECT b.name_admin FROM ?_clients_options a, ?_options b
            WHERE ?d = a.client_id AND a.option_id = b.id AND b.type_id = 2", $id);
        $client['options'] = array();
        foreach($options as $option)
            $client['options'][] = $option['name_admin'];
        $client['comments'] = $this->db->select("SELECT a.*, b.name FROM ?_comments a, ?_users b
            WHERE client_id = ?d AND b.id = a.user_id ORDER BY id DESC", $id);
        return $client;
    }

    public function addEditClient($mode, $id = NULL) {
        $this->load->extension('input');
        $data = $this->input->getData('data', 'array', '');
        $this->convertToTimestamp(array(&$data['startDate'], &$data['deliveryDate'], &$data['finishDate']));
        $clientVals = array(
            'id' => $id,
            'last_name' => $data['lastname'],
            'name' => $data['name'],
            'surname' => $data['surname'],
            'email' => $data['email'],
            'skype' => $data['skype'],
            'phone' => $data['phone'],
            'country_id' => $data['country'],
            'communication' => $data['communication'],
            'source_id' => $data['source'],
            'site_id' => $data['site'],
            'comment' => $data['wish'],
            'start_date' => $data['startDate'],
            'delivery_date' => $data['deliveryDate'],
            'finish_test_date' => $data['finishDate'],
            'status_id' => $data['status'],
            'url' => $data['url'],
            'number' => $data['number']
        );

        switch ($mode) {
            case 'add':
                $clientId = $this->db->query("INSERT INTO ?_clients SET ?a", $clientVals);
                if ($data['option'] != NULL && $data['hosting'] != NULL && $data['logo'] != NULL) {
                    foreach ($data['option'] as $key=>$option)
                        $this->db->query("INSERT INTO ?_clients_options SET client_id = ?d, option_id = ?d", $clientId, $key);
                }
                $this->db->query("INSERT INTO ?_clients_options SET client_id = ?d, option_id = ?d", $clientId, $data['hosting']);
                $this->db->query("INSERT INTO ?_clients_options SET client_id = ?d, option_id = ?d", $clientId, $data['logo']);
            case 'edit':
                $this->db->query("UPDATE ?_clients SET ?a WHERE id=?d", $clientVals, $id);
                $this->db->query("DELETE FROM ?_clients_options WHERE client_id=?d", $id);
                if ($data['option'] != NULL) {
                    foreach ($data['option'] as $key=>$option)
                        $this->db->query("INSERT INTO ?_clients_options SET client_id = ?d, option_id = ?d", $id, $key);
                }
                $this->db->query("INSERT INTO ?_clients_options SET client_id = ?d, option_id = ?d", $id, $data['hosting']);
                $this->db->query("INSERT INTO ?_clients_options SET client_id = ?d, option_id = ?d", $id, $data['logo']);
        }

    }

    private function convertToTimestamp($array) {
        foreach ($array as &$element) {
            if ($element != NULL) {
                $element = explode('.', $element);
                $element = mktime(0, 0, 0, (int)$element[1], (int)$element[0], (int)$element[2]);
                if ($element == "" || $element == 0) $element = NULL;
            }
        }
    }

    public function getCertainNumClients($count = 400, $from = 1, $status = 0, $order = 'id', $isDesc = ' DESC') {
        $from = ($from-1) * $count;
        $where = $status == 0 ? '' : ' AND a.status_id = '.$status;
        $clients = $this->db->select('SELECT a.*, b.country, c.site_name, c.site_id AS site_num, d.source, e.status
            FROM ?_clients a, ?_lands b, ?_sites c, ?_sources d, ?_statuses e
            WHERE c.id = a.site_id AND b.id = a.country_id AND d.id = a.source_id AND e.id = a.status_id'.$where.'
            ORDER BY a.'.$order.$isDesc.' LIMIT '.$from.', '.$count.'');
        foreach ($clients as &$client) {
            $options = $this->db->select("SELECT b.name_admin FROM ?_clients_options a, ?_options b
                WHERE ?d = a.client_id AND a.option_id = b.id AND b.type_id = 1", $client['id']);
            $opt_res = '';
            foreach ($options as $option)
                $opt_res .= $option['name_admin'].', ';
            $opt_res = mb_convert_case(substr($opt_res, 0, -2), MB_CASE_LOWER, "UTF-8");
            $client['options'] = $opt_res;
            $client['hosting'] = $this->db->selectCell("SELECT b.name_admin FROM ?_clients_options a, ?_options b
                WHERE ?d = a.client_id AND a.option_id = b.id AND b.type_id = 2", $client['id']);
            $client['logo'] = $this->db->selectCell("SELECT b.name_admin FROM ?_clients_options a, ?_options b
                WHERE ?d = a.client_id AND a.option_id = b.id AND b.type_id = 3", $client['id']);
        }
        return $clients;
    }

    public function addComment($text, $date, $id_client) {
        $admin = $this->db->selectRow("SELECT id, name FROM ?_users WHERE login = ?s", $_SERVER['PHP_AUTH_USER']);
        $vals = array(
            'id' => NULL,
            'client_id' => $id_client,
            'comment' => $text,
            'date' => $date,
            'user_id' => $admin['id']
        );
        $this->db->query("INSERT INTO ?_comments SET ?a", $vals);
        return $admin['name'];
    }
    public function login() {
		$auth_user = $_SERVER['PHP_AUTH_USER'];
		$auth_pass = $_SERVER['PHP_AUTH_PW'];
        $users = $this->db->select('SELECT * FROM ?_users');
        foreach ($users as $user) {
            if ($user['login'] == $auth_user && $user['password'] == md5($auth_pass)) {
                return true;
            }
        }
        header('WWW-Authenticate: Basic realm="Only for GoPhotoWeb"');
        header('HTTP/1.0 401 Unauthorized');
        echo "<html><body><h1>Ошибка аутентификации</h1></body></html>";
        exit;
    }

    public function newOrder($name, $from, $skype, $phone, $country, $communication, $other, $source, $siteId, $message, $url, $tableAdd = "") {
        $communication = $communication ? $communication : 'other';
        $name = explode(" ", $name);
        $clientVals = array(
            'id' => NULL,
            'last_name' => $name[0],
            'name' => $name[1],
            'surname' => $name[2],
            'email' => $from,
            'skype' => $skype,
            'phone' => $phone,
            'country_id' => $country,
            'communication' => $communication,
            'source_id' => $source,
            'site_id' => $siteId,
            'comment' => $message,
            'start_date' => time(),
            'status_id' => 1,
            'url' => $url
        );
        $id = $this->db->query("INSERT INTO ?_clients{$tableAdd} SET ?a", $clientVals);
        foreach ($other as $option) {
            $this->db->query("INSERT INTO ?_clients_options{$tableAdd} SET client_id = ?d, option_id = ?d", $id, $option);
        }
        return $id;
    }

    public function deleteClient($id) {
        $this->db->query('DELETE FROM ?_clients WHERE id = ?d', $id);
        $this->db->query('DELETE FROM ?_clients_options WHERE client_id = ?d', $id);
        $this->db->query('DELETE FROM ?_comments WHERE client_id = ?d', $id);
    }

    public function getSite($name, $id) {
        $price = $this->db->selectRow("SELECT id, price FROM ?_sites
            WHERE site_name = ?s AND site_id = ?d", strtolower($name), $id);
        return $price;
    }

    public function searchClients($query) {
        $clients = $this->db->select('SELECT a.*, c.site_name, c.site_id AS site_num, e.status
            FROM ?_clients a, ?_sites c, ?_statuses e
            WHERE c.id = a.site_id AND e.id = a.status_id AND
            (a.last_name LIKE "%'.$query.'%" OR a.name LIKE "%'.$query.'%" OR a.number LIKE "%'.$query.'%" OR a.url LIKE "%'.$query.'%")
            ORDER BY a.id DESC');
        foreach ($clients as &$client) {
            $options = $this->db->select("SELECT b.name_admin FROM ?_clients_options a, ?_options b
                WHERE ?d = a.client_id AND a.option_id = b.id AND b.type_id = 1", $client['id']);
            $opt_res = '';
            foreach ($options as $option)
                $opt_res .= $option['name_admin'].', ';
            $opt_res = mb_convert_case(substr($opt_res, 0, -2), MB_CASE_LOWER, "UTF-8");
            $client['options'] = $opt_res;
            $client['hosting'] = $this->db->selectCell("SELECT b.name_admin FROM ?_clients_options a, ?_options b
                WHERE ?d = a.client_id AND a.option_id = b.id AND b.type_id = 2", $client['id']);
        }
        return $clients;
    }

    public function optionsProcessing($options, $id) {
        $forSiteOptions = $this->db->select("SELECT * FROM ?_options_addition WHERE site_id = ?d", $id);
        foreach ($options as $typeKey => &$optionType) {
            foreach ($optionType as $optionsKey => &$option) {
                foreach ($forSiteOptions as $optionForSite) {
                    if ($option['id'] == $optionForSite['option_id']) {
                        if ($optionForSite['show'] == 'n') {
                            unset($options[$typeKey][$optionsKey]);
                        }
                        else {
                            $option['price'] = $optionForSite['price'];
                            $option['checked'] = $optionForSite['checked'];
                        }
                    }
                }
            }
        }
        return $options;
    }

    public function convertOptionsIdToOptionsText($options) {
        $textOptions = array();
        foreach ($options as $key => $option) {
            $option = strip_tags($option);
            $textOptions['other'][$key] = $this->db->selectCell("SELECT option_name FROM ?_options WHERE id = ?d AND type_id = 1", $option);
            if ($textOptions['other'][$key] == "")
                unset($textOptions['other'][$key]);
            if ($textOptions['logo'] == "")
                $textOptions['logo'] = $this->db->selectCell("SELECT option_name FROM ?_options WHERE id = ?d AND type_id = 3", $option);
            if ($textOptions['hosting'] == "")
                $textOptions['hosting'] = $this->db->selectCell("SELECT option_name FROM ?_options WHERE id = ?d AND type_id = 2", $option);
        }

        $textOptions['other'] = implode('; ', $textOptions['other']);

        return $textOptions;
    }

}
