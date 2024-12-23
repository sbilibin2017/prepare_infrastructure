-- Основные настройки
require('core.options')
require('core.mappings')

-- Пытаемся загрузить Packer
vim.cmd [[packadd packer.nvim]]

-- Загружаем конфигурацию плагинов из отдельного Lua файла
require('plugins.packer')

-- Подключаем модули конфигурации для плагинов
require('plugins.lsp')
require('plugins.cmp')
require('plugins.dap')
require('plugins.treesitter')
require('plugins.auto-pairs')
require('plugins.airline')
require('plugins.theme')
require('plugins.nerdtree')

