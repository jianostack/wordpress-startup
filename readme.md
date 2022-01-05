# WordPress startup

## Localhost

```
brew install wp-cli
composer install
wp core download --skip-content
wp theme install twentytwentyone
cp wp-config-sample.php wp-config.php
```

## WPengine deployment

`npm run build`

`scp -r wp-content/uploads user@ip-address:/path-to/wp-content/uploads`

Add WPengine's [remote git servers](https://wpengine.com/git/).

`git push staging master`

## wp-config.php

```
define('FS_METHOD', 'direct');
define( 'DISALLOW_FILE_EDIT', true );
```
