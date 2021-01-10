# Docker PHP Container

```bash
# Build image
$ ./scripts/build.sh
or,
$ docker build --build-arg PHP_TAG=7.4.14-fpm-buster -t docker-drupal/php:7.4.14-fpm-buster .
```

```bash
$ docker run -it docker-drupal/php:7.4.14-fpm-buster bash
```
