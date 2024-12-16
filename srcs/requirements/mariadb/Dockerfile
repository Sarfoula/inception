FROM debian:buster

RUN apt update -y && apt upgrade -y

RUN apt install mariadb-server procps -y

COPY conf/my.cnf /etc/mysql/my.cnf

COPY /conf/init.sh /
RUN chmod +x /init.sh
ENTRYPOINT ["/init.sh"]