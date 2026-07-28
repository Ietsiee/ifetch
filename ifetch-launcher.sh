#!/bin/sh

case "$1" in
    -h|--help)
        cat /etc/ifetch/help.txt
        ;;
    -v|--version)
        echo ifetch: 1.0.0
        ;; 
    -u|--update)
        echo "Updating..."
        curl -fsSL https://raw.githubusercontent.com/Ietsiee/ifetch/main/setup-ifetch.sh | sh
        ;;
    "")
        /etc/ifetch/ifetch.sh
        ;;
    *)
        echo "Unkown option: $1"
        echo "use 'ifetch --help' for help"
        ;;
esac
