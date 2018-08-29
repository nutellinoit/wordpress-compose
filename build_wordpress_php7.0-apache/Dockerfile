FROM wordpress:php7.0-apache
RUN apt-get update && \
    apt-get install -y \
        zlib1g-dev
RUN docker-php-ext-install zip
ADD php.conf.uploads.ini /usr/local/etc/php/conf.d/uploads.ini
#Install APC php opcode caching
RUN yes '' |  pecl install -f apcu-5.1.6
RUN docker-php-ext-enable apcu

ADD start.sh /start.sh
ADD tests.sh /tests.sh
ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["/start.sh"]