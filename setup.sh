#!/bin/sh

touchpadSearchRegex='Touchpad.*id='
touchpadId=$(
  xinput list | 
  grep -Po "$touchpadSearchRegex.*\[" |
  sed "s/$touchpadSearchRegex//" |
  sed "s/[^0-9]//" |
  sed "s/\[//"
)

xinput set-prop $touchpadId "libinput Tapping Enabled" 1
xinput set-prop $touchpadId "libinput Natural Scrolling Enabled" 1