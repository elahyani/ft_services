#!/bin/sh

telegraf &

rc-service vsftpd restart
sleep 2

while true
do
	if pgrep vsftpsd >/dev/null 2>&1;
	then
		printf "Vsftpsd is up.."
	else
		printf "Vsftpsd is down\nExit..."
		exit 1
	fi
	if pgrep telegraf >/dev/null 2>&1;
	then
		printf "Telegraf is up.."
	else
		printf "Telegraf is down\nExit..."
		exit 1
	fi
	sleep 2
done

exit 0