FROM alpine:3.12.3

EXPOSE 5000

# install nginx
RUN apk update && apk upgrade
RUN apk add --no-cache bash openrc nginx
RUN rc-status
RUN touch /run/openrc/softlevel

# install telegraf
RUN echo "http://nl.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories
RUN apk add telegraf

# add user
RUN adduser -D -g 'www' www
RUN mkdir /www
RUN chown -R www:www /var/lib/nginx
RUN chown -R www:www /www

# install php
RUN apk add php7-fpm php7-mcrypt php7-soap php7-openssl php7-gmp php7-pdo_odbc php7-json \
	php7-dom php7-pdo php7-zip php7-mysqli php7-sqlite3 php7-apcu php7-pdo_pgsql php7-bcmath \
	php7-gd php7-odbc php7-pdo_mysql php7-pdo_sqlite php7-gettext php7-xmlreader php7-xmlrpc \
	php7-bz2 php7-iconv php7-pdo_dblib php7-curl php7-ctype php7-session php7-mbstring \
	php7 php7-opcache php7-zlib

# install mysql
# RUN apk add mariadb mariadb-client
# RUN mysql_install_db --user=mysql --datadir=/var/lib/mysql

# install PhpMyAdmin
RUN wget http://files.directadmin.com/services/all/phpMyAdmin/phpMyAdmin-5.0.2-all-languages.tar.gz
RUN tar zxvf phpMyAdmin-5.0.2-all-languages.tar.gz
RUN rm phpMyAdmin-5.0.2-all-languages.tar.gz
RUN mv phpMyAdmin-5.0.2-all-languages /www/phpmyadmin
RUN mkdir /www/phpmyadmin/tmp
RUN chmod -R 777 /www/phpmyadmin/tmp

# add configuration files
RUN mv /etc/nginx/nginx.conf /etc/nginx/nginx.conf.orig
ADD srcs/nginx.conf /etc/nginx/nginx.conf
ADD srcs/config.inc.php /www/phpmyadmin/config.inc.php
ADD /srcs/telegraf.conf /etc/telegraf.conf
ADD /srcs/run.sh /usr/bin/run.sh
RUN chmod +x /usr/bin/run.sh

ENTRYPOINT /usr/bin/run.sh