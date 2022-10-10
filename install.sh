#!/bin/bash

prompt() {
	read e

	echo "--------------------------------------"
	echo "- do you want to install hexOS (y/n) -"
        echo "--------------------------------------"

	if [ "$e" == "y" ]; then
		setup
	fi

	if [ "$e" == "n" ]; then
		exit 1
	fi
}



setup() {
	echo "--------------"
	echo "- installing -"
	echo "--------------"
        
	sleep 1
	mkdir ~/.xmonad && mv ~/hexOS/xmonad/xmonad.hs ~/.xmonad && mkdir ~/.config/xmobar && mv ~/hexOS/xmobar/xmobarrc ~/.config/xmobar


}





config() {
	echo "---------------------"
	echo "- configuring hexOS -"
	echo "---------------------"
	
	
	echo -n "would you like to replace your .bashrc with the hexOS .bashrc (y/n)"
        read -r y/n

	if [ "y/n" == "y" ]; then
		sleep 1
		mv ~/hexOS/bash-config/.bashrc ~/ && mv ~/hexOS/compton/compton.conf ~/.config/ && 
	fi

	if [ "y/n" == "n" ]; then
		











