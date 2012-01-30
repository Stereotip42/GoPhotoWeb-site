<?php
/**
 * This file contains router rules.
 *
 * @author Dmitry Avseyenko <polsad@gmail.com>
 * @link http://weegbo.com/
 * @copyright Copyright &copy; 2008-2011 Inspirativ
 * @license http://weegbo.com/license/
 * @package system.base
 * @since 0.8
 */
return array(
    /**
     * Admin panel
     */
    'admin' => 'admin/index',
    'admin\/add' => 'admin/add',
    'admin\/delete\/([\d]+)' => 'admin/delete/$1',
    'admin\/logout' => 'admin/logout',
    'admin\/client\/([\d]+)' => 'admin/edit/$1',
    'admin\/addComment' => 'admin/addComment',
    'admin\/getSomeClients' => 'admin/getSomeClients',
    'admin\/search' => 'admin/search',
    'admin\/sort\/(name|number)' => 'admin/sorting/$1',

    /**
     * Front end
     */
    ''  => 'main/index',
    'clients.html\/page([\d]+)' => 'main/gallery_of_clients/$1',
    'upgrade_request_details_([0-9]+).html' => 'main/upgrade_website_request_details/t/t/$1',
    'upgrade_request_details_(.*)_(.*).html' => 'main/upgrade_website_request_details/$1/$2',            
    'upgrade_website_order_([0-9]+).html' => 'main/upgrade_website_order/$1',        
    'update_upgrade_data.html'=> 'main/update_upgrade_data',
    '([a-zA-Z0-9_\-~]+).html'  => 'main/get_page/$1',
    '[a-zA-Z0-9_\-~\.]+'  => 'main/get_error_page',
 );
