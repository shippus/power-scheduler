#!/bin/bash
set -e
#Hello I'm shippus
clear
echo "power-scheduler GUI (Zenity) edition."
echo "Written by shippus. This program is to not be used seriously since it was made as a test to my programming skills"

#Initialize program
sleep 3
clear

if zenity --question --title="Initialize power-scheduler?"; then
	zenity --info --text="Selected answer was Y (Yes)." #Replace with Zenity GUI
	HOUR=$(zenity --entry --title="Schedule" --text="Please input an hour to schedule a shutdown.")
	if ! [[ "$HOUR" =~ ^[0-9]+$ ]] || (( HOUR < 0 || HOUR > 23 )); then
    	zenity --warning --title="Invalid hour." --text="Invalid hour. Enter a number between 0 and 23"
    	exit 1
	else
		SHUT_OUTPUT=$(shutdown -h "$HOUR:00" 2>&1)
		zenity --info --text="$SHUT_OUTPUT"

		#Verifies answer
		if zenity --question --title="Shutdown time persistence" --text="Enable persisten shutdowns?"; then
			zenity --info --text="A persistent shutdown has been set."
		else
			zenity --info --text="Understood. Ending program"
			exit
		fi
	fi
else
	zenity --info --text="Selected answer was N (No)."
	sleep 1
	zenity --info --text="Ending program."
	exit
fi
