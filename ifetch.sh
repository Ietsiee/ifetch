#!/bin/sh

while IFS= read -r line
do
    #Skip empty lines
    [ -z "$line" ] && continue

    #Skip comments
    case "$line" in
        \#*) continue ;;
    esac

    #Read module
    case "$line" in
        module=*)
            args="${line#module=}"
            module="${args%% *}"

            color=""

            #Read color option
            set -- $args
            shift

            while [ $# -gt 0 ]; do
                case "$1" in
                    --color)
                        color="$2"
                        shift 2
                        ;;
                    *)
                        shift
                        ;;
                esac
            done

            output=$(/etc/ifetch/modules/$module.sh)

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

done < /etc/ifetch/ifetch.config
