#!/bin/bash

# Устанавливаем Packer
echo "Установка Packer..."
git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim

# Создаем директорию для конфигурации Neovim, если её нет
echo "Создание директории конфигурации Neovim..."
mkdir -p ~/.config/nvim

# Копируем вашу конфигурацию в ~/.config/nvim
echo "Копирование конфигурации Neovim..."
cp -r ./nvim ~/.config

# Открываем init.lua в Neovim и выполняем PackerSync
echo "Открытие init.lua в Neovim для выполнения :PackerSync..."
nvim ~/.config/nvim/init.lua +":PackerSync"

