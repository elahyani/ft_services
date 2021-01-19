#!/bin/bash

minikube delete
minikube start
eval $(minikube docker-env)

docker build -t nginx ./srcs/nginx/
docker build -t mysql ./srcs/mysql/
docker build -t ftps ./srcs/ftps/
docker build -t phpmyadmin ./srcs/phpmyadmin/
docker build -t wordpress ./srcs/wordpress/
docker build -t influxdb ./srcs/influxdb/
docker build -t grafana ./srcs/grafana/

kubectl create -f nginx/nginx-service.yaml
kubectl create -f nginx/mysql-service.yaml
kubectl create -f nginx/phpmyadmin-service.yaml
kubectl create -f nginx/wordpress-service.yaml
kubectl create -f nginx/influxdb-service.yaml
kubectl create -f nginx/grafana-service.yaml