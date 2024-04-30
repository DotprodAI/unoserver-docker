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

# Check if file exists
if [ ! -f "$file_path" ]; then
    echo "LibreOffice process file not found at ${file_path}"
    exit 0
fi

# Read PID from file
pid=$(cat "$file_path")

# Check if process with pid is running
# NOTE: we don't have `ps -p $pid` on Alpine Linux, we use instead a custom grep.
if ps | grep "^[ ]*$pid[ ]" > /dev/null; then
    echo "LibreOffice interface process is running"
    exit 0
else
    echo "LibreOffice interface process is not running"
    exit 1
fi
