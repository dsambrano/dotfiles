#!/usr/bin/env bash

# Installing RPM Fusion Repos
## Free
sudo dnf install \
  https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm -y
## Non Free
sudo dnf install \
  https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm -y

sudo dnf update -y

sudo dnf install git gnome-tweaks dnf-plugins-core 'dnf-command(config-manager)' zsh neovim bat neofetch htop fzf cmatrix nmap tldr rust mpv aria2 steam-devices -y

# Exports 
export EDITOR=/usr/bin/nvim


# Configs	
setxkbmap -option "caps:swapescape"
gsettings set org.gnome.desktop.input-sources xkb-options '["caps:swapescape"]' # Appears Fedora Gnome Specific: https://ask.fedoraproject.org/t/xkboptions-not-effective-after-login/10691/2


# Install Brave
sudo dnf config-manager --add-repo https://brave-browser-rpm-release.s3.brave.com/x86_64/
sudo rpm --import https://brave-browser-rpm-release.s3.brave.com/brave-core.asc
sudo dnf install brave-browser

# Install GH
sudo dnf config-manager --add-repo https://cli.github.com/packages/rpm/gh-cli.repo
sudo dnf install gh
mkdir ~/git_repos
git auth login

# Install Docker
## Source: https://docs.docker.com/engine/install/fedora/#install-using-the-repository
sudo dnf config-manager \
    --add-repo \
    https://download.docker.com/linux/fedora/docker-ce.repo
sudo dnf install docker-ce docker-ce-cli containerd.io docker-compose-plugin
## Start the docker process
sudo systemctl start docker

# Install Zoom
sudo dnf install wget -y 
wget https://zoom.us/client/latest/zoom_x86_64.rpm
dnf localinstall zoom_x86_64.rpm

# Install Custom fonts
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

# Switch Default Shell to ZSH
sudo dnf install util-linux-user  util-linux
chsh -s $(which zsh)

# Flathub setup
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak remote-modify --enable flathub

## Installing Flatpak Apps
flatpak install flathub com.slack.Slack # net.davidotek.pupgui2 #(previous one is for protonup-qt) com.brave.Browser
# Other potential useful software dev tools: 
# - rest.insomnia.Insomnia: Insomnia for web dev/ head testing info


# Gaming Specific Installs
## Proprietary drives (already installed nonfree RPM repos above): Could be useful to programmatically install these or keep for amd: `lspci | grep VGA` source: https://phoenixnap.com/kb/fedora-nvidia-drivers
sudo dnf install kmod-nvidia -y
sudo dnf install xorg-x11-drv-nvidia-cuda -y # This is for cuda support (likely for ML)

## Installing packages
sudo dnf install gamemode discord steam mangohud gamescope
### flatpak install flathub com.valvesoftware.Steam com.discordapp.Discord # not sure if I want fp version or nah 
flatpak install flathub net.davidotek.pupgui2 # net.lutris.Lutris com.heroicgameslauncher.hgl
### Below is no longer needed because I am switching from flatpak to the fusion repos
## Game Specific info: So it turns out that installing steam via flatpak moves things just a tad, but here is the location for apex's config file under flatpak install. You will want to change the profile/profile.cfg as well as videoconfig.txt and settings.cfg from the local folder. directory located: /home/buddy/.var/app/com.valvesoftware.Steam/.local/share/Steam/steamapps/compatdata/1172470/pfx/drive_c/users/steamuser/Saved Games/Respawn/Apex 
