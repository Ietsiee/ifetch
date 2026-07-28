#!/bin/sh
set -e

cd

rm -rf ifetch

if command -v ifetch >/dev/null 2>&1; then
    sudo rm /bin/ifetch
    sudo rm -rf /etc/ifetch
fi

echo "Cloning ifetch..."
git clone -q https://github.com/Ietsiee/ifetch.git

cd ifetch

chmod +x modules/*
chmod +x ifetch.sh
chmod +x ifetch-launcher.sh

echo "Installing ifetch..."
sudo cp ifetch-launcher.sh /bin/ifetch
sudo mkdir -p /etc/ifetch
sudo cp ifetch.sh /etc/ifetch/ifetch.sh
sudo cp help.txt /etc/ifetch/help.txt
sudo cp logo.txt /etc/ifetch/logo.txt
sudo cp ifetch.config /etc/ifetch/ifetch.config
sudo cp -r modules /etc/ifetch/modules

echo "Cleaning up..."
cd ..
rm -rf ifetch

echo "Successfully installed ifetch"
ifetch
