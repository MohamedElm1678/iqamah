#!/bin/bash
echo "0" > /home/pi/iqamah/data/chrome_status.txt
# Close Chromium Browser Instance, if the device is not mic
if [ "$(sed '3q;d' /home/pi/iqamah/config.txt)" != 'mic' ]; then
  pkill chromium
fi
