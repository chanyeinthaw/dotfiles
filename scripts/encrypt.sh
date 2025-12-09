#!/usr/bin/env zsh

ONLY=$1
CWD=$(pwd)

source "$CWD/scripts/passwordman.sh"
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

	if [[ "$dir" == "common" ]]; then
		tar -czf dot-skm.tar.gz "./dot-skm"
		mv dot-skm.tar.gz "$CWD/common"
		cp dot-sshed "$CWD/common"
	fi

  CRP_PASSWORD="$CRP_PASSWORD" "$CWD/scripts/crypto.sh" -t enc "$CWD/$dir"
done
