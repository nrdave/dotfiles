#!/bin/sh
#
# Wrapper script for brightnessctl that outputs notifications

# The change in brightness on each up/down - in percent
# I chose percent because raw brightness values vary between displays,
# while percent is universal
brightness_step=5

# Time in ms for notifications to last
notification_life=1500

# Name to use for app-name in notify-send
app_name="brightness-notification-script"

# notify-send options that should always be used. 
# These flags allow consolidation of arguments to notify-send in one place
notify_send_flags="-a $app_name -t $notification_life"

get_brightness() {
	# Get the current brightness raw value
	raw_brightness=$(brightnessctl get)
	# Get the max brightness - used to calculate the
	# brightness as a percent
	max_brightness=$(brightnessctl max)

	# Calculate the brightness as a percent. First multiply by 
	# 100 (the percent conversion) because bash only does integer
	# division - if we divided raw_brightness by max_brightness first,
	# the result of that calculation would be 0 except when the display was at
	# max brightness.
	#
	# Of course, because integer division, we lose some accuracy, but it's a
	# percent at most, which I'm okay with if it means no dependencies.
	brightness=$((raw_brightness * 100 / max_brightness))
	echo $brightness
}

notification() {
	brightness=$(get_brightness)
	text="Brightness: $brightness%"

	if [ $((brightness)) -le 25 ]; then
		icon="notification-display-brightness-low"
	elif [ $((brightness)) -le 50 ]; then
		icon="notification-display-brightness-medium"
	elif [ $((brightness)) -le 75 ]; then
		icon="notification-display-brightness-high"
	else
		icon="notification-display-brightness-full"
	fi
	notify-send -i "$icon" $notify_send_flags --hint=INT:value:$brightness "$text"
}

# Figure out what to do based on the argument
case $1 in
	up)
		brightnessctl set $brightness_step%+
		notification
		;;
	down)
		brightnessctl set $brightness_step%-
		notification
		;;
	nano-up)
		brightnessctl set 1+
		notification
		;;
	nano-down)
		brightnessctl set 1-
		notification
		;;
esac
