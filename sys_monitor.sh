
#!/bin/bash

# System Info
HOSTNAME=$(hostname)
CPU_LOAD=$(top -bn1 | grep "load average" | awk '{print $12}')
RAM_USAGE=$(free -h | awk '/Mem:/ {print $3 " / " $2}')
DISK_USAGE=$(df -h / | awk 'NR==2 {print $3 " / " $2 " (" $5 " used)"}')
TOP_PROCESSES=$(ps -eo pid,comm,%cpu,%mem --sort=-%cpu | head -n 6)

# Generate Report File
REPORT_FILE="/tmp/system_report.txt"
{
  echo "System Report for $HOSTNAME"
  echo "----------------------------"
  echo "🖥  CPU Load: $CPU_LOAD"
  echo "💾 RAM Usage: $RAM_USAGE"
  echo "🗄  Disk Usage: $DISK_USAGE"
  echo "🔥 Top Processes:"
  echo "$TOP_PROCESSES"
} > "$REPORT_FILE"

# Email Alert Config
TO_EMAIL="azharism51@gmail.com"
SUBJECT="System Monitor Report - $HOSTNAME"
BODY="Hello Azhar,\n\nPlease find the attached system report.\n\nRegards,\nYour Script"

# Send Email using msmtp
msmtp -a gmail -t <<EOF
From: azharism51@gmail.com
To: $TO_EMAIL
Subject: $SUBJECT
Content-Type: text/plain

$BODY

$(cat $REPORT_FILE)
EOF

echo "✅ System report sent to $TO_EMAIL