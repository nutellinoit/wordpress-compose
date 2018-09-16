FROM wordpress:php7.0-apache
RUN apt-get update && \
    apt-get install -y \
        zlib1g-dev
RUN docker-php-ext-install zip
ADD uploads.ini /usr/local/etc/php/conf.d/uploads.ini
ADD opcache-recommended.ini /usr/local/etc/php/conf.d/opcache-recommended.ini
ADD start.sh /start.sh
ADD tests.sh /tests.sh
ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["/start.sh"]