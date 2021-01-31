#!/bin/bash

echo -e "\n\033[34m________________Start minikube________________\033[0m\n"	
minikube delete
sleep 1
minikube start
sleep 1
eval $(minikube docker-env)

services=(
	influxdb
	grafana
	ftps
	mysql
	phpmyadmin
	wordpress
	nginx
)

echo -e "\n\033[34m________________Build Images________________\033[0m\n"
for s in "${services[@]}"
do
	echo -e "\033[32mBuilding $s Image...\033[0m"
	docker build -t $s ./srcs/$s/ 1>/dev/null
	sleep 1
done

echo -e "\n\033[34m________________Install MetalLB________________\033[0m\n"
sleep 1
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/namespace.yaml 1>/dev/null
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/metallb.yaml 1>/dev/null
# On first install only
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"  &>/dev/null
echo -e "\033[32mInstalled.\033[0m"
echo -e "\n\033[34m________________config MetalLB________________\033[0m\n"
sleep 1
kubectl apply -f ./srcs/metallb/metallb.yaml 1>/dev/null
echo -e "\033[32mConfigMap Created.\033[0m"

echo -e "\n\033[34m________________Create Services________________\033[0m\n"
kubectl apply -f ./srcs/mysql/mysql-secret.yaml 1>/dev/null
for s in ${services[@]}
do
	kubectl apply -f ./srcs/$s/$s-service.yaml 1>/dev/null
	echo -e "\033[32m$s service created.\033[0m"
	sleep 1
done
echo -e "\033[32m[+] Done\033[0m"

sleep 5
echo -e "\033[32m[+] Launch Dashboard...\033[0m"
minikube dashboard

# docker-machine create --driver virtualbox default
# docker-machine env default
# eval $(docker-machine env default)
# eval $(minikube docker-env)
