FROM debian:bullseye

RUN apt update && apt upgrade -y && apt install -y \
    nginx \
    openssl
RUN apt clean

COPY ./tools/start.sh .

CMD [ "./start.sh" ]
