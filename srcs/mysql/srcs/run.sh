#!/bin/sh

/etc/init.d/mariadb setup
/etc/init.d/mariadb start
echo "CREATE DATABASE wordpress;" | mysql
echo "GRANT ALL ON *.* TO 'kfriese'@'%' IDENTIFIED BY 'kfriese' WITH GRANT OPTION; FLUSH PRIVILEGES;" | mysql
mysql wordpress < /var/srcs/wordpress.sql
/etc/init.d/mariadb stop

/usr/bin/mysqld_safe
