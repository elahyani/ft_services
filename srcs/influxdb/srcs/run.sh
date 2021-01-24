#!/bin/sh

rc-service telegraf start

rc-service influxdb start
influx -execute "CREATE USER admin WITH PASSWORD 'admin1234' WITH ALL PRIVILEGES"
influx -username admin -password 'admin1234' -execute "CREATE DATABASE services"
influx -username admin -password 'admin1234' -execute "grant ALL on services to admin"

rc-service influxdb restart
#cat /dev/random > /dev/null
