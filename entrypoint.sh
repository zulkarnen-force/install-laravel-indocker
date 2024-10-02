#!/bin/bash

set -e

appname="myapp"
project_dir="/var/www/html/$appname"

if [ ! -d "$project_dir" ]; then
    echo "Installing Laravel in $project_dir ..."
    cd /var/www/html
    composer create-project laravel/laravel $appname
    cd $appname
    php artisan key:generate
    chmod -R 777 storage/ bootstrap/cache/
    chmod 777 database/database.sqlite
fi

php-fpm -D
nginx -g 'daemon off;'


