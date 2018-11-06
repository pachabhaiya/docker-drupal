# Docker for Drupal

Local Development Environment for Drupal 7/8 site using Docker.

| Container | Description |
| :--- | :--- |
| web | PHP-FPM 5.6/7.2 and Apache 2.4<br />Base Image = CentOS 7 |
| db | MariaDB 5/10 - Official repository |
| adminer | Adminer - Official repository |
| varnish | Varnish 4.1<br />Base Image = CentOS 7 |
| nginx | SSL termination proxy |
| solr | Apache Solr 4.10.4 |

---

## 1. Clone [`drupal-drupal`](https://github.com/pachabhaiya/docker-drupal) repository
```bash
$ git clone https://github.com/pachabhaiya/docker-drupal.git
$ cd docker-drupal
```

## 2. Create environment variables for your project

```bash
$ cp .env.default .env
```

Change the value of environment variables as needed.
```
MYSQL_DATABASE=drupal_db
MYSQL_USER=drupaluser
MYSQL_PASSWORD=pa55w0Rd

PHP_VERSION=7.2
MARIADB_VERSION=10
SOLR_VERSION=4

DOCROOT_FOLDER=/var/www/html
SERVER_NAME=www.drupal.local
```

Supported PHP versions: 5.6 and 7.2

Supported MariaDB versions: 5 and 10

## 3. Start Docker containers

```bash
# Create and start containers.
# -d = Detached mode (run in background)
# --build = Build images before starting containers
$ docker-compose up -d --build

# Create and start the containers in background mode
# --build is not needed if the containers are already built.
$ docker-compose up -d

# List all running containers.
$ docker container ls
```

## 4. Test page

http://www.drupal.local

https://www.drupal.local

## 5. Stop Docker containers

```bash
$ docker-compose down
```
