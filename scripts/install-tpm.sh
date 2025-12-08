#!/usr/bin/env zsh
# install tpm if there's no ~/.tmux/plugins/tpm

if [ ! -d ~/.tmux/plugins/tpm ]; then
	echo "installing tpm"
	git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
else
	echo "tpm already installed"
fi
