#!/bin/bash

# === CONFIGURATION ===
IMAGE_FILE="/tmp/docker_transfer/image.tar"
CONTAINER_FILE="/tmp/docker_transfer/container.tar"
NEW_CONTAINER_NAME="imported_container"

echo "[+] Loading Docker image..."
docker load -i "$IMAGE_FILE"

echo "[+] Importing container filesystem (note: settings like ports won't be preserved)..."
cat "$CONTAINER_FILE" | docker import - "$NEW_CONTAINER_NAME"

echo "[✓] Done. You can now run the container with:"
echo "    docker run -it --name your_container_name $NEW_CONTAINER_NAME"
