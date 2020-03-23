#!/usr/bin/env bash

# This tags and uploads an image to Docker Hub

# Step 1:
# This is your Docker ID/path
# dockerpath=<>

image="steeloctopus/duckhunt:1.0"
#mysql="steeloctopus/devmysql:1.0"

# Step 2
# Run the Docker Hub container with kubernetes
kubectl create deployment duckhunt --image=$image
#kubectl create deployment mysql --image=$mysql

sleep 20

# Step 3:
# List kubernetes pods
kubectl get pods --all-namespaces

# Step 4:
# Forward the container port to a host
#kubectl expose deployment mysql --type="NodePort" --port=3306
#kubectl port-forward deployment/mysql 8000:3306

kubectl expose deployment duckhunt --type="NodePort" --port=80

kubectl port-forward deployment/duckhunt 8080:80