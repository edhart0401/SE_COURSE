#!/usr/bin/env bash
set -x
if [ "$#" -eq 0 ]; then echo "Please provide a filename"; elif [ -f "$1" ]; then echo "$1 exists"; else echo "$1 does not exist"; fi
