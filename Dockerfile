FROM php:7.1.3-fpm-alpine

RUN apk add --no-cache --virtual .phpize-deps $PHPIZE_DEPS && \
    apk add --no-cache --repository http://dl-2.alpinelinux.org/alpine/edge/main icu-dev git && \
    docker-php-ext-install bcmath intl opcache pdo_mysql && \
    pecl install xdebug && \
    apk del .phpize-deps

COPY entrypoint.sh install-composer.sh /usr/local/bin/
COPY www.conf /usr/local/etc/php-fpm.d/
COPY php.ini $PHP_INI_DIR/
COPY override.ini $PHP_INI_DIR/conf.d/

ENTRYPOINT ["entrypoint.sh"]
