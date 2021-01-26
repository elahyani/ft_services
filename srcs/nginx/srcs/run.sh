#!/bin/sh

rc-service telegraf start
rc-service nginx start

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
	if pgrep -x nginx >/dev/null
		echo "nginx is up.."
	else
		echo "nginx is down"
		echo "Quitting..."
		exit 1
	fi
	sleep 2
done