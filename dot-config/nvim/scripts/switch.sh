#!/bin/bash

# quit if not in tmux session with error message
if [[ -z "$TMUX" ]]; then
  echo "Not in tmux session"
  exit 1
fi

target_dir=$1
if [[ ! -d "$target_dir" ]]; then
  echo "Target dir does not exist"
  exit 1
fi

current_session=$(tmux display-message -p '#S')

function do_nvim() {
  session="01-Neovim"

  tmux rename-window -t $session:nvim 'to-kill-later'
  tmux new-window -t $session -n nvim
  tmux send-keys -t $session:nvim "cd $target_dir" C-m
  tmux send-keys -t $session:nvim "nvim" C-m

  tmux select-window -t $session:nvim
  tmux kill-window -t $session:to-kill-later
}


function do_term() {
  session="02-Terminal"

  tmux rename-window -t $session:term 'to-kill-later'
  tmux new-window -t $session -n term
  tmux send-keys -t $session:term "cd $target_dir" C-m
  tmux split-window -h -t $session:term
  tmux send-keys -t $session:term.1 "cd $target_dir" C-m
  tmux select-pane -t $session:term.0

  tmux select-window -t $session:term
  tmux kill-window -t $session:to-kill-later
}


function do_things() {
  do_nvim 
  do_term

  if [[ "$current_session" != "01-Neovim" ]]; then
    tmux switch-client -t "01-Neovim" 
  fi
}

do_things &

