FROM ubuntu:16.04
MAINTAINER Carl Isip <carl.loiuse@gmail.com>

ADD default /etc/nginx/sites-enabled/default
ADD run.sh /run.sh

RUN apt-get update && \
    apt-get install -y nginx php7* && \
    mkdir -p /run/php && \
    echo "clear_env = no" >> /etc/php/7.0/fpm/pool.d/www.conf && \
    echo "display_errors = On" >> /etc/php/7.0/fpm/php.ini && \
    echo "display_startup_errors = On" >> /etc/php/7.0/fpm/php.ini && \
    chmod +x /run.sh

VOLUME ["/var/www/html"]

EXPOSE 80

ENTRYPOINT ["/run.sh"]
