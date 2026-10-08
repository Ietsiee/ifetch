#!/bin/sh

case "$1" in
    -h|--help)
        cat /etc/ifetch/help.txt
        ;;
    -v|--version)
        echo "ifetch: 1.0.6"
        ;;
    -p|--presets)
        echo "Total presets $(find /etc/ifetch/presets -type f | wc -l) in /etc/ifetch/presets"
        ls -1 /etc/ifetch/presets
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