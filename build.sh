#!/bin/bash

# Build Docker image
docker build -t app:dev .

# Tag and push the dev image to the public Docker Hub
docker tag app:dev sajaiprathap/dev:latest
docker push sajaiprathap/dev:latest

# Build Docker image for production private repository
docker build -t app:prod .

# Tag and push the production image to the private Docker Hub repository
docker tag app:prod sajaiprathap/prod:latest
docker push sajaiprathap/prod:latest
