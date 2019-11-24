#!/bin/bash

# Cleans up the windows in a GNU Screen session after I've been programming for
# a while.
screenpid=`echo -n $STY | tr '.' '\n' | head -n 1`
ps --ppid $screenpid -o pid= | while read pid
do
    # How many children does this window have?
    children=`ps --ppid $pid -o pid= | wc -l`
    # What is this window's number?
    number=`cat /proc/$pid/environ | \
        tr '\0' '\n' | \
        sed -n 's/WINDOW=\([[:digit:]]\)/\1/p'`

    # Skip the window this was invoked from.
    if [[ "$number" == "$WINDOW" ]]; then
        continue
    fi

    case $children in
    0)
        screen -p $number -X stuff ^C
        sleep 0.1
        screen -p $number -X stuff ^d
        ;;
    1)
        comm=`ps --ppid $pid -o comm=`
        case $comm in
        man)
            screen -p $number -X stuff 'q'
            sleep 0.1
            screen -p $number -X stuff ^d
            ;;
        less)
            screen -p $number -X stuff 'q'
            sleep 0.1
            screen -p $number -X stuff ^d
            ;;
        git)
            screen -p $number -X stuff 'q'
            sleep 0.1
            screen -p $number -X stuff ^d
            ;;
        vim)
            screen -p $number -X stuff ^[
            screen -p $number -X stuff ':q'
            screen -p $number -X stuff ^M
            sleep 0.1
            screen -p $number -X stuff ^d
            ;;
        view)
            screen -p $number -X stuff ^[
            screen -p $number -X stuff ':q'
            screen -p $number -X stuff ^M
            sleep 0.1
            screen -p $number -X stuff ^d
            ;;
        esac
        ;;
    esac
done
