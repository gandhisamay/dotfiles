#! /bin/sh

chosen=$(printf "  Power Off\n  Restart\n  Lock" | rofi -no-config -no-lazy-grab -show drun -modi drun rofi -dmenu -theme ~/.config/polybar/cuts/scripts/rofi/launcher.rasi)

case "$chosen" in
	"  Power Off") poweroff ;;
	"  Restart") reboot ;;
	"  Lock") i3lock --image ~/.config/i3/lockscreen_background.png;; # systemctl suspend;;
	*) exit 1 ;;
esac
