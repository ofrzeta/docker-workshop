### Container runtimes

* Docker (stable) https://www.docker.com
* Rocket (stable) https://coreos.com/rkt
* Pouch (stable), container engine by Alibaba https://github.com/alibaba/pouch
* Railcar (experimental) https://github.com/oracle/railcar
* VIC Engine (containers on vSphere) https://github.com/vmware/vic
* LXC, LXD https://linuxcontainers.org/lxd/ (also possible to use as a Kubernetes runtime)
* gVisor (container runtime with userspace kernel features, by Google) https://github.com/google/gvisor

### Container + VM engines

* Clear Linux https://clearlinux.org/
* runV https://github.com/hyperhq/runv
* Kata (new OpenStack project that merges Clear and runV) https://katacontainers.io
* frakti (hypervisor-based container runtime for Kubernetes) https://github.com/kubernetes/frakti

### Minimalistic container implementations based on namespaces, cgroups etc.

* https://github.com/tonybaloney/mocker
* https://github.com/p8952/bocker
* https://github.com/kragniz/omochabako/blob/master/omochabako
* https://blog.lizzie.io/linux-containers-in-500-loc.html
* A workshop on Linux containers: Rebuild Docker from Scratch https://github.com/Fewbytes/rubber-docker

### Docker Machine (easy VM including Docker)
* https://github.com/docker/machine/releases
* https://github.com/dhiltgen/docker-machine-kvm/releases/

### Docker storage (images/container)
* https://docs.docker.com/engine/userguide/storagedriver/
* https://integratedcode.us/2016/08/30/storage-drivers-in-docker-a-deep-dive/
* http://www.windsock.io/explaining-docker-image-ids/

### Docker volume plugins
* https://docs.portworx.com/scheduler/docker/docker-plugin.html
* https://github.com/rancher/convoy
* https://github.com/ClusterHQ/flocker

### Container standards/specs
* https://github.com/containernetworking/cni
* https://github.com/opencontainers/runtime-spec
* https://github.com/opencontainers/image-spec
* https://github.com/container-storage-interface/spec

### Docker Registry 2.0
* https://github.com/docker/distribution
* https://github.com/cesanta/docker_auth
* https://docs.docker.com/registry/deploying
* https://docs.docker.com/registry/recipes/mirror
* https://blog.docker.com/2015/10/registry-proxy-cache-docker-open-source
* https://github.com/SUSE/Portus - authorization service and frontend for Docker registry (v2)
* https://github.com/vmware/harbor - an enterprise-class container registry server based on Docker Distribution
* https://www.sonatype.com/nexus-repository-oss - Repository for Docker and other artifacts
* https://umo.ci - umoci is a free software tool for manipulating and interacting with container images in the standardised OCI image format
* https://github.com/projectatomic/skopeo - work with remote images registries - retrieving information, images, signing content
* https://github.com/estesp/manifest-tool - manifest-tool is a command line utility that implements a portion of the client side of the Docker * registry v2.2 API for interacting with manifest objects in a registry conforming to that specification.
* https://github.com/ivanilves/lstags - compare and sync local Docker images with ones in remote registry
* https://github.com/burnettk/delete-docker-registry-image 
If you are running a private v2 docker registry, and you are storing your data on disk, running this script from the machine where the data lives will let you fully delete an image or tag
* Tools for browsing and manipulating docker registries https://github.com/mayflower/docker-ls

### Security scanning
* https://github.com/coreos/clair
* https://github.com/arminc/clair-scanner
* https://github.com/jgsqware/clairctl
* Docker Bench for Security, a script that checks for best-practices around deploying Docker containers in production, https://github.com/docker/docker-bench-security

### Docker Compose
* https://docs.docker.com/compose/compose-file
* https://docs.docker.com/compose/production
* https://docs.docker.com/engine/swarm/stack-deploy

### Docker secrets
* https://docs.docker.com/engine/swarm/secrets/
* https://github.com/hashicorp/vault
* https://square.github.io/keywhiz/

### Dockerfile, ENTRYPONT and CMD
* https://docs.docker.com/engine/reference/builder/#understand-how-cmd-and-entrypoint-interact

### Container security
* What capabilities do I really need in my container? https://danwalsh.livejournal.com/76358.html
* https://developers.redhat.com/blog/2017/02/16/find-what-capabilities-an-application-requires-to-successful-run-in-a-container/

#### Orchestration
* Docker Swarm
* Kubernetes, see below
* Nomad by Hashicorp: https://www.nomadproject.io
* Stellar, minimalistic orchestration https://github.com/ehazlett/stellar/

### Interesting thought about alternative container architecture
* https://www.hastexo.com/blogs/florian/2016/02/21/containers-just-because-everyone-else/

### Kubernetes

#### Installation
* Manual installation on Google Cloud https://github.com/kelseyhightower/kubernetes-the-hard-way
* Same thing as above on bare metal https://github.com/Praqma/LearnKubernetes/blob/master/kamran/Kubernetes-The-Hard-Way-on-BareMetal.md
* kubeadm is a toolkit that help you bootstrap a best-practice Kubernetes cluster in an easy, reasonably secure and extensible way  https://kubernetes.io/docs/setup/independent/create-cluster-kubeadm/
* Installation for "production" environments on AWS https://github.com/kubernetes/kops
* Deploy a production ready kubernetes cluster on AWS, GCE, Azure, OpenStack or Baremetal https://github.com/kubernetes-incubator/kubespray
* Kubicorn: create, manage, snapshot, and scale Kubernetes infrastructure in the public cloud https://github.com/kubicorn/kubicorn
* Terraform module for creating Kubernetes cluster running on Container Linux by CoreOS in an AWS VPC https://github.com/kz8s/tack
* Minikube (Kubernetes on a single VM) https://kubernetes.io/docs/getting-started-guides/minikube/

#### Minikube - single VM Kubernetes
* https://github.com/kubernetes/minikube
* also usable with KVM: `minikube start --vm-driver kvm`

#### Applications on Kubernetes 
* Package manager for Kubernetes https://helm.sh
* Automated deployment updates https://keel.sh

#### Kubernetes distros
* Rancher 2.0: http://rancher.com
* CoreOS (now Red Hat) Tectonic https://coreos.com/tectonic
* Typhoon (minimal and free Kubernetes distribution): https://typhoon.psdn.io/
* Pharos by Kontena: https://pharos.sh

#### Kubernetes container runtimes
* CRI-O is an implementation of the Kubernetes CRI (Container Runtime Interface) to enable using OCI (Open Container Initiative) compatible runtimes http://cri-o.io/

#### Overlay networks
* https://www.weave.works/docs/net/latest/install/plugin/
* https://github.com/coreos/flannel/blob/master/Documentation/running.md
* https://github.com/projectcalico/canal

#### Container services in the cloud
* Google Kubernetes Engine
* Azure Container Service
* Amazon Container Services, Amazon Elastic Container Service for Kubernetes
* Joyent (based on OpenSolaris/SmartOS and Linux zones)
