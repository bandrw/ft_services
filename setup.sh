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

# MySQL
docker build -t mysql_image srcs/mysql
kubectl apply -f srcs/mysql/mysql.yaml

# PhpMyAdmin
docker build -t phpmyadmin_image srcs/phpmyadmin
kubectl apply -f srcs/phpmyadmin/phpmyadmin.yaml

# WordPress
docker build -t wordpress_image srcs/wordpress
kubectl apply -f srcs/wordpress/wordpress.yaml

# Nginx
docker build -t nginx_image srcs/nginx
kubectl apply -f srcs/nginx/nginx.yaml

# FTPS
docker build -t ftps_image srcs/ftps
kubectl apply -f srcs/ftps/ftps.yaml

# InfluxDB
docker build -t influxdb_image srcs/influxdb
kubectl apply -f srcs/influxdb/influxdb.yaml

# Grafana
docker build -t grafana_image srcs/grafana
kubectl apply -f srcs/grafana/grafana.yaml
