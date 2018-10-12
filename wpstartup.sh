#! /bin/bash

composer install
mv wp-content tmp-wp-content
mv composer.json tmp-composer.json
mv wp-config.php tmp-wp-config.php

