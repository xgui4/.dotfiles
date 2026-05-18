#!/bin/bash

export POLYBAR_BAT=$(ls -1 /sys/class/power_supply/ | grep -E '^BAT' | head -n 1)
export POLYBAR_ADAPTER=$(ls -1 /sys/class/power_supply/ | grep -E '^AD|^AC' | head -n 1)

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch Polybar, using default config location ~/.config/polybar/config
polybar main --config=~/.config/polybar/config.ini &
polybar second --config=~/.config/polybar/config.ini &

echo "Polybar launched..."