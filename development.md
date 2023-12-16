# Development Plan

Another To-Do from Clean Ubuntu (12/12/23)
-[] Add my custom functions like the tmux-sessionizer etc.
-[] Add `rbenv` to installs
-[] Try to make the installs more compartmentalized where they only do the ones that have to be done with the Distro's package manager, if it done with cargo, or anything it should be in the general install section (just go through and separate them more)
-[] Make more options for running it (e.g., ubunutu desktop vs server) I want to have gui apps completely separate so that can be installed only where relevent
-[] There were some things that I ran and didnt work on first attempt but then didnt change anything and they worked... Could just be from the weird pasting on windows so just confirm (nvim and tmux come to mind)
-[] I should probably find a way to not have to rerun powerlevels10k each time. Just install and move over the `.zshrc` / `powerlevels10k` files, I think that is a better idea.

## To Do list:

-[] Need to move the config files to base dir and have them all source those 
-[] Update all mac Sym links to the new locations
-[] Seperate out Mac Specific things form `~/.zshrc` and move source them just like I do for `~/.aliases` (e.g., anaconda repo). One alternative is to just change the default location on Mac (but not sure if possible with homebrew.
-[] Follow Steps 1 and 3 for install/setup scripts
-[] Update (`install.sh`) Aliases commands to include the new package manager specific aliases
-[] Update `dock_setup.sh` to include the new sed commands to manage the .zshrc file. Alternatively, I can just store the `.zshrc` file in the git repo. Should be possible but need to confirm that it is viable to have it consistent across screen sizes. I think it is fine so long as I have different `powerlevel10k` THEME files. But just need to compare with both work computer and laptop.
-[] Need to diff the init.vim with local and repo to see what changes to makge and the of course sym link everything properly
-[] Oranizing setup:
  - Main installs
    - clis and CASKs (Mac)
    - main repos vs proprietary repos/PPA etc (linx)
  - Configs
    - general configs (change keys and dock settings)
    - set up all sym links
    - should have some of these be general and some specific and the function pulls in whatever is necessary.
    - Some examples for general. Font install, zsh configs. some specifics would include package_aliases (regular aliases would stay in general)
    - symlinks are similar here, were some are generic and other specific. 
  - Post installs
    - This is where you do all the install that for whatever reason require additional things first 
  - Conditionals
    - this is where you set up all the things that that require and if statement. E.g., are the gaming things going to be setup. or for Ubuntu is the GUI or just the CLI stuff loaded etc. TBF if ubuntu its literally alwasy just the CLI. I pretty much will never have a DE on ubuntu. So perhaps a better option is gaming/smashbox/GoXLR. 
 -[] Symlinks: MPV, Rstudio
 -[] Using the python script to fix VScode's font
 -[] Need to add `eval "$(zoxide init zsh)"` to the `.zshrc`
