#!/bin/env sh

setxkbmap latam
urxvtd -q -o -f
nm-applet&
udiskie -an&
light-locker --lock-on-suspend&

