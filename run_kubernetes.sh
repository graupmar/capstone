#!/usr/bin/env bash

# This tags and uploads an image to Docker Hub

#delete old pod
kubectl delete pod capstone

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
sleep 30
kubectl get pods

# Step 4:
# Forward the container port to a host

FILE="save_port-forward_pid.txt"
if [ -f "$FILE" ]; then
        kill -9 `cat $FILE`
        rm $FILE
fi

nohup kubectl port-forward capstone 80:80 --address='0.0.0.0' > port-forward-nohup.log 2>&1 &
echo $! > $FILE
