#!/bin/sh

cp -r /var/srcs/test_webpage/* /var/www/

nginx -g 'daemon off;'
