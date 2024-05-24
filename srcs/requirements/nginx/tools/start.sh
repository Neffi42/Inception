#!/bin/bash

openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
       -out /etc/nginx/ssl/abasdere.crt \
       -keyout /etc/nginx/ssl/abasdere.key \
       -subj "/C=FR/ST=Paris/L=Paris/O=42 School/OU=abasdere/CN=abasdere/"

echo "
server {
    listen 443 ssl;
    listen [::]:443 ssl;

    #server_name www.$DOMAIN_NAME $DOMAIN_NAME;

    ssl_certificate $CERTS_;
    ssl_certificate_key /etc/ssl/private/nginx-selfsigned.key;" > /etc/nginx/sites-available/default


echo '
    ssl_protocols TLSv1.3;

    index index.php;
    root /var/www/html;

    location ~ [^/]\.php(/|$) {
            try_files $uri =404;
            fastcgi_pass wordpress:9000;
            include fastcgi_params;
            fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
        }
} ' >>  /etc/nginx/sites-available/default


nginx -g "daemon off;"
