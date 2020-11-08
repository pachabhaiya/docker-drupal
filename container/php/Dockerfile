ARG PHP_TAG=7.4.12-fpm-buster

FROM php:${PHP_TAG}

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
