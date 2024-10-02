FROM php:8.2-fpm

WORKDIR /var/www/html

RUN apt update && apt install -y git zip unzip libzip-dev libicu-dev libonig-dev nginx  \ 
     && docker-php-ext-install pdo_mysql intl zip 

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer
COPY nginx.conf /etc/nginx/conf.d/myapp.conf
RUN usermod -u 1000 www-data

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

EXPOSE 9000 80
CMD ["php-fpm"]
