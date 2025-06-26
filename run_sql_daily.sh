#!/bin/bash
# File: run_sql_daily.sh
#4. SQL Script Runner (with Logging)
#Purpose: Run scheduled SQL scripts and log output.

SQLPLUS="/u01/app/oracle/product/19.0.0/dbhome_1/bin/sqlplus"
DB_USER="user/pass@dbname"
SCRIPT="/opt/bcbs_app/sql/active_policies.sql"
LOGFILE="/opt/bcbs_app/logs/sql_output_$(date +%F).log"

echo "Running SQL script: $SCRIPT"
$SQLPLUS -s "$DB_USER" <<EOF > "$LOGFILE"
SET PAGESIZE 500
SET LINESIZE 200
SET FEEDBACK OFF
SET VERIFY OFF
@${SCRIPT}
EXIT
EOF

echo "SQL execution completed. Output logged in $LOGFILE"
