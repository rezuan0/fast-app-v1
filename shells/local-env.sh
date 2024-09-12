#!/bin/bash

cp local-env .env
sudo service mysql start

./shells/run.sh

