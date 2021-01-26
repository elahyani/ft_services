FROM alpine:3.12.3

EXPOSE 3000

RUN apk update
RUN apk add openrc
RUN rc-status
RUN touch /run/openrc/softevel

RUN echo "http://nl.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories
RUN apk add telegraf grafana

ADD /srcs/telegraf.conf /etc/telegraf.conf
ADD /srcs/run.sh /usr/bin/run.sh

ENTRYPOINT /usr/bin/run.sh