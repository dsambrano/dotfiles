#!/usr/bin/env bash

# Exports 
export EDITOR=/usr/bin/nvim

# Improving DNF speed (Should probably do first to make installs faster?): https://druthetux.wordpress.com/2019/12/14/speed-up-dnf-in-fedora/
echo """
fastestmirror=true
max_parallel_downloas=12
deltarpm=true
""" | sudo tee -a /etc/dnf/dnf.conf

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
sudo dnf install -y util-linux-user  util-linux
chsh -s $(which zsh)


# More g settings:
dconf dump /org/gnome/settings-daemon/plugins/media-keys/ # Getting default keybinds: https://unix.stackexchange.com/a/134182
#[/]
# custom-keybindings=['/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/']
# www=['<Super>b']
# 
# [custom-keybindings/custom0]
# binding='<Super>t'
# command='gnome-terminal'
# name='Launch Terminal'

