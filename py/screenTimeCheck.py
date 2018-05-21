#!/usr/bin/python
from fun_sbr import *
from datetime import date, datetime, time, timedelta
import time as timeSleep
import os
import sys
import subprocess

#exit the file if the device is not a monitor device
if(device_type=='mic'):
    sys.exit() 

csv_file=path_data+'parsedIqamah.csv' # we assume that the csv file already exisis, in future we have to deal with the appcenece of this file

if os.path.exists(csv_file):
    # Praery Time Import from csv
    data_of_csv=get_line_form_file(csv_file,1)
    fajrAthan = datetime.combine(date.today(), time(int(data_of_csv[0:2]),int(data_of_csv[2:4])))

    data_of_csv=get_line_form_file(csv_file,5) 
    Duha = datetime.combine(date.today(), time(int(data_of_csv[0:2]),int(data_of_csv[2:4])))

    data_of_csv=get_line_form_file(csv_file,7) 
    DhuhrAthan = datetime.combine(date.today(), time(int(data_of_csv[0:2]),int(data_of_csv[2:4])))

    data_of_csv=get_line_form_file(csv_file,17) 
    IshaIqamah = datetime.combine(date.today(), time(int(data_of_csv[0:2]),int(data_of_csv[2:4])))
else:
    sys.exit() 

# Set Delay on Screen On and Off Times
screenOnBeforeFajr = fajrAthan - timedelta(hours=1)
screenOnBeforeFajr = screenOnBeforeFajr.time()
screenOffAfterDuha = Duha + timedelta(minutes=30)
screenOffAfterDuha = screenOffAfterDuha.time()
screenOnBeforeDhuhr = DhuhrAthan - timedelta(hours=1)
screenOnBeforeDhuhr = screenOnBeforeDhuhr.time()
screenOffAfterIsha = IshaIqamah + timedelta(hours=1.7)
screenOffAfterIsha = screenOffAfterIsha.time()

# Define Midnight Time
Midnight = datetime.combine(date.today(), time(00, 00))
Midnight = Midnight.time()

# Simulate Current Time
# currentTime = datetime.combine(date.today(), time(12, 50))
# currentTime = currentTime.time()

'''
# Print Prayer Times for Verifiation
print("screenOnBeforeFajr: " + str(screenOnBeforeFajr))
print("screenOffAfterDuha: " + str(screenOffAfterDuha))
print("screenOnBeforeDhuhr: " + str(screenOnBeforeDhuhr))
print("screenOffAfterIsha: " + str(screenOffAfterIsha))
'''
#while True:
# Check Server Screen Status
autoscreen_file=path_data+"autoscreen_status.txt"
if os.path.exists(autoscreen_file):
    autoScreenStatusFile = open(autoscreen_file, "r")
    autoScreenStatus = autoScreenStatusFile.readline(1)
    print "auto file exsist="+autoScreenStatus
else:
    autoScreenStatus = "1"
    print "auto file Not exsist="+autoScreenStatus
'''
screen_file=path_data+"screen_status.txt"
if os.path.exists(screen_file):
    screenStatusFile = open(screen_file, "r")
    screenStatus = screenStatusFile.readline(1)
    print "screen file exsist="+screenStatus
else:
    screenStatus = "0"
    print "screen file Not exsist="+screenStatus
'''
# If There is No Override, Run Screen Check Schedule
if autoScreenStatus == "1":
    # Check Current Time
    currentTime = datetime.now().time()
    if screen_size=="27":
        # Check real time screenStatus from shell
        output = subprocess.check_output("vcgencmd display_power", shell=True)
        screenStatus = output[14]
    if screen_size=="7":
        output2 = subprocess.check_output("cat /sys/class/backlight/rpi_backlight/bl_power", shell=True)
        screenStatus = output2[0]
        if output2[0]=="0":
            screenStatus="1"
        else:
            screenStatus="0"
    print "screen="+screenStatus
    # Turn Screen On for Fajr
    if currentTime >= screenOnBeforeFajr and currentTime < screenOffAfterDuha:
        if screenStatus == "0":
            comm="on"

    # Turn Screen Off After Fajr
    if currentTime >= screenOffAfterDuha and currentTime < screenOnBeforeDhuhr:
        if screenStatus == "1":
            comm="off"

    # Turn Screen On Before Dhuhr
    if currentTime >= screenOnBeforeDhuhr and currentTime < screenOffAfterIsha:
        print "HERE"
        if screenStatus == "0":
            comm="on"

    # Turn Screen Off After Isha # Turn Screen Off for the Night
    if currentTime >= screenOffAfterIsha or currentTime < screenOnBeforeFajr:
        if screenStatus == "1":
            comm="off"
            
    if comm=="on":
        '''
        os_system('sh '+dir_local+'Chromium_Open.sh &')
        time.sleep(1.0)
        '''
        os_system('sh '+dir_local+'screen_on.sh')
        
    if comm=="on":     
        '''
        os_system('sh '+dir_local+'Chromium_Close.sh &')
        time.sleep(1.0)
        '''
        os_system('sh '+dir_local+'screen_off.sh')
        
print str(currentTime)+"="+str(screenOnBeforeDhuhr)+" "+str(currentTime) +"="+ str(screenOffAfterIsha)
# Sleep for a second before rerunning the loop
#timeSleep.sleep(1)
