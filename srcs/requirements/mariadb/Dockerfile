FROM debian:buster

RUN apt update -y && apt upgrade -y

RUN apt install mariadb-server -y

COPY conf/mariadb.conf /etc/mysql/mariadb.conf/50-server.conf
