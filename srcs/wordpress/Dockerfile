FROM alpine:3.12.3

EXPOSE 5000

# install nginx
RUN apk update && apk upgrade
RUN apk add --no-cache bash openrc nginx
RUN rc-status
RUN touch /run/openrc/softlevel

# add user
RUN adduser -D -g 'www' www
RUN mkdir /www
RUN chown -R www:www /var/lib/nginx
RUN chown -R www:www /www

# install php
RUN apk add php7 php7-fpm php7-common php7-iconv php7-json php7-gd php7-curl \ 
	php7-xml php7-mysqli php7-imap php7-cgi fcgi php7-pdo php7-pdo_mysql php7-soap \
	php7-mbstring php7-xmlrpc php7-posix php7-mcrypt php7-gettext php7-ldap php7-ctype \
	php7-dom php7-opcache php7-zlib php7-session php7-intl php7-zip

# install mysql
RUN apk add mariadb mariadb-client
RUN mysql_install_db --user=mysql --datadir=/var/lib/mysql

# install PhpMyAdmin
# RUN wget http://files.directadmin.com/services/all/phpMyAdmin/phpMyAdmin-5.0.2-all-languages.tar.gz
# RUN tar zxvf phpMyAdmin-5.0.2-all-languages.tar.gz
# RUN rm phpMyAdmin-5.0.2-all-languages.tar.gz
# RUN mv phpMyAdmin-5.0.2-all-languages /www/phpmyadmin
# RUN mkdir /www/phpmyadmin/tmp
# RUN chmod -R 777 /www/phpmyadmin/tmp

# install wordpress
RUN wget https://wordpress.org/latest.tar.gz
# RUN mkdir /www/wordpress
RUN tar xzf latest.tar.gz
RUN rm latest.tar.gz
RUN mv wordpress /www/wordpress
# RUN cp /www/wordpress/wp-config{-sample,}.php
RUN mkdir /www/wordpress/tmp
RUN chown -R 777 /www/wordpress/tmp
# RUN ln -s /wordpress /var/www/localhost/htdocs/wordpress


# add configuration files
RUN mv /etc/nginx/nginx.conf /etc/nginx/nginx.conf.orig
ADD srcs/nginx.conf /etc/nginx/nginx.conf
ADD srcs/index.html /www/index.html
# ADD srcs/config.inc.php /www/phpmyadmin/config.inc.php
ADD /srcs/wp-config.php /www/wordpress/wp-config.php
ADD /srcs/run.sh /usr/bin/run.sh
RUN chmod +x /usr/bin/run.sh

ENTRYPOINT sh /usr/bin/run.sh