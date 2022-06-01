#!/bin/sh

killall -q picom

picom --config ~/.config/picom/picom.conf &

echo "Successfully launched Picom..."
