#!/usr/bin/env bash

set -e

# Setup sample: https://sourabhbajaj.com/mac-setup/
read -p "User Name for Git: " GITUNAME
read -p "Email for User Name: " GITEMAIL

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
sudo xcode-select --install

brew install git gh bat neofetch python fzf htop cmatrix xclip node ffmpeg duti lf nmap netcat docker-compose docker-machine trash-cli autojump tldr thefuck espeak tmux ranger wget nvim
brew install --cask r rstudio amethyst mpv visual-studio-code sublime-text iterm2 firefox brave-browser xquartz docker virtualbox zoom slack spotify anaconda onlyoffice edex-ui itsycal insomnia

git config --global user.name $GITUNAME
git config --global user.email $GITEMAIL
git config --global pull.rebase false # true for rebase: source for meaning: https://stackoverflow.com/a/70627815

# Add to Path
## Adding to path permenantly
cat << EOF >> ~/.zprofile
# Add Visual Studio Code (code)
export PATH="\$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
EOF

export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin" # Added to path to be used immediately

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Aliases
cp -r config/.aliases ~/
echo "source ~/.aliases/aliases" >> ~/.zshrc # https://superuser.com/a/331766
echo "source ~/.aliases/package_aliases" >> ~/.zshrc
# Need to also add package_aliases I believe if I have that start with a `.` I can make a single `cp` line

# Set up Vim
cp config/.vimrc ~/.vimrc # If I want to move this to ~/.config I can ln -s or follow this guide: https://vi.stackexchange.com/a/11881 
# Setting up the one true vim: NEOVIM
mkdir - p $HOME/.config/
cp -r config/nvim ~/.config/nvim
## Really need to make this an if statement and symbolically link for me but not others

# Setup local bin folder
mkdir -p $HOME/.config/local/bin

duti -s $(osascript -e 'id of app "Visual Studio Code"') .md all # found from https://superuser.com/a/1092184 in comments

# Install fonts
install_fonts() { # Taken from: https://apple.stackexchange.com/a/321938
	cd ~/Library/Fonts && { curl -O $1 cd - ; }
}

for i in {Regular,Bold,Italic,"Bold Italic"}; do
	install_fonts "https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS NF ${i}.ttf"
done

gh auth login

## Setting up git repos:
mkdir -p ~/git_repos/
repos={dotfiles,code_samples}
for i in $repos; do
    git clone git@github.com:dsambrano/$i.git
done

# Anime from Terminal
## Installing Dependencies 
brew install aria2
curl "https://raw.githubusercontent.com/whoisYoges/anime-terminal/master/anime-terminal" > anime-terminal
chmod +x anime-terminal
sudo mv anime-terminal /usr/local/bin/
## Adding Man Pages
curl "https://raw.githubusercontent.com/whoisYoges/anime-terminal/master/anime-terminal.1" > anime-terminal.1
sudo mv anime-terminal.1 /usr/share/man/man1/
