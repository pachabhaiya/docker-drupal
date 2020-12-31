ARG PHP_TAG=7.4.12-fpm-buster

FROM php:${PHP_TAG}

ARG DRUSH_VERSION=10.3.6
# ENV DRUSH_VERSION=${DRUSH_VERSION}

ENV PHP_OPCACHE_VALIDATE_TIMESTAMPS="0" \
  PHP_OPCACHE_MAX_ACCELERATED_FILES="10000" \
  PHP_OPCACHE_MEMORY_CONSUMPTION="192" \
  PHP_OPCACHE_MAX_WASTED_PERCENTAGE="10"

RUN apt update \
  && apt upgrade -y \
  && apt autoremove -y \
  && apt install -y \
  curl \
  git \
  wget \
  vim \
  zip \
  unzip \
  libfreetype6-dev \
  libjpeg62-turbo-dev \
  libpng-dev

RUN docker-php-ext-configure gd --with-freetype --with-jpeg \
  && docker-php-ext-install -j$(nproc) \
  gd \
  # opcache \
  mysqli \
  pdo_mysql

RUN pecl install xdebug
RUN docker-php-ext-enable xdebug
COPY conf.d/docker-php-ext-xdebug.ini /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini

# COPY conf.d/opcache.ini /usr/local/etc/php/conf.d/opcache.ini

# Composer
# RUN wget -O composer-setup.php https://getcomposer.org/installer \
#   && php composer-setup.php --install-dir=/usr/local/bin --filename=composer
RUN wget -P /usr/local/bin https://getcomposer.org/download/1.8.4/composer.phar
RUN chmod a+x /usr/local/bin/composer.phar
RUN ln -s /usr/local/bin/composer.phar /usr/local/bin/composer

# Drush
RUN git clone https://github.com/drush-ops/drush.git /usr/local/src/drush \
  && cd /usr/local/src/drush \
  && git checkout ${DRUSH_VERSION} \
  && ln -s /usr/local/src/drush/drush /usr/bin/drush \
  && composer install \
  && drush --version