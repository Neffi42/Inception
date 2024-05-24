FROM debian:bullseye

RUN apt update && apt upgrade -y && apt install -y \
    nginx \
    openssl
RUN apt clean

RUN mkdir /etc/nginx/ssl
RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
       -out /etc/nginx/ssl/abasdere.crt \
       -keyout /etc/nginx/ssl/abasdere.key \
       -subj "/C=FR/ST=Paris/L=Paris/O=42 School/OU=abasdere/CN=abasdere/"

COPY conf/nginx.conf /etc/nginx/sites-available

RUN mkdir -p /run/nginx

CMD [ "nginx", "-g", "daemon off;" ]
