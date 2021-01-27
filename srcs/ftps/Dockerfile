FROM alpine:3.12.3

EXPOSE 21
VOLUME [ "sys/fs/cgroup" ]

RUN apk update
RUN apk add vsftpd
RUN apk add openrc openssl openssh
RUN rc-status
RUN touch /run/openrc/softlevel

RUN echo "http://nl.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories
RUN apk add telegraf

RUN printf "MA\nKH\nKH\nORG_NM\nVERV_NM\n_\nftserver@projetc.com\n" | openssl req -x509 -nodes -days 365 \
	-newkey rsa:2048 -keyout /etc/ssl/private/vsftpd.pem -out /etc/ssl/private/vsftpd.pem

RUN adduser -D admin && echo "admin:12341234" | chpasswd
RUN ssh-keygen -A

RUN mkdir /etc/telegraf
ADD /srcs/telegraf.conf /etc/telegraf/telegraf.conf
ADD srcs/vsftpd.conf /etc/vsftpd/vsftpd.conf
ADD srcs/run.sh /usr/bin/run.sh
RUN chmod +x /usr/bin/run.sh

ENTRYPOINT /usr/bin/run.sh
