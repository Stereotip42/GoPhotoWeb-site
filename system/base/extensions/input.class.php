<?php
/**
 * Weegbo InputExtension class file.
 *
 * @author Dmitry Avseyenko <polsad@gmail.com>
 * @package system.base.extensions
 * @copyright Copyright &copy; 2008-2011 Inspirativ
 * @license http://weegbo.com/license/
 * @since 0.8
 */
/**
 * InputExtension class
 *
 * Extension for process input data
 *
 * @author Dmitry Avseyenko <polsad@gmail.com>
 * @package system.base.extensions
 * @since 0.8
 */
class InputExtension {
    /**
     * @var array allowed tags
     */
    private $_tags = NULL;

    /**
     * Get data from $_POST and lead to the type.
     *
     * @access public
     * @param string $name key in $_POST array
     * @param string $type type 'int', 'string', 'float', 'bool', 'array'. Default - string
     * @param bool   $clean clean value or not
     * @param mixed  $res  default result
     * @return mixed
     */
    public function getData($name, $type = 'string', $res = NULL, $clean = false) {
        $value = isset($_POST[$name]) ? $_POST[$name] : $res;
        if ($value != $res) {
            settype($value, $type);
            if ($value == $res) {
                $value = $res;
            }
            elseif (true == $clean) {
                $value = $this->cleanText($value);
            }
        }
        return $value;
    }

    /**
     * If exist $_POST[$name] method return $true value, else $false value.
     *
     * @access public
     * @param string $name key in $_POST array
     * @param mixed $true
     * @param mixed $false
     * @return mixed
     */
    public function getDataEnum($name, $true = NULL, $false = NULL) {
        $value = isset($_POST[$name]) ? $true : $false;
        return $value;
    }

    /**
     * Clean text (strip tags, remove XSS)
     *
     * @access public
     * @param string $text source text
     * @param bool $autobr [option] if true - transforms the line break in <br>, default - false
     * @return stirng
     */
    public function cleanText($text, $autobr = false) {
        if ($text == '') {
            return $text;
        }
        $text = trim($text);
        if ('*' != $this->_tags) {
            $text = strip_tags($text, $this->_tags);
        }
        $text = $this->cleanXSS($text);
        if ($autobr == true) {
            $text = nl2br($text);
        }
        return $text;
    }

    /**
     * Remove XSS
     *
     * @access public
     * @param string $text source text
     * @return stirng
     */
    public function cleanXSS($text) {
        if ($text == '') {
            return $text;
        }
        $text = str_replace(array('&amp;amp;', '&amp;lt;', '&amp;gt;'), array('&amp;amp;amp;', '&amp;amp;lt;', '&amp;amp;gt;'), $text);
        $text = preg_replace('/(&amp;#*\w+)[\x00-\x20]+;/u', '$1;', $text);
        $text = preg_replace('/(&amp;#x*[0-9A-F]+);*/iu', '$1;', $text);
        $text = html_entity_decode($text, ENT_COMPAT, 'UTF-8');
        // Remove any attribute starting with "on" or xmlns
        $text = preg_replace('#(&lt;[^&gt;]+?[\x00-\x20"\'])(?:on|xmlns)[^&gt;]*+&gt;#iu', '$1&gt;', $text);
        // Remove javascript: and vbscript: protocols
        $text = preg_replace('#([a-z]*)[\x00-\x20]*=[\x00-\x20]*([`\'"]*)[\x00-\x20]*j[\x00-\x20]*a[\x00-\x20]*v[\x00-\x20]*a[\x00-\x20]*s[\x00-\x20]*c[\x00-\x20]*r[\x00-\x20]*i[\x00-\x20]*p[\x00-\x20]*t[\x00-\x20]*:#iu', '$1=$2nojavascript...', $text);
        $text = preg_replace('#([a-z]*)[\x00-\x20]*=([\'"]*)[\x00-\x20]*v[\x00-\x20]*b[\x00-\x20]*s[\x00-\x20]*c[\x00-\x20]*r[\x00-\x20]*i[\x00-\x20]*p[\x00-\x20]*t[\x00-\x20]*:#iu', '$1=$2novbscript...', $text);
        $text = preg_replace('#([a-z]*)[\x00-\x20]*=([\'"]*)[\x00-\x20]*-moz-binding[\x00-\x20]*:#u', '$1=$2nomozbinding...', $text);
        // Only works in IE: &lt;span style="width: expression (alert ('Ping!'));"&gt;&lt;/span&gt;
        $text = preg_replace('#(&lt;[^&gt;]+?) style[\x00-\x20]*=[\x00-\x20]*[`\'"]*.*?expression[\x00-\x20]*\([^&gt;]*+&gt;#i', '$1&gt;', $text);
        $text = preg_replace('#(&lt;[^&gt;]+?) style[\x00-\x20]*=[\x00-\x20]*[`\'"]*.*?behaviour[\x00-\x20]*\([^&gt;]*+&gt;#i', '$1&gt;', $text);
        $text = preg_replace('#(&lt;[^&gt;]+?) style[\x00-\x20]*=[\x00-\x20]*[`\'"]*.*?s[\x00-\x20]*c[\x00-\x20]*r[\x00-\x20]*i[\x00-\x20]*p[\x00-\x20]*t[\x00-\x20]*:*[^&gt;]*+&gt;#iu', '$1&gt;', $text);
        // Remove namespaced elements (we do not need them)
        $text = preg_replace('#&lt;/*\w+:\w[^&gt;]*+&gt;#i', '', $text);
        do {
            $old_text = $text;
            $text = preg_replace('#&lt;/*(?:applet|b (?:ase|gsound|link)|embed|frame (?:set)?|i (?:frame|layer)|l (?:ayer|ink)|meta|object|s (?:cript|tyle)|title|xml)[^&gt;]*+&gt;#i', '', $text);
        }
        while ($old_text !== $text);
        return $text;
    }
}
