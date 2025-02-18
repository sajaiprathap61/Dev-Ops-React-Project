@!/bin/bash

# Build Docker image
sudo docker build -t app:dev .

# Tag and push the dev image to the public Docker Hub
sudo docker tag app:dev sajaiprathap/dev:latest
sudo docker push sajaiprathap/dev:latest

# Build Docker image for production private repository
sudo docker build -t app:prod .

# Tag and push the production image to the private Docker Hub repository
sudo docker tag app:prod sajaiprathap/prod:latest
sudo docker push sajaiprathap/prod:latest
