# Welcome

My beloved dotfiles. First time using linux and neovim after being heavily inspired by ThePrimeagen and I'm loving it.

![my current riced setup](rice.jpeg)
*My riced setup. (I have 2 monitors causing the gap)* 

## My Favourite/Essential Linux Tools/Programs ( needed to be installed ):

----------

- [Neovim <33](https://github.com/neovim/neovim/blob/master/INSTALL.md)
- [oh-my-bash](https://github.com/ohmybash/oh-my-bash)
- [tmux](https://github.com/tmux/tmux/wiki/Installing)
- [i3 windows manager](https://i3wm.org/)
- [alacritty](https://github.com/alacritty/alacritty?tab=readme-ov-file)
- [polybar](https://github.com/polybar/polybar/wiki/Configuration)
- [mangohud](https://github.com/flightlessmango/MangoHud)
- git and github cli (gh)
- cava
- calibre
- TLDR
- neofetch
- btop
- fzf
- thunar
- bat
- ffmpeg
- copyq
- feh
- redshift
- flameshot
- pavucontrol
- dust
- xcape
- stow (still about to implement when i have the time)
- openssh-server

## Icons 
----------

To have icons in terminal/neovim, you need a [patched font](https://www.nerdfonts.com/font-downloads).
   
## Mount them drives
----------

1. List available drives
```
lsblk or sudo fdisk -l
```

2. Make mmount point directory
```
sudo mkdir -p /path/to/mount/
```

3. Verify mount
```
df -h
```

4. Edit /etc/fstab to mount automatically on boot
```
/dev/<sdXn>  /mnt/<your drive name>  <file system (listed on lsblk. windows is ntfs-3)>  <permissions. use "defaults" without quotes if you're not sure. gives rw access>  <fsck. check the disk on boot. 0=not checked>  <dump. how often filesystem is backed up. 0=not backed up>
```

## Backup guide 
----------

[Backup guide](https://ubuntuforums.org/showthread.php?t=35087)
*still yet to do this* 

## GTK Dark Theme on i3
----------

Followed this [github post](https://github.com/i3/i3/discussions/5896#discussioncomment-8556941)

TLDR:

Make a config file for xdg-desktop-portal i.e. $HOME/.config/xdg-desktop-portal/portals.conf

add this config:
```
[preferred]
default=gtk;wlr
```
then ....

Add the following code to: ~/.config/gtk-3.0/settings.ini

```
[Settings]
gtk-application-prefer-dark-theme=1
```

## Multi-Monitor Setup on Login
----------

My workaround:

1. Sign in via Ubuntu rather than i3wm
2. Set up your monitors in the settings
3. Copy this display config to gdm3
```
sudo cp ~/.config/monitors.xml /var/lib/gdm3/.config
```

## Issues
----------

### Booting Problems (so far experienced one booting problem) 

- nvidia persistence daemon failed
    - [this guide worked](https://community.frame.work/t/solved-ubuntu-wont-boot-hangs-when-displaying-logs/29148)
    - On Grub, go to Advanced Options for Ubuntu (might be called something a little different)
    - Scroll to an option that says (recovery) at the end of the listing and press enter.
    - Wait for the magenta screen with a list of options to show up, then select the option that says “root” and says something about going into a terminal or bash or something.
    - run sudo apt update, sudo apt upgrade
    - run sudo apt-get install --reinstall ubuntu-desktop
    - then sudo reboot

### Package Install Error

E: The package <package-name> needs to be reinstalled, but I can't find an archive for it.
```
sudo dpkg --remove --force-all <package-name> 
```

## FOR LAPTOP
----------

**Add this for touchpad and other keybinds**
```
# Pulse Audio controls
bindsym XF86AudioRaiseVolume exec --no-startup-id pactl set-sink-volume 0 +5% #increase sound volume
bindsym XF86AudioLowerVolume exec --no-startup-id pactl set-sink-volume 0 -5% #decrease sound volume
bindsym XF86AudioMute exec --no-startup-id pactl set-sink-mute 0 toggle # mute sound

# Sreen brightness controls
bindsym XF86MonBrightnessUp exec xbacklight -inc 20 # increase screen brightness
bindsym XF86MonBrightnessDown exec xbacklight -dec 20 # decrease screen brightness

# Touchpad controls
bindsym XF86TouchpadToggle exec /some/path/toggletouchpad.sh # toggle touchpad

# Media player controls
bindsym XF86AudioPlay exec playerctl play
bindsym XF86AudioPause exec playerctl pause
bindsym XF86AudioNext exec playerctl next
bindsym XF86AudioPrev exec playerctl previous
```
**Enable one tap click for laptop**

Add the following code in /etc/X11/xorg.conf.d/90-touchpad.conf
```
Section "InputClass"
        Identifier "touchpad"
        MatchIsTouchpad "on"
        Driver "libinput"
        Option "Tapping" "on"
        Option "NaturalScrolling" "true"
        Option "TappingButtonMap" "lrm" # 1/2/3 finger, for 3-finger middle lrm
EndSection
```

## TMUX
----------

**Colors**

Run echo $TERM 

On tmux.conf add:
```
set-option -a terminal-features '<change to $TERM value>:RGB'
```
You can also set the $TERM varibale to your desired value e.g. xterm-256color:RGB. On alacritty it's running 'alacritty' and I dont like the undercurl it gives.

**TMUX Sessioniser** 

Add this code on .bashrc for tmux sessionizer to work
```bashrc
function ctrl_f_search() {
    ~/bin/.local/scripts/tmux-sessionizer
}

bind -x '"\C-f": ctrl_f_search'
```

**Plugins**

You need tmux plugin manager to install plugins for tmux. **Remember to specify which folder you save it**
```
git clone https://github.com/tmux-plugins/tpm.git <PATH>  
```

## Neovim:
----------

I am using [packer.nvim](https://github.com/wbthomason/packer.nvim) to handle my plugins. You need to clone it first before being able to install plugins.



## Miscs
----------

iykyk @nClientDownloadEnableHTTP2PlatformLinux 0
