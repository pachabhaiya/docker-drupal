# Docker for Drupal

Local Development Environment for Drupal/React.

| Container | Description |
| :-------- | :---------- |
| php       |             |
| nginx     |             |
| db        |             |
| adminer   |             |
| node      |             |

---

## 1. Clone [`docker-drupal`](https://github.com/pachabhaiya/docker-drupal) repository

```bash
$ git clone --branch debian https://github.com/pachabhaiya/docker-drupal.git
$ cd docker-drupal
```

## 2. Create environment variables for your project

```bash
$ cp .env.example .env
```

Change the value of environment variables as needed.

## 3. Start Docker containers

```bash
# Create and start containers.
# -d = Detached mode (runs in background)
# --build = Build images before starting containers
$ docker-compose up -d --build

# Create and start the containers in background mode
# --build is not needed if the containers are already built.
$ docker-compose up -d

# List all running containers.
$ docker container ls
```

## 4. Test page

https://www.drupal.local

---

## Xdebug configuration for VS Code

```json
{
  "version": "0.2.0",
  "configurations": [
    {
      "name": "Listen for XDebug",
      "type": "php",
      "request": "launch",
      "port": 9000,
      "log": true,
      "pathMappings": {
        "/var/www/drupal-site/web": "${workspaceFolder}/www/drupal-site/web"
      }
    }
  ]
}
```

## Import database

1. Copy the db dump file (e.g., `db-dump.sql.gz`) to ./data/tmp folder.

2. Run this command to import the sql dump file to database

   ```bash
   $ docker-compose exec db sh -c "gunzip < /tmp/db-dump.sql.gz | mysql -u drupaluser -p drupal_db"
   ```

3. Verify the imported database tables

   ```bash
   $ docker-compose exec db sh -c "mysql -u drupaluser -p drupal_db"
   Enter password: pa55w0Rd

   MariaDB [drupal_db]> show databases;

   MariaDB [drupal_db]> use drupal_db
   Database changed

   MariaDB [drupal_db]> show tables;
   ```

## Export database

Using mysqldmp

```bash
$ docker-compose exec db sh -c "mysqldump -u drupaluser -p drupal_db > /tmp/export.sql"
```

Using Drush

```bash
$ docker-compose exec php sh -c "drush sql-dump | gzip -9 > /tmp/export.sql.gz"
```

Using Drupal Console

```bash
$ docker-compose exec php sh -c "drupal dbdu --gz --file=/tmp/export.sql.gz"
```

## Bash helpers

```bash
$ source ./scripts/bash-helpers.sh

# docker-compose up -d --build
$ dcup

# docker-compose down
$ dcdown

# Drush
$ dcdrush cr

# Drupal Console
$ dcdrupal cr
```
