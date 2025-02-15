#!/bin/bash

# Deploy the application to the server 
ssh ubuntu@52.221.189.20 << 'EOF'
  docker pull app:$1
  docker-compose down
  docker-compose up -d
EOF
