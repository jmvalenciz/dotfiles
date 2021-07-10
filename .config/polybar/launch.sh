#!/bin/bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
echo "---" | tee -a /tmp/polybar1.log /tmp/polybar2.log
polybar -c ~/.config/polybar/config.ini main >>/tmp/polybar1.log 2>&1 & disown
echo "Bars launched..."
