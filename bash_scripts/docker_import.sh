#!/bin/bash
# Load Docker image
docker load -i docker_image_backup.tar

# Import container filesystem (creates a new image, optionally name it)
# docker import docker_container_backup.tar restored_container_image

# OR (if you want to run container directly without reimporting image)
docker run -it --name restored_container restored_container_image /bin/bash

