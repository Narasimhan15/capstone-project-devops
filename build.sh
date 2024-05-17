#!/bin/bash

# Define variables
IMAGE_NAME="my-react-app"
DOCKERFILE="Dockerfile"
BUILD_CONTEXT="."

# Check if Docker is installed
if ! command -v docker &> /dev/null; then
    echo "Error: Docker is not installed or not in PATH. Please install Docker first."
    exit 1
fi

# Build Docker image
echo "Building Docker image $IMAGE_NAME..."
docker build -t $IMAGE_NAME -f $DOCKERFILE $BUILD_CONTEXT

# Check if the build was successful
if [ $? -eq 0 ]; then
    echo "Docker image $IMAGE_NAME built successfully."
else
    echo "Error: Docker image $IMAGE_NAME failed to build."
    exit 1
fi
