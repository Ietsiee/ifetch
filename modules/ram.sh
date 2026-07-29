#!/bin/sh

used=$(free -m | awk '/Mem:/ {print $3}')
total=$(free -m | awk '/Mem:/ {print $2}')

echo "Ram: ${used}MB / ${total}MB"
