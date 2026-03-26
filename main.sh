#!/bin/bash
#Hello I'm shippus
clear
echo "power-scheduler CLI edition."
echo "Written by shippus. This program is to not be used seriously since it was made as a test to my programming skills"
echo "Enable debug? (y/n)"
read DEBUG
if [[ "$DEBUG" != "y" ]]; then
	DEBUG=$(echo $DEBUG | tr '[:upper:]' '[:lower:]')
fi
if [[ "$DEBUG" == "y" ]]; then
	echo "true....."
	DEBUG=1
fi

#Initialize program
sleep 3
clear
echo "Initialize program? (y/n)"
read ANSWER_INTRO

NORMALIZED_ANSWER=$(echo $ANSWER_INTRO | tr '[:upper:]' '[:lower:]')
set -e

#If Debug is enabled, output.
if [[ "$DEBUG" == 1 ]]; then
	echo "DEBUG: Normalized = $NORMALIZED_ANSWER"
fi

if [[ $NORMALIZED_ANSWER == y ]]; then
	echo "Selected answer was Y (Yes)."
	read -p "Please enter an hour to schedule a shutdown: " HOUR
	if ! [[ "$HOUR" =~ ^[0-9]+$ ]] || (( HOUR < 0 || HOUR > 23 )); then
    	echo "Invalid hour."
    	exit 1
	else
		shutdown $HOUR":00"
	fi
elif [[ $NORMALIZED_ANSWER == n ]]; then
	echo "Selected answer was N (No)."
	sleep 1
	echo "Ending program."
	exit
else
	echo "Please enter a valid answer"
	./main.sh
fi
