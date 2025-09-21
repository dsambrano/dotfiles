#!/usr/bin/env bash

GITUNAME=$1
GITEMAIL=$2

# Git Configs:
git config --global user.name $GITUNAME
git config --global user.email $GITEMAIL
git config --global init.defaultBranch main # Set default branch name
git config --global pull.rebase false # true for rebase: source for meaning: https://stackoverflow.com/a/70627815
git config --global core.excludesFile "~/.gitignore_global" # https://stackoverflow.com/a/19299889
git config --global core.editor "nvim" # Use Nvim as default editor: https://stackoverflow.com/a/2596819






# Install Custom fonts
## Linux Source: https://docs.fedoraproject.org/en-US/quick-docs/fonts/
install_fonts() { # Taken from: https://apple.stackexchange.com/a/321938
    FONT_DIR=~/.local/share/fonts/$1/
    mkdir -p $FONT_DIR
    cd $FONT_DIR
    wget $2
    cd -
}


for i in {Regular,Bold,Italic,"Bold%20Italic"}; do
    install_fonts "MesloLGS" "https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20${i}.ttf"
done
## Update fonts cache
fc-cache -v


# Setup local bin folder
mkdir -p $HOME/.config/local/bin
mkdir -p $HOME/.local/bin

## NPM 
npm config set prefix '~/.local/' # npm -g install install in ~/.local/bin

## NVIM
npm i -g pyright

python3 -m venv ~/.config/nvim/venv
source ~/.config/nvim/venv/bin/activate
pip install wheel
pip install pynvim doq
deactivate

## Set up basic SSH template
mkdir -p ~/.ssh
echo """Host *
    IgnoreUnknown UseKeychain
    UseKeychain yes
    AddKeysToAgent yes

# Host template
#     Hostname 192.168.1.69
#     Port 69420
#     IdentityFile ~/.ssh/id_rsa

""" >> ~/.ssh/config

echo 'eval "$(zoxide init zsh)"' >> ~/.zshrc
# Exports which need to be added to my ~/.zshrc file:
echo 'export PATH="$HOME/.cargo/bin:$PATH"' >> ~/.zshrc
echo "export RIPGREP_CONFIG_PATH=$HOME/.config/ripgrep/.ripgreprc" >> ~/.zshrc
echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.zshrc
echo "export EDITOR=/usr/bin/nvim" >> ~/.zshrc
# Bash Colors can be changed with: https://gist.github.com/thomd/7667642
echo 'export LS_COLORS="*README.md=04;31:$LS_COLORS"' >> ~/.zshrc
## zsh options
# https://scriptingosx.com/2019/07/moving-to-zsh-part-5-completions/
# echo "source ~/.aliases/aliases" >> ~/.zshrc # https://superuser.com/a/331766
# echo "source ~/.aliases/package_aliases" >> ~/.zshrc


## Setting up Displays with xrandr:
# This is my personal settings for my setup. Should allow it to be more flexable in the future.
# Use xrandr without the options to see what you displays are capable of
# xrandr --output DP-0 --mode 1920x1080  --rate 165.00 --output DP-2 --mode 1920x1080 --rate 60 --right-of DP-0
xrandr --output DP-2 --mode 2560x1440 --rate 180  
