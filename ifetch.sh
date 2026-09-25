#!/bin/sh

# Find config file
if [ -n "$1" ]; then
    config="$1"
elif [ -f "$HOME/.config/ifetch/ifetch.config" ]; then
    config="$HOME/.config/ifetch/ifetch.config"
else
    config="/etc/ifetch/ifetch.config"
fi

# Read config file
while IFS= read -r line
do
    # Skip empty lines
    [ -z "$line" ] && continue

    # Skip comments
    case "$line" in
        \#*) continue ;;
    esac

    # Read module
    case "$line" in
        module=*)
            args="${line#module=}"
            color=""

            # Read color option
            eval "set -- $args"
            module="$1"
            shift

            while [ $# -gt 0 ]; do
                case "$1" in
                    --color)
                        color="$2"
                        shift 2
                        ;;
                    *)
                        break
                        ;;
                esac
            done

            output=$(/etc/ifetch/modules/"$module".sh "$@")

            # Colors
            case "$color" in
                black)   color=30 ;;
                red)     color=31 ;;
                green)   color=32 ;;
                yellow)  color=33 ;;
                blue)    color=34 ;;
                magenta) color=35 ;;
                cyan)    color=36 ;;
                white)   color=37 ;;
                default) color=39 ;;
                *)       color="" ;;
            esac

            if [ -n "$color" ]; then
                printf '\033[%sm%s\033[0m\n' "$color" "$output"
            else
                printf '%s\n' "$output"
            fi
            ;;
    esac

done < "$config"
