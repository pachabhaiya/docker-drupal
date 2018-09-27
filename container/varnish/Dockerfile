FROM centos:7
LABEL maintainer.name="Chhabi Pachabhaiya" \
      maintainer.email="chhabi@pachabhaiya.com" \
      version="1.0" \
      description="Varnish 4"

# Update all packages
RUN yum update -y

# Install the EPEL repository
RUN yum install epel-release -y
# or,
# RUN yum install https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm -y

# Add yum repo for varnish 4
# https://packagecloud.io/varnishcache/varnish41/install#manual-rpm
COPY conf/varnishcache_varnish41.repo /etc/yum.repos.d/

# Install pygpgme, a package which allows yum to handle gpg signatures, and
# a package called yum-utils which contains the tools you need for installing source RPMs.
RUN yum install pygpgme yum-utils -y

# Flush local yum cache
RUN yum clean all -y

# Install varnish
RUN yum install varnish -y

RUN cp /etc/varnish/varnish.params /etc/varnish/varnish.params.original
RUN cp /etc/varnish/default.vcl /etc/varnish/default.vcl.original

EXPOSE 80

CMD ["/usr/sbin/varnishd", "-F", "-f", "/etc/varnish/default.vcl"]
