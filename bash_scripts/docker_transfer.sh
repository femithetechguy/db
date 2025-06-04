#!/bin/bash

# === CONFIGURATION ===
IMAGE_NAME="myapp:latest"
CONTAINER_NAME="my_container"
TARGET_USER="remote_user"
TARGET_HOST="remote_host"
TARGET_DIR="/tmp/docker_transfer"

# === DERIVED FILE NAMES ===
IMAGE_FILE="image.tar"
CONTAINER_FILE="container.tar"

echo "[+] Saving Docker image..."
docker save -o "$IMAGE_FILE" "$IMAGE_NAME"

echo "[+] Exporting container filesystem..."
docker export -o "$CONTAINER_FILE" "$CONTAINER_NAME"

echo "[+] Copying files to $TARGET_USER@$TARGET_HOST:$TARGET_DIR ..."
ssh "$TARGET_USER@$TARGET_HOST" "mkdir -p $TARGET_DIR"
scp "$IMAGE_FILE" "$CONTAINER_FILE" "$TARGET_USER@$TARGET_HOST:$TARGET_DIR"

echo "[+] Cleanup local tar files..."
rm "$IMAGE_FILE" "$CONTAINER_FILE"

echo "[✓] Done. Now run the import script on the target system."
