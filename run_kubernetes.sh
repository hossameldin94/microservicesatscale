#!/usr/bin/env bash

# This tags and uploads an image to Docker Hub

# Step 1:
# This is your Docker ID/path
# dockerpath=<>
dockerpath=hossameldin94/project5

# Step 2
# Run the Docker Hub container with kubernetes
kubectl create deployment project5 --image=$dockerpath

kubectl run project5\
    --generator=run-pod/v1\
    --image=$dockerpath\
    --port=80 --labels app=project5

# Step 3:
# List kubernetes pods

kubectl get pods

# Step 4:
# Forward the container port to a host

kubectl port-forward project5-7d689ff8d9-gqqjt 8000:80
