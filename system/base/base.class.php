<?php
/**
 * Base class file.
 *
 * Base класс подключает необходимые для работы классы (Config, Error, Exception,
 * Register и Loader), реализует функции роутера и подключает необходимый контроллер,
 * выводит статистику по работе приложения (время работы, потребляемая память,
 * количество запросов к БД, общая прододжительность запросов).
 *
 * @author Dmitry Avseyenko <polsad@gmail.com>
 * @link http://weegbo.com/
 * @copyright Copyright &copy; 2008-2011 Inspirativ
 * @license http://weegbo.com/license/
 * @package system.base
 * @since 0.8
 */
class Base {
    /**
     * @var floor $_stime время начала работы приложения.
     */
    private static $_stime = 0.00;

    /**
     * Create application.
     *
     * @access public
     * @param string $path_app - path to application folder
     * @return void
     */
    public static function createWebApplication($path_app) {
        /**
         * Define path application, PATH_ROOT and PATH_BASE defined in file index.php.
         */
        define('PATH_APP', $path_app);
        /**
         * Include config class and load application configuration.
         */
        require_once(PATH_BASE.'config.class.php');
        Config::load('config');
        /**
         * Enable profiler
         */
        if (Config::get('debug/statistic'))
            self::statistic('start');
        /**
         * Include static classes exception and error, set error handler Error::codeError method.
         */
        require_once(PATH_BASE.'exception.class.php');
        require_once(PATH_BASE.'error.class.php');
        set_error_handler(create_function('$c, $m, $f, $l', 'Error::errorHandler($m, $c, $f, $l);'), E_ALL ^ E_NOTICE);
        /**
         * Include class Register.
         */
        require_once(PATH_BASE.'registry.class.php');
        /**
         * Include class Loader, create loader and config instance.
         */
        require_once(PATH_BASE.'loader.class.php');
        Registry::set('load', Loader::getInstance());
        Registry::set('config', Config::getInstance());
        /**
         * Application routing.
         */
        try {
            self::routing();
        }
        catch (CException $e) {
            Error::exceptionHandler($e);
        }
        /**
         * Show profiler data
         */
        if (Config::get('debug/statistic'))
            self::statistic('end');
    }

    /**
     * Create controller and execute method base on URL.
     *
     * @access public
     * @return void
     */
    public static function routing() {
        $params = array('uri' => array(), 'get' => array(), 'host' => array());

        self::parseDomain($_SERVER['HTTP_HOST'], $params['host']);
        self::parseUrl(substr($_SERVER['REQUEST_URI'], 1), $params['uri'], $params['get']);

        Registry::set('params', $params);
        $cname = isset($params['uri'][0]) ? strtolower(trim($params['uri'][0])) : Config::get('app/default-controller');
        $cname = empty($cname) ? Config::get('app/default-controller') : $cname;

        Loader::controller($cname);
        $controller = Registry::get('controller');
        $controller->execute();
    }

    /**
     * Parse URL for obtaining domain and subdomains.
     *
     * @param string $url
     * @param link $host array with domain/subdomain segments
     * @return void
     */
    private function parseDomain($url, &$host) {
        preg_match_all("/([^.]+)\.?/", $url, $matches);
        $host = $matches[1];
    }

    /**
     * Parse URL on URI and GET segments.
     *
     * @access private
     * @param string $url
     * @param link $uri array with URI segments
     * @param link $get array with GET segment
     * @return void
     */
    private static function parseUrl($url, &$uri, &$get) {
        if (strpos($url, '?')) {
            $url = explode('?', $url);
            $uristr = $url[0];
            $getstr = $url[1];
        }
        else {
            $uristr = $url;
            $getstr = NULL;
        }
        if (Config::get('app/url-replace')) {
            $uristr = self::replaceUrl($uristr);
        }
        $uri = explode('/', $uristr);
        if (NULL != $getstr) {
            $buff = explode('&', $getstr);
            $size = sizeof($buff);
            for ($i = 0; $i < $size; $i++) {
                $params = explode('=', $buff[$i]);
                $get[$params[0]] = $params[1];
            }
        }
    }

    /**
     * Метод заменяет исходный URL в соответствии с регулярным выражением.
     *
     * @access private
     * @param array $urls хэш с шаблонами и на что они будут заменяться
     * @param string $url исходный URL по которому будет проводиться поиск
     * @return string
     */
    private static function replaceUrl($url) {
        $routes = require_once(Config::get('path/config').'routes.php');
        foreach ($routes as $k => $v) {
            $pattern = '/^'.$k.'[\/]?$/';
            if (preg_match($pattern, $url)) {
                $url = preg_replace($pattern, $v, $url);
                return $url;
            }
        }
        return $url;
    }

    /**
     * Start/stop cбор статистики and display result.
     *
     * @access public
     * @return void
     */
    public static function statistic($action) {
        switch ($action) {
            case 'start':
                self::$_stime = microtime(true);
                break;
            case 'end':
                $memory = round(memory_get_usage() / 1024, 2);
                if (class_exists('Db')) {
                    $dbres = Db::getStatistic();
                }
                else {
                    $dbres = array('total' => 0, 'runtime' => 0);
                }
                $time = round(microtime(true) - self::$_stime, 4);
                echo "Queries {$dbres['total']} ({$dbres['runtime']} sec.) Time {$time} sec. Memory {$memory} Kb.";
                break;
        }
    }
}
