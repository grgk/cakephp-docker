FROM kreator/docker-php:7.4-fpm-alpine

LABEL maintainer="gfx@karpiak.pl"

RUN apk --update add --no-cache \
    icu-dev \
    oniguruma-dev \
&& docker-php-ext-install intl pdo_mysql mbstring bcmath

WORKDIR /opt/app/
