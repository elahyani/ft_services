#!/bin/sh

# rc-service mariadb start
# mysql -u root -e "create user 'admin'@'localhost' identified by 'admin1234'" #creating user
# mysql -u root -e "create database wordpress" #creating wordpress database
# mysql -u root -e "grant all privileges on *.* to 'admin'@'localhost'" #granting all privileges for admin (user) on all databases
# mysql -u root -e "flush privileges" #saving the privileges for admin
# mysql -u root -e "quit" 

# rc-service mariadb restart
rc-service nginx start
rc-service php-fpm7 start
cat /dev/random > dev/null