#!/bin/bash
# File: cleanup_old_logs.sh

LOG_DIR="/opt/bcbs_app/logs"
DAYS=7

echo "Cleaning up logs older than $DAYS days from $LOG_DIR..."
find "$LOG_DIR" -type f -name "*.log" -mtime +$DAYS -exec rm -f {} \;
echo "Cleanup complete."
