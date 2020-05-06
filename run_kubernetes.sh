#!/usr/bin/env bash

# This tags and uploads an image to Docker Hub

# Step 1:
# This is your Docker ID/path
dockerpath="udzhumok/devops:demo"

# Step 2
# Run the Docker Hub container with kubernetes
kubectl run prediction\
    --generator=run-pod/v1\
    --image=$dockerpath\
    --port=8000 --labels app=prediction

# Step 3:
# List kubernetes pods
kubectl get pods

# Step 4:
# Forward the container port to a host and print logs
kubectl port-forward prediction 8000:80 &

kubectl logs -f prediction
