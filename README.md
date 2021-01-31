# ft_services
System Administration and Networking Project.

## Features
The project consists of setting up an infrastructure of different services, It is related to setting up of multi-service cluster, where each service is running in a dedicated container.
- Containers are built with Alpine Linux.
- The Kubernetes web dashboard. which help you manage your cluster.
- The Load Balancer which manages the external access of the services
- A WordPress website listening on port 5050
- PhpMyAdmin, listening on port 5000 and linked with the MySQL database.
- A container with annginx server listening on ports 80 and 443.
- A FTPS server listening on port 21.
- A Grafana platform, listening on port 3000, linked with an InfluxDB database.

## Requiremenets
- ***[Docker](https://www.docker.com/)***
- ***[Kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl/)***
- ***[Minikube](https://minikube.sigs.k8s.io/docs/start/)***

## Usage
```bash
# run the script
./setup.sh
```
## Resources
- https://kubernetes.io/docs/home/
- https://kubernetes.io/docs/tutorials/hello-minikube/
- https://www.osetc.com/en/how-to-install-and-configure-nginx-web-server-on-alpine-linux.html
- https://wiki.alpinelinux.org/wiki/Nginx
- https://wiki.alpinelinux.org/wiki/PhpMyAdmin
- https://wiki.alpinelinux.org/wiki/WordPress
- https://techviewleo.com/how-to-install-mariadb-on-alpine-linux/
- https://sbcode.net/grafana/install-influxdb-datasource/
- https://grafana.com/docs/grafana/latest/
- https://www.howtoforge.com/tutorial/how-to-install-and-configure-vsftpd/
- https://serverfault.com/questions/1005097/ftps-server-doesnt-work-properly-using-kubernetes
- https://serverfault.com/questions/421161/how-to-configure-vsftpd-to-work-with-passive-mode
- https://www.youtube.com/watch?v=X48VuDVv0do
- https://wiki.alpinelinux.org/wiki/Alpine_Linux_package_management
- https://docs.influxdata.com/influxdb/v1.8/administration/config/#using-the-configuration-file
- https://sbcode.net/grafana/install-telegraf-agent/
- https://www.youtube.com/watch?v=FrqeG-IajWM
- https://www.perforce.com/manuals/gitswarm/monitoring/performance/influxdb_configuration.html
- https://metallb.universe.tf/configuration/
- https://medium.com/google-cloud/kubernetes-nodeport-vs-loadbalancer-vs-ingress-when-should-i-use-what-922f010849e0
- https://www.notion.so/Docker-k8s-resources-5d89599a520b479e8f18487aa3e537a3
- https://kubernetes.io/docs/tutorials/stateful-application/mysql-wordpress-persistent-volume/
- https://kinsta.com/knowledgebase/307-redirect/
