#!/bin/bash

cd ~
sudo apt update
sudo apt upgrade
sudo apt install build-essential wget git libc6 -y
git clone https://github.com/NightmareVCO/folding-home-script.git
curl -O https://download.foldingathome.org/releases/public/fah-client/debian-stable-arm64/release/fah-client_8.3.18_arm64.deb
sudo dpkg -i fah-client_8.3.18_arm64.deb

cd folding-home-script
RANDOM_NUMBER=$(shuf -i 100-999 -n 1)
sed -i "s/<machine-name v=\"droplet .*\" \/>/<machine-name v=\"droplet $RANDOM_NUMBER\" \/>/" config.xml
sudo cp my-config.xml /etc/fah-client/config.xml
sudo systemctl restart fah-client
