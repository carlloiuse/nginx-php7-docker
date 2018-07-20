#!/bin/bash

# Creating php-fpm.sock
php-fpm7.0 -D

# Starting nginx
nginx -g 'daemon off;'
