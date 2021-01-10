#!/bin/bash

set -ex

docker build --build-arg PHP_TAG=7.4.14-fpm-buster -t docker-drupal/php:7.4.14-fpm-buster .
