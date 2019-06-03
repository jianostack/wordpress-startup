# WordPress startup

## Start script

`sh wpstartup.sh`

## Base theme

https://underscores.me/

## Distribution

`npm run build`

`scp -r wp-content/uploads user@ip-address:/path-to/wp-content/uploads`

Add WPengine's [remote git servers](https://wpengine.com/git/).

In wpengine.sh change TEMPSTORAGE and UPLOADPATH.

`sh wpengine.sh <environment> <branch>`

## wp-config.php

```
define( 'WP_HOME', 'http://localhost:8000' );
define( 'WP_SITEURL', 'http://localhost:8000' );
define('FS_METHOD', 'direct');
```
