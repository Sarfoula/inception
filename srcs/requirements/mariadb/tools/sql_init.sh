!/bin/bash

service mysql start
mysql -e "CREATE DATABASE IF NOT EXITS \`${SQL_DATABASE}`\"
mysql -e "CREATE USER IF NOT EXITS \`${SQL_USER}\`@`'localhost' IDENTIFIED BY `${SQL_PASSWORD}`;"
mysql -e "GRANT ALL PRIVILEGES ON \`${SQL_DATABASE}\`.* TO \`{SQL_USER}\`@'%' IDENTIFIED BY '${SQL_PASSWORD}';"
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASWWORD}';"
mysql -e "FLUSH PRIVILEGESl;"
mysqladmin -u root -p$SQL_ROOT_PASWWORD shutdown
exec mysql_safe
