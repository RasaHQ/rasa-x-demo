#! /bin/bash

ssh user_name@rasa.example.com bash -c "'
  sudo docker pull $IMAGE_TAG
  sudo docker stop rasa_application 2> /dev/null
  sudo docker rm rasa_application 2> /dev/null
  sudo docker run -d -p 5001:5001 \
  --name rasa_application \
  -e RASA_API_ENDPOINT_URL=$RASA_API_ENDPOINT_URL \
  -e RASA_REMOTE_CORE_ENDPOINT_URL=$RASA_REMOTE_CORE_ENDPOINT_URL \
  $IMAGE_TAG'"
