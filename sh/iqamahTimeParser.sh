#!/bin/bash

#This sh runs every day once to parse Athan and Iqamah times from server, work only in monitor
if [ "$(sed '3q;d' vconfig.txt)" != 'mic' ]; then
#Download Iqamah Times for Davis from Server
wget -q "$(sed '4q;d' /home/pi/iqamah/config.txt)api.php?city=$(sed '1q;d' /home/pi/iqamah/config.txt)&id=0" -O /home/pi/iqamah/data/tmp.txt

#Extract Salat Name and Time from Text File
awk -F'<BR>' '{for (i=1;i<=NF;i++) print $i}' /home/pi/iqamah/data/tmp.txt > /home/pi/iqamah/data/tmp2.txt

#Check Number of Ljnes in Temp File
lineCheck=$(wc -l < /home/pi/iqamah/data/tmp2.txt)

if [ $lineCheck = "19" ]
    then
	#Remove ':' Symbol from the Extracted Time (for comparison purpose)
	sed 's/://' /home/pi/iqamah/data/tmp2.txt > /home/pi/iqamah/data/parsedIqamah.csv
fi

#Delete all Temp. Files
rm /home/pi/iqamah/data/tmp.txt
rm /home/pi/iqamah/data/data/tmp2.txt

#################### Other Functions/Ways that Didn't work ####################
#Another way to remove : from the times
# gawk -F':' '{for (i=1;i<=NF;i++) print $i}' tmp2.txt > tmp3.csv
#
#Convert Strings to Integers
# sed -E 's/\:([0-9])([0-9])\..*"/\:\1\2"/g' tmp3.csv > tmp4.csv
#
# Another way to read each column form the csv file
# while IFS=, read -r col1; do echo $col1  ; done < tmp.csv
#
# Declaring an array variable
# declare -a var
#
# Another way to read the contents of the csv file
# for=$(while IFS=, read -r col1; do echo $col1  ; done < tmp.csv)
#
# Another way to read the contents of the csv file
# declare -a var=$(gawk -F':' '{for (i=1;i<=NF;i++) print $i, var[$i]=$i}' tmp2.txt)
#
# Another way to read the contents of the csv file
# gawk -F':' '{for (i=1;i<=NF;i++) print $i, var[$i]=$i}' tmp3.csv
#
# Another way to read the contents of the csv file
# declare -a nvar
# for (( i = 0; i < NF; i++ )); do
#   nvar[i]=sed -n "$i"p tmp3.csv
# done

fi
