FROM debian:bullseye

RUN apt update && apt upgrade -y && apt install -y \
    php7.4 \
    php-fpm \
    php-mysql \
    wget \
    sendmail
RUN apt clean

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && chmod +x wp-cli.phar \
    && mv wp-cli.phar /usr/local/bin/wp

COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d

RUN mkdir /run/php

COPY ./tools/start.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/start.sh

EXPOSE 9000

CMD [ "/usr/local/bin/start.sh" ]
