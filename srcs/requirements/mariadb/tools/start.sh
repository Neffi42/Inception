#!/bin/bash

echo "CREATE DATABASE IF NOT EXISTS ${MYSQL_DATABASE};" > /etc/mysql/init.sql
echo "CREATE USER IF NOT EXISTS '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';" >> /etc/mysql/init.sql
echo "GRANT ALL PRIVILEGES ON *.* TO '${MYSQL_USER}'@'%' WITH GRANT OPTION;" >> /etc/mysql/init.sql
echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';"
echo "FLUSH PRIVILEGES;" >> /etc/mysql/init.sql

mysqld
