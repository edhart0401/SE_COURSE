#!/usr/bin/env bash

cat ~/.zsh_history ~/.bash_history \
| awk '{
    for ( i = 1; i <= NF; i++ ) {
        if (( $i ~ /^[A-Za-z_][A-Za-z0-9_]*=/ ) || ( $i == "sudo" )) 
        {
            continue
        }
        print $i
        next
    }
}' \
| sed 's#.*/##' \
| sort \
| uniq -c \
| sort -nrk1,1 \
| head -n10