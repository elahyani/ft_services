#!/bin/sh

rc-service vsftpd restart

cat /dev/random > /dev/null
