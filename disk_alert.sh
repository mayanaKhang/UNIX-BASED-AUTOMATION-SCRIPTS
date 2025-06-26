#!/bin/bash
# File: disk_alert.sh
#Alert When Disk Usage Exceeds 90%

THRESHOLD=90
EMAIL="admin@bcbs-support.com"

df -h | grep '^/dev/' | while read line; do
  usage=$(echo $line | awk '{print $5}' | sed 's/%//')
  mount=$(echo $line | awk '{print $6}')
  if [ "$usage" -ge "$THRESHOLD" ]; then
    echo "Disk usage alert: $usage% used on $mount" | mail -s "Disk Alert on $(hostname)" $EMAIL
  fi
done
