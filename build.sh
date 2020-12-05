#!/bin/bash

source config.sh

echo "Image name is: ${IMAGE_NAME}"
echo "Image tag is: ${IMAGE_TAG}"

sudo docker build -t ${IMAGE_NAME}:${IMAGE_TAG} .
