#!/usr/bin/env zsh

ONLY=$1
CWD=$(pwd)

source "$CWD/setup/passwordman.sh"
try_readpwd
CRP_PASSWORD=$(readpwd)

dirs=(
  dot-zshrc.d
  dot-aws
  dot-ssh
	common
)

for dir in $dirs; do
	if [[ ! -z "$ONLY" && "$dir" != "$ONLY" ]]; then
		continue
	fi

  CRP_PASSWORD="$CRP_PASSWORD" "$CWD/setup/crypto.sh" -t dec "$CWD/$dir"
done
