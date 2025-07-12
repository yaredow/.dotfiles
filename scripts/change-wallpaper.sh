#!/bin/bash
WALLPAPER_DIR="$HOME/Pictures/wallpaper"
INTERVAL=300 # Time in seconds (e.g., 300 = 5 minutes)

while true; do
	# Select a random image from the wallpaper directory
	PIC=$(find "$WALLPAPER_DIR" -type f \( -name "*.jpg" -o -name "*.png" \) | shuf -n 1)
	# Set the wallpaper with feh
	DISPLAY=:0 feh --no-fehbg --bg-fill "$PIC"
	# Wait for the specified interval
	sleep "$INTERVAL"
done
