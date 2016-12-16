#!/bin/bash

php_version=php-5.6.28

if [ ! -z "${fpm_port}" ];then
    sed -i "s/^listen = .*/listen = 0.0.0.0:${fpm_port}/g" /usr/local/${php_version}/etc/php-fpm.conf
fi

/usr/local/${fpm_port}/sbin/php-fpm -F 
