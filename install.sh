#!/bin/bash

# Simple Install for Shell-random-greeter
# This file must be in the same directory as the script in order to properly install
# Essentially this is happening: 
# 	1. 'shell-random-greeter'File is made an executable
#	2. shell config file is detected and a line is added invoking the shell.
#	3. if you would like to only install the command, install manually.
#	4. create a linked file in .config/shellrandomgreeter to easily append to /usr/bin/shell-random-greeter

echo "Starting Install..."
echo "Making Script an executable..."


#Main Functions

function making() { #Makes the script executable	
	chmod +x $PWD/shell-random-greeter
}

function moving() { #Moves the script into /usr/bin
	
	# if the file is detected in /usr/bin, ask if overwrite is ok.
	if [[ -f /usr/bin/shell-random-greeter ]]; then
		echo -e "// there already is a file named 'shell-random-greeter' detected in /usr/bin \n Do you wish to overwrite this file? [y/N]"
		read -s -n1 yn
		if [[ $yn == "y" ]] || [[ $yn == "Y" ]]; then #Overwrite
			echo "Overwriting 'shell-random-greeter' in /usr/bin"
			sleep 2
			sudo cp --remove-destination $PWD/shell-random-greeter /usr/bin
		elif [[ $yn == "n" ]] || [[ $yn == "N" ]]; then #Don't overwrite
			echo -e "Overwrite cancelled. \n Exiting Script..."
		else 
			echo "Unknown Input, Exiting Script..."
		fi
	else
		sudo cp $PWD/shell-random-greeter /usr/bin
		yn="y"
	fi
		
}
#########################################################

#Shell Config file checkers

function detect_tcshrc() { #detect .tcshrc file
        if [[ -f ~/.tcshrc ]]; then
                echo ".tcshrc found!"   
                COUNT=$(grep -c shell-random-greeter ~/.tcshrc) #Check to see if shell-random-greeter is installed...

                if [[ (($COUNT -lt 1)) ]]; then
                        echo  "appending 'shell-random-greeter' to .tcshrc"
			sleep 2
                        echo -e "\nshell-random-greeter" >> ~/.tcshrc
                else
                        echo "Shell Random Greeter is already installed in .tcshrc!"
                fi
        else      
                echo ".tcshrc file not found, making file..."
                touch ~/.tcshrc
                echo "Done."
                echo "appending 'shell-random-greeter' to file..."
		sleep 2
                echo -e "\nshell-random-greeter" >> ~/.tcshrc
                echo Done.
        fi
}

function detect_zshrc() { #detect .zshrc file
        if [[ -f ~/.zshrc ]]; then
                echo ".zshrc found!"   
		if [[ -f ~/.p10k.zsh ]]; then #Detects if user has Power Level 10K
			echo ".p10k.zsh detected!"
			COUNT=$(grep -c shell-random-greeter $HOME/.p10k.zsh)
			INSTANTPROMPT=$(grep -c instant_prompt_shell-prompt $HOME/.zshrc)
			if [[ (($COUNT -lt 1))  ]]; then 
				echo "creating 'shell-random-greeter' instant prompt to .p10k.zsh"
				sleep 2
				echo -e "# shell-random-greeter instant prompt \nfunction prompt_shell_prompt() {\n\tshell-random-greeter\n}" >> ~/.p10k.zsh
				echo -e "\nfunction instant_prompt_shell_prompt() {\n\tprompt_shell_prompt\n}" >> ~/.p10k.zsh
				sleep 2
				echo "invoking instant prompt in ~/.zshrc"
				sleep 2
				if [[ $INSTANTPROMPT -lt 1 ]]; then
					echo -e "instant_prompt_shell_prompt" >> $HOME/.zshrc
				else
					echo "Instant Prompt invoked already!"
				fi
			else 
				echo "Shell Random Greeter is already installed in .p10k.zsh!"
			fi
		else
			COUNT=$(grep -c shell-random-greeter ~/.zshrc) #Check to see if shell-random-greeter is installed...

			if [[ (($COUNT -lt 1)) ]]; then
				echo "appending 'shell-random-greeter' to .zshrc"
				sleep 2
				echo -e "\nshell-random-greeter" >> ~/.zshrc
			else
				echo "Shell Random Greeter is already installed in .zshrc!"
			fi
		fi

	else      
		echo ".zshrc file not found, making file..."
		touch $HOME/.zshrc
		echo "Done."
		sleep 2
		echo "appending 'shell-random-greeter' to file..."
		echo -e "\nshell-random-greeter" >> ~/.zshrc
		echo Done.
	fi
}

