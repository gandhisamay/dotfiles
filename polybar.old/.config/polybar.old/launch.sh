#!/usr/bin/env bash

killall -q polybar

# tee -a /tmp/polybar.log
polybar my_bar 2>&1 | tee -a /tmp/polybar.log & disown
