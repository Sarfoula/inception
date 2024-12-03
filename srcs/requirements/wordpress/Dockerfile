FROM debian:buster

RUN apt update -y && apt upgrade -y

RUN apt install -y wget

RUN apt install -y php7.3 php-fpm php-mysql mariadb-client

COPY conf/php.conf /etc/php/7.3/fpm/php-fpm.conf

RUN wget https://wordpress.org/wordpress-6.0.tar.gz -P /var/www

RUN cd /var/www && tar -xvf wordpress-6.0.tar.gz && rm wordpress-6.0.tar.gz

RUN chown -R root:root /var/www/wordpress

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

RUN chmod +x wp-cli.phar

RUN mv wp-cli.phar /usr/local/bin/wp

