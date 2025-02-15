@!/bin/bash

# Build Docker image
docker build -t app:$1 .

# Push Docker image to Docker Hub
docker push app:$1