function detect_bashrc() { #detect .bashrc file
        if [[ -f ~/.bashrc ]]; then
                echo ".bashrc found!"   
                COUNT=$(grep -c shell-random-greeter ~/.bashrc) #Check to see if shell-random-greeter is installed...

                if [[ (($COUNT -lt 1)) ]]; then
                        echo "appending 'shell-random-greeter' to .bashrc"
			sleep 2
                        echo -e "\nshell-random-greeter" >> ~/.bashrc
                else
                        echo "Shell Random Greeter is already installed in .bashrc!"
                fi
        else      
                echo ".bashrc file not found, making file..."
                touch ~/.bashrc
                echo "Done."
                echo "appending 'shell-random-greeter' to file..."
		sleep 2
                echo -e "\nshell-random-greeter" >> ~/.bashrc
                echo Done.
        fi
}
function detect_kshrc() { #detect .kshrc file
        if [[ -f ~/.kshrc ]]; then
                echo ".kshrc found!"   
                COUNT=$(grep -c shell-random-greeter ~/.kshrc) #Check to see if shell-random-greeter is installed...

                if [[ (($COUNT -lt 1)) ]]; then
                        echo "appending 'shell-random-greeter' to .kshrc"
                        echo -e "\nshell-random-greeter" >> ~/.kshrc
                else
                        echo "Shell Random Greeter is already installed in .kshrc!"
                fi
        else      
                echo ".kshrc file not found, making file..."
                touch ~/.kshrc
                echo "Done."
                echo "appending 'shell-random-greeter' to file..."
		sleep 2
                echo -e "\nshell-random-greeter" >> ~/.kshrc
                echo Done.
        fi
}
function detect_fish-config() { #detect .fish file
        if [[ -f ~/.config/fish/config.fish ]]; then
                echo ".~/.config/fish/config.fish found!"   
                COUNT=$(grep -c shell-random-greeter ~/.config/fish/config.fish) #Check to see if shell-random-greeter is installed...

                if [[ (($COUNT -lt 1)) ]]; then
                        echo "appending 'shell-random-greeter' to ~/.config/fish/config.fish"
                        echo -e "\nshell-random-greeter" >> ~/.config/fish/config.fish
                else
                        echo "Shell Random Greeter is already installed in config.fish!"
                fi
        else      
                echo "~/.config/fish/config.fish file not found, making file..."
                touch ~/.config/fish/config.fish
                echo "Done."
                echo "appending 'shell-random-greeter' to file..."
                echo -e "\nshell-random-greeter" >> ~/.config/fish/config.fish
                echo Done.
        fi
}

function config() { #Adds script to shell config
	if [[ "$SHELL" =~ "bash" ]]; then #if using bash
		echo "installing to ~/.bashrc"
		detect_bashrc
		source ~/.bashrc
	elif [[ "$SHELL" =~ "zsh" ]]; then #if using zsh
		echo "installing to ~/.zshrc"
		detect_zshrc
	elif [[ "$SHELL" =~ "fish" ]]; then #if using fish
		echo "installing to ~/.config/fish/config.fish"
		detect_fish-config	
	elif [[ "$SHELL" =~ "ksh" ]]; then #if using KSH
		echo "Installing to ~/.kshrc"
		detect_kshrc
	elif [[ "$SHELL" =~ "tcsh" ]]; then #if using TCSH
		echo "Installing to ~/.tcshrc"
		detect_tcshrc
	else
		echo "Couldn't detect shell.  Please add to shell config manually."
	fi
}

#INSTALL BEGINS
making 

if making; then #If making() is successful:
	echo "Success."
	echo "Moving File to /usr/bin"

	if  moving && [[ $yn == "y" ]] || [[ $yn == "Y" ]]; then #if moving() is successful:
		echo -e "\nSuccess!\n---"
		echo -e "creating config files..."
		mkdir $HOME/.config/shellrandomgreeter
		echo -e "making linked config file..."
		sudo link /usr/bin/shell-random-greeter $HOME/.config/shellrandomgreeter/config
		echo "Would you like to add shell-random-greeter to your config file?"
		read -s -n1 configure

		if [[ $configure == "y" ]] || [[ $configure == "Y" ]]; then
			config
		elif [[ $configure == "n" ]] || [[ $configure == "N" ]]; then
			echo -e "\e[34mshell-random-greeter\e[0m installed!"
		else
			echo "unknown input: interpreting as 'n'"
			echo -e "\e[34mshell-random-greeter\e[0m installed!"
		fi
	else #if moving() is unsuccessful
		echo "ERROR: File was not copied to /usr/bin"
		echo "Exiting install"
	fi
else #if making() is unsuccessful
	echo "ERROR: 'shell-random-greeter' was not found."
	echo "Exiting install..."
fi

