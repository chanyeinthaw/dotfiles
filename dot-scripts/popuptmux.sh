#!/usr/bin/env zsh

session="_popup_$(tmux display -p '#S')"

if ! tmux has -t "$session" 2> /dev/null; then
  parent_session="$(tmux display -p '#{session_id}')"
  parent_path="$(tmux display -p '#{pane_current_path}')"
  session_id="$(tmux new-session -dP -s "$session" -F '#{session_id}' -c "$parent_path" -e TMUX_PARENT_SESSION="$parent_session")"
  tmux set-option -s -t "$session_id" key-table popup
  tmux set-option -s -t "$session_id" status off
  tmux set-option -s -t "$session_id" prefix None
  session="$session_id"
fi

exec tmux attach -t "$session" > /dev/null
