#!/usr/bin/env bash


curl -fsSLo "${XDG_DATA_HOME:-$HOME/.local/bin/tmux-sessionizer}" --create-dirs https://raw.githubusercontent.com/dsambrano/local_functions/refs/heads/main/shell/tmux-sessionizer

export PATH="$HOME/.local/bin:$PATH"
echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.zshrc
