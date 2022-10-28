#!/usr/bin/env bash
# Adapted from: https://www.roboleary.net/2021/09/02/linux-change-wallpaper.html

folder="${HOME}/git_repos/dotfiles/wallpapers"
pic=$(find wallpapers | grep "jpg$" |shuf -n1)

# values for picture-options: ‘none’, ‘wallpaper’, ‘centered’, ‘scaled’, ‘stretched’, ‘zoom’, ‘spanned’
gsettings set org.gnome.desktop.background picture-options 'scaled'
gsettings set org.gnome.desktop.background picture-uri "file://$pic"


# Dont forget to set as cron job with: 0 * * * * env DISPLAY=:0 DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/1000/bus /home/your-name/.local/bin/change-wallpaper

