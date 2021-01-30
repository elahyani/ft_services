#!/bin/bash

echo -e "\n\033[32m________________Start minikube________________\033[0m\n"	
minikube delete	
sleep 1
minikube start
sleep 1
eval $(minikube docker-env)

echo -e "\n\033[32m________________Build Images________________\033[0m\n"
echo -e "\033[32mBuilding InfluxDB Image...\033[0m\n"
sleep 1
docker build -t influxdb ./srcs/influxdb/	 1>/dev/null
echo -e "\033[32mBuilding Grafana Image...\033[0m\n"
sleep 1
docker build -t grafana ./srcs/grafana/ 1>/dev/null
echo -e "\033[32mBuilding Nginx Image...\033[0m\n"
sleep 1
docker build -t nginx ./srcs/nginx/ 1>/dev/null
echo -e "\033[32mBuilding FTPS Image...\033[0m\n"
sleep 1
docker build -t ftps ./srcs/ftps/ 1>/dev/null
echo -e "\033[32mBuilding MySQL Image...\033[0m\n"
sleep 1
docker build -t mysql ./srcs/mysql/ 1>/dev/null
echo -e "\033[32mBuilding PhpMyAdmin Image...\033[0m\n"
sleep 1
docker build -t phpmyadmin ./srcs/phpmyadmin/ 1>/dev/null
echo -e "\033[32mBuilding WordPress Image...\033[0m\n"
sleep 1
docker build -t wordpress ./srcs/wordpress/	 1>/dev/null

echo -e "\033[32m________________Install MetalLB________________\033[0m\n"
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
kubectl apply -f ./srcs/influxdb/influxdb-service.yaml
kubectl apply -f ./srcs/mysql/mysql-secret.yaml
kubectl apply -f ./srcs/mysql/mysql-service.yaml
kubectl apply -f ./srcs/nginx/nginx-service.yaml
kubectl apply -f ./srcs/ftps/ftps-service.yaml
kubectl apply -f ./srcs/phpmyadmin/phpmyadmin-service.yaml
kubectl apply -f ./srcs/wordpress/wordpress-service.yaml
kubectl apply -f ./srcs/grafana/grafana-service.yaml

echo -e "\n\033[32m________________Done________________\033[0m\n"

minikube dashboard
