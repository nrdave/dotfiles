#!/bin/sh
#
# Wrapper script for wpctl volume changing that adds notification sending
#
# Credit to these folks for a lot of what I did:
# https://gitlab.com/Nmoleo/i3-volume-brightness-indicator/-/blob/main/volume_brightness.sh?ref_type=heads
# https://github.com/JaKooLit/Ja_HyprLanD-dots/blob/main/config/hypr/scripts/volume

# wpctl uses floating point numbers for most options. I could change things so that
# volume step was an integer, but I felt consistency was better
volume_step=0.05
max_volume=1.00

# Time in ms for notifications to last
notification_life=1500

function get_volume() {
	volume=$( 
	# Get the volume using wpctl - returns it in the form: Volume: X.XX
			wpctl get-volume @DEFAULT_AUDIO_SINK@ | 
	# Extract the number
			grep -Po '[0-9].[0-9]{2}' |
	# Convert from fixed point decimal number to integer
			sed 's/\.//g' |
	# Remove leading zeros - using extended regex
			sed -E 's/^0+([0-9]+)/\1/'
	)
	echo $volume
}

function get_muted () {
	# Look for the string [MUTED] in the output of getting the volume
	# wpctl adds this if the sink/source is muted
	# true is 0 for shells, 1 is false
	if wpctl get-volume @DEFAULT_AUDIO_SINK@ | grep -q '[MUTED]'; then
		return 0
	else
		return 1
	fi
}

function get_input_muted () {
	# Look for the string [MUTED] in the output of getting the volume
	# wpctl adds this if the sink/source is muted
	# true is 0 for shells, 1 is false
	if wpctl get-volume @DEFAULT_AUDIO_SOURCE@ | grep -q '[MUTED]'; then
		return 0
	else
		return 1
	fi
}

function volume_notification () {
	# Uses system icons - allows for easier user configuration
	volume=$(get_volume)

	# Determine the notification text
	text="Volume: $volume"

	# Set the icon based on the volume status
	if $(get_muted); then 
		icon="notification-audio-volume-muted"
		# If volume is muted, add text to indicate that as well
		# (icon may be hard to discern)
		text="Volume: $volume (MUTED)"

	elif [ $((volume)) -le 30 ]; then
		icon="notification-audio-volume-low"

	elif [ $((volume)) -le 60 ]; then
		icon="notification-audio-volume-medium"

	else
		icon="notification-audio-volume-high"
	fi

	notify-send -i "$icon" -t $notification_life --hint=INT:value:$volume "$text"
}

function input_notification () {
	# Determine the icon and text based on the muted state of the 
	# default input 
	if $(get_input_muted); then
		icon="audio-input-microphone-muted"
		text="Input Muted"
	else
		icon="audio-input-microphone-high"
		text="Input Unmuted"
	fi
	notify-send -i "$icon" -t $notification_life "$text"
}

# Figure out what to do based on the argument
case $1 in
	output-up)
		wpctl set-volume @DEFAULT_AUDIO_SINK@ $volume_step+ -l $max_volume
		volume_notification
		;;
	output-down)
		wpctl set-volume @DEFAULT_AUDIO_SINK@ $volume_step-
		volume_notification
		;;
	output-mute)
		wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
		volume_notification
		;;
	input-mute)
		wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle
		input_notification
		;;
esac
