#!/usr/bin/env bash

environment=$1
echo "\n"
echo "Let's push to WPengine."
echo "Have you run composer install?"
echo "If pushing to WPengine results in an error you may need to --force: "
echo "git push production master --force"
echo "Let's start anyway ..."

###
# Commit new structure into git, and push to remote.
###
git add wp-content/themes
git commit -m "WP Engine build"

# echo "Pushing to WP Engine..."
if [ "$environment" == "staging" ]
then
  git push staging master
elif [ "$environment" == "production" ]
then
  git push production master
fi
echo "Successfully deployed."