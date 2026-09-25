#!/bin/sh
city="${1:-Amsterdam}"
echo "Weather: $(curl -s "https://wttr.in/$city?format=%t+%C")"
