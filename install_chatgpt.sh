#!/bin/bash

sudo rm /etc/systemd/resolved.conf
sudo cp ./chatgpt.conf /etc/systemd/resolved.conf
sudo systemctl restart systemd-resolved.service
