#!/bin/bash

wallpaper_dir="$HOME/Pictures/wallpaper"

while true; do
	# Pick a random wallpaper from the folder
	img=$(find "$wallpaper_dir" -type f | shuf -n 1)

	# Kill previous swaybg processes
	pkill swaybg

	# Set wallpaper for all connected outputs
	for output in $(swaymsg -t get_outputs | grep name | cut -d '"' -f4); do
		swaybg -o "$output" -i "$img" -m fill &
	done

	# Wait 5 minutes
	sleep 300
done
