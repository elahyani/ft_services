#!/bin/sh


rc-service influxdb start
sleep 2
influx -execute "CREATE USER admin WITH PASSWORD 'admin1234' WITH ALL PRIVILEGES"
sleep 1
influx -execute "CREATE DATABASE influxdb"
sleep 1
influx -execute "grant ALL on influxdb to admin" 
sleep 2
rc-service influxdb restart
sleep 2

telegraf &

sleep 2

while true
do
	if pgrep influxdb >/dev/null 2>&1;
	then
		printf "Influxdb is up.."
	else
		printf "Influxdb is down\nExit..."
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