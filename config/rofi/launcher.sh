#!/usr/bin/env bash

theme="nord"

dir="$HOME/.config/rofi"

rofi -no-lazy-grab -show drun \
-modi drun \
-theme $dir/themes/$theme \
-show-icons \
-matching regex \
-drun-show-actions

