#!/bin/sh

# /usr/bin/telegraf --config /etc/telegraf.conf
telegraf &

cd /usr/share/grafana/

grafana-server &
sleep 2

while true
do
	if pgrep telegraf >/dev/null 2>&1;
	then
		printf "telegraf is up.."
	else
		printf "telegraf is down\nExit..."
		exit 1
	fi
	if pgrep grafana-server >/dev/null 2>&1;
	then
		printf "grafana is up.."
	else
		printf "grafana is down\nExit..."
		exit 1
	fi
	sleep 2
done

exit 0