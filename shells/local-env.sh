#!/bin/bash

cp local-env .env
sudo systemctl restart mysql

./shells/run.sh

