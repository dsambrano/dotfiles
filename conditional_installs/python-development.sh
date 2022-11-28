#!/usr/bin/env bash

# Directions here: https://realpython.com/intro-to-pyenv/


# Apt
sudo apt-get install -y make build-essential libssl-dev zlib1g-dev \
libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev \
libncursesw5-dev xz-utils tk-dev libffi-dev liblzma-dev python-openssl

# Fedora
sudo yum install gcc zlib-devel bzip2 bzip2-devel readline-devel sqlite \
sqlite-devel openssl-devel xz xz-devel libffi-devel

# Install Pyenv
curl https://pyenv.run | bash



echo """
# Pyenv Install
export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
"""

# Restart shell
exec "$SHELL" # Or just restart your terminal
