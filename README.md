# Настройка инфраструктуры в Ubuntu для разработки на go/python с использованием редактора кода neovim

### Инструкция

1. клорнировать репозиторий
```git clone git@github.com:sbilibin2017/prepare_infrastructure.git```

2. перейти в директорию
```cd prepare_infrastructure```

3. выполнить инициализацию(установка оболочки командной строки oh my zsh)
```sudo chmod +x initialize.sh && ./initialize.sh```
4. перезагрузиться
```reboot```

5. перейти в prepare_infrastructure
```cd prepare_infrastructure```

6. подготовить инфраструктуру (установка go, python, git ,...)
```sudo chmod +x install_infrastructure.sh && ./install_infrastructure.sh```
7. применить настройки
```source ~/.zshrc```

8. подготовить git
```sudo chmod +x prepare_git.sh && ./prepare_git.sh```

9. перезагрузиться
```sudo reboot```

10. добавить ssh ключ в аккаунт github 
```cat ~/.ssh/id_rsa.pub```

10. установить vim-plug
```sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'```

11. скопировать конфигурацию neovim
```mkdir -p ~/.config/nvim && cp ./init.vim ~/.config/nvim/init.vim```

12. открыть конфигурацию neovim

```nvim ~/.config/nvim/init.vim```

ввести ```:PlugInstall```

