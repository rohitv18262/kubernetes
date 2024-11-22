#!/bin/bash
kubectl apply -f applications/app1/deployment.yaml 
kubectl apply -f applications/app1/service.yaml
kubectl apply -f applications/app2/deployment.yaml 
kubectl apply -f applications/app2/service.yaml 
kubectl apply -f ingress.yaml -n default
# kubectl apply -f configmap.yaml -n ingress-nginx
kubectl delete configmap ingress-nginx-controller -n ingress-nginx
kubectl apply -f configmap.yaml -n ingress-nginx
kubectl rollout restart deployment ingress-nginx-controller -n ingress-nginx
