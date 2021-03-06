<?php
/**
 * Error class file.
 *
 * Если debug включен, то ошибки выводятся на экран.
 * Если debug выключен, то ошибки логгируются и выводиться страница ошибки
 * (обычно уже на production server). В этом случае используется расширение
 * logger, которое загрузиться автоматически.
 *
 * @author Dmitry Avseyenko <polsad@gmail.com>
 * @link http://weegbo.com/
 * @copyright Copyright &copy; 2008-2011 Inspirativ
 * @license http://weegbo.com/license/
 * @package system.base
 * @since 0.8
 */
class Error {
    /**
     * Display or write to log exception error.
     *
     * @access public
     * @param object $e exception
     * @return void
     */
    public static function exceptionHandler(&$e) {
        $trace = $e->getTrace();
        $traceIndex = $e->getTraceIndex();
        if (Config::get('debug/debug')) {
            echo "Error: {$e->getMessage()}.<br>
                  File:  {$trace[$traceIndex]['file']}<br>
                  Line:  {$trace[$traceIndex]['line']}<br>";
            echo '<pre>';
            print_r($trace);
            echo '</pre>';
        }
        else {
            $message = "Exception: {$e->getMessage()} in {$trace[$traceIndex]['file']} on line {$trace[$traceIndex]['line']}";
            self::writeError($message);
            self::displayErrorPage($e->getStatusCode());
        }
    }

    /**
     * Display or write to log code error (PHP error_handler).
     *
     * @access public
     * @param string $message error message
     * @param int $code error code
     * @param string $file error file
     * @param int $line error line
     * @return void
     */
    public static function errorHandler($message, $code, $file, $line) {
        $types = array(
            E_ERROR => "Error",
            E_WARNING => "Warning",
            E_PARSE => "Parsing Error",
            E_NOTICE => "Notice",
            E_CORE_ERROR => "Core Error",
            E_CORE_WARNING => "Core Warning",
            E_COMPILE_ERROR => "Compile Error",
            E_COMPILE_WARNING => "Compile Warning",
            E_USER_ERROR => "User Error",
            E_USER_WARNING => "User Warning",
            E_USER_NOTICE => "User Notice",
            E_STRICT => "Runtime Notice"
        );
        $message = "{$types[$code]} ({$code}) - {$message} in {$file} on line {$line}";
        if (Config::get('debug/debug')) {
            echo $message, '<br>';
        }
        else {
            self::writeError($message);
        }
    }

    /**
     * Display error page.
     *
     * @access public
     * @param int $error_number error number, can be 403, 404, 500, 503
     * @return void
     */
    public static function displayErrorPage($error) {
        $view = Registry::get('view');
        if (NULL == $view) {
            Loader::view();
            $view = Registry::get('view');
        }
        $messages = array(
            403 => 'Forbidden',
            404 => 'Not Found',
            500 => 'Internal Server Error',
            503 => 'Service Unavailable',
        );
        Header("HTTP/1.1 $error $messages[$error]");
        $view->display('error/error-'.$error.'.tpl');
    }

    /**
     * Write message to log file.
     *
     * @access private
     * @param string $message
     * @return void
     */
    private static function writeError($message) {
        if (file_exists(Config::get('debug/log'))) {
            $logger = Registry::get('logger');
            if (NULL == $logger) {
                Loader::extension('logger', NULL, Config::get('debug/log'));
                $logger = Registry::get('logger');
            }
            $logger->setMessage($message);
        }
    }
}
