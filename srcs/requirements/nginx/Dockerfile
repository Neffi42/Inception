FROM alpine:3.18
RUN apk update && apk upgrade --no-cache
RUN apk add nginx openssl vim -y --no-cache
RUN mkdir -p /etc/nginx/ssl
RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=abasdere.42.fr/UID=abasdere" 
RUN mkdir -p /var/run/nginx
COPY conf/nginx.conf /etc/nginx/nginx.conf
