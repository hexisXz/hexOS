#!/bin/bash

prompt() {
	read e

	echo "--------------------------------------"
	echo "- do you want to install hexOS (y/n) -"
        echo "--------------------------------------"

	if [ "$e" == "y" ]; then
		read g
		echo "WARNING you need xmonad, xmobar and alacritty for this to work if you dont have alacritty or xmonad this will install it for you however it will not install xmobar so if you dont have xmobar exit out of this and install it."
		echo "enter (n) to exit and (y) to proceed"
		if [ "$g" == "n" ]; then
			exit 1
		fi
		
		if [ "$g" == "y" ]; then
			setup
		fi
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
	
	if ! command -v xmonad >/dev/null; then
		read a
		
		echo "xmonad is not installed on your system would you like to install it (y/n)
		
		you need xmonad to run hexOS so if you enter no the install will stop."

		if [ "$a" == "y" ]; then
			sudo apt install xmonad && mkdir ~/.xmonad && mv ~/hexOS/xmonad/xmonad.hs ~/.xmonad && mkdir ~/.config/xmobar && mv ~/hexOS/xmobar/xmobarrc ~/.config/xmobar

		fi

		
		if [ "$a" == "n" ]; then
			exit 1
		fi
	fi
	
	
	
	if command -v xmonad >/dev/null; then
		read f
		echo "this will replace your existing xmonad & xmobar config do you wish to proceed (y/n)"

		if [ "$f" == "y" ]; then
			mv ~/hexOS/xmonad/xmonad.hs ~/.xmonad && mv ~/hexOS/xmobar/xmobarrc ~/.config/xmobar && mv ~/hexOS/xmobar/xmobar-sound ~/ && chmod +x ~/xmobar-sound
		fi	
	fi 	

}





config() {
	echo "---------------------"
	echo "- configuring hexOS -"
	echo "---------------------"
	
	
	echo -n "this will replace your .bashrc with the hexOS .bashrc you need hexOS .bashrc for hexOS to work do you wish to proceed (y/n)"
        read -r que

	if [ "$que" == "y" ]; then
		sleep 1
		mv ~/hexOS/bash-config/.bashrc ~/

		echo "configuring compton"
		mv ~/hexOS/compton/compton.conf ~/.config/

		echo "configuring alacritty"
	        if ! command -v alacritty >/dev/null; then
			sudo apt install alacritty && mkdir ~/.config/alacritty && mv ~/hexOS/terminal/alacritty.yml ~/.config/alacritty 
		fi	
	fi

	if command -v alacritty >/dev/null; then
		mv ~/hexOS/terminal/alacritty.yml ~/.config/alacritty

	fi


	echo "finishing up"

	sudo apt install pacstall && pacstall -I nala && sudo apt install exa

	echo "------------"
	echo "- finished -"
	echo "------------"

	echo "to install a program just type pacstall -I <name of program>
    apt is still installed so you can use that, if you want to use apt just type aptin to install programs or just look
    at .bashrc to see all the aliases and thats all have fun with hexOS
    just logout and loginto xmonad."

}
