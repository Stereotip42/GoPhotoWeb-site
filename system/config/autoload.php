<?php
/**
 * This file contains autoload rules.
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
     * Base components (db, view)
     */
    'base' => array(
        'db',
        'view'
    ),
    /**
     * Extensions
     */
    'extensions' => array(
        'session' => array('sname', 'ifm.loc'),
        'paging',
        'validator',
    ),
    /**
     * Models
     */
    'models' => array(
        'main'
    )
);
