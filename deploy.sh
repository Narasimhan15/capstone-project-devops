#!/bin/bash

# Define variables
REPO_NAME='dev'
IMAGE_NAME="capstone"
DOCKER_HUB_USERNAME="lux1508"
DOCKER_HUB_PASSWORD="dckr_pat_DEP3Dm-yovV5ksrHLx3eC5Ffd4Q"

# Check if Docker is installed
if ! command -v docker &> /dev/null; then
    echo "Error: Docker is not installed or not in PATH. Please install Docker first."
    exit 1
fi

# Log in to Docker Hub
echo "Logging in to Docker Hub..."
echo "$DOCKER_HUB_PASSWORD" | docker login -u "$DOCKER_HUB_USERNAME" --password-stdin

# Tag the local Docker image with the Docker Hub repository name
echo "Tagging local Docker image..."
docker tag $IMAGE_NAME $DOCKER_HUB_USERNAME/$REPO_NAME

# Push the tagged image to Docker Hub
echo "Pushing Docker image to Docker Hub..."
docker push $DOCKER_HUB_USERNAME/$REPO_NAME

# Check if the push was successful
if [ $? -eq 0 ]; then
    echo "Docker image $IMAGE_NAME has been successfully deployed to Docker Hub."
else
    echo "Error: Failed to deploy Docker image $IMAGE_NAME to Docker Hub."
    exit 1
fi

# Log out from Docker Hub
echo "Logging out from Docker Hub..."
docker logout

