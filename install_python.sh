#!/bin/bash

# Параметры по умолчанию
PYTHON_VERSION="3.12"

# Установить Python, pip и Poetry через PPA
sudo apt update
sudo apt install -y software-properties-common
sudo add-apt-repository ppa:deadsnakes/ppa -y
sudo apt update
sudo apt install -y python${PYTHON_VERSION} python${PYTHON_VERSION}-venv python${PYTHON_VERSION}-dev python3-pip
pip3 install --user poetry
echo 'export PATH=$PATH:$HOME/.local/bin' >> ~/.zshrc
pip3 install pyright
poetry config virtualenvs.in-project true
