# Welcome

This is my first time using Linux + Noevim! I am using WSL though since I don't want the struggle of having to reboot to play games :3

> [!NOTE]
> Note to future self. Add this code on .bashrc for tmux sessionizer to work

```bashrc
function ctrl_f_search() {
    ~/bin/.local/scripts/tmux-sessionizer
}

bind -x '"\C-f": ctrl_f_search'
```
