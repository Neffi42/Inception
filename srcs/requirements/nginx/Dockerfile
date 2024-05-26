FROM debian:bullseye

RUN apt update && apt upgrade -y && apt install -y \
    nginx
    # \
    # openssl
RUN apt clean

COPY ./conf/nginx.conf /etc/nginx/sites-available/default

CMD [ "nginx", "-g", "daemon off;" ]
