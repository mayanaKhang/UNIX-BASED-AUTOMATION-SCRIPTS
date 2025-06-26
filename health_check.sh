#!/bin/bash
# File: health_check.sh
#2. Application Health Check Script
#Purpose: Check disk, memory, and API health, and log the results.

echo "==== Health Check Report ====" >> /opt/bcbs_app/logs/health_report.log
echo "Timestamp: $(date)" >> /opt/bcbs_app/logs/health_report.log

echo "Disk Usage:" >> /opt/bcbs_app/logs/health_report.log
df -h >> /opt/bcbs_app/logs/health_report.log

echo "Memory Usage:" >> /opt/bcbs_app/logs/health_report.log
free -m >> /opt/bcbs_app/logs/health_report.log

echo "Top 5 CPU-consuming processes:" >> /opt/bcbs_app/logs/health_report.log
ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%cpu | head -n 6 >> /opt/bcbs_app/logs/health_report.log

echo "API Status Check:" >> /opt/bcbs_app/logs/health_report.log
curl -s -o /dev/null -w "%{http_code}" http://localhost:8080/member/api/status >> /opt/bcbs_app/logs/health_report.log

echo "==============================" >> /opt/bcbs_app/logs/health_report.log
