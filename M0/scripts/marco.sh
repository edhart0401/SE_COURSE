#!/usr/bin/env bash

marco() {
    MARCO_DIR=$(pwd)
}

polo() {
    if [ -z "$MARCO_DIR" ]; then
        echo "Call marco first"
        return 1
    fi

    if [ -d "$MARCO_DIR" ]; then
        cd "$MARCO_DIR" || return 1
        echo "Changed to $MARCO_DIR"
    else
        echo "Directory $MARCO_DIR does not exist"
        return 1
    fi
}