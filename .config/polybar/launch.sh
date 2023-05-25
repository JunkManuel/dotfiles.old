#!/usr/bin/env zsh

# kill open bars
polybar-msg cmd quit
# killall -q polybar

# Launch Bars
echo "---" | tee -a /tmp/polybar1.log /tmp/polybar2.log
polybar bar 2>&1 | tee -a /tmp/polybar1.log & disown

echo "Bars launched"
