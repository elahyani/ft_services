#!/bin/sh

echo "Starting Nginx.."
rc-service nginx start
echo "Starting sshd Service.."
rc-service sshd restart

# cat /dev/random > /dev/null

while true
do
	Nginx=`rc-service nginx status | grep -c FAIL`
	Sshd=`rc-service sshd status | grep -c FAIL`

	if [ $Nginx -eq 1 ]
	then
		echo "Nginx has stopped!"
		echo "Restarting Nginx..."
		rc-service nginx restart
	else
		echo "Nginx is up!"
	fi
	if [ $Sshd -eq 1 ]
	then
		echo "sshd has stopped!"
		echo "Restarting sshd..."
		rc-service sshd restart
	else
		echo "sshd is up!"
	fi
	sleep 10
done

exit