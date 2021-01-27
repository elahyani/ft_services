#!/bin/sh

telegraf &

rc-service sshd restart
rc-service nginx start
sleep 2

while true
do
	if pgrep nginx >/dev/null 2>&1;
	then
		printf "Nginx is up.."
	else
		printf "Nginx is down\nExit..."
		exit 1
	fi
	if pgrep sshd >/dev/null 2>&1;
	then
		printf "Sshd is up.."
	else
		printf "Sshd is down\nExit..."
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