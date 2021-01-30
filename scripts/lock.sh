#!/bin/sh

i3lock \
--nofork \
--image=/home/$USER/.config/i3/background.png \
--clock \
--indicator \
--pass-media-keys \
--pass-screen-keys \
--pass-power-keys \
--insidevercolor=00000000 \
--insidewrongcolor=00000000 \
--insidecolor=00000000 \
--ringcolor=90A4AEff \
--ringvercolor=263238FF \
--ringwrongcolor=263238FF \
--line-uses-ring \
--keyhlcolor=263238FF \
--bshlcolor=FF5722FF \
--verifcolor=ffffffff \
--wrongcolor=ffffffff \
--layoutcolor=ffffffff \
--timecolor=ffffffff \
--datecolor=ffffffff \
--greetercolor=ffffffff \
--greetertext=$PINCH \
--veriftext=... \
--wrongtext=T_T \
--radius=100