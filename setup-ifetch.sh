#!/bin/sh
set -e

cd /tmp

rm -rf ifetch

cat << "EOF"
 _  __      _       _
(_)/ _| ___| |_ ___| |__
| | |_ / _ \ __/ __| '_ \
| |  _|  __/ || (__| | | |
|_|_|  \___|\__\___|_| |_|
EOF

if command -v ifetch >/dev/null 2>&1; then
    echo "Updating ifetch..."
    sudo rm /bin/ifetch
    sudo rm -rf /etc/ifetch
fi

echo "downloading ifetch.tar.gz..."
wget -q -O ifetch.tar.gz https://github.com/Ietsiee/ifetch/archive/refs/heads/main.tar.gz

echo "Extracting..."
tar -xzf ifetch.tar.gz
mv ifetch-main ifetch

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

echo "Cleaning up..."
cd ..
rm -rf ifetch
rm ifetch.tar.gz

echo "Successfully installed ifetch!"
ifetch
