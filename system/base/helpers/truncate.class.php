<?php
/**
 * Weegbo TruncateHelper class file.
 *
 * @author Dmitry Avseyenko <polsad@gmail.com>
 * @package system.base.helpers
 * @copyright Copyright &copy; 2008-2011 Inspirativ
 * @license http://weegbo.com/license/
 * @since 0.8
 */

require_once(PATH_BASE.'helper.class.php');

/**
 * TruncateHelper class
 *
 * Helper for truncate string
 *
 * @author Dmitry Avseyenko <polsad@gmail.com>
 * @package system.base.helpers
 * @since 0.8
 */
class TruncateHelper extends Helper {
    public function execute($args = array()) {
        $text   = $args[0];
        $number = $args[1];
        $dotted = isset($args[2]) ? $args[2] : '&hellip;';
        
        $size = 0;
        if (function_exists('mb_strlen')) $size = mb_strlen($text, 'UTF-8');
        else $size = strlen($text);
      
        if ($size > $number) {
            if (function_exists('mb_substr')) $text = mb_substr($text, 0, $number, 'UTF-8').$dotted;
            else $text = substr($text, 0, $number).$dotted;
        }
        return $text;
    }
}
?>