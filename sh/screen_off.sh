#!/bin/bash
echo "0" > /home/pi/iqamah/sh/screen_status.txt
if [ "$(sed '3q;d' /home/pi/iqamah/config.txt)" != 'mic' ]; then
vcgencmd display_power 0
sudo echo 1 > /sys/class/backlight/rpi_backlight/bl_power # LCD 7'' turn off with 1 tag
fi


#vcgencmd display_power 0

###### Old Way ######
#tvservice --off > /dev/null
