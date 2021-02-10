#!/bin/sh

egrep ^bind ~/.config/i3/config | cut -d ''' ''' -f 2- | sed '''s/ /\t/''' | pr -2 -w 200 -t | less
