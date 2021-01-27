#!/bin/sh


telegraf &

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
sleep 2

while true
do
	if pgrep mysql >/dev/null 2>&1
	then
		printf "Mariadb is up.."
	else
		printf "Mariadb is down\nExit..."
		exit 1
	fi
	if pgrep telegraf >/dev/null 2>&1
	then
		printf "Telegraf is up.."
	else
		printf "Telegraf is down\nExit..."
		exit 1
	fi
	sleep 2
done

exit 0