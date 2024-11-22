# Kubernetes Web App Deployment with NGINX Ingress and Rate Limiting

This guide outlines how to set up a local Kubernetes environment using Minikube, deploy two sample web applications, configure NGINX ingress with custom routing, and enable global rate limiting based on the `X-Client-Id` header.

## Prerequisites

Before proceeding, make sure you have the following tools installed:
- [Minikube](https://minikube.sigs.k8s.io/docs/) — to create a local Kubernetes cluster.
- [kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl/) — to interact with Kubernetes.
- [Helm](https://helm.sh/docs/intro/install/) — to install NGINX ingress via Helm.

## Steps

### 1. Set Up Minikube Kubernetes Environment

1. **Start Minikube**:  
   Initialize your Minikube cluster with the following command:
   ```bash
   minikube start
