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

# Allow Remote login with SSH
sudo systemsetup -setremotelogin on
# sudo launchctl load -w /System/Library/LaunchDaemons/ssh.plist # not sure if I need both

# Iterm2 updates don't forget to update the ~/.zshrc to include each of the folloing as plugins:
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k # ZSH_THEME="powerlevel10k/powerlevel10k"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions # plugins=( git zsh-autosuggestions )


## Defaults config see (https://lupin3000.github.io/macOS/defaults/) for additional options
## More info about defaults can be found here:
## - https://eclecticlight.co/2017/11/09/customising-it-all-global-defaults-in-macos-sierra-and-high-sierra/
## - https://www.shell-tips.com/mac/defaults/
## - https://wilsonmar.github.io/dotfiles/
## - https://github.com/mathiasbynens/dotfiles/blob/master/.macos
# Dock Config
defaults write com.apple.dock orientation left # Place on left
defaults write com.apple.dock "autohide" -bool "true" # Auto hide
defaults write com.apple.dock "autohide-time-modifier" -float "0" # No animation time
defaults write com.apple.dock no-bouncing -bool true # Remove bouncing animation from: https://www.switchingtomac.com/tutorials/how-to-permanently-stop-dock-icons-from-bouncing/

# Finder config
defaults write NSGlobalDomain "AppleShowAllExtensions" -bool "true" # Show extensions
defaults write com.apple.Finder "AppleShowAllFiles" -bool "true" # Show hidden files
defaults write com.apple.Finder _FXSortFoldersFirst -bool true # folders on top when sorting by name
defaults write com.apple.Finder _FXShowPosixPathInTitle -bool true # show POSIX path
defaults write com.apple.Finder WarnOnEmptyTrash -bool false # disable the warning before emptying the Trash
# osascript -e 'tell application "Finder" to set desktop picture to POSIX file "<path/to/image>"' # set background image
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf" # When performing a search, search the current folder by default
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false # Disable the warning when changing a file extension



# Menu config
defaults write com.apple.menuextra.clock "DateFormat" -string "\"EEE MMM d  h:mm:ss a\""  # https://macos-defaults.com/#🙋-what-s-a-defaults-command
defaults write -g AppleInterfaceStyle Dark # https://apple.stackexchange.com/questions/391686/how-to-set-dark-mode-appearance-to-auto-in-terminal
defaults write -g AppleHighlightColor "0.847059 0.847059 0.862745 Graphite" # Setting my highlight color

# Set Mouse/Trackpad Speed
defaults write -g com.apple.trackpad.scaling -float 3.0
defaults write -g com.apple.mouse.scaling -float 3.0


killall Dock

# Set Start Up Apps
osascript -e 'tell application "iTerm" to open the startup disk'







# End script and restart 
read -t 30 -p "The configs are complete. Although some will not be updated until the next reboot. Would you like to reboot now? [Y]/N" restart
restart=${restart:-N} # If parameter is unset or null, the expansion of word is substituted. Else whatever was read in

