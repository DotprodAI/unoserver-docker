#!/bin/bash

# health_check.sh - Health check script for monitoring the LibreOffice interface process.
#
# Usage: health_check.sh [file_path]
#   file_path: The path to the file containing the PID of the LibreOffice interface process.
#              Default: /tmp/libreoffice_pid
#
# Exit Codes:
#   0: LibreOffice interface process is running.
#   1: LibreOffice interface process is not running.
#

file_path="${1:-/tmp/libreoffice_pid}"

# Read PID from file
pid=$(cat "$file_path")

# Check if process with PID is running
# NOTE: we don't have `ps -p $PID` on Alpine Linux, we use instead a custom grep.
if ps | grep "^[ ]*$PID[ ]" > /dev/null; then
    echo "LibreOffice interface process is running"
    exit 0
else
    echo "LibreOffice interface process is not running"
    exit 1
fi
