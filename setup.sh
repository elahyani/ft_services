#!/bin/bash

echo -e "\n\033[32m________________Start minikube________________\033[0m\n"	
sleep 1
# minikube delete	
sleep 1
# minikube start	
sleep 1
# eval $(minikube docker-env)	

echo -e "\n\033[32m________________Build Images________________\033[0m\n"
echo -e "\n\033[32m________________Build Nginx Image________________\033[0m\n"
sleep 1
docker build -t nginx ./srcs/nginx/
sleep 1
echo -e "\n\033[32m________________Build FTPS Image________________\033[0m\n"
sleep 1
docker build -t ftps ./srcs/ftps/	
echo -e "\n\033[32m________________Build MySQL Image________________\033[0m\n"
sleep 1
docker build -t mysql ./srcs/mysql/
echo -e "\n\033[32m________________Build PhpMyAdmin Image________________\033[0m\n"
sleep 1
docker build -t phpmyadmin ./srcs/phpmyadmin/	
echo -e "\n\033[32m________________Build WordPress Image________________\033[0m\n"
sleep 1
docker build -t wordpress ./srcs/wordpress/	
echo -e "\n\033[32m________________Build InfluxDB Image________________\033[0m\n"
sleep 1
docker build -t influxdb ./srcs/influxdb/	
echo -e "\n\033[32m________________Build Grafana Image________________\033[0m\n"
sleep 1
# docker build -t grafana ./srcs/grafana/

echo -e "\n\033[32m________________Install MetalLB________________\033[0m\n"
sleep 1	
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/namespace.yaml	
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/metallb.yaml	
# On first install only	
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"	

echo -e "\n\033[32m________________config MetalLB________________\033[0m\n"
sleep 1
kubectl apply -f ./srcs/metallb/metallb.yaml

echo -e "\n\033[32m________________Create Services________________\033[0m\n"
sleep 1
kubectl apply -f ./srcs/nginx/nginx-service.yaml
kubectl apply -f ./srcs/ftps/ftps-service.yaml
kubectl apply -f ./srcs/mysql/mysql-secret.yaml
kubectl apply -f ./srcs/mysql/mysql-service.yaml
kubectl apply -f ./srcs/phpmyadmin/phpmyadmin-service.yaml
kubectl apply -f ./srcs/wordpress/wordpress-service.yaml
kubectl apply -f ./srcs/influxdb/influxdb-service.yaml
# kubectl apply -f ./srcs/grafana/grafana-service.yaml

echo -e "\n\033[32m________________Done________________\033[0m\n"
sleep 10
kubectl get svc
# minikube dashboard
