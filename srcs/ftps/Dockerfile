FROM alpine:3.12.3

EXPOSE 21

RUN apk update
RUN apk add vsftpd openrc
RUN rc-status
RUN touch /run/openrc/softlevel
RUN rc-service vsftpd start

RUN printf "MA\nKH\nKH\nORG_NM\nVERV_NM\n_\nftserver@projetc.com\n" | openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/vsftpd.pem -out /etc/ssl/private/vsftpd.pem

ADD /srcs/vsftpd.conf /etc/vsftpd/vsftpd.conf
ADD /srcs/run.sh /usr/bin/run.sh
RUN chmod +x /usr/bin/run.sh

ENTRYPOINT /usr/bin/run.sh
