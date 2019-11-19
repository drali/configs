#!/bin/bash

# Download and install fzf
echo Installing fzf...
if [ ! -d "$HOME/.fzf" ]; then
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
fi
~/.fzf/install --all --key-bindings --completion --update-rc --no-zsh --no-fish > /dev/null

# Install configuration files
echo Installing configurations...
cp config.bash ~/.bashrc
cp config.vim ~/.vimrc
cp fzf-key-bindings.bash ~/.fzf/shell/key-bindings.bash

# Install packages
echo Installing packages...
sudo apt install tree make g++ git &> /dev/null

# Install binary tools
echo Making and installing binary tools...
cd bintools
make > /dev/null
make install > /dev/null

# Remind myself to source the new configurations
echo Install complete, source ~/.bashrc for settings to take effect immediately