#!/bin/bash 
systemctl stop kubelet
docker rm -f -v $(docker ps -qa); mount | grep "/var/lib/kubelet/*" | awk '{print $3}' | xargs umount 1>/dev/null 2>/dev/null;
rm -rf /var/lib/kubelet /etc/kubernetes /var/lib/etcd /etc/cni;
ip link set tunl0 down; ip link del tunl0;
systemctl stop docker
ip link set docker0 down; ip link del docker0;
