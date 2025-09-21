
########################################
#### Should be a conditional install ###
########################################
# Install oh-my-zsh
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
    echo "Oh My ZSH already installed"
fi

# Termianl updates for ~/.zshrc to include each of the folloing as plugins
if [ ! -d "$HOME/.oh-my-zsh/custom/themes/powerlevel10k" ]; then
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k # ZSH_THEME="powerlevel10k/powerlevel10k"
fi
if [ ! -d "$HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions" ]; then
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions # plugins=( git zsh-autosuggestions )
fi
if [ ! -d "$HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting" ]; then
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
fi
# Use sed to recreate the file but change the appropriate options to match above. It stores a backup copy but can be remove manually or by replacing -i.bak with -i '' for no backup. https://stackoverflow.com/a/5171935
sed -i.bak 's/^plugins=(.*).*$/plugins=(git zsh-autosuggestions zsh-syntax-highlighting)/' ~/.zshrc
sed -i.bak 's,^ZSH_THEME="robbyrussell".*$,ZSH_THEME="powerlevel10k/powerlevel10k",' ~/.zshrc
# Another needs to be added with this: HIST_STAMPS="mm/dd/yyyy"
# Need more seds with # ENABLE_CORRECTION="true" and # COMPLETION_WAITING_DOTS="true"
# Here are some more for the p10k theme file at ~/.p10k.zsh taken from https://github.com/romkatv/powerlevel10k/issues/515#issuecomment-589054279:
# typeset -g POWERLEVEL9K_OS_ICON_FOREGROUND=232
# typeset -g POWERLEVEL9K_OS_ICON_BACKGROUND=7
