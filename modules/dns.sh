#!/bin/sh
echo "DNS: $(awk '/^nameserver/ {print $2; exit}' /etc/resolv.conf)"