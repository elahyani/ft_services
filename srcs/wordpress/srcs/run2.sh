#!/bin/sh

echo -e "start nginx and php"
sleep 1
rc-service nginx start
rc-service php-fpm7 start

cat /dev/random > /dev/null