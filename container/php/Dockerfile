ARG PHP_TAG=7.4.12-fpm-buster

FROM php:${PHP_TAG}

RUN apt update \
  && apt upgrade -y \
  && apt autoremove -y \
  && apt install -y \
    curl \
    git \
    wget \
    vim
