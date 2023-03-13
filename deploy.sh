#!/bin/bash

cd $1

source .env

docker build -t $IMAGE_NAME .
docker tag $IMAGE_NAME:latest $REGISTRY_URI/$IMAGE_NAME:latest
docker push $REGISTRY_URI/$IMAGE_NAME:latest

aws lambda update-function-code --function-name $FUNCTION_NAME --image-uri $REGISTRY_URI/$IMAGE_NAME:latest