#!/usr/bin/env bash

# Ask for the administrator password upfront
sudo -v

set -e

## Also need some of the following options:
### - Do you want to Sym links to keep all the files up to date?
### - Do you want to download the GH repos that I keep for default?
# Setup sample: https://sourabhbajaj.com/mac-setup/
## It looks like if I used source to call the script, I dont need to pass the variables: https://unix.stackexchange.com/a/172055
## Otherwise, you can just export them: https://unix.stackexchange.com/a/132701
read -p "User Name for Git (the username used to access your account; all lower case): " GITUNAME
#read -p "Email for User Name: " GITEMAIL
GITEMAIL=$(GITUNAME)@users.noreply.github.com
read -p "What OS are you using? [Mac/Ubuntu/Fedora] " OS
# Obviously need to make it so they cant set incorret OS. 
# Also should make it download the folder once you select the OS probs. 
# In order to auto detect OS, I cam use this for Mac vs Linux: From Line 505 from https://github.com/pystardust/ani-cli/blob/master/ani-cli
# case "$(uname)" in
# 	Darwin*) player_fn='iina';;
# 	*) player_fn='mpv';;
# esac
if [ $OS  == "Mac" ]; then
    OS_DIR=mac
fi

if [ $OS  == "Ubuntu" ]; then
    OS_DIR=linux/ubuntu
fi

if [ $OS  == "Fedora" ]; then
    OS_DIR=linux/fedora
fi


# Install all the packages for the OS
source ./$OS_DIR/package_installs.sh

# General Installs
## Installing latest version of NVM
wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/HEAD/install.sh | bash
# git clone https://github.com/nvm-sh/nvm/blob/master/install.sh
### Using NVM to install latest version of node
npm install node


# Now Set up all the configs. First the general then the specific, to overwrite if necessary. 
source ./os_configs.sh $GITUNAME $GITEMAIL
source ./$OS_DIR/os_configs.sh
# Set up vim mode for regular terminal commands: https://koenwoortman.com/zsh-vim-mode/

# Need to add this to general path: 
export PATH="$HOME/.cargo/bin:$PATH"
export RIPGREP_CONFIG_PATH=$HOME/.config/ripgrep/.ripgreprc


# Tmux plugin manager
if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

# # Install vim-plug to use plugins for nvim: https://github.com/junegunn/vim-plug
# sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
#        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
# Using this to swtich to packer for nvim:
if [ ! -d "$HOME/.local/share/nvim/site/pack/packer/start/" ]; then
    git clone --depth 1 https://github.com/wbthomason/packer.nvim\
	    ~/.local/share/nvim/site/pack/packer/start/packer.nvim
fi
nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'
# Sym links require the clone of the main repo first to work. 
source ./symlinks.sh $OS_DIR

# Authorize GitHub
## gh auth status Logged in togithub.com as GITUNAME
gh auth login

## Setting up git repos:
mkdir -p ~/git_repos/
cd ~/git_repos/
repos={dotfiles,code_samples}
for i in $repos; do
    git clone git@github.com:dsambrano/$i.git
done
cd -

## Conditionals. This is where I would set up things like the GoXLR and smashbox/gaming setup etc
read -p "Would you like to install Anime-Terminal to download/stream anime with CLI: [Y/n] ? " anime
restart=${restart:-N}
if [ $anime == "Y" ]; then
    source ./conditional_installs/anime.sh
fi

# End script and restart 
read -t 30 -p "The configs are complete. Although some will not be updated until the next reboot. Would you like to reboot now? [Y]/N: " restart
restart=${restart:-N} # If parameter is unset or null, the expansion of word is substituted. Else whatever was read in

