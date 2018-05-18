if [ "$(sed '3q;d' /home/pi/iqamah/config.txt)" != 'mic' ]; then
curl -L -o /home/pi/iqamah/data/local.html "$(sed '4q;d' /home/pi/iqamah/config.txt)local.php?city=$(sed '1q;d' /home/pi/iqamah/config.txt)&icdx=1&note_show=0&remain_show=0&time_show=0&refresh_stop=1&arrow_show=0&date_show=0&current_show=0"
fi
