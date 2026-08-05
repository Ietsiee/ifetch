#!/bin/sh

if command -v dpkg >/dev/null; then
    pkgs=$(dpkg -l | grep '^ii' | wc -l)
elif command -v apk >/dev/null; then
    pkgs=$(apk list --installed | wc -l)
elif command -v pacman >/dev/null; then
    pkgs=$(pacman -Q | wc -l)
elif command -v emerge >/dev/null; then
    pkgs=$(find /var/db/pkg -mindepth 2 -maxdepth 2 -type d | wc -l)\
else
    pkgs="Unknown"
fi

echo "Pkgs: $pkgs"
