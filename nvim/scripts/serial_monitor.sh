#!/usr/bin/env bash

connected_boards=$(arduino-cli board list --json | jq '[.detected_ports[] | {key: .port.address, value:.matching_boards?[0]}] | from_entries')

num_connected_boards=$(echo $connected_boards | jq 'length')

if [ $num_connected_boards -eq 0 ]; then
    echo "No connected boards" >&2
    exit 1;
elif [ $num_connected_boards -gt 1 ]; then
    selected_port=$(echo $connected_boards | jq -r 'to_entries | .[] | if .value then "\(.key) (\(.value.name))" else .key end' | fzf | cut -d ' ' -f 1)

    if [ -z "$selected_port" ]; then
        echo "No port selected, cannot attach" >&2
        exit 1;
    fi;
else
    selected_port=$(echo $connected_boards | jq -r 'keys[0]');
fi

if [ $# -ge 1 ]; then
    baud=$1;
else
    baud=115200;
fi

exec minicom -D "$selected_port" -b "$baud"
