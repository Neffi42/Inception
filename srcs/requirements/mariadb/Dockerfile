FROM debian:bullseye

RUN apt update && apt upgrade -y && apt install -y \
    mariadb-server
RUN apt clean

COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d
COPY tools/start.sh .

CMD [ "./start.sh" ]
