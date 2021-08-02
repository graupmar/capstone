#!/usr/bin/env bash

# This tags and uploads an image to Docker Hub

# Step 1:
# This is your Docker ID/path
dockerpath="graupma/capstone:latest"

# Step 2
# Run the Docker Hub container with kubernetes
kubectl run capstone \
        --image=$dockerpath \
        --port=80

# Step 3:
# List kubernetes pods
sleep 10
kubectl get pods

# Step 4:
# Forward the container port to a host
kubectl port-forward capstone 8000:80 --address='0.0.0.0'
