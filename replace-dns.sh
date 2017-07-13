#!/bin/bash
kubectl -n kube-system delete svc kube-dns
kubectl -n kube-system delete deployment kube-dns
sleep 3
kubectl apply -f kubedns-rc.yaml
kubectl apply -f kubedns-svc.yaml
