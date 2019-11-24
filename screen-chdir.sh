#!/bin/bash

screenpid=`echo -n $STY | tr '.' '\n' | head -n 1`
ps --ppid $screenpid -o pid= | while read pid
do
    number=`cat /proc/$pid/environ | \
        tr '\0' '\n' | \
        sed -n 's/WINDOW=\([[:digit:]]\)/\1/p'`

    if [[ "$number" == "$WINDOW" ]]; then
        screen -X chdir `lsof -p $pid | awk '{ if ($4 == "cwd") { print $9 } }'`
        break
    fi
done
