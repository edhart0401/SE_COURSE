#!/usr/bin/env bash

most_recent_file() {
    find "$1" -type f -print0 | xargs -0 stat -f '%m %N' | sort -nrk1,1 | head -n1 | sed -E 's/^[0-9]+ //'
}