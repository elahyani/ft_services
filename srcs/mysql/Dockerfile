FROM alpine:3.12.3

# VOLUME [ "sys/fs/cgroup" ]

RUN apk update

RUN apk search mariadb

RUN apk add openrc mariadb mariadb-client

RUN rc-status

RUN touch /run/openrc/softlevel

RUN mysql_install_db --user=mysql --datadir=/var/lib/mysql

ADD ./srcs/run.sh /usr/bin/run.sh

RUN chmod +x /usr/bin/run.sh

ENTRYPOINT /usr/bin/run.sh