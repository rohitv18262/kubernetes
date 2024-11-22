# Ingress setup in a kubernetes environment and implement custom rate limiting

---
## Screenshots of Working setup

Here is  screenshot of the application:

![App1 screenshot](screenshots/app1.png?raw=false)

![App2 screenshot](screenshots/app2.png?raw=false)

![other path screenshot](screenshots/third.png?raw=false)

![rate limiting screenshot](screenshots/fourth.png?raw=false)

---

step-by-step process to Ingress setup in a kubernetes environment and implement custom rate limiting .

---

## Step 1: Install Required Dependencies

Update the system and install the necessary dependencies:

```bash
sudo apt update -y
sudo apt install -y curl wget 
```

Docker, KVM, VirtualBox, or bare-metal.

---

## Step 2: Install Docker
Set up Docker's apt repository.

```bash

# Add Docker's official GPG key:
sudo apt-get update
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update


# To install the latest version, run:

sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin


# Add Your User to the Docker Group:

sudo usermod -aG docker $USER
newgrp docker

# Verify Docker Installation:

docker --version
```
---

## Step 3: Install Minikube

```bash
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube && rm minikube-linux-amd64

# Verify Installation:

minikube version
```
----

## Step 4: Start Minikube
Start Minikube using your preferred driver. For Docker:

```bash
minikube start 
```

----

## Step 5: Enable the Ingress controller

To enable the NGINX Ingress controller, run the following command:

```bash
minikube addons enable ingress


# Verify that the NGINX Ingress controller is running

kubectl get pods -n ingress-nginx
```
---

## Step 6: Run the deploy.sh file to run the system

first give the execution access to the bash file, run the following command:

```bash
chmod +x deploy.sh


# now run the bash file using

./deploy.sh
```
---

## Step 7: Run the below command to get your ingress ip to check on browser or curl

run the following command:

```bash
kubectl get ingress app-ingress -n default

# now open the address field ip on your browser or use curl on terminal

http://<ingress-ip>/v1
http://<ingress-ip>/v2
```
---

## Step 8: Run the destroy.sh file to destroy all resources

first give the execution access to the bash file, run the following command:

```bash
chmod +x destroy.sh


# now run the bash file using

./destroy.sh
```
---
