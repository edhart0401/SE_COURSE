#!/bin/bash

if [ "$#" -eq 0 ]; then
    echo "Please provide at least 1 argument"
    exit 1
fi

set -euo pipefail

# Start CPU stress in background
stress --cpu 8 &
STRESS_PID=$!

trap 'kill -0 "$STRESS_PID" 2>/dev/null && kill "$STRESS_PID"' EXIT

# Setup log file
LOGFILE="test_runs_$(date +%s).log"
echo "Logging to $LOGFILE"

# Run tests until one fails
RUN=1
while "$@" > "$LOGFILE" 2>&1; do
    echo "Run $RUN passed"
    ((RUN++))
done

# Cleanup and report
echo "Test failed on run $RUN"
echo "Last 20 lines of output:"
tail -n 20 "$LOGFILE"
echo "Full log: $LOGFILE"
