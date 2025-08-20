#!/usr/bin/env bash

generic_dir="$HOME/git_repos/dotfiles/wallpapers/generic/"
db_dir="$HOME/git_repos/dotfiles/wallpapers/dragon_ball/"
wallDIR=($generic_dir $db_dir)
# Use this if I want equal probs of choosing db vs generic 
# wallDIR=${wallDIR[ $RANDOM % ${#wallDIR[@]} ]}
SCRIPTSDIR="$HOME/.config/hypr/scripts"

focused_monitor=$(hyprctl monitors -j | jq -r '.[] | select(.focused) | .name')

PICS=($(find -L ${wallDIR} -type f \( -name "*.jpg" -o -name "*.jpeg" -o -name "*.png" -o -name "*.pnm" -o -name "*.tga" -o -name "*.tiff" -o -name "*.webp" -o -name "*.bmp" -o -name "*.farbfeld" -o -name "*.gif" \)))
RANDOMPICS=${PICS[ $RANDOM % ${#PICS[@]} ]}

update_wallpaper(){
    # Here I will can do anything I want with the new thing.
    # I might even actually do the running in this
    echo "New wallpaper $1"

    # Unlink Old wallpaper symlink
    # ln -s $1 $HOME/.config/hypr/.current_wallpaper
    # Link new file
}


update_wallpaper $RANDOMPICS

# Transition config
FPS=30
TYPE="any"
DURATION=3
BEZIER=".43,1.19,1,.4"
SWWW_PARAMS="--transition-fps $FPS --transition-type $TYPE --transition-duration $DURATION --transition-bezier $BEZIER"

echo "swww img -o $focused_monitor ${RANDOMPICS} $SWWW_PARAMS"
# swww query || swww-daemon --format xrgb &
swww img -o $focused_monitor ${RANDOMPICS} $SWWW_PARAMS


get_wallpaper_theme(){
    echo get
    # For now it should be pywall

    # In the future might switch the wallust
}

set_wallpaper_theme(){
    echo set

    # waybar plus reload waybar

    # term theme 
    
    # In ideal worls tmux theme as well
    # 👀
    # source-file ~/.tmux.conf
}

