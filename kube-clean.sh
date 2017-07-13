#!/bin/bash 
rm /etc/kubernetes/* -rf
rm /var/lib/kubelet/* -rf
rm ~/.kube/* -rf
rm /var/lib/etcd/* -rf
rm /etc/cni/net.d/* -rf
rm /var/run/calico/* -rf
rm /var/etcd/* -rf
ifconfig tunl0 down
ifconfig docker0 down
#clean iptables
iptables -F
iptables -X
echo "---------------------------------------"
iptables -t nat -F
iptables -t nat -X
echo "---------------------------------------"
iptables -t filter -F
iptables -t filter -X
echo "---------------------------------------"
iptables -t mangle -F
iptables -t mangle -X
echo "---------------------------------------"
iptables -t raw -F
iptables -t raw -X
echo "---------------------------------------"
iptables -t security -F
iptables -t security -X
ip route flush table main
service network restart
service docker restart
echo "clean kubelet logs"
> /var/log/messages
