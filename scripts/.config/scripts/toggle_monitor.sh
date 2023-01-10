#!/bin/bash

ACTIVE_MONITORS=$(xrandr --listactivemonitors)
HDMI="HDMI-1-0"
NOT_FOUND="not found"

AVAILABLE_MONITORS=$(xrandr)
CONNECTED="connected"
DISCONNECTED="disconnected"

# s contains the string of AVAILABLE_MONITORS without the CONNECTED string.
s1=${AVAILABLE_MONITORS//"$DISCONNECTED"}
s2=${s1//"$CONNECTED"}
# In this step we subtract the length of the AVAILABLE_MONITORS with and without CONNECTED string. 
# Divide by the length of the CONNECTED string to get the total number of connected monitors.
NUM_MONITORS="$(((${#s1} - ${#s2}) / ${#CONNECTED}))"
echo $NUM_MONITORS

if [ "$NUM_MONITORS" != "1" ]; then
  if grep -q "$HDMI" <<< "$ACTIVE_MONITORS"; then
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
