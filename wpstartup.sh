#! /bin/bash

mv wp-content/ tmp-wp-content/
mv composer.json tmp-composer.json
mv wp-config.php tmp-wp-config.php
cp -a wordpress/. .
rm -rf wp-content
mv tmp-wp-content/ wp-content/
rm -rf wordpress/
mv tmp-composer.json composer.json
mv tmp-wp-config.php wp-config.php
cd wp-content/themes/superleague 
composer install
cd ../../../
