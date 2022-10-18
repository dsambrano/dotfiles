#! /usr/bin/bash

set -e

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
xcode-select --install

brew install git gh bat neofetch fzf htop cmatrix xclip node ffmpeg duti
brew install --cask r rstudio amethyst mpv visual-studio-code sublime-text iterm2 firefox brave-browser xquartzdocker zoom slack spotify anaconda

git config --global user.name 'Deshawn Sambrano'
git config --global user.email ''


cat << EOF >> ~/.zprofile
# Add Visual Studio Code (code)
export PATH="\$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
EOF

export PATH="\$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

# Aliases
echo 'alias xclip="xclip -sel clip"' >> ~/.zshrc

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Set up Vim
echo "syntax on
set number" >> ~/.vimrc # If I want to move this to ~/.config I can ln -s or follow this guide: https://vi.stackexchange.com/a/11881 

duti -s $(osascript -e 'id of app "Visual Studio Code"') .md all # found from https://superuser.com/a/1092184 in comments

# Anime from Terminal
curl "https://raw.githubusercontent.com/whoisYoges/anime-terminal/master/anime-terminal" > anime-terminal
chmod +x anime-terminal
sudo mv anime-terminal /usr/local/bin/
