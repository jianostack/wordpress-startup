#!/usr/bin/env bash

environment=$1
user=$user
project=$repository
echo "\n"
echo "Let's push to WPengine."
echo "Have you run composer install?"
echo "If pushing to WPengine results in an error you may need to --force: "
echo "git push production master --force"
echo "Let's start anyway ..."
mv "wp-config.php" "wp-config-tmp.php"
echo "renamed to wp-config-tmp.php"
mv "wp-content/uploads" "/Users/$user/Downloads/"
echo "moved uploads back"

###
# Commit new structure into git, and push to remote.
###
git add wp-content/themes
git commit -am "WP Engine build from: $(git log -1 HEAD --pretty=format:%s)$(git rev-parse --short HEAD 2> /dev/null | sed "s/\(.*\)/@\1/")"

# echo "Pushing to WP Engine..."
if [ "$environment" == "staging" ]
then
  git push staging master
  git checkout master
elif [ "$environment" == "production" ]
then
  git push production master
  git checkout master
fi
echo "Successfully deployed."

mv "wp-config-tmp.php" "wp-config.php"
echo "renamed to wp-config.php"
mv "/Users/$user/Downloads/uploads" "/Users/user/Sites/$repository/wp-content/uploads"
echo "moved uploads back"