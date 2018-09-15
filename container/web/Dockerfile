FROM centos:7
LABEL maintainer.name="Chhabi Pachabhaiya" \
      maintainer.email="chhabi@pachabhaiya.com" \
      version="1.0" \
      description="PHP-FPM/Apache"

RUN yum update -y
RUN yum install https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm -y
RUN yum install http://rpms.remirepo.net/enterprise/remi-release-7.rpm -y
RUN yum install yum-utils -y

RUN yum install httpd -y
COPY conf/httpd.conf /etc/httpd/conf/
COPY conf/httpd-vhosts.conf /etc/httpd/conf.d/

RUN yum-config-manager --enable remi-php72
RUN yum install php-fpm -y
RUN mkdir /var/run/php-fpm
RUN chmod 755 /var/run/php-fpm

RUN yum install supervisor -y
COPY conf/supervisord.conf /etc/

WORKDIR /var/www/html

EXPOSE 80

ADD ./scripts /scripts
RUN chmod 755 /scripts/*

CMD ["/bin/bash", "/scripts/start.sh"]
