FROM wordpress:php7.0-apache
RUN apt-get update && \
    apt-get install -y \
        zlib1g-dev
RUN docker-php-ext-install zip
ADD uploads.ini /usr/local/etc/php/conf.d/uploads.ini
ADD opcache-recommended.ini /usr/local/etc/php/conf.d/opcache-recommended.ini

RUN set -xe \
        && cd /tmp \
        && curl -L https://github.com/Whissi/realpath_turbo/releases/download/v2.0.0/realpath_turbo-2.0.0.tar.bz2 > realpath_turbo-2.0.0.tar.bz2  \
        && tar -vxf realpath_turbo-2.0.0.tar.bz2 \
        && cd realpath_turbo-2.0.0 \
        && phpize \
        && ./configure \
        && make \
        && make test NO_INTERACTION=1 \
        && make install

ADD start.sh /start.sh
ADD tests.sh /tests.sh
ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["/start.sh"]