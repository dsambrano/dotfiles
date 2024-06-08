

sudo apt update && sudo apt upgrade

sudo apt install nala -y #nala-legacy on older than 22.04 # https://youtu.be/oroSkR4Nn_w https://christitus.com/stop-using-apt/

sudo nala install -y build-essential \
                     git \
                     python3-pip python3-venv neofetch zsh

# Need to add to path for zoxide:
eval "$(zoxide init zsh)"

sudo nala install -y npm nodejs wget bat fzf tldr fd-find ripgrep tmux ocrmypdf cargo texlive-full


## Github
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg
sudo chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null
sudo nala update
sudo nala install -y gh

## RUST INSTALL
### Essentails and Cargo	
sudo nala install -y build-essential cmake
curl https://sh.rustup.rs -sSf | sh
### Packages
cargo install ripgrep lsd git-delta
cargo install --locked zoxide bat
# curl -sS https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | bash

## FZF
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

## NVIM
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod u+x nvim.appimage
./nvim.appimage --appimage-extract
./squashfs-root/AppRun --version
mv squashfs-root nvim-squashfs-root
sudo mv nvim-squashfs-root /
sudo ln -s /nvim-squashfs-root/AppRun /usr/bin/nvim