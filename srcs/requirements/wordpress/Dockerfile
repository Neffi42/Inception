FROM debian:bullseye
RUN apt update -y && apt upgrade -y
RUN apt install wget php7.4  php-fpm php-mysql mariadb-client -y
RUN apt clean -y
RUN wget https://wordpress.org/wordpress-6.5.3.tar.gz -P /var/www
RUN cd /var/www && tar -xvf wordpress-6.5.3.tar.gz && rm wordpress-6.5.3.tar.gz && cd /
RUN chown -R root:root /var/www/wordpress
RUN echo "listen=wordpress:9000" >> /etc/php/7.4/cli/php.ini
RUN echo "clear_env = no" >> /etc/php/7.4/cli/php.ini
