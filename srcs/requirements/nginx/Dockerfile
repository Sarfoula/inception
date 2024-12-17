FROM debian:buster

RUN apt update -y && apt upgrade -y
RUN apt install nginx openssl -y

RUN mkdir -p /etc/nginx/ssl
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key \
    -subj "/C=FR/ST=ARA/L=Lyon/O=42/OU=42/CN=yallo.42.fr/UID=yallo"

COPY conf/nginx.conf /etc/nginx/sites-available/default

ENTRYPOINT ["nginx", "-g", "daemon off;"]
