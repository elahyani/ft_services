#!/bin/sh

rc-service mariadb start
rc-service nginx start
rc-service php-fpm7 start

cat /dev/random > dev/null