# keybinds

## window notification kinda
copied from [tmux-conf-with-commentary](https://willhbr.net/2024/03/06/tmux-conf-with-commentary) might be useful someday
```tmux
bind m {
  set -w monitor-bell
  set -w monitor-activity
  display 'window mute #{?#{monitor-bell},off,on}'
}
```
