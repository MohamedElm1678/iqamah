#!/bin/bash
echo "1" > /home/pi/iqamah/data/sh/screen_status.txt
if [ "$(sed '3q;d' /home/pi/iqamah/data/config.txt)" != 'mic' ]; then
vcgencmd display_power 1
sudo echo 0 > /sys/class/backlight/rpi_backlight/bl_power # LCD 7'' turn on with 0 tag
fi


###### Old Way ######
#tvservice --preferred > /dev/null
#fbset -depth 8; fbset -depth 16; xrefresh
