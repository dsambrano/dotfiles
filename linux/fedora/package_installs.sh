#!/usr/bin/env bash

# Installing RPM Fusion Repos
## Free
sudo dnf install \
  https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm -y
## Non Free
sudo dnf install \
  https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm -y

sudo dnf update -y

sudo dnf install -y \
    git \
    npm \
    wget \
    gnome-tweaks \
    dnf-plugins-core \
    'dnf-command(config-manager)' \
    zsh \
    neovim \
    bat \
    neofetch \
    htop \
    fzf \
    cmatrix \
    nmap \
    tldr \
    rust \
    mpv \
    aria2 \
    steam-devices \
    gnome-open libgnome \
    qpwgraph \
    dconf \
    wine winetricks \
    lsd \
    duf \
    zoxide \
    fd-find \
    ripgrep \
    cargo \
    tmux \

# Need to add to path for zoxide:
eval "$(zoxide init zsh)"
# Consider adding this to my nvim config: https://github.com/nanotee/zoxide.vim

# Installing from copr
sudo dnf copr enable atim/bottom -y && sudo dnf install bottom -y
sudo dnf copr enable atim/gping -y && sudo dnf install gping -y

# Installing from npm
sudo npm install gtop -g

# Installing from cargo
cargo install du-dust
export PATH="$HOME/.cargo/bin:$PATH"


# Install Brave
sudo dnf config-manager --add-repo https://brave-browser-rpm-release.s3.brave.com/x86_64/
sudo rpm --import https://brave-browser-rpm-release.s3.brave.com/brave-core.asc
sudo dnf install brave-browser -y

# Install GH
sudo dnf config-manager --add-repo https://cli.github.com/packages/rpm/gh-cli.repo
sudo dnf install gh -y

# Install Docker
## Source: https://docs.docker.com/engine/install/fedora/#install-using-the-repository
sudo dnf config-manager \
    --add-repo \
    https://download.docker.com/linux/fedora/docker-ce.repo
sudo dnf install docker-ce docker-ce-cli containerd.io docker-compose-plugin
## Start the docker process
sudo systemctl start docker

# Install Zoom
wget https://zoom.us/client/latest/zoom_x86_64.rpm
dnf localinstall zoom_x86_64.rpm

# Install Onefetch: https://github.com/o2sh/onefetch
sudo dnf copr enable varlad/onefetch -y
sudo dnf install onefetch -y

# Flathub setup
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak remote-modify --enable flathub

## Installing Flatpak Apps
flatpak install flathub com.slack.Slack # net.davidotek.pupgui2 #(previous one is for protonup-qt) com.brave.Browser
# Other potential useful software dev tools: 
# - rest.insomnia.Insomnia: Insomnia for web dev/ head testing info
