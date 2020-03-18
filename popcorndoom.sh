#!/usr/bin/bash

#Checking for dialog in arch based systems
if [[ -z $(pacman -Q | grep dialog) ]]; then
	echo "ERROR: Dialog not installed!"
	exit
fi
#Checking for crispydoom in arch based systems
if [[ -z $(pacman -Q | grep crispy-doom) ]]; then
	echo "ERROR: crispydoom not installed!"
	exit
fi

#To configure the script edit these values:
WADpath="/home/kacper/Gry/PC/Doom/WADs"
MODpath="~/Gry/PC/Doom/Mods"
SAVEpath="~/Gry/PC/Doom/Saves"

#These are default values to launch with
#and will be overwritten if you choose
#to enable persistency of last used arguments
WAD="doom.wad"
MOD=
DIFFICULTY=3
FAST=no
RESPAWN=no
MUSIC=yes
MUSICpacks=no
SOUNDeffects=yes

#Uncomment these lines to enable persistency
#of last used arguments, it is also advised
#to set a folder for the persistency file

### PROGRAM DATA ###
DIALOG_CANCEL=1
DIALOG_ESC=255
BACK_TITLE="--backtitle PopcorndDoom"

while true; do
	exec 3>&1
	choice=$(dialog  --backtitle "PopcornDoom" \
			--title "Main menu" \
			--cancel-label "Exit" \
			--menu "Welcome to PopcornDoom\nthe crispydoom launcher!" 15 30 7 \
			1 "Game WAD" \
			2 "Mod WAD" \
			3 "Additional options" \
			4 "Difficulty" \
			5 "Level" \
			6 "Credits" \
			7 "Launch crispydoom" 2>&1 1>&3)
	exit_status=$?
	exec 3>&-
	case $exit_status in
		$DIALOG_CANCEL)
		clear
		exit
		;;
		$DIALOG_ESC)
		clear
		exit 1
		;;
	esac

	case $choice in
		0)
		clear
		echo "Program terminated."
		exit
		;;
		1)
		;;
		7)
		clear
		$(crispy-doom -iwad $WADpath/$WAD)
		exit
		;;
	esac
done
