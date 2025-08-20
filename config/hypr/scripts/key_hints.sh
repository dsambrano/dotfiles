#!/usr/bin/env bash

# GDK BACKEND. Change to either wayland or x11 if having issues
BACKEND=wayland

# Check if rofi or yad is running and kill them if they are
if pidof rofi > /dev/null; then
  pkill rofi
fi

if pidof yad > /dev/null; then
  pkill yad
fi

# Launch yad with calculated width and height
GDK_BACKEND=$BACKEND yad \
    --center \
    --title="Keyboard Shortcuts" \
    --no-buttons \
    --list \
    --column=Key: \
    --column=Effect: \
    --timeout=3 \
    --timeout-indicator=bottom \
    "E" "Example" \
    " = " "Sample"

