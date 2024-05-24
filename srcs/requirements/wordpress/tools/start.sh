#!/bin/bash

mkdir -p /var/www/html /run/php

cd /var/www/html

if [ -f ./wp-config.php ]
then
	echo "wordpress already downloaded"
else
    curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
        && chmod +x wp-cli.phar \
        && mv wp-cli.phar /usr/local/bin/wp

    wp core download --allow-root

    mv /var/www/html/wp-config-sample.php /var/www/html/wp-config.php

    sed -i -r "s/username_here/$MYSQL_USER/g" wp-config-sample.php
    sed -i -r "s/password_here/$MYSQL_PASSWORD/g" wp-config-sample.php
    sed -i -r "s/localhost/$MYSQL_HOSTNAME/g" wp-config-sample.php
    sed -i -r "s/database_name_here/$MYSQL_DATABASE/g" wp-config-sample.php
    mv wp-config-sample.php wp-config.php


    wp core install --url=$DOMAIN_NAME/ \
        --title=$WP_TITLE \
        --admin_user=$WP_ADMIN_USR \
        --admin_password=$WP_ADMIN_PWD \
        --admin_email=$WP_ADMIN_EMAIL \
        --skip-email \
        --allow-root

    wp user create $WP_USR $WP_EMAIL --role=author --user_pass=$WP_PWD --allow-root

fi

php-fpm7.4 -F
