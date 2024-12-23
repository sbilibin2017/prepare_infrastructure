-- Плагин менеджер Packer
return require('packer').startup(function(use)
  -- Пакет Packer для его обновлений и работы
  use 'wbthomason/packer.nvim'

  -- Плагины для LSP
  use 'neovim/nvim-lspconfig'

  -- Плагин для автодополнения (nvim-cmp)
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'

  -- Плагин для сниппетов (LuaSnip)
  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'

  -- Автозавершение для подписи LSP
  use 'hrsh7th/cmp-nvim-lsp-signature-help'

  -- Плагин для автозакрывающих символов
  use 'jiangmiao/auto-pairs'

  -- Статусная линия (airline)
  use 'vim-airline/vim-airline'

  -- Цветовая схема One Monokai
  use 'cpea2506/one_monokai.nvim'

  -- Плагин для дерева синтаксиса (Treesitter)
  use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}

  -- Для дебага (nvim-dap)
  use 'mfussenegger/nvim-dap'
  use 'rcarriga/nvim-dap-ui'
  use 'nvim-telescope/telescope-dap.nvim'
  use 'leoluz/nvim-dap-go'
  use 'mfussenegger/nvim-dap-python'

  -- Дерево файлов (NERDTree или nvim-tree)
  use 'kyazdani42/nvim-tree.lua'
end)

