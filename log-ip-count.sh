#!/bin/bash

LOGFILE="$1"

# Checking if the log filename is provided
if [ -z "$LOGFILE" ]; then
    echo "USAGE: log-ip-count <log-filename> [-f for creating file for the result]"
    exit 1
fi

# Checking if the log file exists
if [ ! -f "$LOGFILE" ]; then
    echo "Error: The log file '$LOGFILE' does not exist"
    exit 2
fi

# Declare an associative array for counting IP occurrences
declare -A counterMap

# Read the log file line by line
while IFS= read -r line || [[ -n $line ]]; do
    # Extract the first field (IP address)
    IP_ADDRESS=$(echo "$line" | awk '{print $1}')
    ((counterMap["$IP_ADDRESS"]++))
done < "$LOGFILE"

# Create a result file
RESULT_FILE="result_$(date +"%s")"
touch $RESULT_FILE

# Write the results to the result file
for item in "${!counterMap[@]}"; do
  echo "$item: ${counterMap[$item]} requests" >> "$RESULT_FILE"
done

# Sort by frequency (reverse order)
sort -t: -k2 -nr "$RESULT_FILE" -o "$RESULT_FILE"

# Display the results
echo "Top 5 IP addresses with the most requests:"
head -n 5 "$RESULT_FILE"

# Removing the file if not asked for it
if [ -z "$2" ]; then
    rm $RESULT_FILE
fi
