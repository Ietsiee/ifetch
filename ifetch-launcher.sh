#!/bin/sh

case "$1" in
    -h|--help)
        cat /etc/ifetch/help.txt
        ;;
    -v|--version)
        echo ifetch: 1.0.0
        ;; 
    -u|--update)
        curl -fsSL https://raw.githubusercontent.com/Ietsiee/ifetch/main/setup-ifetch.sh | sh
        ;;
    -d|--default)
        echo "Do you want to reset your user config to the default? (y/N)"
        echo -n "> "
        read answer

        if [ "$answer" = "y" ] || [ "$answer" = "Y" ]; then
            cp /etc/ifetch/ifetch.config "$HOME/.config/ifetch/ifetch.config"
            echo "Done"
            ifetch
        else
            echo "Cancelled"
        fi
        ;;
    "")
        /etc/ifetch/ifetch.sh
        ;;
    *)
        echo "Unkown option: $1"
        echo "use 'ifetch --help' for help"
        ;;
esac
