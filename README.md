## Dotfiles

This contains my basic setup/configuration scripts for each of my OS's.
Currently, I have MacOS, Ubuntu, and Fedora working.

## Installation

First download the repo in a zip file or via `git clone`:

```bash
git clone "https://github.com/dsambrano/dotfiles" && cd dotfiles
```

Next, you need to give `install.sh` execution permission with 

```bash
chmod +x install.sh
```

Finally, you can run the script:

```bash
./install.sh
```

## Script Actions

The script will start off by asking you a few questions for your git settings.
The OS will automatically be detected and will run through the script specific for your OS.
Feel free to check the relevant folders to see what packages will be installed.

After installation, it will adjust the your config files and system preferences.
Finally, it will ask you for a series of additional applications that can be installed conditionally each of which will be asked independently. 

This script may take some time depending on your internet connection.
On a completely fresh computer is will take about 20 minutes with a standard internet connection.
On a computer that has some of the apps already installed, it can be significantly faster.

