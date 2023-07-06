#!/usr/bin/env bash

# Exports 
export EDITOR=/usr/bin/nvim

# Configs	
setxkbmap -option "caps:swapescape"
gsettings set org.gnome.desktop.input-sources xkb-options '["caps:swapescape"]' # Appears Fedora Gnome Specific: https://ask.fedoraproject.org/t/xkboptions-not-effective-after-login/10691/2
## More configs similar to macOS should be using the `dconf` command: source (https://unix.stackexchange.com/a/426348)
### Example: dconf dump /
###Actually gsettings appears to be a higher level version that is much easier to work with. Much more akin to `defaults`. 

## Dracula colors for terminal using dconf: https://draculatheme.com/gnome-terminal
git clone https://github.com/dracula/gnome-terminal
cd gnome-terminal
./install.sh
echo "eval `dircolors ~/.dir_colors/dircolors`" >> ~/.zshrc
# The new dircolors have been installed as /home/buddy/.dir_colors/dircolors.
# Add "eval `dircolors /path/to/dircolorsdb`" in your shell configuration file (.bashrc, .zshrc, etc...) to use new dircolors.

# Switch Default Shell to ZSH
sudo apt install zsh
chsh -s $(which zsh)

