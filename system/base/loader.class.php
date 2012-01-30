<?php
/**
 * Loader class file.
 *
 * @author Dmitry Avseyenko <polsad@gmail.com>
 * @link http://weegbo.com/
 * @copyright Copyright &copy; 2008-2011 Inspirativ
 * @license http://weegbo.com/license/
 * @package system.base
 * @since 0.8
 */
class Loader {
    /**
     * @var static property to hold singleton instance
     */
    private static $_instance = NULL;

    /**
     * Static method for loading controller
     *
     * @access public
     * @param string $controller controller name
     * @return void
     */
    public static function controller($controller) {
        if (file_exists(Config::get('path/controllers').$controller.'.class.php')) {
            require_once(Config::get('path/controllers').$controller.'.class.php');
            $class = ucwords($controller).'Controller';
            try {
                Registry::set('controller', new $class);
            }
            catch (CException $e) {
                Error::exceptionHandler($e);
            }
            catch (Exception $e) {
                throw new CException("Controller class {$class} in file {$controller}.class.php not found", 1, 404);
            }
        }
        else {
            throw new CException("Controller file {$controller}.php not found", 1, 404);
        }
    }

    /**
     * Static method for loading extension
     *
     * @access public
     * @param string $extension extension class name (for example 'Validator')
     * @param string $name      extension name (for example 'validator')
     * @param mixed [option]
     * @return void
     */
    public static function extension() {
        $args = func_get_args();
        $extension = isset($args[0]) ? strtolower($args[0]) : NULL;
        $name = isset($args[1]) ? $args[1] : $extension;
        $args = array_slice($args, 2);

        if (file_exists(Config::get('path/extensions').$extension.'.class.php')) {
            require_once(Config::get('path/extensions').$extension.'.class.php');
        }
        elseif (file_exists(Config::get('path/extensions').$extension.'/'.$extension.'.class.php')) {
            require_once(Config::get('path/extensions').$extension.'/'.$extension.'.class.php');
        }
        else {
            throw new CException("Extension file {$extension}.class.php not found", 0, 500);
        }

        $class = ucfirst($extension).'Extension';
        try {
            self::createObject($class, $name, $args);
        }
        catch (CException $e) {
            Error::exceptionHandler($e);
        }
        catch (Exception $e) {
            throw new CException("Extension class {$class} in file {$extension}.class.php not found", 0, 500);
        }
    }

    /**
     * Static method for loading model
     *
     * @access public
     * @param string $model model class name (for example 'News')
     * @param string $name  model name (for example 'news')
     * @return void
     */
    public static function model($model, $name = '') {
        $args = func_get_args();
        $model = isset($args[0]) ? strtolower($args[0]) : NULL;
        $name = isset($args[1]) ? $args[1] : $model;
        $args = array_slice($args, 2);
        if (file_exists(Config::get('path/models').$model.'.class.php')) {
            require_once(Config::get('path/models').$model.'.class.php');
            $class = ucfirst($model).'Model';
            try {
                self::createObject($class, $name, $args);
            }
            catch (CException $e) {
                Error::exceptionHandler($e);
            }
            catch (Exception $e) {
                throw new CException("Model class {$class} in file {$model}.class.php not found", 0, 500);
            }
        }
        else {
            throw new CException("Model file {$model}.class.php not found", 0, 500);
        }
    }

    /**
     * Static method for loading library
     *
     * @access public
     * @return void
     */
    public static function library() {
        $args = func_get_args();
        $path = isset($args[0]) ? $args[0] : NULL;
        $library = isset($args[1]) ? $args[1] : NULL;
        $name = isset($args[2]) ? $args[2] : NULL;
        $args = array_slice($args, 3);
        if (file_exists(Config::get('path/libs').$path)) {
            require_once(Config::get('path/libs').$path);
            try {
                self::createObject($library, $name, $args);
            }
            catch (CException $e) {
                Error::exceptionHandler($e);
            }
            catch (Exception $e) {
                throw new CException("Library class {$library} in file {$path} not found", 0, 500);
            }
        }
        else {
            throw new CException("Library file {$path} not found", 0, 500);
        }
    }

    /**
     * Load class for work with database
     * database.php - file with configuration
     *
     * @access public
     * @return void
     */
    public static function db() {
        Config::load('database');
        require_once(PATH_BASE.'db.class.php');

        $db = Db::getInstance();
        $db->connect();
        $db->setIdentPrefix(Config::get('database/prefix'));
        if (NULL != Config::get('database/charset')) {
            $db->query('SET NAMES '.Config::get('database/charset'));
        }
        Registry::set('db', $db);
    }

    /**
     * Static method for loading template engine
     *
     * @access public
     * @return void
     */
    public static function view() {
        require_once(PATH_BASE.'view.class.php');
        Registry::set('view', new View);
    }

    /**
     * Factory method to return the singleton instance
     *
     * @access public
     * @return Registry
     */
    public static function getInstance() {
        if (NULL == Loader::$_instance) {
            Loader::$_instance = new Loader;
        }
        return Loader::$_instance;
    }

    public function __construct() {

    }

    /**
     * Return value from Registry by name
     *
     * @access public
     * @param string $name object's name in Registry
     * @return mixed
     */
    public function __get($name) {
        return Registry::get($name);
    }

    private static function createObject(&$class, &$name, &$args) {
        $obj = new ReflectionClass($class);
        Registry::set($name, call_user_func_array(array(&$obj, "newInstance"), $args));
    }
}
