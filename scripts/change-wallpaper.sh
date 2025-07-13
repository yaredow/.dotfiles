#!/bin/bash

wallpaper_dir="$HOME/Pictures/wallpaper"

while true; do
	# Pick a random wallpaper
	img=$(find "$wallpaper_dir" -type f | shuf -n 1)

	# Start new swaybg first (backgrounded), then kill old one after short delay
	for output in $(swaymsg -t get_outputs | jq -r '.[].name'); do
		swaybg -o "$output" -i "$img" -m fill &
	done

	# Give new swaybg processes a moment to start before killing old ones
	sleep 1
	pkill -o swaybg

	# Wait 5 minutes
	sleep 300
done
