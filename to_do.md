


Basic ToDos for the dotfiles

- Update configs to use gnu stow
- Update themed configs (e.g., alacritty, kitty?, tmux?) to use `current_theme` and structure it such that it when updating the theme it just removes and recreates the symlink to that file (some items, e.g., waybar may require restart). This would mean that the theme import will never be change making git more happy. Then we just .gitignore the `current_theme` file and we will be full good and never have to update the dotfiles unless necessary making an *actual* change
- Third, need to update the structure, I am going to separate out the dotfiles and the install script. This is because the dotfiles should really be plug and play on any and every option (only exception is mac with a few tiny differences in aliases). So I will have an install script that can be called from curl as a one liner. It will be a different one for each distro which the user will configure (e.g., dsambrano.com/DISTRO where distro is fedora or arch etc. Will need to decide for my own website, which is easier to remember and control url OR use GH which is easier to ensure its at the lastest [could use a GH action to ensure its always updated on website potentially] ). That one file should be able to download and install and set up all the good stuff included properly installing the dotfiles.
- Add fcitx5-anthy to installs: `sudo dnf install fcitx5-anthy` 





 config to improve iteration (especially in python, but ideally in all variants) (see Typecraft for tmux pluging in nvim
