#!/usr/bin/env zsh

ONLY=$1
CWD=$(pwd)

source "$CWD/scripts/passwordman.sh"
try_readpwd
CRP_PASSWORD=$(readpwd)

dirs=(
  dot-zshrc.d
  dot-aws
	common
)

for dir in $dirs; do
	if [[ ! -z "$ONLY" && "$dir" != "$ONLY" ]]; then
		continue
	fi

  CRP_PASSWORD="$CRP_PASSWORD" "$CWD/scripts/crypto.sh" -t dec "$CWD/$dir"
done
