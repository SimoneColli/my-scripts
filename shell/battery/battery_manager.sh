#!/bin/bash

watch=/sys/class/power_supply/AC/online
out=/dev/null
run_script=./ac_connected.sh

inotifywait -m -e CLOSE "$watch" | while read -r directory event file
do
    # -f controlla che il file esista e sia regolare
    if [ -f "$run_script" ]; then
        "$run_script"
    else
        echo "Lo script $run_script non esiste o non e' eseguibile"
    fi
done