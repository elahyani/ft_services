# ft_services
System Administration and Networking Project.

## Features
The project consists of setting up an infrastructure of different services, It is related to setting up of multi-service cluster, where each service is running in a dedicated container.
- Containers are built with [```Alpine```](https://alpinelinux.org/) Linux.
- The Kubernetes web dashboard. which help you manage your cluster.
- The Load Balancer which manages the external access of the services
- A ```WordPress``` website listening on port 5050
- ```PhpMyAdmin```, listening on port 5000 and linked with the ```MySQL``` database.
- A container with an ```nginx``` server listening on ports 80 and 443.
- A ```FTPS``` server listening on port 21.
- A ```Grafana``` platform, listening on port 3000, linked with an ```InfluxDB``` database.

## Requiremenets
- ***[Docker](https://www.docker.com/)***
- ***[Kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl/)***
- ***[Minikube](https://minikube.sigs.k8s.io/docs/start/)***
- ***[VirtualBox](https://www.virtualbox.org/)***

## Usage
```bash
# run the script
./setup.sh
```
## Resources
- [Kubernetes Documentation](https://kubernetes.io/docs/home/)
- [Kubernetes Tutorial for Beginners](https://www.youtube.com/watch?v=X48VuDVv0do)
- [Hello Minikube](https://kubernetes.io/docs/tutorials/hello-minikube/)
- [Docker & k8s resources](https://www.notion.so/Docker-k8s-resources-5d89599a520b479e8f18487aa3e537a3)
- [How to Install and Configure Nginx Web Server On Alpine Linux](https://www.osetc.com/en/how-to-install-and-configure-nginx-web-server-on-alpine-linux.html)
- [How to Install and Configure PhpMyAdmin On Alpine Linux](https://wiki.alpinelinux.org/wiki/PhpMyAdmin)
- [How to Install and Configure WordPress On Alpine Linux](https://wiki.alpinelinux.org/wiki/WordPress)
- [How to Install and Configure MySQL on Alpine Linux](https://techviewleo.com/how-to-install-mariadb-on-alpine-linux/)
- [Install grafana](https://sbcode.net/grafana/install-influxdb-datasource/)
- [Grafana documentation](https://grafana.com/docs/grafana/latest/)
- [How to install and configure vsftpd](https://www.howtoforge.com/tutorial/how-to-install-and-configure-vsftpd/)
- [ftps server doesnt work properly using kubernetes](https://serverfault.com/questions/1005097/ftps-server-doesnt-work-properly-using-kubernetes)
- [how to configure vsftpd to work with passive mode](https://serverfault.com/questions/421161/how-to-configure-vsftpd-to-work-with-passive-mode)
- [Alpine Linux package management](https://wiki.alpinelinux.org/wiki/Alpine_Linux_package_management)
- [Influxdb: Using the configuration file](https://docs.influxdata.com/influxdb/v1.8/administration/config/#using-the-configuration-file)
- [Grafana : Install Telegraf and Configure for InfluxDB](https://www.youtube.com/watch?v=FrqeG-IajWM)
- [Install telegraf agent](https://sbcode.net/grafana/install-telegraf-agent/)
- [InfluxDB Configuration](https://www.perforce.com/manuals/gitswarm/monitoring/performance/influxdb_configuration.html)
- [MelatLb](https://metallb.universe.tf/configuration/)
- [kubernetes: nodeport vs loadbalancer vs ingress](https://medium.com/google-cloud/kubernetes-nodeport-vs-loadbalancer-vs-ingress-when-should-i-use-what-922f010849e0)
- [MySQL & WordPress persistent volume](https://kubernetes.io/docs/tutorials/stateful-application/mysql-wordpress-persistent-volume/)
- [Understanding the HTTP 307 Temporary Redirect Status Code in Depth](https://kinsta.com/knowledgebase/307-redirect/)
