#!/bin/sh
echo "CPU: $(grep 'model name' /proc/cpuinfo | head -n 1 | cut -d: -f2)"
