#!/usr/bin/env bash

if type "xrandr"; then
    for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
        if [ "$m" = "HDMI-0" ]; then
            MONITOR=$m polybar --reload -c ~/.config/polybar/config_HDMI0 &
        elif [ "$m" = "DP-0" ]; then
            MONITOR=$m polybar --reload -c ~/.config/polybar/config_DP0 &
        fi
    done
else
    polybar --reload polybar -c ~/.config/polybar/config_DP0 &
fi
