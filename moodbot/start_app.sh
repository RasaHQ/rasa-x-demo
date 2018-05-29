#! /bin/bash

echo "copying rasa core model & restarting"

cp -r models/dialogue/* /home/core_project/
sudo docker restart core

echo "stopping and starting app"
  sudo docker stop app 2> /dev/null
  sudo docker rm app 2> /dev/null
  sudo docker run -d -p 5001:5001 \
  --name app \
  -e RASA_API_ENDPOINT_URL=http://nlu-api:5002 \
  -e RASA_REMOTE_CORE_ENDPOINT_URL=http://core:5005 \
  -e RASA_CORE_TOKEN=$RASA_CORE_TOKEN \
  --link nlu-api \
  --link core \
  $IMAGE_TAG
