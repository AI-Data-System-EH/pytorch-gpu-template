#!/bin/bash

# ::: Shell Script to run after creating the container :::

set -e

echo pwd: $(pwd)

sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get autoremove -y && sudo apt-get clean

npm config set fund false
npm update -g

npm install prettier prettier-plugin-ini prettier-plugin-multiline-arrays
npm cache clean

sudo chmod +x ./.config/scripts/*.sh
./.config/scripts/update-script.sh

./.config/scripts/cache-clean.sh

nvidia-smi
