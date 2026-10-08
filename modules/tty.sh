#!/bin/sh
echo "TTY: $(tty | sed 's|/dev/||')"