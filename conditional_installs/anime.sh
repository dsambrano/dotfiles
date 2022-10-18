#!/usr/bin/env bash

## Currently only out of place for testing purposes. When fixed this should not go here. Maybe combine with zsh in a general install. Else could place just inside the install script. Nvm, this needs to go in the conditionals. 
# Anime from Terminal
## Installing Dependencies 
brew install aria2
curl "https://raw.githubusercontent.com/whoisYoges/anime-terminal/master/anime-terminal" > anime-terminal
chmod +x anime-terminal
sudo mv anime-terminal /usr/local/bin/
## Adding Man Pages
curl "https://raw.githubusercontent.com/whoisYoges/anime-terminal/master/anime-terminal.1" > anime-terminal.1
sudo mv anime-terminal.1 /usr/share/man/man1/
