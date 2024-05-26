FROM debian:bullseye

RUN apt update && apt upgrade -y && apt install -y \
    php7.4 \
    php-fpm \
    php-mysql \
    curl
RUN apt clean

COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d

RUN mkdir /run/php

COPY ./tools/start.sh /
RUN chmod +x /start.sh

EXPOSE 9000

CMD [ "/start.sh" ]
