#!/bin/bash

# Get the currently connected monitor numbers.
CURRENT_MONITORS=$(xrandr --listactivemonitors)
HDMI="HDMI-1-0"
NOT_FOUND="not found"

if !(grep -q "1" <<< "$CURRENT_MONITORS"); then
  if grep -q "$HDMI" <<< "$CURRENT_MONITORS"; then
    OUTPUT=$(xrandr --output eDP --auto)
    if !(grep -q "$NOT_FOUND" <<< "$OUTPUT"); then
      xrandr --output HDMI-1-0 --off
    fi
  else 
    OUTPUT=$(xrandr --output HDMI-1-0 --auto)
    if !(grep -q "$NOT_FOUND" <<< "$OUTPUT"); then
      xrandr --output eDP --off
    fi
  fi
else 
  notify-send -u normal " xrandr" "Failed to switch monitor, only 1 monitor active."
fi
