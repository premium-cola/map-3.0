<?php
use Phalcon\Di\FactoryDefault\Cli as CliDI,
    Phalcon\Cli\Console as ConsoleApp,
    Phalcon\Db\Adapter\Pdo\Mysql as DbAdapter;

error_reporting(E_ALL);
ini_set('display_errors', '1');

/**
 * include external dependencies
 */
require_once __DIR__ . '/../vendor/autoload.php';

define('VERSION', '1.0.0');

// Using the CLI factory default services container
$di = new Phalcon\Di\FactoryDefault\Cli();

// Define path to application directory
defined('APPLICATION_PATH')
|| define('APPLICATION_PATH', realpath(dirname(__FILE__)));

/**
 * Register the autoloader and tell it to register the tasks directory
 */
$loader = new \Phalcon\Loader();
$loader->registerDirs([
    APPLICATION_PATH . '/tasks',
    APPLICATION_PATH . '/controllers',
    APPLICATION_PATH . '/models'
])->register();

// Load the configuration file (if any)
if (is_readable(APPLICATION_PATH . '/config/config.php')) {
    $config = include APPLICATION_PATH . '/config/config.php';
    $di->set('config', $config);
    
    $di->set('db', function () use ($config) {
        return new DbAdapter($config->database->toArray());
    });
}


// Create a console application
$console = new ConsoleApp();
$console->setDI($di);

/**
 * Process the console arguments
 */
$arguments = array();
foreach ($argv as $k => $arg) {
    if ($k == 1) {
        $arguments['task'] = $arg;
    } elseif ($k == 2) {
        $arguments['action'] = $arg;
    } elseif ($k >= 3) {
        $arguments['params'][] = $arg;
    }
}

// Define global constants for the current task and action
define('CURRENT_TASK',   (isset($argv[1]) ? $argv[1] : null));
define('CURRENT_ACTION', (isset($argv[2]) ? $argv[2] : null));

try {
    // Handle incoming arguments
    $console->handle($arguments);
} catch (\Phalcon\Exception $e) {
    echo $e->getMessage();
    exit(255);
}