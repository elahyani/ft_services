#!/bin/sh

rc-service telegraf start

rc-service influxdb start
influx -execute "CREATE USER admin WITH PASSWORD 'admin1234' WITH ALL PRIVILEGES"
influx -username admin -password 'admin1234' -execute "CREATE DATABASE services"
influx -username admin -password 'admin1234' -execute "grant ALL on services to admin"

rc-service influxdb restart

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
	if pgrep -x influxdb >/dev/null
		echo "influxdb is up.."
	else
		echo "influxdb is down"
		echo "Quitting..."
		exit 1
	fi
	sleep 2
done
