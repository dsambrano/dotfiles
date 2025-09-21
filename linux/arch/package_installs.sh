#!/usr/bin/env bash


#########################
### Dev Only Packages ###
#########################

sudo pacman -S lsd bat fd fzf jq git-delta zoxide ripgrep cargo neovim git starship fastfetch github-cli stow zsh which alacritty openssh ghostty which man-db tldr npm nodejs wget tmux htop duf

# --noconfirm



function full_install() {
    while true; do
        read -p "Do you do a full Arch install (this will install hyprland setup the DE) or [D]ev packages only? ([f]ull/[D]ev only/[c]ancel) " yn
        case $yn in
            [Ff]* ) return 0;;
            [Dd]* ) return 1;;
            [Cc]* ) exit;;
            * ) echo "Please answer f, d, or c.";;
        esac
    done
}

# DE
if full_install; then
    sudo pacman -S sudo hyprland waybar hypridle hyprpicker hyprlock hyprpolkitagent SwayNotificationCenter xdg-desktop-portal-hyprland xdg-desktop-portal-gtk wofi wireplumber pipewire wl-clipboard flatpak gnome-themes-extra grim networkmanager notofonts noto-fonts-emoji firefox nautilus gdm adw-gtk-theme mpv ocrmypdf fcitx5-anthy wine gamemode mangohud gamescope xdg-utils

    # Gnome's new papers Doc viewer (https://archlinux.org/packages/extra/x86_64/papers/):
    # sudo pacman -S papers
    # Same but for Image viewer (https://archlinux.org/packages/extra-testing/x86_64/loupe/)
    # sudo pacman -S loupe
    # Here are alts: Gwenview, Loupe, imv, and swayimg

    # Install Yay
    sudo pacman -S --needed git base-devel && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si

    # Install Paru
    sudo pacman -S --needed git base-devel && git clone https://aur.archlinux.org/paru.git && cd paru && makepkg -si

    # Yay installs
    yay -S brave-bin steam-devices goxlr-utility

    # Dark Themes https://www.reddit.com/r/hyprland/comments/1h4abmt/comment/lzx4j8g/?utm_source=share&utm_medium=web3x&utm_name=web3xcss&utm_term=1&utm_content=share_button
    # gsettings set org.gnome.desktop.interface gtk-theme "adw-gtk3-dark"

fi













# Need Look at dotfiles to set up neovim for packages:
# Also need to add gh
# See how I did zsh
function confirm() {
    while true; do
        read -t .1 -p "Set up Shell ? (YES/NO/CANCEL) " yn
        yn=${yn:-n}
        echo "Auto Skipping because its in (pre-alpha)"
        case $yn in
            [Yy]* ) return 0;;
            [Nn]* ) return 1;;
            [Cc]* ) exit;;
            * ) echo "Please answer YES, NO, or CANCEL.";;
        esac
    done
}

# Example usage
if confirm; then
    # Starship:
    eval "$(starship init zsh)"

    # Oh-My-Zsh
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

    # Install P10K without OMZ
    yay -S --noconfirm zsh-theme-powerlevel10k-git
    echo 'source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc


    ### flatpak install flathub com.valvesoftware.Steam com.discordapp.Discord # not sure if I want fp version or nah 
    flatpak install com.valvesoftware.Steam com.discordapp.Discord us.zoom.Zoom 
    # Anki and protonupqt
    # net.ankiweb.Anki net.davidotek.pupgui2 #(previous one is for protonup-qt)

fi
