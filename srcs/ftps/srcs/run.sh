#!/bin/sh

rc-service vsftpd restart

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
	if pgrep -x vsftpsd >/dev/null
		echo "vsftpsd is up.."
	else
		echo "vsftpsd is down"
		echo "Quitting..."
		exit 1
	fi
	sleep 2
done