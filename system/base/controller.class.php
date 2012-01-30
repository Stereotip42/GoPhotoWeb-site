<?php
/**
 * Controller class file.
 *
 * Родительский класс для контроллеров.
 *
 * @author Dmitry Avseyenko <polsad@gmail.com>
 * @link http://weegbo.com/
 * @copyright Copyright &copy; 2008-2011 Inspirativ
 * @license http://weegbo.com/license/
 * @package system.base
 * @since 0.8
 */
abstract class Controller {
    /**
     * @var array controller class and method.
     */
    protected $_info = array();

    public function __construct() {
        $this->autoload();
    }

    /**
     * Return value from Registry by name
     *
     * @access public
     * @param string $var object's name in Registry
     * @return mixed
     */
    public function __get($var) {
        return Registry::get($var);
    }

    /**
     * Return controller info as array (controller class and method).
     *
     * @access public
     * @return array
     */
    public final function getInfo() {
        return $this->_info;
    }

    /**
     * Set info (controller class and method).
     *
     * @access private
     * @return void
     */
    private function setInfo() {
        $name = '';
        $action = '';
        if (isset($this->params['uri'][0]) && $this->params['uri'][0] != NULL) {
            $name = ucwords(trim($this->params['uri'][0])).'Controller';
        }
        else {
            $name = ucwords(Config::get('app/default-controller')).'Controller';
        }
        $action = isset($this->params['uri'][1]) ? strtolower(trim($this->params['uri'][1])) : '';
        if (!method_exists($this, $action) || $action == '') {
            $action = 'index';
        }
        $this->_info = array($name, $action);
    }

    /**
     * Called controller's method depending of the URL.
     *
     * @access public
     * @return void
     */
    public final function execute() {
        $info = $this->_info;
        $params = $this->params;
        $params['uri'] = array_slice($params['uri'], 2);
        Registry::set('params', $params);

        if ($info[1] != 'index') {
            $this->$info[1]();
        }
        else {
            if (Config::get('app/url-replace') && $info[1] != 'index') {
                $this->displayErrorPage(404);
            }
            else {
                $this->index();
            }
        }
    }

    /**
     * Display page.
     *
     * @access public
     * @param string $page template name
     * @return void
     */
    public final function displayPage($page, $expire = NULL) {
        $this->view->display($page, $expire);
        /**
         * If statistic enable, and page is render, show statistic
         */
        if (Config::get('debug/statistic'))
            Base::statistic('end');
        exit();
    }

    /**
     * Display error page.
     *
     * @access public
     * @param int $error error number, see Error::displayErrorPage()
     * @return void
     */
    public final function displayErrorPage($error) {
        Error::displayErrorPage($error);
        /**
         * If statistic enable, and page is render, show statistic
         */
        if (Config::get('debug/statistic'))
            Base::statistic('end');
        exit();
    }

    /**
     * Redirect on URL.
     *
     * @access public
     * @param string $page URL ('/' -  main page)
     * @return void
     */
    public final function redirect($url) {
        if (!preg_match('#^(https?|ftp)://#', $url, $match)) {
            $url = Config::get('path/host').ltrim($url, '/');
        }
        Header('Location: '.$url);
        exit();
    }

    /**
     * Get parameter and bring it to type.
     *
     * @access public
     * @param int $id index in params array
     * @param string $type param's type. Must be: 'int', 'string', 'float', 'bool', default - 'string'
     * @param mixed $res default result
     * @param string $index 'uri', 'get' or 'host'. Defaulf - 'uri'
     * @return mixed
     */
    public final function getParam($id, $type = 'string', $res = NULL, $index = 'uri') {
        $value = isset($this->params[$index][$id]) ? $this->params[$index][$id] : $res;
        if ($value != $res) {
            settype($value, $type);
            if ($value == $res) {
                $value = $res;
            }
        }
        return $value;
    }

    /**
     * Autoload method.
     *
     * @return void
     */
    private final function autoload() {
        $autoload = require_once(Config::get('path/config').'autoload.php');
        /**
         * Load base components
         */
        foreach ($autoload['base'] as $k => $v) {
            $this->load->$v();
        }
        /**
         * Load extensions
         */
        foreach ($autoload['extensions'] as $k => $v) {
            if (is_array($v) && NULL != $v) {
                $vals = array($k);
                $vals = array_merge($vals, $v);
            }
            else {
                $vals = array($v);
            }
            call_user_func_array('Loader::extension', $vals);
        }
        /**
         * Load models
         */
        foreach ($autoload['models'] as $k => $v) {
            if (is_array($v) && NULL != $v) {
                $vals = array($k);
                $vals = array_merge($vals, $v);
            }
            else {
                $vals = array($v);
            }
            call_user_func_array('Loader::model', $vals);
        }
        /**
         * Set info
         */
        $this->setInfo();
        /**
         * Set templates vars
         */
        $this->view->assign('path_host', Config::get('path/host'));
    }

    /**
     * Abstract method index.
     */
    abstract protected function index();
}
