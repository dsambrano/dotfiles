#!/usr/bin/env bash

set -e

# Setting Preferences for Dock

# Built upon from https://stackoverflow.com/a/72106853 and https://stackoverflow.com/a/59637792

__dock_item() {
    printf '%s%s%s%s%s' \
           '<dict><key>tile-data</key><dict><key>file-data</key><dict>' \
           '<key>_CFURLString</key><string>' \
           "$1" \
           '</string><key>_CFURLStringType</key><integer>0</integer>' \
           '</dict></dict></dict>'
}

printf '%s' 'Setting up Dock icons...'
defaults write com.apple.dock \
               persistent-apps -array "$(__dock_item /Applications/Safari.app)" \
				      "$(__dock_item /Application/iTerm.app)"
				      "$(__dock_item /Application/Firefox.app)"
                                      "$(__dock_item /System/Applications/Utilities/Terminal.app)"
                                      "$(__dock_item /System/Applications/Utilities/Messages.app)"
				      

printf '%s\n' ' done.'

# Dock Config
defaults write com.apple.dock orientation left # Place on left
defaults write com.apple.dock "autohide" -bool "true" # Auto hide
defaults write com.apple.dock "autohide-time-modifier" -float "0" # No animation time


# Finder config
defaults write NSGlobalDomain "AppleShowAllExtensions" -bool "true" # Show extensions
defaults write com.apple.Finder "AppleShowAllFiles" -bool "true" # Show hidden files


# Menu config
defaults write com.apple.menuextra.clock "DateFormat" -string "\"EEE MMM d  h:mm:ss a\""  # https://macos-defaults.com/#🙋-what-s-a-defaults-command
defaults write -g AppleInterfaceStyle Dark # https://apple.stackexchange.com/questions/391686/how-to-set-dark-mode-appearance-to-auto-in-terminal


killall Dock


read -t 30 -p "The configs are complete. Although some will not be updated until the next reboot. Would you like to reboot now? [Y]/N" restart
restart=${restart:-N} # If parameter is unset or null, the expansion of word is substituted. Else whatever was read in

