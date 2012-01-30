<?php
/**
 * Weegbo MessageHelper class file.
 *
 * @author Dmitry Avseyenko <polsad@gmail.com>
 * @package system.base.helpers
 * @copyright Copyright &copy; 2008-2011 Inspirativ
 * @license http://weegbo.com/license/
 * @since 0.8
 */

require_once(PATH_BASE.'helper.class.php');

/**
 * MessageHelper class
 *
 * Helper for output message in templater
 *
 * @author Dmitry Avseyenko <polsad@gmail.com>
 * @package system.base.helpers
 * @since 0.8
 */
class MessageHelper extends Helper {
    /**
     * @var array helper arguments
     */
    private $_messages = NULL;

    public function execute($args = array()) {
        $key  = isset($args[0]) ? $args[0] : NULL;
        $file = isset($args[1]) ? $args[1] : NULL;
        if ($file !== NULL) {
            $this->_messages = require(PATH_APP."messages/".APP_LANG."/{$file}.php");
        }
        if ($key != NULL && $this->_messages != NULL && isset($this->_messages[$key])) {
            return $this->_messages[$key];
        }
        return NULL;
    }
}
