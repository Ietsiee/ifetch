#!/bin/sh
echo "Process: $(ps | awk 'NR > 1 { n++ } END { print n + 0 }')"