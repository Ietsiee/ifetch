#!/bin/sh
echo "CPU: $(lscpu | awk -F: '/Model name/ {print $2; exit}' | xargs)"
