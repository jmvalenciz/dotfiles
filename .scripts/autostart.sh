#!/bin/env sh

setxkbmap latam
udiskie -an&
nm-applet&
##pulseaudio&
nitrogen --restore&
##clipit&
light-locker --lock-on-suspend
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1&
