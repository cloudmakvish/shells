#!/bin/bash
echo
echo
echo "Checking the size of log file file.log under Logs directory /home/ubuntu/app-logs/"
log_file=/home/ubuntu/app-logs/file.log
max_size=100 # in KB (100KB)
echo
echo
# Check if the file size is lesser than the defined max size
if [ $(du -k "$log_file" | awk '{ print $1 }') -lt $max_size ]; then
    echo "The size of the log file [file.log] is less than the defined file size i.e, less than 100 KB"
fi
echo
# Check if the file size is greater than the defined max size
if [ $(du -k "$log_file" | awk '{ print $1 }') -gt $max_size ]; then
    echo "The size of the log file [file.log] is greater than the defined file size i.e, greater than 100 KB"
    echo
    echo "The size of the log file is $(du -k "$log_file" | awk '{ print $1 }') KB"
    echo
    # Rotate the log file
    timestamp=$(date "+%Y%m%d%H%M%S")
    mv "$log_file" "$log_file.$timestamp"
    gzip "$log_file.$timestamp" | mv "$log_file.$timestamp".gz /home/ubuntu/app-logs-backup/
    echo
    echo "The log file has been compressed and moved to Logs backup directory /home/ubuntu/app-logs-backup/"
fi
echo
echo
