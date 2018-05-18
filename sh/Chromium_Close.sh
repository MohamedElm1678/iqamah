#!/bin/bash
echo "0" > /home/pi/rpiMasjidDisplay/sh/chrome_status.txt
# Close Chromium Browser Instance, if the device is not mic
if [ "$(sed '3q;d' /home/pi/rpiMasjidDisplay/config.txt)" != 'mic' ]; then
  pkill chromium
fi
