#!/bin/bash
echo -e "\n\033[32m________________Start minikube________________\033[32m\n"
sleep 1
minikube delete
minikube start
eval $(minikube docker-env)

echo -e "\n\033[32m________________Build Nginx image________________\033[32m\n"
sleep 1
docker build -t nginx ./srcs/nginx/
docker build -t mysql ./srcs/mysql/
# docker build -t ftps ./srcs/ftps/
# docker build -t phpmyadmin ./srcs/phpmyadmin/
# docker build -t wordpress ./srcs/wordpress/
# docker build -t influxdb ./srcs/influxdb/
# docker build -t grafana ./srcs/grafana/

echo -e "\n\033[32m________________Install MetalLB________________\033[32m\n"
sleep 1
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/namespace.yaml
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/metallb.yaml
# On first install only
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"

echo -e "\n\033[32m________________config MetalLB________________\033[32m\n"
sleep 1
kubectl apply -f ./srcs/metallb/metallb.yaml

echo -e "\n\033[32m________________Create Services________________\033[32m\n"
sleep 1
kubectl apply -f ./srcs/nginx/nginx-service.yaml
kubectl apply -f ./srcs/mysql-service.yaml
echo -e "\n\033[32m________________Done________________\033[32m\n"
# kubectl apply -f ./srcs/phpmyadmin-service.yaml
# kubectl apply -f ./srcs/wordpress-service.yaml
# kubectl apply -f ./srcs/influxdb-service.yaml
# kubectl apply -f ./srcs/grafana-service.yaml
kubectl get svc
minikube dashboard