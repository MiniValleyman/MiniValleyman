#!/bin/bash
# Simple Docker build & run script for Android NDK compilation

set -e

IMAGE_NAME="ndk-builder"
CONTAINER_NAME="ndk-dev"

echo "📦 Building Docker image..."
docker build -t $IMAGE_NAME .

echo ""
echo "✅ Docker image built! Now you have two options:"
echo ""
echo "OPTION 1: Interactive shell (recommended for testing)"
echo "  docker run -it --rm -v \$(pwd):/workspace -v ~/android-ndk:/ndk $IMAGE_NAME"
echo ""
echo "OPTION 2: Run a build command directly"
echo "  docker run -it --rm -v \$(pwd):/workspace -v ~/android-ndk:/ndk $IMAGE_NAME ./build.sh"
echo ""
echo "OPTION 3: Keep container running (for multiple compilations)"
echo "  docker run -it --name $CONTAINER_NAME -v \$(pwd):/workspace -v ~/android-ndk:/ndk $IMAGE_NAME"
echo ""
echo "Inside the container:"
echo "  - Your project code is at: /workspace"
echo "  - Android NDK is at: /ndk"
echo "  - Use: export NDK_HOME=/ndk"
echo ""
