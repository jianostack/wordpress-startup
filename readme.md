# WordPress startup

## Start script

`sh wpstartup.sh`

## Create base theme

https://underscores.me/

## Development 

`gulp`

## Distribution

`gulp dist`

Add WPengine's [remote git servers](https://wpengine.com/git/). 

In wpengine.sh change TEMPSTORAGE and UPLOADPATH.

`sh wpengine.sh <environment> <branch>`

## wp-config.php

```
define( 'WP_HOME', 'http://localhost:8000' );
define( 'WP_SITEURL', 'http://localhost:8000' );
```
