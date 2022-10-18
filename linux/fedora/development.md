# Development Decisions

## To Do list:
-[] Switch current aliases folder to be two symlinks, one for global git repo and one for fedora specific (could make them no longer a folder, but I like for organization and for non symlink usage)
-[] Go back and see which have already been tested, and test the unix general ones that way I can be sure the script just works
-[] Install MPV, Anime from terminal, and nVidia Proprietary drivers through RPM Fusions 
-[] Set up some keyboard shortcuts: e.g., Super+B is brave, Super+T terminal 
-[] Install WM (awesome)
-[] Use custom Grub (Much later; create custom grub either purple or vegeta theme)
-[] The final product should be something that is an install script that should eb identical that calls in functions/scripts to run the necessarythings. E.g install packages/games/fonts etc. Then a separate config script that does all the config stuff. The main script can grab the distro name and all DE and then implement the stuff it needs. can use source to run each file with a `BASE_PATH` variable to based on OS and De.([source](https://stackoverflow.com/a/10823213))
