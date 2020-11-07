#!/bin/bash

source config.sh

read -p "Enter the full path to the github directory.  This will be exposed at /share.  Example: '/home/nightrider/aquaeye-ai':" PROJ_DIR
PROJ_DIR=$(eval echo $PROJ_DIR)

read -p "Enter the full path to the model files directory.  This will be exposed at /share/model.  Example: '/home/nightrider/aquaeye-ai/calacademy-fish-id/classifiers/image_classification/models/mobilenet_v2_100_224_keras/fine_tuned/9_10_2020/1':" MODEL_DIR
MODEL_DIR=$(eval echo $MODEL_DIR)

# Expose ports and run
if [ $ENVIRONMENT = "PROD" ]
then
  sudo docker run -it \
          -p $HTTP_SERVER_PORT:$HTTP_SERVER_PORT \
          -p $EXPRESS_APP_PORT:$EXPRESS_APP_PORT \
          -p $REACT_CLIENT_PORT:$REACT_CLIENT_PORT \
          -v "$PROJ_DIR":/share \
          -v "$MODEL_DIR":/share/model \
          --name $IMAGE_NAME $IMAGE_NAME
else
  sudo docker run -it \
          -p $PUBLIC_PORT:$PUBLIC_PORT \
          -v "$PROJ_DIR":/share \
          -v "$MODEL_DIR":/share/model \
          --name $IMAGE_NAME $IMAGE_NAME
fi
