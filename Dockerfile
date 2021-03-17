FROM debian:buster

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get -y install wget \
	nginx \
	mariadb-server \
	php7.3 \
    php-fpm \
    php-mysql \
    php-mbstring