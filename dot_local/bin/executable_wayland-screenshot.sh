#!/bin/bash
#
# A script to wrap taking screenshots in Wayland using grim and slurp
#
# There are a total of 5 options:
# 1. Screenshot area, save to file
# 2. Screenshot whole screen, save to file
# 3. Screenshot area, copy to clipboard
# 4. Screenshot whole screen, copy to clipboard
# 5. Screenshot area, pipe to swappy - a simple image editor

screenshot_dir="$(xdg-user-dir PICTURES)/Screenshots"

screenshot_name="Screenshot_$(date +"%Y-%m-%d_%H-%M-%S").png"

screenshot_loc="$screenshot_dir/$screenshot_name"

mkdir -p "$screenshot_dir"

case $1 in
	area-save)
		grim -g "$(slurp)" $screenshot_loc 
		;;

	screen-save)
		grim $screenshot_loc 
		;;

	area-copy)
		grim -g "$(slurp)" - | wl-copy
		;;

	screen-copy)
		grim - | wl-copy
		;;

	area-swappy)
		grim -g "$(slurp)" - | swappy -f -
		;;
esac
