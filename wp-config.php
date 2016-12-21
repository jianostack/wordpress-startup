<?php
// Detect URL to load proper configuration settings
switch ($_SERVER['HTTP_HOST']) {
    case 'project.localhost':
        define('ENVIRONMENT', 'dev');
        break;
    default:
        define('ENVIRONMENT', 'production');
        break;
}

// staging
// WPengine has it's own wp-config

// production
// WPengine has it's own wp-config

// localhost
$config['dev']['db_name'] = '';
$config['dev']['db_user'] = '';
$config['dev']['db_password'] = '';
$config['dev']['db_host'] = '';

define('DB_NAME', $config[ENVIRONMENT]['db_name']);
define('DB_USER', $config[ENVIRONMENT]['db_user']);
define('DB_PASSWORD', $config[ENVIRONMENT]['db_password']);
define('DB_HOST', $config[ENVIRONMENT]['db_host']);
define('DB_CHARSET', 'utf8');
define('DB_COLLATE', '');

if (!defined('WP_SITEURL')) {
  define('WP_SITEURL', 'http://' . $_SERVER['SERVER_NAME']);
}
if (!defined('WP_HOME')) {
  define('WP_HOME',    'http://' . $_SERVER['SERVER_NAME']);
}
// if (!defined('WP_CONTENT_URL')) {
//   define('WP_CONTENT_URL', 'http://' . $_SERVER['SERVER_NAME'] . '/content');
// }
