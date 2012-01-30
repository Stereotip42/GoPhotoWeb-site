<?php
/**
 * This file contains ACL rules.
 *
 * @author Dmitry Avseyenko <polsad@gmail.com>
 * @link http://weegbo.com/
 * @copyright Copyright &copy; 2008-2011 Inspirativ
 * @license http://weegbo.com/license/
 * @package system.config
 * @since 0.8
 */
return array(
    'anonymous' => array(
        'allow' => '*',
        'deny' => array(
            'MainController' => array('validate')
        )
    ),
    'members' => array(
        'allow' => array(
            'MainCoontroller' => array('test')
        ),
        'deny' => '*'
    )
);
