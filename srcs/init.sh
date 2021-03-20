openssl req -newkey rsa:2048 -x509 -days 365 -nodes -out /etc/nginx/ssl/nginx-selfsigned.crt -keyout /etc/nginx/ssl/nginx-selfsigned.key -subj "/C=RU/ST=TATARSTAN/L=KAZAN/O=xxx/OU=School21/CN=mrosie"
service nginx start
service mysql start
service php7.3-fpm start

echo "CREATE DATABASE wordpress;"| mysql -u root --skip-password
echo "GRANT ALL PRIVILEGES ON wordpress.* TO 'root'@'localhost' WITH GRANT OPTION;"| mysql -u root --skip-password
echo "FLUSH PRIVILEGES;"| mysql -u root --skip-password
echo "update mysql.user set plugin='' where user='root';"| mysql -u root --skip-password

bash
