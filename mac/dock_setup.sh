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
# Use sed to recreate the file but change the appropriate options to match above. It stores a backup copy but can be remove manually or by replacing -i.bak with -i '' for no backup. https://stackoverflow.com/a/5171935
sed -i.bak 's/^plugins=(.*).*$/plugins=(git zsh-autosuggestions)/' ~/.zshrc
sed -i.bak 's,^ZSH_THEME="robbyrussell".*$,ZSH_THEME="powerlevel10k/powerlevel10k",' ~/.zshrc
# Another needs to be added with this: HIST_STAMPS="mm/dd/yyyy"
# Need more seds with # ENABLE_CORRECTION="true" and # COMPLETION_WAITING_DOTS="true"

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
## Set hot corners https://wilsonmar.github.io/dotfiles/#desktop-scren-saver-hot-corners
### Top right screen corner → Mission Control
defaults write com.apple.dock wvous-tr-corner -int 2
defaults write com.apple.dock wvous-tr-modifier -int 0
### Top right screen corner → Put Display to Sleep
defaults write com.apple.dock wvous-tr-corner -int 10
defaults write com.apple.dock wvous-tr-modifier -int 0


# Was looking for additional things to change. One solution came up: https://apple.stackexchange.com/a/322417
# Finder config
defaults write NSGlobalDomain AppleShowScrollBars -string "WhenScrolling" # Show scroll bars only when scrolling: options are Always
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

# Mouse
## Set Mouse/Trackpad Speed
defaults write -g com.apple.trackpad.scaling -float 3.0
defaults write -g com.apple.mouse.scaling -float 3.0
## Set Trackpad Gestures https://superuser.com/a/868797 
## More on defaults command: https://ss64.com/osx/defaults.html
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad DragLock -bool false
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Dragging -bool false
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadCornerSecondaryClick -bool false
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadFiveFingerPinchGesture -int 2
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadFourFingerHorizSwipeGesture -int 2
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadFourFingerPinchGesture -int 2
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadFourFingerVertSwipeGesture -int 2
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadHandResting -bool true
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadHorizScroll -bool true
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadMomentumScroll -bool true
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadPinch -bool true
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadRightClick -bool true
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadRotate -bool true
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadScroll -bool true
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerDrag -int 2
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerHorizSwipeGesture -int 2
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerTapGesture -int 2
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerVertSwipeGesture -int 2
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadTwoFingerDoubleTapGesture -bool true
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadTwoFingerFromRightEdgeSwipeGesture -int 3;
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad USBMouseStopsTrackpad -bool false

# Keybinds
## More infor here:
### - https://apple.stackexchange.com/a/66971
### - https://apple.stackexchange.com/a/36612
mkdir -p ~/Library/Keybindings/
echo """
 {
    "^x" = cut:;
    "^c" = copy:;
    "^v" = paste:;
}
""" >> ~/Library/Keybindings/DefaultKeybinding.dict

# Generic Settings
## Save screenshots in lossless PNG format
## rather than defaul JPG (other options: BMP, GIF, JPG, PDF, TIFF)
defaults write com.apple.screencapture type -string "png"
## Require password immediately after sleep or screen saver begins
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0
## Save screenshots to the desktop
#defaults write com.apple.screencapture location -string "${HOME}/Desktop"
## This makes your Mac run quicker (alledgely, not sure if I believe but you can activate if you want):
## Hide All Desktop Icons from http://osxdaily.com/2009/09/23/hide-all-desktop-icons-in-mac-os-x/
## The files are still in Desktop directory, but they are now not shown.
# defaults write com.apple.finder CreateDesktop -bool false;killall Finder

## Fancy screen saver like apple tv. Combines with Aerial from brew install
## Got settings from: defaults -currentHost write com.apple.screensaver https://apple.stackexchange.com/a/283374
defaults -currentHost write com.apple.screensaver "{
    CleanExit = YES;
    PrefsVersion = 100;
    idleTime = 600;
    moduleDict =     {
        moduleName = Aerial;
        path = \"${HOME}/Library/Screen Savers/Aerial.saver\";
        type = 0;
    };
    showClock = 0;
}"




killall Dock; killall Finder

# Set Start Up Apps
osascript -e 'tell application "iTerm" to open the startup disk'







# End script and restart 
read -t 30 -p "The configs are complete. Although some will not be updated until the next reboot. Would you like to reboot now? [Y]/N" restart
restart=${restart:-N} # If parameter is unset or null, the expansion of word is substituted. Else whatever was read in

