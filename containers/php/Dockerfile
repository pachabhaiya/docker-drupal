ARG PHP_TAG=7.4.14-fpm-buster

FROM php:${PHP_TAG}

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
  libpng-dev \
  mariadb-client

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
# https://github.com/drush-ops/drush/blob/10.x/docs/install.md
RUN wget -O drush.phar https://github.com/drush-ops/drush-launcher/releases/latest/download/drush.phar \
  && chmod +x drush.phar \
  && mv drush.phar /usr/local/bin/drush

# Install Drupal Console Launcher
RUN curl https://drupalconsole.com/installer -L -o drupal.phar
RUN mv drupal.phar /usr/local/bin/drupal
RUN chmod a+x /usr/local/bin/drupal