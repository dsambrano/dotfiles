#!/usr/bin/env bash

### Setting up the smash box:
#### Setting up xinput instead of dinput (native for smashbox): https://steamcommunity.com/app/236090/discussions/0/558748653724279774/?l=russian
### Smashbox Designer https://gitlab.com/Luberry/hb-wine-cfg
# Smash Box: make sure to uncheck all checkboxes in the installer.
winetricks prefix=hit_box ./smash_box_designer.verb
### Jak and Daxter: https://www.youtube.com/watch?v=p8I9NfuZOgE
sudo dnf install antimicrox # For Smashbox (https://github.com/AntiMicroX/antimicrox#installation) also see https://discordapp.com/channels/297604571704983572/297604571704983572/1016756522610602014
