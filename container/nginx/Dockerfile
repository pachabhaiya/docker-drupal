FROM nginx:latest

ARG SERVER_NAME
ENV SERVER_NAME=${SERVER_NAME}

ARG DOCROOT
ENV DOCROOT=${DOCROOT}

# RUN apt-get update -y

# RUN apt-get install openssl -y

# RUN cp /usr/lib/ssl/openssl.cnf /usr/lib/ssl/openssl.cnf.original
# RUN printf "[SAN]\nsubjectAltName=DNS:${SERVER_NAME}" >> /usr/lib/ssl/openssl.cnf

# # Create self-signed SSL certificate.
# RUN openssl req \
#   -newkey rsa:2048 \
#   -x509 \
#   -nodes \
#   -keyout /etc/ssl/private/${SERVER_NAME}.key \
#   -new \
#   -out /etc/ssl/certs/${SERVER_NAME}.crt \
#   -subj /CN=${SERVER_NAME} \
#   -reqexts SAN \
#   -extensions SAN \
#   -sha256 \
#   -days 3650

# Make a copy of original configuration files.
RUN cp /etc/nginx/conf.d/default.conf /etc/nginx/conf.d/default.conf.original
RUN cp /etc/nginx/nginx.conf /etc/nginx/nginx.conf.original

# Copy configuration files from host to container.
COPY conf/default.conf.template /etc/nginx/conf.d/

# Substitute environment variables.
# RUN envsubst < "/etc/nginx/conf.d/nginx.conf.template" > "/etc/nginx/conf.d/default.conf"
RUN envsubst '$${SERVER_NAME} $${DOCROOT}' < /etc/nginx/conf.d/default.conf.template > /etc/nginx/conf.d/default.conf


# https://geekflare.com/php-fpm-optimization/
