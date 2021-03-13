#!/bin/bash

minikube stop # tmp
minikube delete # tmp
minikube start --vm-driver=virtualbox
eval $(minikube docker-env)
minikube addons enable metallb

docker build -t nginx_image srcs/nginx
docker build -t mysql_image srcs/mysql

kubectl apply -f srcs/metallb/metallb.yaml

kubectl apply -f srcs/nginx/nginx.yaml
kubectl apply -f srcs/mysql/mysql.yaml
