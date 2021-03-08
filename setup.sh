#!/bin/sh

minikube stop # tmp
minikube delete # tmp
minikube start --vm-driver=virtualbox
eval $(minikube docker-env)
minikube addons enable metallb
docker build -t nginx_image nginx
kubectl apply -f metallb/metallb.yaml
kubectl apply -f nginx/nginx.yaml
