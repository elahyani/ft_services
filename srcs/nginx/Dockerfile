FROM alpine:3.12.3

EXPOSE 80
EXPOSE 443
EXPOSE 22

RUN apk update && apk upgrade && apk add --no-cache bash openrc nginx openssl openssh
RUN rc-status
RUN touch /run/openrc/softlevel

# install telegraf
RUN echo "http://nl.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories
RUN apk add telegraf

RUN adduser -D -g 'www' www
RUN mkdir /www

RUN chown -R www:www /var/lib/nginx
RUN chown -R www:www /www

RUN mv /etc/nginx/nginx.conf /etc/nginx/nginx.conf.orig

ADD srcs/nginx.conf /etc/nginx/nginx.conf
ADD srcs/index.html /www/index.html

RUN /etc/init.d/sshd start
RUN adduser -D elahyani
RUN echo "elahyani:admin1234" | chpasswd
RUN ssh-keygen -A

ADD /srcs/telegraf.conf /etc/telegraf.conf
ADD srcs/run.sh /usr/bin/run.sh
RUN chmod +x /usr/bin/run.sh

RUN printf "MA\nKH\nKH\nORG_NM\nVERV_NM\n_\nftserver@projetc.com\n" | openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt
ENTRYPOINT /usr/bin/run.sh