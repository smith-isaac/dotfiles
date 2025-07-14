#!/usr/bin/env bash

arduino-cli board list -w --json | jq -r '"\(.eventType) \(.port.address)\(if .matching_boards then " (\(.matching_boards[0].name))" else "" end)"'
