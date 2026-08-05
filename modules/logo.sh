#!/bin/sh

#Find logo file
if [ -f "$HOME/.config/ifetch/logo.txt" ]; then
    logo="$HOME/.config/ifetch/logo.txt"
else
    logo="/etc/ifetch/logo.txt"
fi

cat "$logo"
