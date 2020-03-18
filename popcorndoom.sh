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
WADpath=~/Gry/PC/Doom/WADs
MODpath=~/Gry/PC/Doom/Mods
SAVEpath=~/Gry/PC/Doom/Saves

#These are default values to launch with
#and will be overwritten if you choose
#to enable persistency of last used arguments
WAD=doom.wad
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

#These are program values, plase do not edit
#them if you don't know what they do
CHOICE=

dialog  --backtitle "PopcornDoom" \
	--menu "Welcome to PopcornDoom\nthe crispydoom launcher!" 15 30 7 \
	1 "Game WAD" \
	2 "Mod WAD" \
	3 "Additional options" \
	4 "Difficulty" \
	5 "Level" \
	6 "Launch crispydoom" \
	7 "PopcornDoom version"

