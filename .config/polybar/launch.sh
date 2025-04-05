#!/usr/bin/env bash

# Terminate already running bar instances
# If all your bars have ipc enabled, you can use 
polybar-msg cmd quit
# Otherwise you can use the nuclear option:
# killall -q polybar

export BATTERY_FULL_ICON="%{F$COLOR_PRIMARY}󰋑 %{F-}"

# Launch bar1 and bar2
echo "---" | tee -a /tmp/polybar1.log /tmp/polybar2.log
polybar panel 2>&1 | tee -a /tmp/polybar1.log & disown

echo "Bars launched..."
