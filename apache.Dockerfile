FROM ubuntu:16.04

# Install Apache 2
RUN apt-get update && apt-get install apache2 -y

# Disable Apache default site
RUN a2dissite 000-default

# Set up config file for routing to auth & data services
RUN cp proxy-host.conf /etc/apache2/sites-available

# Enable apache modules
RUN a2enmod proxy
RUN a2enmod proxy_http
RUN a2enmod rewrite

# Enable our site
RUN a2ensite proxy-host

EXPOSE 80