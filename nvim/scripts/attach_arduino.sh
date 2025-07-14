#!/usr/bin/env bash

if ! command -v fzf &> /dev/null; then
    echo "fzf not found" >&2
    exit 1;
fi

if ! command -v arduino-cli &> /dev/null; then
    echo "arduino-cli not found"
    exit 1;
fi

connected_boards=$(arduino-cli board list --json | jq '[.detected_ports[] | {key: .port.address, value:.matching_boards?[0]}] | from_entries')

num_connected_boards=$(echo $connected_boards | jq 'length')

if [ $num_connected_boards -eq 0 ]; then
    echo "No connected boards, cannot attach" >&2
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

selected_fqbn=$(echo $connected_boards | jq -r --arg port "$selected_port" '.[$port].fqbn')
if [ $selected_fqbn == "null" ]; then
    boards=$(arduino-cli board listall --json | jq '[.boards[] | {key: .name, value:.fqbn}] | from_entries')

    selected_board=$(echo $boards | jq 'keys | .[]' | fzf)

    if [ -z "$selected_board" ]; then
        echo "No board selected, cannot attach" >&2
        exit 1;
    fi

    selected_fqbn=$(echo $boards | jq -r ".$selected_board");
fi

if [ $# -ge 1 ] && [ -a $1 ]; then
    arduino-cli board attach -p $selected_port -b $selected_fqbn "$1";
else
    arduino-cli board attach -p $selected_port -b $selected_fqbn;
fi
