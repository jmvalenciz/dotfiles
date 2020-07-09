#!/bin/env sh

setxkbmap latam
udiskie -an&
##light-locker --lock-on-suspend&
pulseaudio --start&
nitrogen --restore
