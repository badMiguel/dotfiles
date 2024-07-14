#!/usr/bin/env bash

focused_workspace() {
    i3-msg -t get_workspaces | jq -r '.[] | select(.focused == true) | .output'
}

if [[ $(focused_workspace) == "HDMI-0" ]]; then
    alacritty -o 'font.size=12'
else
    alacritty
fi


