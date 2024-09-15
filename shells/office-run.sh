#!/bin/bash

cp office-env .env
sudo service mysql start

./shells/run.sh
