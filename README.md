# Docker for Drupal

Local Development Environment for Drupal 7/8 site using Docker.

| Container | Description                                               |
| :-------- | :-------------------------------------------------------- |
| web       | PHP-FPM 5.6/7.2 and Apache 2.4<br />Base Image = CentOS 7 |
| db        | MariaDB 5/10 - Official repository                        |
| adminer   | Adminer - Official repository                             |
| varnish   | Varnish 4.1<br />Base Image = CentOS 7                    |
| nginx     | SSL termination proxy                                     |
| solr      | Apache Solr 4.10.4                                        |

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

WEB_PORT=8080
VARNISH_PORT=80
NGINX_PORT=443
DB_PORT=3306
ADMINER_PORT=8888
SOLR_PORT=8983

WEB_CONTAINER_NAME=web
VARNISH_CONTAINER_NAME=varnish
NGINX_CONTAINER_NAME=nginx
DB_CONTAINER_NAME=db
ADMINER_CONTAINER_NAME=adminer
SOLR_CONTAINER_NAME=solr

SERVER_NAME=www.drupal.local

# Project folder name.
PROJECT_FOLDER_NAME=my-drupal-site

# Path to Drupal code base relative to './www' folder.
DOCROOT_PATH=my-drupal-site/web

# Path to working directory relative to './www' folder.
WORKDIR=my-drupal-site
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

# XDebug

```json
{
  // Use IntelliSense to learn about possible attributes.
  // Hover to view descriptions of existing attributes.
  // For more information, visit: https://go.microsoft.com/fwlink/?linkid=830387
  "version": "0.2.0",
  "configurations": [
    {
      "name": "Listen for XDebug",
      "type": "php",
      "request": "launch",
      //   "port": 9000,
      "log": true,
      "pathMappings": {
        "/var/www/my-drupal-site/web": "${workspaceFolder}/www/my-drupal-site/web"
      }
    }
  ]
}
```

```bash
$ docker cp db-dump/filmykhabar_local_db-20200913-2.sql.gz docker-filmykhabar_db_1:/tmp
$ docker exec -it docker-filmykhabar_db_1 sh -c "gunzip < /tmp/filmykhabar_local_db-20200913-2.sql.gz | mysql -u drupaluser -p filmykhabar_db"
```
