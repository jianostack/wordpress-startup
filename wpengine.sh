#!/usr/bin/env bash

environment=$1
TEMPSTORAGE="/Users/user/Downloads"
UPLOADPATH="/Users/user/Sites/superlt-www/wp-content/uploads"

echo "\n\n"
echo "Let's push to WPengine."
echo "Have you run composer install?"
echo "\n"
echo "If pushing to WPengine results in an error you may need to --force: "
echo "git push production master --force"
echo "Let's start anyway ..."
echo "\n\n"
echo "renaming to wp-config-tmp.php"
mv "wp-config.php" "wp-config-tmp.php"
echo "moving uploads"
mv wp-content/uploads $TEMPSTORAGE

###
# Commit new structure into git, and push to remote.
###
git add wp-content/themes
git commit -am "WP Engine build from: $(git log -1 HEAD --pretty=format:%s)$(git rev-parse --short HEAD 2> /dev/null | sed "s/\(.*\)/@\1/")"

# echo "Pushing to WP Engine..."
if [ "$environment" == "staging" ]
then
  git push -f staging master
  git checkout master
elif [ "$environment" == "production" ]
then
  git push production master
  git checkout master
fi
echo "Successfully deployed."

echo "renaming to wp-config.php"
mv wp-config-tmp.php wp-config.php
echo "moving uploads back"
mv $TEMPSTORAGE/uploads $UPLOADPATH
echo "Done."
