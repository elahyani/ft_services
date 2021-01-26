#!/bin/sh

rc-service telegraf restart
rc-service nginx start
rc-service php-fpm7 start

while true
do
	if pgrep -x telegraf >/dev/null
	then
		echo "Telegraf is up.."
	else
		echo "Telegraf is down"
		echo "quitting..."
		exit 1
	fi
	if pgrep -x nginx >/dev/null
		echo "Nginx is up.."
	else
		echo "Nginx is down"
		echo "Quitting..."
		exit 1
	fi
	if pgrep -x php-fpm7 >/dev/null
		echo "PHP is up.."
	else
		echo "PHP is down"
		echo "Quitting..."
		exit 1
	fi
	sleep 2
done