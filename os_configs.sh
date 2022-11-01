#!/usr/bin/env bash

GITUNAME=$1
GITEMAIL=$2

# Git Configs:
git config --global user.name $GITUNAME
git config --global user.email $GITEMAIL
git config --global init.defaultBranch main # Set default branch name
git config --global pull.rebase false # true for rebase: source for meaning: https://stackoverflow.com/a/70627815
git config --global core.excludesFile "~/.gitignore_global" # https://stackoverflow.com/a/19299889
git config --global core.editor "nvim" # Use Nvim as default editor: https://stackoverflow.com/a/2596819


# Evaluate Zoxide for Modern CD:
eval "$(zoxide init zsh)"

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Termianl updates for ~/.zshrc to include each of the folloing as plugins
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k # ZSH_THEME="powerlevel10k/powerlevel10k"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions # plugins=( git zsh-autosuggestions )
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
# Use sed to recreate the file but change the appropriate options to match above. It stores a backup copy but can be remove manually or by replacing -i.bak with -i '' for no backup. https://stackoverflow.com/a/5171935
sed -i.bak 's/^plugins=(.*).*$/plugins=(git zsh-autosuggestions)/' ~/.zshrc
sed -i.bak 's,^ZSH_THEME="robbyrussell".*$,ZSH_THEME="powerlevel10k/powerlevel10k",' ~/.zshrc
# Another needs to be added with this: HIST_STAMPS="mm/dd/yyyy"
# Need more seds with # ENABLE_CORRECTION="true" and # COMPLETION_WAITING_DOTS="true"
# Here are some more for the p10k theme file at ~/.p10k.zsh taken from https://github.com/romkatv/powerlevel10k/issues/515#issuecomment-589054279:
# typeset -g POWERLEVEL9K_OS_ICON_FOREGROUND=232
# typeset -g POWERLEVEL9K_OS_ICON_BACKGROUND=7


# Install Custom fonts
## Linux Source: https://docs.fedoraproject.org/en-US/quick-docs/fonts/
install_fonts() { # Taken from: https://apple.stackexchange.com/a/321938
    FONT_DIR=~/.local/share/fonts/$1/
    mkdir -p $FONT_DIR
    cd $FONT_DIR
    wget $2
    cd -
}

for i in {Regular,Bold,Italic,"Bold Italic"}; do
    install_fonts "MesloLGS" "https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS NF ${i}.ttf"
done
## Update fonts cache
fc-cache -v


# Setup local bin folder
mkdir -p $HOME/.config/local/bin
mkdir -p $HOME/.local/bin

## NPM 
npm config set prefix '~/.local/' # npm -g install install in ~/.local/bin

## NVIM
npm i -g pyright

python3 -m venv ~/.config/nvim/env
source ~/.config/nvim/env/bin/activate
pip install wheel
pip install pynvim doq
deactivate

## Set up basic SSH template
mkdir -p ~/.ssh
echo """Host *
    IgnoreUnknown UseKeychain
    UseKeychain yes
    AddKeysToAgent yes

Host template
    Hostname 192.168.1.69
    Port 69420
    IdentityFile ~/.ssh/id_rsa

""" >> ~/.ssh/config

# Exports which need to be added to my ~/.zshrc file:
echo 'export PATH="$HOME/.cargo/bin:$PATH"' >> ~/.zshrc
echo "export RIPGREP_CONFIG_PATH=$HOME/.config/ripgrep/.ripgreprc" >> ~/.zshrc
echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.zshrc
echo "export EDITOR=/usr/bin/nvim" >> ~/.zshrc
echo 'export LS_COLORS="*README.md=04;31:$LS_COLORS"' >> ~/.zshrc
## zsh options
# https://scriptingosx.com/2019/07/moving-to-zsh-part-5-completions/
# echo "source ~/.aliases/aliases" >> ~/.zshrc # https://superuser.com/a/331766
# echo "source ~/.aliases/package_aliases" >> ~/.zshrc
