#! /bin/bash

ssh user_name@rasa.example.com bash -c "'
  sudo docker pull $IMAGE_TAG
  sudo docker stop rasa_application 2> /dev/null
  sudo docker rm rasa_application 2> /dev/null
  sudo docker run -d -p 5001:5001 \
  --name rasa_application \
  -e RASA_API_ENDPOINT_URL=http://nlu-api:5002 \
  -e RASA_REMOTE_CORE_ENDPOINT_URL=http://core:5005 \
  -e RASA_CORE_TOKEN=$RASA_CORE_TOKEN \
  --link nlu-api \
  --link core \
  $IMAGE_TAG'"
