#!/bin/bash

# Set base directory inside home folder
BASE_DIR="$HOME/AREA51_DO_NOT_ENTER/projects/devops"
LOG_DIR="$BASE_DIR/logs"
BACKUP_DIR="$LOG_DIR/backup"
DATE=$(date +%Y-%m-%d)

# Create directory structure
mkdir -p "$BACKUP_DIR"

# Move into logs directory
cd "$LOG_DIR" || exit

echo "Creating log files..."

# Create 5 log files with today's date
for i in {1..5}; do
    touch "log$i-$DATE.log"
done

echo "Writing sample log data..."

# Write log entry to all files
echo "Sample log generated on $(date)" | tee log*.log > /dev/null

echo "Copying logs to backup..."

# Copy log files into backup
cp log*.log "$BACKUP_DIR"

echo "Creating tar archive..."

# Create tar from the devops directory
cd "$BASE_DIR" || exit
tar -cvf backup.tar logs/backup

echo "Verifying tar contents..."

# List tar contents
tar -tvf backup.tar

echo "Script completed successfully."
