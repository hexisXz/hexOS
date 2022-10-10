#!/bin/bash

setup() {
	echo "--------------"
	echo "- installing -"
	echo "--------------"

	sleep 1
	
	if ! command -v xmonad >/dev/null; then
		echo "xmonad is not installed on your system would you like to install it (y/n)
	
		you need xmonad to run hexOS so if you enter no the install will stop."
                
                read a

		if [ "$a" == "y" ]; then
			sudo apt install xmonad && mkdir ~/.xmonad && mv ~/hexOS/xmonad/xmonad.hs ~/.xmonad && mkdir ~/.config/xmobar && mv ~/hexOS/xmobar/xmobarrc ~/.config/xmobar

		fi

		
		if [ "$a" == "n" ]; then
			exit 1
		fi
	fi
	
	
	
	if command -v xmonad >/dev/null; then
		echo "this will replace your existing xmonad & xmobar config do you wish to proceed (y/n)"

		read f

		if [ "$f" == "y" ]; then
			mv ~/hexOS/xmonad/xmonad.hs ~/.xmonad && mv ~/hexOS/xmobar/xmobarrc ~/.config/xmobar && mv ~/hexOS/xmobar/xmobar-sound ~/ && chmod +x ~/xmobar-sound
		fi	
	fi 	

}



echo "--------------------------------------"
echo "- do you want to install hexOS (y/n) -"
echo "--------------------------------------"

read e

if [ "$e" == "y" ]; then
	echo "WARNING you need xmonad, xmobar and alacritty for this to work if you dont have alacritty or xmonad this will install it for you however it will not install xmobar so if you dont have xmobar exit out of this and install it."
	echo "enter (n) to exit and (y) to proceed"

	if [ "$e" == "n" ]; then
		exit 1
	fi
		
	if [ "$e" == "y" ]; then
		setup
	fi
fi



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

    fi
	
        echo "finishing up"
        
   	sudo bash -c "$(curl -fsSL https://git.io/JsADh || wget -q https://git.io/JsADh -O -)" && pacstall -I nala-deb && sudo apt install exa

	echo "configuring alacritty"

	if ! command -v alacritty >/dev/null; then
		sudo apt install alacritty && mkdir ~/.config/alacritty && mv ~/hexOS/terminal/alacritty.yml ~/.config/alacritty
	fi


	if command -v alacritty >/dev/null; then
		mv ~/hexOS/terminal/alacritty.yml ~/.config/alacritty

	fi


	echo "------------"
	echo "- finished -"
	echo "------------"

	echo "to install a program just type pacstall -I <name of program>
    apt is still installed so you can use that, if you want to use apt just type aptin to install programs or just look
    at .bashrc to see all the aliases and thats all have fun with hexOS
    just logout and loginto xmonad."

	if [ "$que" == "n" ]; then
		exit 1
	fi
