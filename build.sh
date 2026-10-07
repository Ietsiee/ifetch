#!/bin/sh
set -e

case "$1" in
    install)
        echo  "[*] Installing ifetch..."
        mkdir -p /usr/bin
        cp ifetch-launcher.sh /usr/bin/ifetch

        mkdir -p /etc/ifetch
        cp ifetch.sh /etc/ifetch/ifetch.sh
        cp ifetch.config /etc/ifetch/ifetch.config
        cp help.txt /etc/ifetch/help.txt
        cp logo.txt /etc/ifetch/logo.txt
	
        cp -r modules /etc/ifetch/
        cp -r presets /etc/ifetch/

        echo "[+] Successfully installed ifetch"
        ;;
    uninstall)
        echo "[*] Uninstalling ifetch..."
        rm -f /usr/bin/ifetch
	    rm -rf /etc/ifetch

        echo "[+] Successfully uninstalled ifetch"
        ;;
    *)
        echo "[*] Building ifetch..."
        chmod +x ifetch-launcher.sh
        chmod +x ifetch.sh
        chmod +x modules/*

        echo "[+] Successfully build ifetch"
        ;;
esac