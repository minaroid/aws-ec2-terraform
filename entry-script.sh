#!/bin/bash

sudo apt update -y
sudo apt install -y docker.io
sudo docker run --name nginx -d -p 80:80 nginx 
sudo docker exec -i nginx bash -c "echo \"Hello from $(hostname -f)\" > /usr/share/nginx/html/index.html"

