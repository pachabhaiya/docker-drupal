FROM centos:7

RUN yum update -y
RUN yum install java wget unzip -y

# Download Solr 4.10.4.
RUN wget -P /opt https://archive.apache.org/dist/lucene/solr/4.10.4/solr-4.10.4.tgz

# Extract it, rename the directory to 'solr' and remove the archive.
RUN tar xzvf /opt/solr-4.10.4.tgz -C /opt && mv /opt/solr-4.10.4 /opt/solr && rm /opt/solr-4.10.4.tgz

# Create a backup of solr config files.
RUN cp /opt/solr/example/solr/collection1/conf/elevate.xml /opt/solr/example/solr/collection1/conf/elevate.xml.original
RUN cp /opt/solr/example/solr/collection1/conf/mapping-ISOLatin1Accent.txt /opt/solr/example/solr/collection1/conf/mapping-ISOLatin1Accent.txt.original
RUN cp /opt/solr/example/solr/collection1/conf/protwords.txt /opt/solr/example/solr/collection1/conf/protwords.txt.original
RUN cp /opt/solr/example/solr/collection1/conf/schema.xml /opt/solr/example/solr/collection1/conf/schema.xml.original
RUN cp /opt/solr/example/solr/collection1/conf/solrconfig.xml /opt/solr/example/solr/collection1/conf/solrconfig.xml.original
RUN cp /opt/solr/example/solr/collection1/conf/stopwords.txt /opt/solr/example/solr/collection1/conf/stopwords.txt.original
RUN cp /opt/solr/example/solr/collection1/conf/synonyms.txt /opt/solr/example/solr/collection1/conf/synonyms.txt.original

EXPOSE 8983

WORKDIR /opt/solr

ADD ./scripts /scripts
RUN chmod 755 /scripts/*

CMD ["/bin/bash", "/scripts/start.sh"]
