#!/usr/bin/env zsh

CWD=$(pwd)
if ! command -v stow >/dev/null 2>&1; then
    echo "GNU Stow not installed"
    exit 1
fi

"$CWD/setup/decrypt.sh" || { echo "Decrypt failed"; exit 1; }

# install tpm if there's no ~/.tmux/plugins/tpm
if [ ! -d ~/.tmux/plugins/tpm ]; then
	echo "installing tpm"
	git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
else
	echo "tpm already installed"
fi

# extract dot-skm
tar -xzf "$CWD/common/dot-skm.tar.gz"

mv "$CWD/common/dot-sshed" "$CWD"

echo "installing dotfiles"
stow --dotfiles --adopt .

chmod +x "$HOME"/.scripts/*
