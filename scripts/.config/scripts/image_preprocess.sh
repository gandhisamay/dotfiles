convert -resize $(xdpyinfo | grep dimensions | cut -d\  -f7 | cut -dx -f1) joker.jpg joker_resized.png
