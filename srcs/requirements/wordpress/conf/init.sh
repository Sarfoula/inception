#!/bin/bash

if ! test -f /var/www/wordpress/wp-config.php; then
    wp-cli.phar config create --allow-root --path='/var/www/wordpress' --dbname=${SQL_DATABASE} --dbuser=${SQL_USER} --dbpass=${SQL_PASSWORD} --dbhost=${SQL_HOST}
    wp-cli.phar core install --allow-root --path='var/www/wordpress' --url=yallo.42.fr --title=inception --admin_user=${WP_ROOTUSER} --admin_password=${WP_ROOTPASSWORD} --admin_email=${WP_EMAIL} --skip-email
    wp-cli.phar user create --allow-root --path='var/www/wordpress' ${WP_USER} ${WP_EMAIL} --user_pass=${WP_PASSWORD} --user_url=yallo.42.fr/user
fi

php-fpm7.3 --nodaemonize