FROM centos:7

RUN yum update -y
RUN yum install java wget unzip -y

# Download Solr 4.10.4.
RUN wget -P /opt https://archive.apache.org/dist/lucene/solr/4.10.4/solr-4.10.4.tgz

# Extract it, rename the directory to 'solr' and remove the archive.
RUN tar xzvf /opt/solr-4.10.4.tgz -C /opt && mv /opt/solr-4.10.4 /opt/solr && rm /opt/solr-4.10.4.tgz

EXPOSE 8983

WORKDIR /opt/solr

ADD ./scripts /scripts
RUN chmod 755 /scripts/*

CMD ["/bin/bash", "/scripts/start.sh"]
