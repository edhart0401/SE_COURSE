#!/usr/bin/env bash

pidwait() {

    if [ $# -ne 1 ]; then
        echo "Provide only one PID"
        return 1
    fi

    local pid=$1

    while kill -0 "$pid" 2>/dev/null; do
        sleep 1
    done
}