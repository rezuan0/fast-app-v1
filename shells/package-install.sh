#!/bin/bash
# Check if a Python package name is provided
if [ -z "$1" ]; then
  echo "Error: No Python package name provided."
  echo "Usage: ./install_python_package.sh <package-name>"
  exit 1
fi

docker exec py-app pip install $1 > /dev/null 2>&1
echo "Package Install Done."


