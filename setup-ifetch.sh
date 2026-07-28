#!/bin/sh
set -e

cd

rm -rf ifetch

if command -v ifetch >/dev/null 2>&1; then
    echo "Updating ifetch..."
    sudo rm /bin/ifetch
    sudo rm -rf /etc/ifetch
fi

echo "Cloning ifetch..."
git clone -q https://github.com/Ietsiee/ifetch

cd ifetch

chmod +x modules/*
chmod +x ifetch.sh
chmod +x ifetch-launcher.sh    

echo "Installing ifetch..."
sudo cp ifetch-launcher.sh /bin/ifetch

sudo mkdir -p /etc/ifetch
sudo cp ifetch.sh /etc/ifetch/ifetch.sh
sudo cp -r modules /etc/ifetch/modules
sudo cp help.txt /etc/ifetch/help.txt
sudo cp logo.txt /etc/ifetch/logo.txt
sudo cp ifetch.config /etc/ifetch/ifetch.config

mkdir -p "$HOME/.config/ifetch"
if [ -f "$HOME/.config/ifetch/ifetch.config" ]; then
    echo "ifetch.config already exists"
else
    cp ifetch.config "$HOME/.config/ifetch/ifetch.config"
fi
if [ -f "$HOME/.config/ifetch/logo.txt" ]; then
    echo "logo.txt already exists"
else
    cp logo.txt "$HOME/.config/ifetch/logo.txt"
fi

echo "Cleaning up..."
cd ..
rm -rf ifetch

echo "Successfully installed ifetch"
ifetch
