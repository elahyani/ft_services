FROM alpine:3.12.3

EXPOSE 8086
VOLUME [ "sys/fs/cgroup" ]

RUN apk update
RUN apk add openrc
RUN rc-status
RUN touch /run/openrc/softlevel
RUN echo "http://nl.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories
RUN apk add telegraf
RUN mkdir /etc/telegraf

RUN apk add influxdb

ADD /srcs/telegraf.conf /etc/telegraf/telegraf.conf
ADD /srcs/influxdb.conf /etc/influxdb.conf
ADD /srcs/run.sh /usr/bin/run.sh
RUN chmod +x /usr/bin/run.sh

ENTRYPOINT /usr/bin/run.sh
