#!/bin/bash

sleep 1 

i3-msg '[class="Alacritty" title="secondary"] move to workspace 10'

sleep 1

i3-msg '[class="Alacritty" title="secondary"] move container to down'
