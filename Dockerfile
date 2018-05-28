FROM php:7.1-fpm

LABEL maintainer="gfx@karpiak.pl"

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash -

RUN apt-get update && apt-get install -y --no-install-recommends \
    nodejs \
    libicu-dev \
    libxml2-dev \
    git \
    unzip \
    nano \
&& apt-get clean \
&& rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
RUN docker-php-ext-install opcache intl pdo_mysql mbstring bcmath

RUN npm install apidoc -g && npm install apidoc-swagger -g

RUN export TERM=xterm
RUN echo 'alias ll="ls -la"' >> ~/.bashrc

WORKDIR /opt/app/
