#!/bin/sh

mkdir -p ~/Pictures/Screenshots/$(date +%Y-%m)

FILENAME=~/Pictures/Screenshots/$(date +%Y-%m)/screenshot-$(date +%Y-%m-%d_%H_%M_%S).png

if [ $1 = "area" ]
then
	maim -s -u $FILENAME ; cat $FILENAME | xclip -selection clipboard -t image/png
	if [ -f "$FILENAME" ]; then
		paplay ~/Music/screenshot-sound.wav
	fi
elif [ $1 = "window" ]
then
	maim -u -i $(xdotool getactivewindow) $FILENAME ; cat $FILENAME | xclip -selection clipboard -t image/png
	if [ -f "$FILENAME" ]; then
		paplay ~/Music/screenshot-sound.wav
	fi
elif [ $1 = "screen" ]
then
	MONITORS=$(xrandr | grep -o '[0-9]*x[0-9]*[+-][0-9]*[+-][0-9]*')
	# Get the location of the mouse
	XMOUSE=$(xdotool getmouselocation | awk -F "[: ]" '{print $2}')
	YMOUSE=$(xdotool getmouselocation | awk -F "[: ]" '{print $4}')

	for mon in ${MONITORS}; do
  		# Parse the geometry of the monitor
  		MONW=$(echo ${mon} | awk -F "[x+]" '{print $1}')
  		MONH=$(echo ${mon} | awk -F "[x+]" '{print $2}')
  		MONX=$(echo ${mon} | awk -F "[x+]" '{print $3}')
  		MONY=$(echo ${mon} | awk -F "[x+]" '{print $4}')
  		# Use a simple collision check
  		if (( ${XMOUSE} >= ${MONX} )); then
    			if (( ${XMOUSE} <= ${MONX}+${MONW} )); then
      				if (( ${YMOUSE} >= ${MONY} )); then
        				if (( ${YMOUSE} <= ${MONY}+${MONH} )); then
          					# We have found our monitor!
          					maim -u -g "${MONW}x${MONH}+${MONX}+${MONY}" $FILENAME ; cat $FILENAME | xclip -selection clipboard -t image/png
						if [ -f "$FILENAME" ]; then
							paplay ~/Music/screenshot-sound.wav
						fi
          					exit 0
        				fi
      				fi
    			fi
  		fi
	done
fi
