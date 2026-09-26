#!/bin/sh

case "$1" in
    -h|--help)
        cat /etc/ifetch/help.txt
        ;;
    -v|--version)
        echo "ifetch: 1.0.5"
        ;;
    "")
        /etc/ifetch/ifetch.sh
        ;;
    -*)
        echo "Unknown option: $1"
        echo "Use 'ifetch --help' for help"
        exit 1
        ;;
    *)
        /etc/ifetch/ifetch.sh "$1"
        ;;
esac