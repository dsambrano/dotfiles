#!/usr/bin/env bash

# Ask for the administrator password upfront
sudo -v

set -e

## Also need some of the following options:
### - Do you want to Sym links to keep all the files up to date?
### - Do you want to download the GH repos that I keep for default?
# Setup sample: https://sourabhbajaj.com/mac-setup/
GITUNAME="Deshawn Sambrano"
GITEMAIL="3dbrano3@gmail.com"
OS=Mac
# Obviously need to make it so they cant set incorret OS. 
# Also should make it download the folder once you select the OS probs. 
if [ $OS  == "Mac" ]; then
    OS_DIR=mac
fi

if [ $OS  == "Ubuntu" ]; then
    OS_DIR=linux/ubuntu
fi

if [ $OS  == "Fedora" ]; then
    OS_DIR=linux/fedora
fi



# Now Set up all the configs. First the general then the specific, to overwrite if necessary. 
##/bin/bash ./configs.sh
source ./$OS_DIR/os_configs.sh
