#!/bin/bash
sudo apt update
sudo apt install -y python3-pip python3-venv

# Create and activate the virtual environment
# python3 -m venv venv
# source venv/bin/activate

# Install dependencies
pip install -r /home/rezuan/Desktop/python-app-deployment/python-fast-app/requirements.txt
