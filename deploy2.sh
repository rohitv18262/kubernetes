#!/bin/bash

# Apply application 1
kubectl apply -f applications/app1/deployment.yaml
kubectl apply -f applications/app1/service.yaml

# Apply application 2
kubectl apply -f applications/app2/deployment.yaml
kubectl apply -f applications/app2/service.yaml

# Apply the ingress resource (assuming it's in the 'default' namespace as per your original script)
kubectl apply -f ingress.yaml -n default

# Apply the custom ConfigMap for the ingress controller (in 'ingress-nginx' namespace)
kubectl apply -f configmap.yaml -n ingress-nginx

# Define the ingress-nginx-controller pod name (from your output)
POD_NAME="ingress-nginx-controller-f69bd4897-6wn7k"

# Check if the pod exists
kubectl get pod -n ingress-nginx $POD_NAME > /dev/null 2>&1
if [ $? -ne 0 ]; then
    echo "Pod $POD_NAME not found in the ingress-nginx namespace. Exiting."
    exit 1
fi

# Echo the pod name for debugging
echo "Found ingress-nginx-controller pod: $POD_NAME"

# Edit the args in the pod's container using sed to replace the configmap argument
kubectl exec -it $POD_NAME -n ingress-nginx -- sh -c \
  "sed -i 's|--configmap=\$(POD_NAMESPACE)/ingress-nginx-controller|--configmap=\$(POD_NAMESPACE)/mycustom-configmap|' /etc/nginx/nginx.conf"

# After modification, reload the nginx configuration inside the pod
kubectl exec $POD_NAME -n ingress-nginx -- kill -HUP 1

# Optionally: Check if the reload was successful by examining the logs
echo "Checking NGINX logs for pod: $POD_NAME"
kubectl logs $POD_NAME -n ingress-nginx --tail=50

echo "Deployment complete, ConfigMap updated, and NGINX Ingress controller reloaded with the new ConfigMap!"
