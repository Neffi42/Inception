#!/bin/bash

mkdir -p /var/run/mysqld && chown -R mysql:mysql /var/run/mysqld && chmod 777 /var/run/mysqld

service mysql start

echo "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE ;" > init.sql
echo "CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD' ;" >> init.sql
echo "GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%' ;" >> init.sql
echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '12345' ;" >> init.sql
echo "FLUSH PRIVILEGES;" >> init.sql

mysql < init.sql

kill $(cat /var/run/mysqld/mysqld.pid)

mysqld
