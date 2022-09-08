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
    wine winetricks

# Exports 
export EDITOR=/usr/bin/nvim


# Configs	
setxkbmap -option "caps:swapescape"
gsettings set org.gnome.desktop.input-sources xkb-options '["caps:swapescape"]' # Appears Fedora Gnome Specific: https://ask.fedoraproject.org/t/xkboptions-not-effective-after-login/10691/2
## More configs similar to macOS should be using the `dconf` command: source (https://unix.stackexchange.com/a/426348)
### Example: dconf dump /
###Actually gsettings appears to be a higher level version that is much easier to work with. Much more akin to `defaults`. 

## Dracula colors for terminal using dconf: https://draculatheme.com/gnome-terminal
git clone https://github.com/dracula/gnome-terminal
cd gnome-terminal
./install.sh
echo "eval `dircolors ~/.dir_colors/dircolors`" >> ~/.zshrc
# The new dircolors have been installed as /home/buddy/.dir_colors/dircolors.
# Add "eval `dircolors /path/to/dircolorsdb`" in your shell configuration file (.bashrc, .zshrc, etc...) to use new dircolors.


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

# NVIM configs
sudo dnf install -y libstdc++ g++ # https://github.com/nvim-treesitter/nvim-treesitter/issues/626#issuecomment-831972947
## need to move Plugin files only here
nvim +PlugInstall +qall # Installing all Plugins
## need to move the rest of the files now: This will prevent the error for theming before installed

# Install Onefetch: https://github.com/o2sh/onefetch
sudo dnf copr enable varlad/onefetch -y
sudo dnf install onefetch -y

# Switch Default Shell to ZSH
sudo dnf install util-linux-user  util-linux
chsh -s $(which zsh)

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
## Prepping Plugins
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k # ZSH_THEME="powerlevel10k/powerlevel10k"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions # plugins=( git zsh-autosuggestions )
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
# Use sed to recreate the file but change the appropriate options to match above. It stores a backup copy but can be remove manually or by replacing -i.bak with -i '' for no backup. https://stackoverflow.com/a/5171935
sed -i.bak 's/^plugins=(.*).*$/plugins=(git zsh-autosuggestions zsh-syntax-highlighting)/' ~/.zshrc
sed -i.bak 's,^ZSH_THEME="robbyrussell".*$,ZSH_THEME="powerlevel10k/powerlevel10k",' ~/.zshrc

# Flathub setup
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak remote-modify --enable flathub

## Installing Flatpak Apps
flatpak install flathub com.slack.Slack # net.davidotek.pupgui2 #(previous one is for protonup-qt) com.brave.Browser
# Other potential useful software dev tools: 
# - rest.insomnia.Insomnia: Insomnia for web dev/ head testing info

## Installing GoXLR setup:
LOCATION=$( curl -s "https://api.github.com/repos/GoXLR-on-Linux/goxlr-utility/releases" \
    | grep "browser_download_url.*.rpm" \
    | head -1 \
    | sed 's/.* //' \
    | cut -d '"' -f 2) # Removes Double Quotes: https://stackoverflow.com/a/35636517
wget $LOCATION
sudo rpm -i goxlr*rpm # Source: https://phoenixnap.com/kb/how-to-install-rpm-file-centos-linux https://www.cyberciti.biz/faq/rhel-redhat-fedora-opensuse-linux-install-rpmfile-command/
sudo dnf install goxlr-utility
cd git_repos
g clone git@github.com:GoXLR-on-Linux/goxlr-ui.git
cd goxlr-ui
npm install
npm run serve

# Gaming Specific Installs
## Proprietary drives (already installed nonfree RPM repos above): Could be useful to programmatically install these or keep for amd: `lspci | grep VGA` source: https://phoenixnap.com/kb/fedora-nvidia-drivers
## Alternative to the above: (nvidia-smi) (source: https://unix.stackexchange.com/a/184873)
sudo dnf install kmod-nvidia -y
sudo dnf install xorg-x11-drv-nvidia-cuda -y # This is for cuda support (likely for ML)

## Installing packages
sudo dnf install gamemode discord steam mangohud gamescope
### flatpak install flathub com.valvesoftware.Steam com.discordapp.Discord # not sure if I want fp version or nah 
flatpak install flathub net.davidotek.pupgui2 # net.lutris.Lutris com.heroicgameslauncher.hgl
### Below is no longer needed because I am switching from flatpak to the fusion repos
## Game Specific info: So it turns out that installing steam via flatpak moves things just a tad, but here is the location for apex's config file under flatpak install. You will want to change the profile/profile.cfg as well as videoconfig.txt and settings.cfg from the local folder. directory located: /home/buddy/.var/app/com.valvesoftware.Steam/.local/share/Steam/steamapps/compatdata/1172470/pfx/drive_c/users/steamuser/Saved Games/Respawn/Apex 
### Setting up the smash box:
#### Setting up xinput instead of dinput (native for smashbox): https://steamcommunity.com/app/236090/discussions/0/558748653724279774/?l=russian
### Smashbox Designer https://gitlab.com/Luberry/hb-wine-cfg
# Smash Box: make sure to uncheck all checkboxes in the installer.
winetricks prefix=hit_box ./smash_box_designer.verb
### Jak and Daxter: https://www.youtube.com/watch?v=p8I9NfuZOgE
