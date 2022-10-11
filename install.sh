#!/bin/bash

# Simple Install for Shell-random-greeter
# This file must be in the same directory as the script in order to properly install
# Essentially this is happening: 
# 	1. 'sfetch'File is made an executable
#	2. shell config file is detected and a line is added invoking the shell.
#	3. if you would like to only install the command, install manually.
#	4. create a linked file in .config/shellrandomgreeter to easily append to /usr/bin/sfetch

echo "Starting Install..."
echo "Making Script an executable..."


#Main Functions

function making() { #Makes the script executable	
	chmod +x $PWD/sfetch
}

function moving() { #Moves the script into /usr/bin
	
	# if the file is detected in /usr/bin, ask if overwrite is ok.
	if [[ -f /usr/bin/sfetch ]]; then
		echo -e "// there already is a file named 'sfetch' detected in /usr/bin \n Do you wish to overwrite this file? [y/N]"
		read -s -n1 yn
		if [[ $yn == "y" ]] || [[ $yn == "Y" ]]; then #Overwrite
			echo "Overwriting 'sfetch' in /usr/bin"
			sleep 2
			sudo cp --remove-destination $PWD/sfetch /usr/bin
		elif [[ $yn == "n" ]] || [[ $yn == "N" ]]; then #Don't overwrite
			echo -e "Overwrite cancelled. \n Exiting Script..."
		else 
			echo "Unknown Input, Exiting Script..."
		fi
	else
		sudo cp $PWD/sfetch /usr/bin
		yn="y"
	fi
		
}
#########################################################

#Shell Config file checkers

function detect_tcshrc() { #detect .tcshrc file
        if [[ -f ~/.tcshrc ]]; then
                echo ".tcshrc found!"   
                COUNT=$(grep -c sfetch ~/.tcshrc) #Check to see if sfetch is installed...

                if [[ (($COUNT -lt 1)) ]]; then
                        echo  "appending 'sfetch' to .tcshrc"
			sleep 2
                        echo -e "\nsfetch" >> ~/.tcshrc
                else
                        echo "sfetch is already installed in .tcshrc!"
                fi
        else      
                echo ".tcshrc file not found, making file..."
                touch ~/.tcshrc
                echo "Done."
                echo "appending 'sfetch' to file..."
		sleep 2
                echo -e "\nsfetch" >> ~/.tcshrc
                echo Done.
        fi
}

function detect_zshrc() { #detect .zshrc file
        if [[ -f ~/.zshrc ]]; then
                echo ".zshrc found!"   
		if [[ -f ~/.p10k.zsh ]]; then #Detects if user has Power Level 10K
			echo ".p10k.zsh detected!"
			COUNT=$(grep -c sfetch $HOME/.p10k.zsh)
			INSTANTPROMPT=$(grep -c instant_prompt_shell-prompt $HOME/.zshrc)
			if [[ (($COUNT -lt 1))  ]]; then 
				echo "creating 'sfetch' instant prompt to .p10k.zsh"
				sleep 2
				echo -e "# sfetch instant prompt \nfunction prompt_shell_prompt() {\n\tsfetch\n}" >> ~/.p10k.zsh
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
				echo "sfetch is already installed in .p10k.zsh!"
			fi
		else
			COUNT=$(grep -c sfetch ~/.zshrc) #Check to see if sfetch is installed...

			if [[ (($COUNT -lt 1)) ]]; then
				echo "appending 'sfetch' to .zshrc"
				sleep 2
				echo -e "\nsfetch" >> ~/.zshrc
			else
				echo "sfetch is already installed in .zshrc!"
			fi
		fi

	else      
		echo ".zshrc file not found, making file..."
		touch $HOME/.zshrc
		echo "Done."
		sleep 2
		echo "appending 'sfetch' to file..."
		echo -e "\nsfetch" >> ~/.zshrc
		echo Done.
	fi
}

function detect_bashrc() { #detect .bashrc file
        if [[ -f ~/.bashrc ]]; then
                echo ".bashrc found!"   
                COUNT=$(grep -c sfetch ~/.bashrc) #Check to see if sfetch is installed...

                if [[ (($COUNT -lt 1)) ]]; then
                        echo "appending 'sfetch' to .bashrc"
			sleep 2
                        echo -e "\nsfetch" >> ~/.bashrc
                else
                        echo "sfetch is already installed in .bashrc!"
                fi
        else      
                echo ".bashrc file not found, making file..."
                touch ~/.bashrc
                echo "Done."
                echo "appending 'sfetch' to file..."
		sleep 2
                echo -e "\nsfetch" >> ~/.bashrc
                echo Done.
        fi
}
function detect_kshrc() { #detect .kshrc file
        if [[ -f ~/.kshrc ]]; then
                echo ".kshrc found!"   
                COUNT=$(grep -c sfetch ~/.kshrc) #Check to see if sfetch is installed...

                if [[ (($COUNT -lt 1)) ]]; then
                        echo "appending 'sfetch' to .kshrc"
                        echo -e "\nsfetch" >> ~/.kshrc
                else
                        echo "sfetch is already installed in .kshrc!"
                fi
        else      
                echo ".kshrc file not found, making file..."
                touch ~/.kshrc
                echo "Done."
                echo "appending 'sfetch' to file..."
		sleep 2
                echo -e "\nsfetch" >> ~/.kshrc
                echo Done.
        fi
}
function detect_fish-config() { #detect .fish file
        if [[ -f ~/.config/fish/config.fish ]]; then
                echo ".~/.config/fish/config.fish found!"   
                COUNT=$(grep -c sfetch ~/.config/fish/config.fish) #Check to see if sfetch is installed...

                if [[ (($COUNT -lt 1)) ]]; then
                        echo "appending 'sfetch' to ~/.config/fish/config.fish"
                        echo -e "\nsfetch" >> ~/.config/fish/config.fish
                else
                        echo "sfetch is already installed in config.fish!"
                fi
        else      
                echo "~/.config/fish/config.fish file not found, making file..."
                touch ~/.config/fish/config.fish
                echo "Done."
                echo "appending 'sfetch' to file..."
                echo -e "\nsfetch" >> ~/.config/fish/config.fish
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
		mkdir $HOME/.config/shellrandomgreeter/indexing
		mkdir $HOME/.config/shellrandomgreeter/prompts
		echo "Copying sampleprompt files into config folder..."
		cp sampleprompts/* $HOME/.config/shellrandomgreeter/prompts
		echo "Would you like to add sfetch to your config file?"
		read -s -n1 configure

		if [[ $configure == "y" ]] || [[ $configure == "Y" ]]; then
			config
		elif [[ $configure == "n" ]] || [[ $configure == "N" ]]; then
			echo -e "\e[34msfetch\e[0m installed!"
		else
			echo "unknown input: interpreting as 'n'"
			echo -e "\e[34msfetch\e[0m installed!"
		fi
	else #if moving() is unsuccessful
		echo "ERROR: File was not copied to /usr/bin"
		echo "Exiting install"
	fi
else #if making() is unsuccessful
	echo "ERROR: 'sfetch' was not found."
	echo "Exiting install..."
fi

