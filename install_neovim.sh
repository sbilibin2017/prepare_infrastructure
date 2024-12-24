#!/bin/bash

# Установить Neovim
wget https://github.com/neovim/neovim/releases/download/stable/nvim.appimage
sudo apt install -y fuse
sudo chmod u+x nvim.appimage
sudo mv nvim.appimage /usr/local/bin/nvim

# Установить Vim-plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# Установить шрифт Fira Code
sudo apt install -y fonts-firacode
