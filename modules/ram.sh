#!/bin/sh

used=$(free -m | awk '/Mem:/ {print $3}')
total=$(free -m | awk '/Mem:/ {print $2}')
unit="MB"

case "$1" in
    -g)
        used=$(awk "BEGIN {printf \"%.1f\", $used/1024}")
        total=$(awk "BEGIN {printf \"%.1f\", $total/1024}")
        unit="GB"
        ;;
esac

echo "RAM: ${used}${unit} / ${total}${unit}"\
