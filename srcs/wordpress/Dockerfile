FROM alpine:3.12.3

RUN apk update && apk upgrade

RUN apk add nginx openrc

RUN rc-status

RUN touch /run/openrc/softlevel

RUN apk add php7 php7-fpm php7-common php7-iconv php7-json php7-gd php7-curl php7-xml php7-mysqli php7-imap php7-cgi fcgi php7-pdo php7-pdo_mysql php7-soap php7-xmlrpc php7-posix php7-mcrypt php7-gettext php7-ldap php7-ctype php7-dom php7-opcache php7-zlib

ADD ./test.php /var/www/localhost/htdocs/test.php

ADD  /srcs/run.sh /usr/bin/run.sh

RUN chmod +x /usr/bin/run.sh

CMD sh /usr/bin/run.sh
# ENTRYPOINT /usr/bin/run.sh
