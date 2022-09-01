# Development Plan

## To Do list:

-[] Need to move the config files to base dir and have them all source those 
-[] Update all mac Sym links to the new locations
-[] Seperate out Mac Specific things form `~/.zshrc` and move source them just like I do for `~/.aliases` (e.g., anaconda repo). One alternative is to just change the default location on Mac (but not sure if possible with homebrew.
-[] Follow Steps 1 and 3 for install/setup scripts
-[] Update (`install.sh`) Aliases commands to include the new package manager specific aliases
-[] Update `dock_setup.sh` to include the new sed commands to manage the .zshrc file. Alternatively, I can just store the `.zshrc` file in the git repo. Should be possible but need to confirm that it is viable to have it consistent across screen sizes. I think it is fine so long as I have different `powerlevel10k` THEME files. But just need to compare with both work computer and laptop.
