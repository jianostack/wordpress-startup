# WPengine startup kit

## Development 
`composer install`

`npm i`

`gulp`

`sh wpstartup.sh`

## wp-config.php

```
define( 'WP_HOME', 'http://localhost:8000' );
define( 'WP_SITEURL', 'http://localhost:8000' );
```

## Distribution
`gulp dist`

Add WPengine's [remote git servers](https://wpengine.com/git/). 

In wpengine.sh change TEMPSTORAGE and UPLOADPATH.

`sh wpengine.sh <environment> <branch>`
