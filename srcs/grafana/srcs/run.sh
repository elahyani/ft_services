#!/bin/sh

# /usr/bin/telegraf --config /etc/telegraf.conf
rc-service telegraf start
/usr/sbin/grafana-server --config /usr/share/grafana/conf/defaults.ini  --homepath /usr/share/grafana/

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
	if pgrep -x grafana-server >/dev/null
		echo "grafana is up.."
	else
		echo "grafana is down"
		echo "Quitting..."
		exit 1
	fi
	sleep 2
done