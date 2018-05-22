#! /bin/bash

scp -r models/current/dialogue/ user_name@rasa.example.com:~

ssh user_name@rasa.example.com bash -c "'
  sudo cp ~/dialogue/* /home/core_project/
  sudo docker restart core '"
