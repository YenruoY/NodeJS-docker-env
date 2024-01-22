#!/bin/bash

echo "Starting the container using DOCKER COMPOSE..."
echo ""

sudo docker compose up -d

running_containers=$(sudo docker container ps)
image_id=$(echo $running_containers | cut -d' ' --field=9) 
image_name=$(echo $running_containers | cut -d' ' --field=10) 

echo " Image name : $image_name"
echo " Image ID : $image_id"

echo ""
echo "Attaching to the container..."

sudo docker container attach $image_id
