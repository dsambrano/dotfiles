#!/usr/env/bin bash

read -p "Would you like to install GUI apps installed or is this a server only: [server]/gui/all" GUI
GUI=${GUI:-server}

# INSTALL
sudo apt update && sudo apt upgrade
sudo apt install nala #nala-legacy on older than 22.04 # https://youtu.be/oroSkR4Nn_w https://christitus.com/stop-using-apt/
sudo nala install build-essential \
	git \
	unattended-upgrades \
	hollywood \
	cmatrix \
	nginx \
	openssh-server \
	autojump \
	python3-pip \
	nodejs npm \
	neofetch

## Github
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg
sudo chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null
sudo nala update
sudo nala install gh

## SERVER APPS
read -p "Do you want to install Server sercurity and apps: y/N " SERVER
if [ $SERVER == "y" ]; then
    ### Nginx
    . /etc/os-release
    deb https://nginx.org/packages/ubuntu/ $VERSION_CODENAME nginx
    deb-src https://nginx.org/packages/ubuntu/ $VERSION_CODENAME nginx
    sudo nala update
    sudo nala install nginx
    https://www.deb-multimedia.org/dists/testing/main/binary-amd64/package/mpv

    #### Open relevant ports
    sudo ufw allow nginx 
    sudo ufw allow https
    sudo systemctl start nginx
    sudo systemctl enable nginx

    ## SERVER CONFIG
    ## UFW (uncomplicated firewall)
    sudo ufw allow ssh
    sudo ufw enable
    sudo ufw status

    ## SSH
    sudo systemctl enable ssh
    sudo systemctl start ssh

    ## Auto Update
    sudo dpkg-reconfigure --priority=low unattended-upgrades
fi


## RUST INSTALL
### Essentails and Cargo	
sudo apt install build-essential cmake
curl https://sh.rustup.rs -sSf | sh
### Packages
cargo install ripgrep 
cargo install --locked zoxide bat
# curl -sS https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | bash


## GUI APPS
read -p "Do you want to install GUI apps: y/N " GUI_APPS
if [ $GUI_APPS == "y" ]; then
    sudo nala install mpv
    ### Brave Browser
    sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
    echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list
    sudo nala install brave-browser
    
    ### Firefox
    sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys A6DCF7707EBC211F
    sudo apt-add-repository "deb http://ppa.launchpad.net/ubuntu-mozilla-security/ppa/ubuntu focal main"
    sudo nala update
    sudo nala install firefox

    ### Anime Terminal
    curl "https://raw.githubusercontent.com/whoisYoges/anime-terminal/master/anime-terminal" > anime-terminal
    chmod +x anime-terminal
    sudo mv anime-terminal /usr/local/bin/
    #### man page
    curl "https://raw.githubusercontent.com/whoisYoges/anime-terminal/master/anime-terminal.1" > anime-terminal.1
    sudo mv anime-terminal.1 /usr/share/man/man1/
fi










# ALIASES
alias update='sudo nala update && sudo nala upgrade && sudo nala dist-upgrade'
alias bat='batcat'
alias cat='bat -p
