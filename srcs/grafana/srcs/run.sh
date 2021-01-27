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
		printf "Telegraf is up.."
	else
		printf "Telegraf is down\nExit..."
		exit 1
	fi
	if pgrep grafana-server >/dev/null 2>&1;
	then
		printf "Grafana is up.."
	else
		printf "Grafana is down\nExit..."
		exit 1
	fi
	sleep 2
done

exit 0