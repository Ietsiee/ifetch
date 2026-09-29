#!/bin/sh
set -e

cd "$PREFIX/tmp"

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
    rm -rf "$PREFIX/etc/ifetch"
    rm -rf "$PREFIX/bin/ifetch"
    rm -rf "$PREFIX/usr/bin/ifetch"
fi

echo "[*] Downloading ifetch.tar.gz..."
wget -q -O ifetch.tar.gz https://github.com/Ietsiee/ifetch/archive/refs/heads/main.tar.gz

echo "[*] Extracting..."
tar -xzf ifetch.tar.gz
mv ifetch-main ifetch

cd ifetch

echo "[*] Installing ifetch..."

sed -i 's|/etc/ifetch/ifetch.sh|"$PREFIX/etc/ifetch/ifetch.sh"|g' ifetch-launcher.sh
sed -i 's|/etc/ifetch/help.txt|"$PREFIX/etc/ifetch/help.txt"|g' ifetch-launcher.sh


chmod +x ifetch-launcher.sh
chmod +x ifetch.sh
chmod +x modules/*

cp ifetch-launcher.sh "$PREFIX/bin/ifetch"

mkdir -p "$PREFIX/etc/ifetch"
cp ifetch.sh "$PREFIX/etc/ifetch/ifetch.sh"
cp ifetch.config "$PREFIX/etc/ifetch/ifetch.config"
cp help.txt "$PREFIX/etc/ifetch/help.txt"
cp logo.txt "$PREFIX/etc/ifetch/logo.txt"
	
cp -r modules "$PREFIX/etc/ifetch/"
cp -r presets "$PREFIX/etc/ifetch/"

mkdir -p "$HOME/.config/ifetch"
cp -r modules "$HOME/.config/ifetch/"
cp -r presets "$HOME/.config/ifetch/"

echo "[*] Cleaning up..."
cd ..
rm -rf ifetch
rm -f ifetch.tar.gz

echo "[+] Successfully installed ifetch"
ifetch