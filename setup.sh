#!/bin/bash

minikube stop # tmp
minikube delete # tmp
minikube start --vm-driver=virtualbox
eval $(minikube docker-env)
minikube addons enable metallb

kubectl apply -f srcs/metallb/metallb.yaml

docker build -t nginx_image srcs/nginx
kubectl apply -f srcs/nginx/nginx.yaml

docker build -t mysql_image srcs/mysql
kubectl apply -f srcs/mysql/mysql.yaml

docker build -t phpmyadmin_image srcs/phpmyadmin
kubectl apply -f srcs/phpmyadmin/phpmyadmin.yaml
