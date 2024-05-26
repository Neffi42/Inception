#!/bin/bash

cd /var/www/html

if [ -f ./wp-config.php ]
then
	echo "WordPress already downloaded"
else
    wp core download --allow-root
    wp config create --allow-root \
        --dbhost=$MYSQL_HOSTNAME \
        --dbname=$MYSQL_DATABASE \
        --dbuser=$MYSQL_USER \
        --dbpass=$MYSQL_PASSWORD
    wp core install --allow-root \
        --url=https://www.$DOMAIN_NAME \
        --title=$WP_TITLE \
        --admin_user=$WP_ADMIN_USR \
        --admin_password=$WP_ADMIN_PWD \
        --admin_email=$WP_ADMIN_EMAIL \
        --skip-email
fi

php-fpm7.4 -F
