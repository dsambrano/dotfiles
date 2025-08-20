#!/usr/bin/env bash

# Main focus here is to update the theme in all the locations
#
# Ideally, this file doesn't know about about the wallpaper.
# A different file creates the theme and this just takes that theme and updates all the locations. 
# Caveat: The themer (pywall or wull or whatever) might directly creat the configs for a particular thing. If that is the case this file will resort to synchronizing the update of the themes (e.g., reload waybar etc.)
