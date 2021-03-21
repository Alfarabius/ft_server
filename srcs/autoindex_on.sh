sed -i 's/autoindex off;/autoindex on;/' /etc/nginx/sites-available/default
service nginx restart
