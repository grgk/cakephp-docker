FROM php:7.2-fpm

LABEL maintainer="gfx@karpiak.pl"

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN apt-get update && apt-get install -y --no-install-recommends \
    libicu-dev \
    libxml2-dev \
    gnupg \
    git \
    unzip \
    nano \
&& apt-get clean \
&& rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
&& docker-php-ext-install opcache intl pdo_mysql mbstring bcmath

RUN curl -sL https://deb.nodesource.com/setup_10.x | bash - \
&& apt-get install -y nodejs \
&& apt-get clean \
&& rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
&& npm install apidoc -g \
&& npm install apidoc-swagger -g

RUN yes | pecl install xdebug \
    && echo "zend_extension=$(find /usr/local/lib/php/extensions/ -name xdebug.so)" > /usr/local/etc/php/conf.d/xdebug.ini \
    && echo "xdebug.remote_enable=on" >> /usr/local/etc/php/conf.d/xdebug.ini \
    && echo "xdebug.remote_autostart=off" >> /usr/local/etc/php/conf.d/xdebug.ini \
    && echo "xdebug.remote_connect_back=On" >> /usr/local/etc/php/conf.d/xdebug.ini

RUN export TERM=xterm \
&& echo 'alias ll="ls -la"' >> ~/.bashrc

WORKDIR /opt/app/
