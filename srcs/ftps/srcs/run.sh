#!/bin/sh

rc-service vsftpd restart

while true
do
	ftps=`rc-service nginx status | grep -c FAIL`

	if [ $Nginx -eq 1 ]
	then
		echo "Nginx has stopped!"
		echo "Restarting Nginx..."
		rc-service nginx restart
	else
		echo "Nginx is up!"
	fi
	sleep 2
done
