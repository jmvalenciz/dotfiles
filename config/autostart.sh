#! /usr/bin/bash

# Error fixing for java applications
wmname LG3D

pkill udiskie
udiskie -an&

pkill clipit
clipit&

deadd-notification-center&
nm-applet&

xbacklight -set 35
nitrogen --restore
picom

#light-locker --lock-on-suspend

/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1&
mpDris2&
