# WordPress startup

## Start up

```
composer install
ln -s /full/source/path/wp-content /full/link/path/wordpress
```

Valet link composer generated wordpress directory

`valet link`

## Distribution

`npm run build`

`scp -r wp-content/uploads user@ip-address:/path-to/wp-content/uploads`

Add WPengine's [remote git servers](https://wpengine.com/git/).

`git push staging master`

## wp-config.php

```
define('FS_METHOD', 'direct');
define( 'DISALLOW_FILE_EDIT', true );
```
