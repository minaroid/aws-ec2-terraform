#!/bin/bash

sudo apt update -y
sudo apt install -y docker.io

sudo docker run -d --name totd-mongo -p 27017:27017 -v $(pwd)/docker-volumes/mongo:/data/db mongo