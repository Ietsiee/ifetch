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
    echo "[*] Updating ifetch..."
    sudo rm -rf /etc/ifetch
    sudo rm -rf /usr/bin/ifetch
fi

echo "[*] Downloading ifetch.tar.gz..."
wget -q -O ifetch.tar.gz https://github.com/Ietsiee/ifetch/archive/refs/heads/main.tar.gz

echo "[*] Extracting..."
tar -xzf ifetch.tar.gz
mv ifetch-main ifetch

cd ifetch

echo "[*] Installing ifetch..."

chmod +x ifetch-launcher.sh
chmod +x ifetch.sh
chmod +x modules/*

sudo mkdir -p /usr/bin

sudo cp ifetch-launcher.sh /usr/bin/ifetch

sudo mkdir -p /etc/ifetch
sudo cp ifetch.sh /etc/ifetch/ifetch.sh
sudo cp ifetch.config /etc/ifetch/ifetch.config
sudo cp help.txt /etc/ifetch/help.txt
sudo cp logo.txt /etc/ifetch/logo.txt
	
sudo cp -r modules /etc/ifetch/
sudo cp -r presets /etc/ifetch/

echo "[+] Successfully installed ifetch"
ifetch