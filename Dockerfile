# Build environment with Android NDK
FROM ubuntu:22.04

# Install dependencies
RUN apt-get update && apt-get install -y \
    curl \
    wget \
    unzip \
    git \
    build-essential \
    rclone \
    && rm -rf /var/lib/apt/lists/*

# Create NDK directory
RUN mkdir -p /ndk

# Note: For Mega access, mount rclone config at runtime with -v flag

# Set working directory
WORKDIR /workspace

# Default shell
CMD ["/bin/bash"]
