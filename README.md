# Настройка инфраструктуры в Ubuntu для разработки на go/python с использованием редактора кода neovim

### Инструкция

```
sudo chmod +x install_oh_my_zsh.sh && ./install_oh_my_zsh.sh
sudo chmod +x configure_gnome.sh && ./configure_gnome.sh
sudo chmod +x install_docker.sh && ./install_docker.sh
sudo chmod +x install_go.sh && ./install_go.sh
source ~/.zshrc
sudo chmod +x configure_go.sh && ./configure_go.sh
sudo chmod +x install_python.sh && ./install_python.sh
source ~/.zshrc
poetry config virtualenvs.in-project true
sudo chmod +x install_neovim.sh && ./install_neovim.sh
source ~/.zshrc
```
