#!/bin/bash

# -----------------------------------------------
# Script to run SQL Server 2022 in Docker
# Usage:
#   chmod +x run_sql_server.sh
#   ./run_sql_server.sh
# -----------------------------------------------

# Variables
CONTAINER_NAME="sql_server_container"
IMAGE_NAME="mcr.microsoft.com/mssql/server:2022-latest"
SA_PASSWORD="Fttg@powerbi143"
PORT="1433"

# Pull the latest SQL Server image
echo "Pulling SQL Server Docker image..."
docker pull $IMAGE_NAME

# Remove existing container if it exists
if [ "$(docker ps -aq -f name=$CONTAINER_NAME)" ]; then
    echo "Stopping and removing existing container..."
    docker stop $CONTAINER_NAME
    docker rm $CONTAINER_NAME
fi

# Run the container
echo "Creating SQL Server container..."
docker run -d \
  --name $CONTAINER_NAME \
  -e "ACCEPT_EULA=Y" \
  -e "SA_PASSWORD=$SA_PASSWORD" \
  -p $PORT:1433 \
  $IMAGE_NAME

echo "✅ SQL Server container is up and running on port $PORT"