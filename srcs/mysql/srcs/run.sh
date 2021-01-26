#!/bin/sh

# echo "Starting MySQL service.."
# rc-service mariadb start
# sleep 1

# #creating user
# mysql -u root -e "create user 'admin'@'%' identified by 'admin1234'"

# #creating wordpress database
# mysql -u root -e "create database wordpress"

# #granting all privileges for admin (user) on all databases
# mysql -u root -e "grant all privileges on *.* to 'admin'@'%'"

# #saving the privileges for admin
# mysql -u root -e "flush privileges"

# mysql -u root -e "quit"
# rc-service mariadb restart

/etc/init.d/mariadb setup 
rc-service mariadb start
mysql -u root -e "create user '${MYSQL_ROOT_USERNAME}'@'%' identified by '${MYSQL_ROOT_PASSWORD}'" 
mysql -u root -e "create database wordpress"
mysql -u root -e "grant all privileges on *.* to '${MYSQL_ROOT_USERNAME}'@'%'"
mysql -u root -e "flush privileges"
mysql -u root -e "exit"
rc-service mariadb stop
sleep 3
sed -i "s|.*skip-networking.*|#skip-networking|g" /etc/my.cnf.d/mariadb-server.cnf
rc-service mariadb start

cat /dev/random > dev/null