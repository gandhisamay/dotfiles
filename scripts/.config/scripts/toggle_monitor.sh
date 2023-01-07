#!/bin/bash

CURRENT_MONITOR=$(xrandr --listactivemonitors)
HDMI="HDMI-1-0"
NOT_FOUND="not found"

if grep -q "$HDMI" <<< "$CURRENT_MONITOR"; then
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
