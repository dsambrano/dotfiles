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


# Installing GUI APPs
brew install --cask r \
                    rstudio \
                    amethyst \
                    mpv \
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


