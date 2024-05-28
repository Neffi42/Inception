FROM debian:bullseye

RUN apt update && apt upgrade -y && apt install -y \
    nginx \
    openssl
RUN apt clean

RUN rm -rf /etc/nginx/sites-enabled/default /etc/nginx/sites-available/default

COPY ./conf/abasdere.42.fr /etc/nginx/sites-available/abasdere.42.fr

RUN ln -s /etc/nginx/sites-available/abasdere.42.fr /etc/nginx/sites-enabled/abasdere.42.fr

RUN mkdir /etc/nginx/ssl
RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
       -out /etc/nginx/ssl/abasdere.42.fr.crt \
       -keyout /etc/nginx/ssl/abasdere.42.fr.key \
       -subj "/C=FR/ST=Paris/L=Paris/O=42 School/OU=abasdere.42.fr/CN=abasdere.42.fr/"

RUN ln -sf /dev/stdout /var/log/nginx/access.log \
    && ln -sf /dev/stderr /var/log/nginx/error.log

EXPOSE 443

CMD [ "nginx", "-g", "daemon off;" ]
