#!/bin/bash
echo "1" > /home/pi/rpiMasjidDisplay/sh/chrome_status.txt
# Open Chromium Browser Instance, if the device is not mic
if [ "$(sed '3q;d' /home/pi/rpiMasjidDisplay/config.txt)" != 'mic' ]; then
  chromium-browser --kiosk --incognito --no-sandbox  --noerrdialogs -disable-session-crashed-bubble --disable-infobars "$(sed '4q;d' /home/pi/rpiMasjidDisplay/config.txt)screen.php?size=$(sed '5q;d' /home/pi/rpiMasjidDisplay/config.txt)&icdx=1&city=$(sed '1q;d' /home/pi/rpiMasjidDisplay/config.txt)"
fi
