#!/usr/bin/env bash

OS_DIR=$1

## Set up Vim
## Need to adjust location for this 
rm -rf ~/.vimrc || echo "No vimrc installed"
ln -s ~/git_repos/dotfiles/config/.vimrc ~/
#cp config/.vimrc ~/.vimrc # If I want to move this to ~/.config I can ln -s or follow this guide: https://vi.stackexchange.com/a/11881 

## NeoVim symlink and install plugins
rm -rf ~/.config/nvim || echo "No Neovim folder Installed"
ln -s ~/git_repos/dotfiles/config/nvim ~/.config # Requires that the git repos are already cloned. So this may need to be adjusted. 
## need to move Plugin files only here
nvim +PlugInstall +qall # Installing all Plugins
## need to move the rest of the files now: This will prevent the error for theming before installed

## Aliases symlinks and add them to zsh (Could be replaced in the furture with just symlinking the full .zsh and .p10k files over. Only fixes the echos not the symlinks, those would still need to be there) 
rm -rf ~/.aliases || echo "Alias folder does not exists"
mkdir -p ~/.aliases 
ln -s ~/git_repos/dotfiles/config/.aliases/aliases ~/.aliases/
ln -s ~/git_repos/dotfiles/$OS_DIR/config/.aliases/package_aliases ~/.aliases/
#cp -r config/.aliases ~/ # Needs to be replaced with a symlink option and need to call in the OS_dir here so I can also get the package_aliases file as well
echo "source ~/.aliases/aliases" >> ~/.zshrc # https://superuser.com/a/331766
echo "source ~/.aliases/package_aliases" >> ~/.zshrc
# Need to also add package_aliases I believe if I have that start with a `.` I can make a single `cp` line

# Bat symlinks
rm -rf $(bat --config-dir) || echo "bat folder does not exists"
ln -s ~/git_repos/dotfiles/config/bat/ $(bat --config-dir)


# Tmuxing
rm -rf ~/.tmux.conf || echo "tmux configs does not exists"
ln -s ~/git_repos/dotfiles/config/.tmux.conf ~/
tmux source-file ~/.tmux.conf # Set up config file
cd ~/.tmux/plugins/tpm/bin/
source ~/.tmux/plugins/tpm/bin/install_plugins
cd -

# If I want to add lsd configs: they go here: ~/.config/lsd/config.yaml: https://github.com/Peltoche/lsd#configuration

# MPV
rm -rf ~/.config/mpv || echo "MPV folder does not exists"
ln -s ~/git_repos/dotfiles/configs/mpv ~/.config/

# Others I still need to symlink
