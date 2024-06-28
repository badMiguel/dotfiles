# Welcome

This is my first time using Linux (Ubuntu) + Neovim!  

~~I am using WSL though since I don't want the struggle of having to reboot to play games :3~~

Heavily inspired by ThePrimeagen

# Setup Guide

## Ubuntu:

1. My Favourite/Essential Linux Tools/Programs ( needed to be installed ):

    - [Neovim <33](https://github.com/neovim/neovim/blob/master/INSTALL.md)
    - [oh-my-bash](https://github.com/ohmybash/oh-my-bash)
    - [tmux](https://github.com/tmux/tmux/wiki/Installing)
    - git and github cli (gh)
    - TLDR
    - neofetch
    - asciiquarium
    - btop
    - fzf
    - nautilus
    - copyq
    - bat
    - ffmpeg
    - shutter

2. To have icons in terminal/neovim, you need a [patched font](https://www.nerdfonts.com/font-downloads).

3. Booting Problems (so far experienced one booting problem) 
    - nvidia persistence daemon failed
        - [this guide worked](https://community.frame.work/t/solved-ubuntu-wont-boot-hangs-when-displaying-logs/29148)
        - On Grub, go to Advanced Options for Ubuntu (might be called something a little different)
        - Scroll to an option that says (recovery) at the end of the listing and press enter.
        - Wait for the magenta screen with a list of options to show up, then select the option that says “root” and says something about going into a terminal or bash or something.
        - Figure out how to connect to the internet through terminal commands
        - run sudo apt update, sudo apt upgrade
        - run sudo apt-get install --reinstall ubuntu-desktop
        - then sudo reboot

## Neovim:

1. I am using [packer.nvim](https://github.com/wbthomason/packer.nvim) to handle my plugins. You need to clone it first before being able to install plugins.

2. Add this code on .bashrc for tmux sessionizer to work
```bashrc
function ctrl_f_search() {
    ~/bin/.local/scripts/tmux-sessionizer
}

bind -x '"\C-f": ctrl_f_search'
```

3. You need tmux plugin manager to install plugins for tmux. **Remember to specify which folder you save it**
```
git clone https://github.com/tmux-plugins/tpm.git <PATH>  
```
