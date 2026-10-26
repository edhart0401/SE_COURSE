#!/usr/bin/env bash

if [ "$#" -lt 2 ]; then
    echo "Ensure at least two arguments are provided"
    exit 1
fi

if [[ ! "$1" =~ ^[0-9]+$ ]]; then
    echo "Ensure argument one contains only digits"
    exit 1
fi

REPEAT=$((10#$1))

if [ "$REPEAT" -lt 1 ]; then
    echo "Ensure argument one is at least one"
    exit 1
fi

shift
TEXT="$*"

INDEX=1

while (( INDEX <= REPEAT )); do
    echo "$TEXT"
    (( INDEX++ ))
done
