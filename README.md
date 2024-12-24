# Настройка инфраструктуры в Ubuntu для разработки на Go/Python с использованием редактора кода Neovim

## Таблица команд

| Команда | Описание |
|---------|----------|
| `sudo chmod +x install_oh_my_zsh.sh && ./install_oh_my_zsh.sh` | Установка Oh My Zsh |
| `reboot` | Перезагрузка системы |
| `sudo chmod +x configure_git.sh && ./configure_git.sh` | Настройка Git |
| `sudo chmod +x configure_gnome.sh && ./configure_gnome.sh` | Настройка окружения GNOME |
| `echo -e "export NO_COLOR=1\nalias ls='ls --color=never'\nalias grep='grep --color=never'" >> ~/.zshrc && source ~/.zshrc` | Отключение цветового вывода в терминале |
| `sudo chmod +x install_docker.sh && ./install_docker.sh` | Установка Docker |
| `sudo chmod +x install_go.sh && ./install_go.sh && source ~/.zshrc && sudo chmod +x configure_go.sh && ./configure_go.sh` | Установка и настройка Go |
| `sudo chmod +x install_python.sh && ./install_python.sh && source ~/.zshrc && poetry config virtualenvs.in-project true` | Установка Python и Poetry |
| `sudo chmod +x install_neovim.sh && ./install_neovim.sh && source ~/.zshrc` | Установка Neovim |
| `sudo chmod +x install_chatgpt.sh && ./install_chatgpt.sh` | Установка ChatGPT CLI |
| `wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb && sudo dpkg -i google-chrome-stable_current_amd64.deb` | Установка Google Chrome |

---

## Описание конфига init.vim 

### Основные настройки

| Настройка                   | Назначение                                                                 |
|-----------------------------|---------------------------------------------------------------------------|
| `set number`                | Абсолютная нумерация строк.                                               |
| `set relativenumber`        | Относительная нумерация строк.                                            |
| `set nowrap`                | Отключает перенос строк.                                                  |
| `set tabstop=4`             | Устанавливает длину табуляции в 4 пробела.                                |
| `set shiftwidth=4`          | Определяет количество пробелов для автоматического сдвига.                |
| `set expandtab`             | Использует пробелы вместо табуляции.                                      |
| `set guifont=Fira\ Code:h12`| Устанавливает шрифт Fira Code размером 12 для GUI-версий.                 |
| `let mapleader=" "`         | Устанавливает пробел в качестве лидер-клавиши.                            |
| `set smartindent`           | Включает умный отступ.                                                    |
| `set autoindent`            | Автоматически добавляет отступы для новых строк.                          |
| `set cursorline`            | Подсвечивает строку, где находится курсор.                                |
| `set showmatch`             | Подсвечивает пары скобок.                                                 |
| `set incsearch`             | Включает инкрементальный поиск.                                           |
| `set hlsearch`              | Подсвечивает результаты поиска.                                           |
| `set ignorecase`            | Игнорирует регистр в поиске.                                              |
| `set smartcase`             | Учитывает регистр, если запрос содержит заглавные буквы.                  |
| `set lazyredraw`            | Ускоряет работу Vim, отключая перерисовку экрана при сложных операциях.   |

### Плагины

| Плагин                         | Назначение                                                                 |
|--------------------------------|---------------------------------------------------------------------------|
| `neovim/nvim-lspconfig`        | Плагин для настройки LSP (Language Server Protocol).                      |
| `hrsh7th/nvim-cmp`             | Плагин для автокомплита.                                                  |
| `hrsh7th/cmp-nvim-lsp`         | Источник автокомплита для LSP.                                            |
| `hrsh7th/cmp-buffer`           | Источник автокомплита для текста буфера.                                  |
| `hrsh7th/cmp-path`             | Источник автокомплита для путей.                                          |
| `saadparwaiz1/cmp_luasnip`     | Источник автокомплита для LuaSnip.                                        |
| `L3MON4D3/LuaSnip`             | Плагин для управления сниппетами.                                        |
| `windwp/nvim-autopairs`        | Плагин для автозакрытия скобок.                                          |
| `cpea2506/one_monokai.nvim`    | Тема оформления One Monokai.                                             |
| `mfussenegger/nvim-dap`        | Плагин для отладки (Debug Adapter Protocol).                              |
| `leoluz/nvim-dap-go`           | Дополнение для отладки Go в DAP.                                         |

### Маппинг для функций

| Комбинация клавиш | Описание                                                                 |
|-------------------|-------------------------------------------------------------------------|
| `<leader>ot`      | Переключение темы One Monokai.                                          |
| `<leader>ac`      | Переключение автокомплита.                                              |
| `<F5>`            | Запуск отладки через DAP (если включено).                              |
| `<F10>`           | Шаг через (step over) через DAP (если включено).                       |
| `<F11>`           | Шаг внутрь (step into) через DAP (если включено).                      |
| `<F12>`           | Шаг наружу (step out) через DAP (если включено).                       |
| `<Leader>b`       | Установка/снятие брейкпоинта в DAP.                                    |
| `<Leader>B`       | Установка условного брейкпоинта с вводом условия в DAP.                |
| `<Leader>lp`      | Установка лог-точки (log point) в DAP.                                 |
| `<Leader>dr`      | Открытие REPL для DAP.                                                 |
| `<Leader>dl`      | Повторный запуск последнего сеанса отладки в DAP.                      |
| `<Leader>dt`      | Включение/выключение функциональности DAP.                             |

