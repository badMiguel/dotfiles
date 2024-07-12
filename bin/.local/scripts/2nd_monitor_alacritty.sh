#!/usr/bin/env bash

focused_workspace() {
    i3-msg -t get_workspaces | jq -r '.[] | select(.focused == true) | .name'
}

if [[ $(focused_workspace) -eq 10 ]]; then
    alacritty -o 'font.size=11'
elif [[ $(focused_workspace) -ne 10 ]]; then
    alacritty
fi


