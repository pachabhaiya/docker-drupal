FROM centos:7
LABEL maintainer.name="Chhabi Pachabhaiya" \
      maintainer.email="chhabi@pachabhaiya.com" \
      version="1.0" \
      description="PHP-FPM/Apache"

ARG DOCROOT_FOLDER
ENV DOCROOT_FOLDER=${DOCROOT_FOLDER}

# Update all packages
RUN yum update -y

# Install the EPEL repository
RUN yum install epel-release -y
# or,
# RUN yum install https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm -y

# Install Apache HTTP server
RUN yum install httpd -y

COPY conf/httpd.conf /etc/httpd/conf/
COPY conf/httpd-vhosts.conf.template /etc/httpd/conf.d/

RUN yum install gettext -y
RUN envsubst '$${DOCROOT_FOLDER}' < /etc/httpd/conf.d/httpd-vhosts.conf.template > /etc/httpd/conf.d/httpd-vhosts.conf

# Install remi repo for php 7
RUN yum install http://rpms.remirepo.net/enterprise/remi-release-7.rpm -y
RUN yum-config-manager --enable remi-php72

# Install php-fpm
RUN yum install php-fpm php-mysql php-pdo php-gd php-mbstring php-opcache php-xml -y

RUN mkdir /var/run/php-fpm
RUN chmod 755 /var/run/php-fpm

RUN cp /etc/httpd/conf.modules.d/00-mpm.conf /etc/httpd/conf.modules.d/00-mpm.conf.original
COPY conf/00-mpm.conf /etc/httpd/conf.modules.d/

COPY conf/php.conf /etc/httpd/conf.d/

RUN cp /etc/php-fpm.d/www.conf /etc/php-fpm.d/www.conf.original
COPY conf/www.conf /etc/php-fpm.d/

# Install additional packages
# Drush does not work if database server is not installed in web container
RUN yum install mariadb drush git wget -y

RUN wget -P /tmp https://github.com/drush-ops/drush/releases/download/8.1.16/drush.phar
RUN chmod a+x /tmp/drush.phar
RUN mv /tmp/drush.phar /usr/local/bin/drush

RUN yum install supervisor -y
COPY conf/supervisord.conf /etc/

WORKDIR ${DOCROOT_FOLDER}

EXPOSE 80

ADD ./scripts /scripts
RUN chmod 755 /scripts/*

CMD ["/bin/bash", "/scripts/start.sh"]
