#!/bin/sh

read used total <<EOF
$(df -k / | awk 'NR==2 {print $3, $2}')
EOF

case "$1" in
    -t)
        used=$(awk "BEGIN {printf \"%.2f\", $used/1024/1024/1024}")
        total=$(awk "BEGIN {printf \"%.2f\", $total/1024/1024/1024}")
        unit="TB"
        ;;
    *)
        used=$(awk "BEGIN {printf \"%.1f\", $used/1024/1024}")
        total=$(awk "BEGIN {printf \"%.0f\", $total/1024/1024}")
        unit="GB"
        ;;
esac

echo "Disk: ${used}${unit} / ${total}${unit}"