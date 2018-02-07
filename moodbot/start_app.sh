#! /bin/bash

echo "copying rasa core model"

cp -r models/dialogue/* /home/core_project/

echo "stopping and starting app"
  sudo docker stop rasa_application 2> /dev/null
  sudo docker rm rasa_application 2> /dev/null
  sudo docker run -d -p 5001:5001 \
  --name rasa_application \
  -e RASA_API_ENDPOINT_URL=http://nlu_backend:5002 \
  -e RASA_REMOTE_CORE_ENDPOINT_URL=http://enterprise_core:5005 \
  -e RASA_CORE_TOKEN=$RASA_CORE_TOKEN \
  --link nlu_backend \
  --link enterprise_core \
  $IMAGE_TAG
