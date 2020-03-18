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
WADpath="$HOME/Gry/PC/Doom/WADs"
MODpath="$HOME/Gry/PC/Doom/Mods"
SAVEpath="$HOME/Gry/PC/Doom/Saves"

#These are default values to launch with
#and will be overwritten if you choose
#to enable persistency of last used arguments
WAD="$WADpath/doom2.wad"
MOD="$MODpath/"

#Uncomment these lines to enable persistency
#of last used arguments, it is also advised
#to set a folder for the persistency file

### PROGRAM DATA ###
DIALOG_CANCEL=1
DIALOG_ESC=255
BACK_TITLE="--backtitle PopcornDoom"

#This value is only used when a difficulty or map is chosen,
#so when none are selected it goes to the main menu
#instead of kicking you into the first map
setskill=""
setmap=""

while true; do
##The main menu, still don't quite know how most of this crap even works
	exec 3>&1
	choice=$(dialog $BACK_TITLE \
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

## The submenus are activated by this switch
	case $choice in
		##This is here just in case
		0)
		clear
		echo "Program terminated."
		exit
		;;

		1)
		exec 3>&1
		WAD=$(dialog --stdout $BACK_TITLE --title "Select game WAD" --fselect $WADpath/ 50 50)
		;;

		2)
		exec 3>&1
		MOD=$(dialog --stdout $BACK_TITLE --title "Select mod WAD" --fselect $MODpath/ 50 50)
		;;

		3)
		exec 3>&1
		## Here you can modify additional options to be default
		$(dialog --stdout $BACK_TITLE --title "Select additional options" --checklist "Some additional options will only work with a map selected, those are mainly related to enemies:" 15 60 3 \
		        1 "Fast monsters" off \
		        2 "Respawning monsters" off \
		        3 "No music" off\
			4 "No soundeffects" off)
		;;
		4)
		exec 3>&1
		## Here you can modify your default difficulty
		setskill="-skill"
		difficulty=$(dialog --stdout $BACK_TITLE --title "Select difficulty" --radiolist "This will only work if a map is selected, if no map is selected the first one will play" 15 60 6 \
			0 "No monsters" off\
			1 "I'm too young to die." off\
			2 "Hey not too rough." off\
			3 "Hurt me plenty." off\
			4 "Ultra violence." on\
			5 "Nightmare!" off)
		;;

		5)
		exec 3>&1
		setmap="-warp"
		map=$(dialog --stdout $BACK_TITLE --title "Choose map" --inputbox "Insert map name, for example E1M1 is 1 1 and MAP01 is 01" 10 30)
		;;

		7)
		clear
		$(crispy-doom -iwad $WAD -file $MOD $setskill $difficulty $setmap $map -savedir $SAVEpath)
		exit
		;;
	esac
done
