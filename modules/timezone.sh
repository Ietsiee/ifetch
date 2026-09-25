#!/bin/sh
echo "Timezone: $(readlink /etc/localtime | sed 's#^.*/zoneinfo/##')"
