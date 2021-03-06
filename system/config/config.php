<?php
/**
 * This file contains config details.
 *
 * @author Dmitry Avseyenko <polsad@gmail.com>
 * @link http://weegbo.com/
 * @copyright Copyright &copy; 2008-2011 Inspirativ
 * @license http://weegbo.com/license/
 * @package system.config
 * @since 0.8
 */
return array(
    /**
     * File system paths
     * path/config - path to directory with config files
     * path/cache - path to directiry with cache files
     * path/libs - path to directiry with libraries
     * path/controllers - path to directiry with controllers
     * path/models - path to directiry with models
     * path/extensions - path to directiry with framework extensions
     * path/helpers - path to directiry with templates
     * path/tmpls - path to directiry with templates
     * path/host - root URL (for example: http://site.com/)
     */
    'path' => array(
        'config' => PATH_APP.'config/',
        'cache' => PATH_APP.'cache/',
        'libs' => PATH_APP.'libraries/',
        'controllers' => PATH_APP.'controllers/',
        'models' => PATH_APP.'models/',
        'extensions' => PATH_BASE.'extensions/',
        'helpers' => PATH_BASE.'helpers/',
        'tmpls' => PATH_APP.'tmpls/',
        'host' => 'http://'.$_SERVER['HTTP_HOST'].'/'
    ),
    /**
     * Application options
     * app/default-controller - default controller
     * app/url-replace - enable or disable router for replace URL
     * app/cache - configuration for cache system
     *    app/cache/driver - application cache driver (apc, eaccelerator, file, memcache)
     *    app/cache/server - configuration for memcache servers. 
     *    app/cache/server/host - option only for memcache system. Memcache server.
     *    app/cache/server/port - option only for memcache system. Memcache port.
     * app/autoload - компоненты которые будут загруженны автоматически
     *    app/autoload/base - основные компоненты (db, view)
     *    app/autoload/extensions - расширения
     *    app/autoload/models - модели
     * app/ob-gzip - enable/disable gzip compression
     * app/session-name - session name
     */
    'app' => array(
        'default-controller' => 'main',
        'url-replace' => true,
        'cache' => array(
            'driver' => 'file',
            'server' => array(
                array('host' => '', 'port' => '')
            )
        ),
        'ob-gzip' => false,
        'session-name' => 'session',
    ),
    /**
     * Debug options
     * debug/debug - enable or disable debug (Load errors, Db errors, etc...)
     * debug/statistic - enable or disable statistics collection
     * debug/log - full path to debug log file
     */
    'debug' => array(
        'debug' => true,
        'statistic' => false,
        'log' => PATH_APP.'error.log'
    ),
    /*
     * Settings for pictures
     */
    'pictures' => array(
        'preview_count' => 14,
        'preview_link'  =>array(
                '1' => 1,
                '2' => 1,
                '3' => 1,
                '4' => 2,
                '5' => 2,
                '6' => 2,
                '7' => 3,
                '8' => 4,
                '9' => 4,
                '10' => 4,
                '11' => 5,
                '12' => 5,
                '13' => 5,
                '14' => 3,
        )
    )
);