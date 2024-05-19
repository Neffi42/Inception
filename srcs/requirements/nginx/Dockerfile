FROM debian:bullseye
RUN apt update -y && apt upgrade -y
RUN apt install nginx openssl -y
RUN apt clean
RUN mkdir -p /etc/nginx/ssl
RUN mkdir -p /var/run/nginx
RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=abasdere.42.fr/UID=abasdere"
COPY conf/nginx.conf /etc/nginx/nginx.conf
RUN chmod 755 /var/www/html
RUN chown -R www-data:www-data /var/www/html
CMD [ "nginx", "-g", "daemon off;" ]
