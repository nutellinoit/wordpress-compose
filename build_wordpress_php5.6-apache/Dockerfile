FROM wordpress:php5.6-apache
RUN apt-get update && \
    apt-get install -y \
        zlib1g-dev
RUN docker-php-ext-install zip
ADD php.conf.uploads.ini /usr/local/etc/php/conf.d/uploads.ini
ADD start.sh /start.sh
ADD tests.sh /tests.sh
ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["/start.sh"]