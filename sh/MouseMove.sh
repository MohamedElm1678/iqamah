#!/bin/bash

# Move Mouse to Bottom Right Corner
if [ "$(sed '3q;d' /home/pi/iqamah/config.txt)" != 'mic' ]; then
xdotool mousemove 1080 1920
fi
