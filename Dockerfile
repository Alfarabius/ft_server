FROM debian:buster

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get -y install wget \
	nginx \
	mariadb-server \
	php7.3 \
	php-fpm \
	php-xml \
	php-mysql

COPY /srcs/init.sh ./
WORKDIR /var/www/html/

RUN mkdir /etc/nginx/ssl/
COPY /srcs/my_nginx.conf /etc/nginx/sites-available/default
EXPOSE 80 443

RUN wget https://files.phpmyadmin.net/phpMyAdmin/5.0.1/phpMyAdmin-5.0.1-english.tar.gz
RUN tar -xf phpMyAdmin-5.0.1-english.tar.gz && rm -rf phpMyAdmin-5.0.1-english.tar.gz
RUN mv phpMyAdmin-5.0.1-english phpmyadmin
COPY ./srcs/config.inc.php phpmyadmin

RUN wget https://wordpress.org/latest.tar.gz
RUN tar -xvzf latest.tar.gz && rm -rf latest.tar.gz
COPY ./srcs/wp-config.php /var/www/html

COPY /srcs/autoindex_off.sh ./
COPY /srcs/autoindex_on.sh ./

RUN chown -R www-data:www-data *
RUN chmod -R 755 /var/www/*


CMD bash ~/../init.sh
