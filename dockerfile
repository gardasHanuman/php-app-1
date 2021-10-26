From php:7.0-apache
RUN docker-php-ext-install mysqli && docker-php-ext-enable mysqli
RUN apt-get update && apt-get upgrade -y
run apt-get install vim -y
copy index.php /var/www/html
expose 80