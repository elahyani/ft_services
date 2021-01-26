#!/bin/sh


rc-service telegraf start

/etc/init.d/mariadb setup
rc-service mariadb start
sleep 1

mysql -u root -e "create user 'admin'@'%' identified by 'admin1234'"
mysql -u root -e "create database wordpress"
mysql -u root -e "grant all privileges on *.* to 'admin'@'%'"
mysql -u root -e "flush privileges"
mysql -u root -e "quit"
rc-service mariadb stop
sleep 3

sed -i "s|.*skip-networking.*|#skip-networking|g" /etc/my.cnf.d/mariadb-server.cnf
rc-service mariadb start

while true
do
	if pgrep -x telegraf >/dev/null
	then
		echo "telegraf is up.."
	else
		echo "telegraf is down"
		echo "quitting..."
		exit 1
	fi
	if pgrep -x mariadb >/dev/null
		echo "mariadb is up.."
	else
		echo "mariadb is down"
		echo "Quitting..."
		exit 1
	fi
	sleep 2
done