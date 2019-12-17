FROM kreator/docker-php:7.2-fpm

LABEL maintainer="gfx@karpiak.pl"

RUN apt-get update && apt-get install -y --no-install-recommends \
    libicu-dev \
    libxml2-dev \
    gnupg \
&& apt-get clean \
&& rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
&& docker-php-ext-install intl pdo_mysql mbstring bcmath

WORKDIR /opt/app/
