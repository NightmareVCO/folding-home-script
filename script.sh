#!/bin/bash

cd ~
sudo apt update
sudo apt install wget curl -y
curl -O https://download.foldingathome.org/releases/public/fah-client/debian-10-64bit/release/fah-client_8.3.18_amd64.deb
sudo dpkg -i fah-client_8.3.18_amd64.deb


cd folding-home-script
RANDOM_NUMBER=$(shuf -i 100-999 -n 1)
sed -i "s/<machine-name v=\"droplet .*\" \/>/<machine-name v=\"droplet $RANDOM_NUMBER\" \/>/" config.xml
sudo cp my-config.xml /etc/fah-client/config.xml
sudo systemctl start fah-client



