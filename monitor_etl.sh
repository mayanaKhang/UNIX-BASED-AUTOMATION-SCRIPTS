#!/bin/bash
# File: monitor_etl.sh
#3. ETL Job Monitoring Script
#Purpose: Monitor if an ETL process is stuck or failed.

PROCESS_NAME="etl_loader"
LOGFILE="/opt/bcbs_app/logs/etl_monitor.log"

if pgrep -f "$PROCESS_NAME" > /dev/null
then
    echo "$(date): $PROCESS_NAME is running." >> "$LOGFILE"
else
    echo "$(date): ALERT! $PROCESS_NAME is NOT running." >> "$LOGFILE"
    # Optionally restart or send alert
    # /etc/init.d/etl_loader start
fi
