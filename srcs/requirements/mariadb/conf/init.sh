#!/bin/bash

service mysql start

until mysqladmin -u root -p${SQL_ROOT_PASSWORD} ping --silent; do
    echo "waiting for database to start"
    sleep 2
done

mysql -u root -p${SQL_ROOT_PASSWORD} -e "CREATE DATABASE IF NOT EXISTS ${SQL_DATABASE};"
mysql -u root -p${SQL_ROOT_PASSWORD} -e "CREATE USER IF NOT EXISTS '${SQL_USER}'@'%' IDENTIFIED BY '${SQL_PASSWORD}';"
mysql -u root -p${SQL_ROOT_PASSWORD} -e "GRANT ALL PRIVILEGES ON ${SQL_DATABASE}.* TO '${SQL_USER}'@'%';"

sleep 2
mysql -u root -p${SQL_ROOT_PASSWORD} -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';"
mysql -u root -p${SQL_ROOT_PASSWORD} -e "FLUSH PRIVILEGES;"

mysqladmin -u root -p${SQL_ROOT_PASSWORD} shutdown

exec mysqld_safe