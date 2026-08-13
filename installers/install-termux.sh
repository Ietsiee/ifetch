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
    echo "Updating ifetch..."
     rm -rf "$PREFIX/etc/ifetch"
     rm -rf "$PREFIX/bin/ifetch"
     rm -rf "$PREFIX/usr/bin/ifetch"
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
sed -i 's|/etc/ifetch/ifetch.sh|"$PREFIX/etc/ifetch/ifetch.sh"|g' ifetch-launcher.sh
sed -i 's|/etc/ifetch/help.txt|"$PREFIX/etc/ifetch/help.txt"|g' ifetch-launcher.sh
cp ifetch-launcher.sh "$PREFIX/bin/ifetch"

mkdir -p "$PREFIX/etc/ifetch"
sed -i 's|/etc/ifetch/modules/\$module\.sh|"$PREFIX/etc/ifetch/modules/$module.sh"|g' ifetch.sh
cp ifetch.sh "$PREFIX/etc/ifetch/ifetch.sh"
cp -r modules "$PREFIX/etc/ifetch/modules"
cp help.txt "$PREFIX/etc/ifetch/help.txt"
cp logo.txt "$PREFIX/etc/ifetch/logo.txt"
cp ifetch.config "$PREFIX/etc/ifetch/ifetch.config"

mkdir -p "$HOME/.config/ifetch"
cp ifetch.config "$HOME/.config/ifetch/ifetch.config"

echo "Cleaning up..."
cd ..
rm -rf ifetch
rm ifetch.tar.gz

echo "Successfully installed ifetch!"
ifetch
