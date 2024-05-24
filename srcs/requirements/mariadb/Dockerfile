FROM debian:bullseye

RUN apt update && apt upgrade -y && apt install -y \
    mariadb-server \
    mariadb-client
RUN apt clean

RUN mkdir -p /var/run/mysqld \
    && chown -R mysql:mysql /var/run/mysqld \
    && chmod 777 /var/run/mysqld

# EXPOSE 3306

COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d

COPY tools/start.sh .

CMD [ "./start.sh" ]
