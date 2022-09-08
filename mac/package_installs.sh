#!/usr/bin/env bash

sudo xcode-select --install || sudo xcode-select --reset || echo "XCode Already installed"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

brew install git gh bat neofetch python fzf btop cmatrix xclip node ffmpeg duti lf nmap netcat docker-compose docker-machine trash-cli autojump tldr thefuck espeak tmux ranger wget nvim onefetch
brew install --cask r rstudio amethyst mpv visual-studio-code sublime-text iterm2 firefox brave-browser xquartz docker virtualbox zoom slack spotify anaconda onlyoffice edex-ui itsycal insomnia

