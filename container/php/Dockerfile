ARG PHP_TAG=7.4.12-fpm-buster

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
    # needed for composer
    wget \
    vim \
    zip \
    unzip \
    # https://stackoverflow.com/questions/61228386/installing-gd-extension-in-docker
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    libpng-dev

RUN docker-php-ext-configure gd --with-freetype --with-jpeg \
  && docker-php-ext-install -j$(nproc) \
    gd \
    opcache

# https://www.scalingphpbook.com/blog/2014/02/14/best-zend-opcache-settings.html
# https://laravel-news.com/php-opcache-docker
COPY conf.d/opcache.ini /usr/local/etc/php/conf.d/opcache.ini



# RUN docker-php-ext-install \
#     mysqli \
#     pdo_mysql \
#     gd \
#     mbstring \
#     xsl \
#     opcache \
#     calendar \
#     intl \
#     exif \
#     ftp \
#     bcmath \
#     zip

# Install composer.
RUN wget -O composer-setup.php https://getcomposer.org/installer \
  && php composer-setup.php --install-dir=/usr/local/bin --filename=composer
