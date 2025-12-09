#!/usr/bin/env zsh

SERVICE_NAME="com.chan.dotfiles"
ACCOUNT_NAME="chan"

readpwd() {
	security find-generic-password -a "$ACCOUNT_NAME" -s "$SERVICE_NAME" -w 2>/dev/null || true
}

try_readpwd() {
  local password
  password=$(readpwd)

  if [[ -z "$password" ]]; then
    read -r -s "password?password: "
    echo ""

    security add-generic-password \
      -a "$ACCOUNT_NAME" \
      -s "$SERVICE_NAME" \
      -w "$password" \
      -U
  fi
}
