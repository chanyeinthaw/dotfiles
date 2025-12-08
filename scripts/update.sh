#!/usr/bin/env zsh

CWD=$(pwd)

read -s "CRP_PASSWORD?password: "
echo ""

CRP_PASSWORD=$CRP_PASSWORD $CWD/scripts/crypto.sh -t upd $CWD/dot-zshrc.d
