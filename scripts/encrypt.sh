#!/usr/bin/env zsh

CWD=$(pwd)

read -s "CRP_PASSWORD?password: "
echo ""

CRP_PASSWORD=$CRP_PASSWORD $CWD/scripts/crypto.sh -t enc $CWD/dot-zshrc.d
CRP_PASSWORD=$CRP_PASSWORD $CWD/scripts/crypto.sh -t enc $CWD/dot-aws
