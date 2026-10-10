#!/bin/sh
set -e

mkdir -p "$PREFIX/tmp"
cd "$PREFIX/tmp"

rm -rf ifetch

rm -rf "$PREFIX/etc/ifetch"
rm -rf "$PREFIX/bin/ifetch"
rm -rf "$PREFIX/usr/bin/ifetch"

echo "[*] Downloading ifetch.tar.gz..."
wget -q -O ifetch.tar.gz https://github.com/Ietsiee/ifetch/archive/refs/heads/main.tar.gz

echo "[*] Extracting..."
tar -xzf ifetch.tar.gz
mv ifetch-main ifetch

cd ifetch

echo "[*] Building ifetch..."
sed -i 's|/etc/ifetch/ifetch.sh|"$PREFIX/etc/ifetch/ifetch.sh"|g' ifetch-launcher.sh
sed -i 's|/etc/ifetch/help.txt|"$PREFIX/etc/ifetch/help.txt"|g' ifetch-launcher.sh
sed -i 's|/etc/ifetch/presets|"$PREFIX/etc/ifetch/presets"|g' ifetch-launcher.sh

sed -i 's|/etc/ifetch/logo.txt|"$PREFIX/etc/ifetch/logo.txt"|g' logo.sh

chmod +x ifetch-launcher.sh
chmod +x ifetch.sh
chmod +x modules/*

echo "[+] Successfully build ifetch"

echo "[*] Installing ifetch..."
cp ifetch-launcher.sh "$PREFIX/bin/ifetch"

mkdir -p "$PREFIX/etc/ifetch"
cp ifetch.sh "$PREFIX/etc/ifetch/ifetch.sh"
cp ifetch.config "$PREFIX/etc/ifetch/ifetch.config"
cp help.txt "$PREFIX/etc/ifetch/help.txt"
cp logo.txt "$PREFIX/etc/ifetch/logo.txt"
	
cp -r modules "$PREFIX/etc/ifetch/"
cp -r presets "$PREFIX/etc/ifetch/"

echo "[*] Cleaning up..."
cd ..
rm -rf ifetch
rm -f ifetch.tar.gz

echo "[+] Successfully installed ifetch"
ifetch