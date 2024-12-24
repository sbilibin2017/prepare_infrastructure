#!/bin/bash

# Настроить фон рабочего стола на черный
gsettings set org.gnome.desktop.background picture-options 'none'
gsettings set org.gnome.desktop.background primary-color '#000000'

# Установить смену раскладки клавиатуры на alt+shift и добавить язык Russian
sudo apt-get install -y gnome-tweaks
gsettings set org.gnome.desktop.input-sources xkb-options "['grp:alt_shift_toggle']"
gsettings set org.gnome.desktop.input-sources sources "[('xkb', 'us'), ('xkb', 'ru')]"

# Поменять маппинг кавычек
sudo cp /usr/share/X11/xkb/symbols/us /usr/share/X11/xkb/symbols/us.bak
sudo sed -i 's/section { shift<AC11>=[dollar,asterisk]; };/section { shift<AC11>=[dollar,apostrophe]; };/' /usr/share/X11/xkb/symbols/us
