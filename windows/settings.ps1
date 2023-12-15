# To check any additional properties use Get-ItemProperty -P... e.g.,
Get-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\DWM" -Name "AccentColor"

###############################
########### Theming ###########
###############################

# Set Accent Color to Purple (in ARGB Hex format)
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\DWM" -Name "AccentColor" -Value 4292281431  #If decimal format doesn't work: 0xFFCD48B3

# Set apps to use dark theme
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" -Name "AppsUseLightTheme" -Value 0

# Set Windows to use dark theme
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" -Name "SystemUsesLightTheme" -Value 0

###############################
#### File Explore Settings ####
###############################

# Show file extensions
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "HideFileExt" -Value 0

# Show hidden files
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "Hidden" -Value 1

# Set Windows Explorer to open to 'This PC'
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "LaunchTo" -Value 1

# Rename Your PC
Rename-Computer -NewName "BUDDYs-WIN10-PC"

# Restart the computer to implement the changes
Restart-Computer

###############################
############ GoXLR ############
###############################

# C:\Users\Buddy\Documents\GoXLR\MicProfiles
# mic.goxlrMicProfile
# C:\Users\Buddy\Documents\GoXLR\Profiles
# Streaming_-_Purple_Mic_Filter.goxlr

# User aided Pinned Taskbar

# Open Notepad
Start-Process "notepad.exe"

# Wait for 5 seconds
Start-Sleep -Seconds 5

# Wait for user input
Read-Host -Prompt "Press Enter to continue to the next application"

# Set the desktop background
$ImagePath = "C:\Path\To\Your\Image.jpg"
Set-ItemProperty -Path 'HKCU:\Control Panel\Desktop\' -Name Wallpaper -Value $ImagePath

# Refresh the desktop
rundll32.exe user32.dll, UpdatePerUserSystemParameters

# Set the path to your image
$LockScreenImagePath = "C:\Path\To\Your\LockScreenImage.jpg"

# Registry key and value for lock screen image (Windows 10 Pro and higher)
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Personalization" -Name "LockScreenImage" -Value $LockScreenImagePath


