#!/bin/bash
kubectl delete deployment --all
kubectl delete service --all
kubectl delete ingress app-ingress -n default
# kubectl delete configmap mycustom-configmap -n ingress-nginx