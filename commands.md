## Installation of Docker CE on Ubuntu amd64

    sudo apt-get install apt-transport-https ca-certificates curl software-properties-common
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

    sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
    sudo apt-get update
    sudo apt-get install docker-ce

see <https://docs.docker.com/engine/installation/linux/docker-ce/ubuntu/>

## Using Docker-Machine to setup a dedicated VM for running Docker
    curl -L https://github.com/docker/machine/releases/download/v0.13.0/docker-machine-`uname -s`-`uname -m` >/tmp/docker-machine
    chmod +x /tmp/docker-machine
    sudo cp /tmp/docker-machine /usr/local/bin/docker-machine

Download `docker-machine-kvm` binary from <https://github.com/dhiltgen/docker-machine-kvm/releases>, `chmod +x` and put it into PATH

    docker-machine create -d kvm 

## Show info about Docker
    docker version
    docker info

## Activate experimental features on Ubuntu 16.04
edit `/etc/systemd/system/multi-user.target.wants/docker.service`

    ExecStart=/usr/bin/dockerd -H fd:// --experimental=true

reload systemd

    sudo systemctl daemon-reload
    sudo systemctl restart docker
    docker info | grep Experimental

## Run a simple container with Alpine Linux

get container image from repository ("registry") - optional

    docker image pull alpine

run it

    docker container run -ti alpine 
(`-ti` is required because the default command is a shell that requires a TTY; otherwise the container exits)

Start an existing container that requires a TTY:

    docker container start -ai 

## Commands for listing containers

    docker container ls
    docker container ls -l
    docker container ls -a


## Find out IP address of a container

first command needs the `jq` utility for json processing

    docker container inspect stupefied_darwin | jq .[].NetworkSettings.IPAddress
    docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' stupefied_darwin

## Show PID of "main container process"

    docker inspect --format '{{ .State.Pid }}' clairctl_clair_1

## Run MySQL devel version in a Docker container
the official MySQL image is using a Docker volume for db storage

    docker container run -e MYSQL_ROOT_PASSWORD=xcxcxc -p 33061:3306 --name mysqlbleeding mysql:8.0
    docker container exec -ti mysqlbleeding mysql -p
    mysql -u root -P 33061 -p
    docker container stop mysqlbleeding

## Run Portainer GUI

    docker run -d -p 9000:9000 -v /var/run/docker.sock:/var/run/docker.sock -v /opt/portainer:/data --name portainer portainer/portainer

If you are using SELinux, you need run Docker with the `--privileged` option

## Transfer images from one host to another as a tar file
    docker image save -o myimage.tar 
    docker image load -i myimage.tar

## Run a Registry (without authentication)

    docker run -d -p 5000:5000 --restart=always --name registry registry:2

use [Docker Registry 2 authentication server](https://github.com/cesanta/docker_auth) for authentication or one of the projects on the [links](urls.md) page

## Initialize and run Docker Swarm

    docker swarm init

## Run application on Swarm

    docker stack deploy -c docker-compose.yml stackname
    docker service ls 
    
    docker node inspect manager1 --format "{{ .ManagerStatus.Reachability }}"
    docker node inspect manager1 --format "{{ .Status.State }}"

## Run Kubernetes on Minikube with KVM 
    
    minikube get-k8s-versions
    minikube start --vm-driver kvm
    kubectl run hello-minikube --image=gcr.io/google_containers/echoserver:1.4 --port=8080
    kubectl expose deployment hello-minikube --type=NodePort
    service "hello-minikube" exposed
    kubectl get pod
    kubectl scale --replicas=4 
    minikube dashboard
    minikube stop
    minikube delete

## Reset Linux environment for native Kubernetes installation

    iptables -t nat -F
    ip link set docker0 down
    ip link delete docker0

## Install Kubernetes with kubeadm

    kubeadm init

start over

    kubeadm reset

## Working with kubectl

    kubectl config view
    kubectl cluster-info
    kubectl cluster-info dump

    kubectl create -f webserver.yaml
    kubectl get deployments
    kubectl get replicasets
    kubectl get pods
    kubectl get pods -n kube-system
    kubectl get pods -L app,label2
    kubectl get pods -l app=webserver
    kubectl describe pod
    kubectl create -f webserver-svc.yaml
    kubectl get service
    kubectl describe svc web-service
    kubectl delete deployments webserver

