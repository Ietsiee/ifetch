#!/bin/sh
echo "Network: $(ip -o -4 addr show scope global | awk '{print $4}' | cut -d/ -f1 | head -1)"
