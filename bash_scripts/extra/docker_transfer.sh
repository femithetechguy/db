#!/bin/bash

# IDs provided Pls (update as necessary)
# These IDs are placeholders and should be replaced with actual IDs from your Docker environment.
# You can find the container ID using `docker ps -a` and the image ID using `docker images`.
# Make sure to run this script in the same environment where the Docker container and image exist.
CONTAINER_ID="1ba6a5806e7537e30adf308a4d1358f328d1130b8d90cb0d72b5cfd45dcfadaf"
IMAGE_ID="sha256:147ee765ff1db3b86ce6ec05908e51fd0dab2feda5dd85b2721f28c77ca305eb"

# Optional names for output files
IMAGE_TAR="docker_image_backup.tar"
CONTAINER_TAR="docker_container_backup.tar"

echo "Saving Docker image..."
docker save -o "$IMAGE_TAR" "$IMAGE_ID"

echo "Exporting Docker container..."
docker export "$CONTAINER_ID" -o "$CONTAINER_TAR"

echo "Done. Files created:"
echo "- $IMAGE_TAR"
echo "- $CONTAINER_TAR"

echo ""
echo "To transfer to another machine, run this from your local terminal:"
echo "scp $IMAGE_TAR $CONTAINER_TAR user@destination_ip:/path/to/destination/"
