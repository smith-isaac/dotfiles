#!/usr/bin/env bash

find ~/.arduino15 -type f -path '*/examples/*.ino'
# installed_libs_examples=($(arduino-cli lib list --json | jq -r '.installed_libraries[].library.examples[]'))
