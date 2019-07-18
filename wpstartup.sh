#! /bin/bash

composer install
npm i
mv wp-content tmp-wp-content
mv composer.json tmp-composer.json
cp -a wordpress/. .
rm -rf wp-content
mv tmp-wp-content wp-content
mv tmp-composer.json composer.json
mv tmp-wp-config.php wp-config.php
