#!/bin/bash

# check if Docker is running
if ! systemctl is-active --quiet docker; then
    echo "Docker is not running. Please start Docker and try again."
    exit 1
fi      

# Check if the backup file exists
if [ ! -f docker_image_backup.tar ]; then
    echo "Backup file 'docker_image_backup.tar' not found."
    exit 1
fi      

# Load Docker image
docker load -i docker_image_backup.tar

# Rename the image to match source names
# image name = mcr.microsoft.com/mssql/server
# image tag= 2022-latest 
# image id =147ee765ff1db3b86ce6ec05908e51fd0dab2feda5dd85b2721f28c77ca305eb 
docker tag sha256:147ee765ff1db3b86ce6ec05908e51fd0dab2feda5dd85b2721f28c77ca305eb mcr.microsoft.com/mssql/server:2022-lates


# Import container filesystem (creates a new image, optionally name it)
# docker import docker_container_backup.tar restored_container_image

# OR (if you want to run container directly without reimporting image)
docker run -it --name restored_container restored_container_image /bin/bash

