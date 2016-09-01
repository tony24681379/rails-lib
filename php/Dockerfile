FROM php:7.0-apache
RUN docker-php-ext-install mysqli

COPY NTHU_lib_app/ /var/www/html/
RUN cd /var/www/html/ && chmod 777 * -R