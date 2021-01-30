#!/bin/sh

layout=$(xset -q|grep LED| awk '{ print $10 }')

case "$layout" in
  "00000000") KBD="Us" ;;
  "00001000") KBD="Mm" ;;
  *) KBD="--";
esac

echo $KBD