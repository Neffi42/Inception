FROM debian:bullseye

RUN apt update && apt upgrade -y && apt install -y \
    php-fpm \
    php-mysqli \
    curl
RUN apt clean

COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d

COPY ./tools/start.sh /
RUN chmod +x /start.sh

ENTRYPOINT [ "/start.sh" ]
