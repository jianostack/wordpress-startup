#! /bin/bash

composer install
npm i
mv composer.json tmp-composer.json
cp -a wordpress/. .
mv tmp-composer.json composer.json
cp wp-config-sample.php wp-config.php
