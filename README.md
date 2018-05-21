# Iqamah
Iqamah times

New commnads:

# cd ~ ; rm -Rf iqamah ; git clone https://github.com/albararamli/iqamah.git ; cd ~/iqamah/sh/ ; sh ./install.sh ; reboot
 

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
