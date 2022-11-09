# sfetch - A fork of Shell Random Greeter
A simple bash script that will generate a random ASCII art -OR- Quote when ran. Looks like this:

```
Welcome! USER@HOST
Your Current Directory is: $PWD
Time of Terminal Start: (HH:MM:SS)
Default Shell: ($SHELL)

About System:
CPU MODEL: 
Memory Available:
Kernel:
____________________________________

ASCII ART/QUOTE

____________________________________

user@host $
```
Acts as a minimalist alternative to NeoFetch/pFetch 

--------------------------------------------------------------------------------

# Dependencies:
`util-linux`

--------------------------------------------------------------------------------

# Installation
### Shells supported for automatic installer:
FISH, BASH, ZSH, TCSH, and KSH

## Install from Install Script (Mac {Not tested} / Linux):
1. In a terminal, type `$ chmod +x install.sh`
2. In the same terminal, type: `$ ./install` and run through Installation Process.
3. Run `$ sfetch` or `$ ls /usr/bin | grep sfetch` to test if the command copied to the right directory

## Manual Install (Linux/Unix Systems)
1. In a terminal type: `$ chmod +x sfetch`
2. In the same terminal, type `$ sudo cp sfetch /usr/bin` (If not /usr/bin/, then wherever your CLI commands are held).
3. Run `$ sfetch` or `$ ls /usr/bin/sfetch` to test if the command copied to the right directory

# Installing to $SHELL (MANUAL ONLY!)
Installing to any shell:
1. Edit your config file, (looks like `.*rc` or check your shell's documentation for this)
2. Add `sfetch` in it's own line
3. Source it with `$ source path/to/config` and enjoy!

--------------------------------------------------------------------------------

# Post-Customizing 'sfetch' (For Manual Install only)
!!! You can now easily create prompts for `sfetch` without superuser priviledges!
You may configure prompts from `~/.config/shellrandomgreeter/prompts/~`
to do so, create a text file in `.config/shellrandomgreeter/prompts` and input whatever text you would like!

--------------------------------------------------------------------------------

# Known Working Shells/OS support:
Unix Shells:
- ZSH
- BASH
- KSH
- FISH
- TCSH
--------------------------------------------------------------------------------
Notes:
- ~~WinBash is sort of buggy, but I'll work it out~~ Windows is depreciated.
- ~~Should work just fine on MacOS-- Since Mac's utilize the ZSH shell and is a UNIX-like OS, but I haven't tested it yet.~~ Upcoming update for better OS detection. `lscpu` is a part of the `linuxutils`.
- Same goes for any other Unix-Like System. If any issues sprout up, pls post in the Bug Reports. Or email me @westwardfishdme@gmail.com :P
--------------------------------------------------------------------------------
## Calling Custom Quotes:
if you would rather call a specific quote, you may use `sfetch [1,2,3....]` which will then show that specific art/quote when running the script 

--------------------------------------------------------------------------------
Enjoy the script!

