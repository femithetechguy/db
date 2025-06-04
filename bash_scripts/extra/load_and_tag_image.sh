#!/bin/bash

# === CONFIGURATION ===
TAR_FILE="docker_image_backup.tar"
TARGET_REPO="mcr.microsoft.com/mssql/server"
TARGET_TAG="2022-latest"

# === STEP 1: Load Docker Image from TAR ===
echo "📦 Loading Docker image from $TAR_FILE..."
IMAGE_ID=$(docker load -i "$TAR_FILE" | awk -F ': ' '/Loaded image/ { print $2 }')

if [ -z "$IMAGE_ID" ]; then
    # Fallback in case image is loaded but untagged
    IMAGE_ID=$(docker images --no-trunc --quiet | head -n 1)
    echo "⚠️  No tag found during load, using fallback image ID: $IMAGE_ID"
else
    echo "✅ Loaded image: $IMAGE_ID"
fi

# === STEP 2: Tag the Image ===
echo "🏷️ Tagging image with $TARGET_REPO:$TARGET_TAG ..."
docker tag "$IMAGE_ID" "$TARGET_REPO:$TARGET_TAG"

# === STEP 3: Show Result ===
echo "📋 Resulting image list:"
docker images | grep "$TARGET_REPO"

# === STEP 4: Optional Clean-up (uncomment to remove untagged images) ===
# echo "🧼 Cleaning up dangling images..."
# docker image prune -f

echo "✅ Done."
