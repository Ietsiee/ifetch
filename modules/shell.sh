#!/bin/sh
echo "Shell: $(basename "$(readlink /proc/$$/exe)")"
