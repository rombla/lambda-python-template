#!/bin/bash

cd $1
source .env

docker build -t $IMAGE_NAME .
docker run -p 9000:8080 $IMAGE_NAME:latest
