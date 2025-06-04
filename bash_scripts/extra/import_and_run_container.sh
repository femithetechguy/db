#!/bin/bash

# === CONFIGURATION ===
CONTAINER_TAR="docker_container_backup.tar"
IMAGE_NAME="restored_sql_server_image"
# IMAGE_TAG="v1"
CONTAINER_NAME="sql_server_container"
HOST_PORT=1433
CONTAINER_PORT=1433

# === STEP 1: Import TAR as Image ===
echo "📦 Importing container from $CONTAINER_TAR as image..."
IMAGE_ID=$(docker import "$CONTAINER_TAR" "$IMAGE_NAME:$IMAGE_TAG")
echo "✅ Imported as image: $IMAGE_ID"

# === STEP 2: Run Container with Ports and Name ===
echo "🚀 Running container: $CONTAINER_NAME ..."
docker run -d \
  --name "$CONTAINER_NAME" \
  -p $HOST_PORT:$CONTAINER_PORT \
  "$IMAGE_NAME:$IMAGE_TAG"

echo "📋 Active containers:"
docker ps | grep "$CONTAINER_NAME"

echo "✅ Container '$CONTAINER_NAME' is now running on port $HOST_PORT."
