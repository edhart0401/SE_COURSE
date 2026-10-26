#! /usr/bin/env bash

# Define log directory for this script
LOG_DIR=~/SE_COURSE/scripts/logs

mkdir -p "$LOG_DIR"

> "$LOG_DIR/stdout_log.txt" 'true'
> "$LOG_DIR/stderr_log.txt" 'true'

run_counter=0

while "$(dirname "$0")/random_fail.sh" 1>>"$LOG_DIR/stdout_log.txt" 2>>"$LOG_DIR/stderr_log.txt"; do
    ((run_counter++))
done

((run_counter++))

cat "$LOG_DIR/stdout_log.txt"
cat "$LOG_DIR/stderr_log.txt"
echo "Number of runs until failure: $run_counter"
