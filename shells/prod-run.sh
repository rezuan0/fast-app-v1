#!/bin/bash

cp prod-env .env

sudo service mysql stop

docker compose down
docker compose up