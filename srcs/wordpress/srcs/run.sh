#!/bin/sh

# echo "Starting MySQL service.."
rc-service mariadb start
# sleep 1

#creating user
mysql -u root -e "create user 'admin'@'localhost' identified by 'admin1234'"

#creating wordpress database
mysql -u root -e "create database wordpress"

#granting all privileges for admin (user) on all databases
mysql -u root -e "grant all privileges on *.* to 'admin'@'localhost'"

#saving the privileges for admin
mysql -u root -e "flush privileges"

mysql -u root -e "quit" 
rc-service mariadb stop 
rc-service mariadb start
sleep 2
cat /dev/random > dev/null

# echo -e "start nginx and php"
# sleep 1
# mysql -u root -e "SET PASSWORD FOR root@localhost = PASSWORD('root1234')"
# mysql -u root -e "grant all privileges on *.* to 'root'@'localhost'"
# mysql -u root -e "flush privileges"
# mysql -u root -e "quit"

# rc-service nginx start
# rc-service mariadb start
# rc-service php-fpm7 start

# cat /dev/random > /dev/null