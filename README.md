# Iqamah
Iqamah times


# git clone https://github.com/albararamli/iqamah.git

# cd /home/pi/iqamah/sh ;chmod +x *.sh

# cd /home/pi/iqamah/py ;chmod +x *.py

# crontab -e

####Script Star####

#Update parsedIqamah.csv File Once Every Day 15 min after  Midnight

00 03 * * * /home/pi/iqamah/sh/iqamahTimeParser.sh

#Run screenTimeCheck.py Script Every 5 min

*/5 * * * * sudo python /home/pi/iqamah/py/screenTimeCheck.py

#Restart RPi Everyday at 2:15AM

15 02 * * * reboot

#Download Local HTML

15 03 * * * /home/pi/iqamah/sh/local.sh

#Move Mouse Location

#00 * * * * /home/pi/iqamah/sh/MouseMove.sh

# cd ~/.config/lxsession/LXDE-pi ; sudo nano autostart 

@lxpanel --profile LXDE-pi

@pcmanfm --desktop --profile LXDE-pi

@xscreensaver -no-splash

@point-rpi

sudo sh /home/pi/iqamah/sh/MouseMove.sh

sudo sh /home/pi/iqamah/sh/Chromium_Open.sh

sudo sh /home/pi/iqamah/sh/iqamahTimeParser.sh

sudo python /home/pi/iqamah/py/screenTimeCheck.py

sudo python /home/pi/iqamah/py/mic_ini.py

sudo python /home/pi/iqamah/py/mic_listen_online.py

sudo python /home/pi/iqamah/py/internet.py

sudo python /home/pi/iqamah/py/sensor.py



# sudo nano /boot/config.txt

#Rotate the Screen 90 Degrees

display_rotate=1



Disable Screen Sleep on Raspberry Pi

# sudo apt-get install xscreensaver

Now open the app

xscreensaver

Click Settings, then at the top choose Disable Screen Sleep from the dropdown. 

# sudo apt-get update

# sudo apt-get install lxsession-default-apps


Changing the brightness on the Raspberry Pi 7″ touchscreen

# sudo sh -c "echo 40 > /sys/class/backlight/rpi_backlight/brightness"

Brighth=255, Black=0

Turn the LCD 7'' screen off

sudo bash -c "echo 1 > /sys/class/backlight/rpi_backlight/bl_power"

Turn the LCD 7'' screen off

sudo bash -c "echo 0 > /sys/class/backlight/rpi_backlight/bl_power"
