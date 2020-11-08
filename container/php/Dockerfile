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
    vim

# Install composer.
RUN wget -O composer-setup.php https://getcomposer.org/installer \
  && php composer-setup.php --install-dir=/usr/local/bin --filename=composer
