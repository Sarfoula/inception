FROM debian:buster

RUN apt update -y && apt upgrade -y
RUN apt install php7.3 php7.3-fpm php7.3-mysql wget -y

RUN wget https://wordpress.org/wordpress-6.0.tar.gz -P /var/www
RUN cd /var/www && tar -xvf wordpress-6.0.tar.gz && rm wordpress-6.0.tar.gz

COPY conf/php.conf /etc/php/7.3/fpm/pool.d/www.conf
RUN mkdir -p /run/php/
RUN chown www-data:www-data /run/php/
RUN chmod 755 /run/php/

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar -P /usr/local/bin
RUN chmod +x /usr/local/bin/wp-cli.phar

COPY conf/init.sh /
RUN chmod +x /init.sh
ENTRYPOINT ["/init.sh"]
