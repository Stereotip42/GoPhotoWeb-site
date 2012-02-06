<?php
/**
 * This file contains database config details.
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
     * Define database constants
     * database/driver - database driver, supported PDO
     * database/host - database hostname
     * database/user - database user
     * database/pass - database password
     * database/db - database name
     * database/prefix - table prefix
     * database/ charset - database character
     */
    'database' => array(
        'driver' => 'mysql',
        'host' => 'localhost',
        'user' => 'gophotoweb',
        'pass' => 'qBcgR1PQ',
        'db' => 'gophotoweb',
        'prefix' => 'gphw_',
        'charset' => 'utf8'
    )
);