#!/usr/bin/env zsh

ONLY=$1
CWD=$(pwd)

read -s "CRP_PASSWORD?password: "
echo ""

dirs=(
  dot-zshrc.d
  dot-aws
)

for dir in $dirs; do
	if [[ ! -z "$ONLY" && "$dir" != "$ONLY" ]]; then
		continue
	fi

  CRP_PASSWORD=$CRP_PASSWORD $CWD/scripts/crypto.sh -t dec $CWD/$dir
done
