
wallpaper="~/.config/hypr/wallpaper/.current"

focused_monitor=$(hyprctl monitors -j | jq -r '.[] | select(.focused) | .name')

# Transition config
FPS=30
TYPE="any"
DURATION=3
BEZIER=".43,1.19,1,.4"
SWWW_PARAMS="--transition-fps $FPS --transition-type $TYPE --transition-duration $DURATION --transition-bezier $BEZIER"

echo "swww img -o $focused_monitor ${wallpaper} $SWWW_PARAMS"
# swww query || swww-daemon --format xrgb &
swww img -o $focused_monitor ${wallpaper} $SWWW_PARAMS
