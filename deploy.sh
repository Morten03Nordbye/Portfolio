#!/bin/bash

# Check if script is run as root
if [ "$UID" -ne 0 ]; then
    echo "Please run this script with sudo: sudo ./script"
    exit 1
fi

# Image details
IMAGE_NAME="mnordbye/portfolio"
TAG="latest"

# Build the Docker image
echo "Building Docker image..."
docker build -t $IMAGE_NAME:$TAG .

# Log in to Docker Hub
echo "Logging into Docker Hub..."
docker login

# Check if login was successful
if [ $? -eq 0 ]; then
    # Push the image to Docker Hub
    echo "Pushing image to Docker Hub..."
    docker push $IMAGE_NAME:$TAG
else
    echo "Failed to log in to Docker Hub. Exiting..."
    exit 1
fi

# Finish
echo "Done!"
