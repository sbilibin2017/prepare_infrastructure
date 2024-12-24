" ==========================
" Основные настройки
" ==========================
" Включение нумерации строк
set number               " Абсолютная нумерация
set relativenumber       " Относительная нумерация

" Отключение переноса строк
set nowrap

" Настройки отступов
set tabstop=4            " Количество пробелов, которое соответствует одному табулятору
set shiftwidth=4         " Количество пробелов для автоматического сдвига
set expandtab            " Использовать пробелы вместо табуляции

" Настройка шрифта для графических интерфейсов
set guifont=Fira\ Code:h12

" Устанавливаем лидер-клавишу
let mapleader=" "

" Дополнительные полезные настройки
set smartindent          " Умный отступ
set autoindent           " Автоматический отступ
set cursorline           " Подсвечивать строку курсора
set showmatch            " Подсвечивать пары скобок
set incsearch            " Инкрементальный поиск
set hlsearch             " Подсвечивать результаты поиска
set ignorecase           " Игнорировать регистр в поиске
set smartcase            " Учитывать регистр, если есть заглавные буквы

" Ускорение работы Vim
set lazyredraw           " Отключить перерисовку экрана во время сложных операций

" ==========================
" Настройки плагинов
" ==========================
call plug#begin('~/.vim/plugged')

" 1. Плагин для LSP
Plug 'neovim/nvim-lspconfig'

" 2. Плагин для автокомплита
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'L3MON4D3/LuaSnip'

" 3. Плагин для парных скобок
Plug 'windwp/nvim-autopairs'

" 4. Плагин для темы One Monokai
Plug 'cpea2506/one_monokai.nvim'

" 5. Плагин для DAP
Plug 'mfussenegger/nvim-dap'

" 6. Дополнительные конфигурации для Go DAP
Plug 'leoluz/nvim-dap-go'

call plug#end()

" ==========================
" Настройка LSP
" ==========================
lua << EOF
require('lspconfig').gopls.setup{}
EOF

" ==========================
" Настройка автокомплита
" ==========================
lua << EOF
local cmp = require'cmp'
local autocomplete_enabled = true

function ToggleAutocomplete()
  autocomplete_enabled = not autocomplete_enabled
  if autocomplete_enabled then
    print("Autocomplete: ON")
  else
    print("Autocomplete: OFF")
  end
end

cmp.setup({
  enabled = function()
    return autocomplete_enabled
  end,
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  }, {
    { name = 'buffer' },
    { name = 'path' },
  })
})
EOF

" ==========================
" Настройка парных скобок
" ==========================
lua << EOF
require('nvim-autopairs').setup{}
EOF

" ==========================
" Настройка темы One Monokai
" ==========================
lua << EOF
local one_monokai = require("one_monokai")

one_monokai.setup({
  italics = true,
  colors = {
    bg = "#282c34",
    fg = "#abb2bf",
    accent = "#56b6c2",
    highlight = "#e5c07b",
  },
})

local theme_enabled = true

function ToggleOneMonokai()
  if theme_enabled then
    -- Отключаем тему
    vim.cmd("colorscheme default")
    vim.cmd("syntax off")
    vim.cmd("highlight Normal ctermfg=white guifg=white")
    vim.cmd("highlight Keyword ctermfg=none guifg=none")
    vim.cmd("highlight Comment ctermfg=none guifg=none")
    vim.cmd("highlight String ctermfg=none guifg=none")
    vim.cmd("highlight Type ctermfg=none guifg=none")
    vim.cmd("highlight Function ctermfg=none guifg=none")
    vim.cmd("highlight Identifier ctermfg=none guifg=none")
    vim.cmd("highlight Statement ctermfg=none guifg=none")
    vim.cmd("highlight PreProc ctermfg=none guifg=none")
    vim.cmd("highlight Special ctermfg=none guifg=none")
    vim.cmd("highlight Error ctermfg=none guifg=none")
    theme_enabled = false
    print("One Monokai: OFF")
  else
    -- Включаем тему
    vim.cmd("colorscheme one_monokai")
    vim.cmd("syntax on") -- Включить подсветку синтаксиса
    theme_enabled = true
    print("One Monokai: ON")
  end
end

vim.cmd("colorscheme one_monokai")
EOF

" ==========================
" Настройка DAP для Go
" ==========================
lua << EOF
local dap = require('dap')
require('dap-go').setup()

local dap_enabled = true

function ToggleDAP()
  dap_enabled = not dap_enabled
  if dap_enabled then
    print("DAP: Enabled")
  else
    print("DAP: Disabled")
  end
end

-- Маппинг для управления DAP
vim.api.nvim_set_keymap('n', '<F5>', '<Cmd>lua if dap_enabled then require("dap").continue() else print("DAP is disabled") end<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<F10>', '<Cmd>lua if dap_enabled then require("dap").step_over() else print("DAP is disabled") end<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<F11>', '<Cmd>lua if dap_enabled then require("dap").step_into() else print("DAP is disabled") end<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<F12>', '<Cmd>lua if dap_enabled then require("dap").step_out() else print("DAP is disabled") end<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>b', '<Cmd>lua if dap_enabled then require("dap").toggle_breakpoint() else print("DAP is disabled") end<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>B', '<Cmd>lua if dap_enabled then require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: ")) else print("DAP is disabled") end<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>lp', '<Cmd>lua if dap_enabled then require("dap").set_breakpoint(nil, nil, vim.fn.input("Log point message: ")) else print("DAP is disabled") end<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>dr', '<Cmd>lua if dap_enabled then require("dap").repl.open() else print("DAP is disabled") end<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>dl', '<Cmd>lua if dap_enabled then require("dap").run_last() else print("DAP is disabled") end<CR>', { noremap = true, silent = true })

-- Маппинг для включения/выключения DAP
vim.api.nvim_set_keymap('n', '<Leader>dt', '<Cmd>lua ToggleDAP()<CR>', { noremap = true, silent = true })
EOF

" ==========================
" Маппинг для плагинов и функций
" ==========================
nnoremap <leader>ot :lua ToggleOneMonokai()<CR> " Переключение темы
nnoremap <leader>ac :lua ToggleAutocomplete()<CR> " Переключение автокомплита

" ==========================
" Переключение раскладки Alt+Shift
" ==========================
nnoremap <A-S> :!setxkbmap us<CR>
nnoremap <A-R> :!setxkbmap ru<CR>
