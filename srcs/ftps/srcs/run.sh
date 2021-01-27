#!/bin/sh

telegraf &

rc-service vsftpd start
sleep 2

while true
do
	if pgrep [vsftpd] >/dev/null 2>&1;
	then
		printf "Vsftpd is up.."
	else
		printf "Vsftpd is down\nExit..."
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