#!/bin/sh
echo "Network: $(ip -4 addr show scope global | awk '/inet / {print $2; exit}' | cut -d/ -f1)"