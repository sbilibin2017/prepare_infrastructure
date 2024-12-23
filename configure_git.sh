#!/bin/bash

# Генерация нового SSH ключа
ssh-keygen -t ed25519 -C "$EMAIL" -f ~/.ssh/id_ed25519 -N ""

# Добавление SSH ключа в ssh-agent
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519

# Получение содержимого публичного ключа
cat ~/.ssh/id_ed25519.pub


