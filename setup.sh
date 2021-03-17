#!/bin/bash

minikube stop # tmp
minikube delete # tmp
minikube start --vm-driver=virtualbox
eval $(minikube docker-env)
minikube addons enable metallb

# MetalLB
kubectl apply -f srcs/metallb/metallb.yaml

# Volume
kubectl apply -f srcs/volume/volume.yaml

# Nginx
docker build -t nginx_image srcs/nginx
kubectl apply -f srcs/nginx/nginx.yaml

# MySQL
docker build -t mysql_image srcs/mysql
kubectl apply -f srcs/mysql/mysql.yaml

# PhpMyAdmin
docker build -t phpmyadmin_image srcs/phpmyadmin
kubectl apply -f srcs/phpmyadmin/phpmyadmin.yaml

# WordPress
docker build -t wordpress_image srcs/wordpress
kubectl apply -f srcs/wordpress/wordpress.yaml
