#!/usr/bin/env bash

# Installing Xcode and the package Manager
sudo xcode-select --install || sudo xcode-select --reset || echo "XCode Already installed"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Installing CLI apps
brew install git \
             gh \
             bat \
             neofetch \
             python ipython\
             fzf \
             gtop \
             cmatrix \
             xclip \
             node \
             ffmpeg \
             duti \
             lf \
             nmap \
             netcat \
             docker-compose \
             docker-machine \
             trash-cli \
             autojump \
             tldr \
             thefuck \
             espeak \
             tmux \
             ranger \
             wget \
             nvim \
             onefetch \
             lsd \
             bottom \
             duf \
             dust \
             gping \
             zoxide \
             fd \
             ripgrep \
             rust \
             tmux \


# Installing GUI APPs
brew install --cask r \
                    rstudio \
                    amethyst \
                    mpv iina \
                    visual-studio-code \
                    sublime-text \
                    iterm2 \
                    firefox \
                    brave-browser \
                    xquartz \
                    docker \
                    virtualbox \
                    zoom \
                    slack \
                    spotify \
                    anaconda \
                    onlyoffice \
                    edex-ui \
                    itsycal \
                    insomnia \


# Install Ani-cli 
brew install curl grep axel openssl@1.1 ffmpeg git && \
brew install --cask iina
rm -rf "$(brew --prefix)/share/ani-cli" "$(brew --prefix)/bin/ani-cli" "$(brew --prefix)/bin/UI" "$(brew --prefix)"/bin/player_* #If some of these aren't found, it's not a problem
git clone "https://github.com/pystardust/ani-cli.git" && cd ./ani-cli
cp ./ani-cli "$(brew --prefix)"/bin 
cd .. && rm -rf ./ani-cli
