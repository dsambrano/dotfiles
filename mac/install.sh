#!/usr/bin/env bash

set -e

# Setup sample: https://sourabhbajaj.com/mac-setup/
read -p "User Name for Git" GITUNAME
read -p "Email for User Name" GITEMAIL

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
sudo xcode-select --install

brew install git gh bat neofetch python fzf htop cmatrix xclip node ffmpeg duti lf nmap netcat docker docker-compose docker-machine trash-cli autojump tldr thefuck espeak tmux ranger
brew install --cask r rstudio amethyst mpv visual-studio-code sublime-text iterm2 firefox brave-browser xquartz docker virtualbox zoom slack spotify anaconda onlyoffice edex-ui itsycal insomnia aerial

git config --global user.name $GITUNAME
git config --global user.email $GITEMAIL

# Add to Path
## Adding to path permenantly
cat << EOF >> ~/.zprofile
# Add Visual Studio Code (code)
export PATH="\$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
EOF

export PATH="\$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin" # Added to path to be used immmediately

# Aliases
cp config/.aliases ~/.aliases
echo ". ~/.aliases" >> ~/.zshrc # https://superuser.com/a/331766

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Set up Vim
cp config/.vimrc ~/.vimrc # If I want to move this to ~/.config I can ln -s or follow this guide: https://vi.stackexchange.com/a/11881 

duti -s $(osascript -e 'id of app "Visual Studio Code"') .md all # found from https://superuser.com/a/1092184 in comments

# Install fonts
install_fonts() { # Taken from: https://apple.stackexchange.com/a/321938
	cd ~/Library/Fonts && { curl -O $1 cd - ; }
}

for i in {Regular,Bold,Italic,"Bold Italic"}; do
	install_fonts "https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS NF ${i}.ttf"
done


# Anime from Terminal
curl "https://raw.githubusercontent.com/whoisYoges/anime-terminal/master/anime-terminal" > anime-terminal
chmod +x anime-terminal
sudo mv anime-terminal /usr/local/bin/
