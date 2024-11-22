#!/bin/bash
kubectl delete deployment --all
kubectl delete service --all
kubectl delete ingress app-ingress -n default