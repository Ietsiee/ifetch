#!/bin/sh

case "$1" in
    -h|--help)
        cat /etc/ifetch/help.txt
        ;;
    -v|--version)
        echo ifetch: 1.0.5
        ;; 
    "")
        /etc/ifetch/ifetch.sh "$1"
        ;;
    *)
        echo "Unkown option: $1"
        echo "use 'ifetch --help' for help"
        ;;
esac
