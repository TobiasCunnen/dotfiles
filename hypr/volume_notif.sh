#!/usr/bin/env bash
notification_timer=3

if [ $1 = "volume" ]; then
	# Check if already running
	eww open volume-slider
	if [ $2 = "up" ]; then
		wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+
	else
		wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-
	fi
	sleep $notification_timer
	eww close volume-slider
elif [ $1 = "brightness" ]; then
	eww open brightness-slider
	#TODO change brightness
	sleep $notification_timer
	eww close brightness-slider
fi
