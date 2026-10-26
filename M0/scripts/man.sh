#!/usr/bin/env bash
# This script retrieves the man pages for each command-line argument provided,
# saving each manual as a plain text file in the ~/SE_COURSE/.manuals directory.
# For example, running `./man.sh cat grep` will save the manuals for 'cat' and 'grep'
# as ~/SE_COURSE/.manuals/cat.txt and ~/SE_COURSE/.manuals/grep.txt respectively.
# If a manual entry for a specified argument is not found, the script will report it at the end.

# Guard for no arguments provided
if (( $# == 0 )); then
    echo "Usage: $0 command [command ...]"
    echo "Please provide at least one command to retrieve its man page."
    exit 1
fi

# Guard for man command presence
if ! command -v man >/dev/null 2>&1; then
    echo "Error: 'man' command not found. Please install man before running this script."
    exit 1
fi

# Guard for col command presence
if ! command -v col >/dev/null 2>&1; then
    echo "Error: 'col' command not found. Please install col before running this script."
    exit 1
fi

# Ensure the manuals directory exists
MANUALS_DIR=~/SE_COURSE/.manuals
mkdir -p "$MANUALS_DIR"

# Guard for write permission in manuals directory
if [[ ! -w "$MANUALS_DIR" ]]; then
    echo "Error: Cannot write to directory $MANUALS_DIR"
    exit 1
fi

# Keep track of failed manual pages
FAILED_CMDS=()

while (( $# > 0 )); do
    CMD="$1"
    # Try to get the man page, suppress stderr
    if man "$CMD" 2>/dev/null | col -b > "$MANUALS_DIR/$CMD.txt" && [[ -s "$MANUALS_DIR/$CMD.txt" ]]; then
        :
    else
        FAILED_CMDS+=("$CMD")
        # Remove output file if it was created but is empty/bad
        rm -f "$MANUALS_DIR/$CMD.txt"
    fi
    shift
done

if (( ${#FAILED_CMDS[@]} > 0 )); then
    echo "No manual entry found for: ${FAILED_CMDS[*]}"
fi