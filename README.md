# Welcome

This is my first time using Linux (Ubuntu) + Noevim!  ~~I am using WSL though since I don't want the struggle of having to reboot to play games :3~~ 

Heavily inspired by ThePrimeagen

# Setup Guide

## Ubuntu:

### My Favourite/Essential Linux Tools/Programs ( needed to be installed ):

1. [Neovim <33](https://github.com/neovim/neovim/blob/master/INSTALL.md)
2. Git
3. TLDR
4. [oh-my-bash](https://github.com/ohmybash/oh-my-bash) 

## Neovim:

1. Add this code on .bashrc for tmux sessionizer to work

```bashrc
function ctrl_f_search() {
    ~/bin/.local/scripts/tmux-sessionizer
}

bind -x '"\C-f": ctrl_f_search'
```
2. You need tmux plugin manager to install plugins for tmux. **Remember to specify which folder you save it**

```
git clone https://github.com/tmux-plugins/tpm.git ./plugins/tpm    
```
