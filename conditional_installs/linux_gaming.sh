#!/usr/bin/env bash

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

