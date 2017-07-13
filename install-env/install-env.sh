#!/bin/bash
echo "export http_proxy=child-prc.intel.com:913" >> ~/.bashrc
echo "export https_proxy=child-prc.intel.com:913" >> ~/.bashrc
source ~/.bashrc
yum install -y yum-utils policycoreutils-python libtool-ltdl-2.4.2-21.el7_2.x86_64 libseccomp-2.3.1-2.el7.x86_64 socat-1.7.2.2-5.el7.x86_64
#docker
cd ./docker-rpm
rpm -Uvh ./docker-engine-selinux-1.13.1.cs2-1.el7.centos.noarch.rpm
rpm -Uvh ./docker-engine-1.13.1.cs2-1.el7.centos.x86_64.rpm
mkdir /etc/systemd/system/docker.service.d
cp ../http-proxy.conf /etc/systemd/system/docker.service.d/http-proxy.conf
systemctl daemon-reload
systemctl enable docker
systemctl restart docker
docker run --rm -it hello-world
#kubernetes
cd ../kube-rpm
rpm -Uvh kubelet-1.4.0-0.x86_64.rpm 
rpm -Uvh kubernetes-cni-0.3.0.1-0.07a8a2.x86_64.rpm 
rpm -Uvh kubectl-1.4.0-0.x86_64.rpm 
rpm -Uvh kubeadm-1.5.0-0.alpha.0.1403.gc19e08e.x86_64.rpm
