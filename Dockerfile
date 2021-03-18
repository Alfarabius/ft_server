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

RUN mkdir /etc/nginx/ssl/
COPY /srcs/init.sh ./
COPY /srcs/my_nginx.conf /etc/nginx/sites-available/default
RUN chmod 775 ./init.sh
EXPOSE 80 443
CMD sh ./init.sh
