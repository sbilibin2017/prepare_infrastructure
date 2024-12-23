-- Настройка LSP серверов (например, для Go и Python)
local nvim_lsp = require('lspconfig')

nvim_lsp.gopls.setup{
  on_attach = function(client, bufnr)
    -- Пример привязки клавиш
    local opts = { noremap=true, silent=true }
    local keymaps = {
      ['gd'] = 'vim.lsp.buf.definition',
      ['K'] = 'vim.lsp.buf.hover',
      ['gi'] = 'vim.lsp.buf.implementation',
      ['<C-k>'] = 'vim.lsp.buf.signature_help',
      ['gr'] = 'vim.lsp.buf.references',
      ['gl'] = 'vim.diagnostic.open_float'
    }
    for k, v in pairs(keymaps) do
      vim.api.nvim_buf_set_keymap(bufnr, 'n', k, '<cmd>lua ' .. v .. '()<CR>', opts)
    end
  end,
}

nvim_lsp.pyright.setup{
  on_attach = function(client, bufnr)
    local opts = { noremap=true, silent=true }
    local keymaps = {
      ['gd'] = 'vim.lsp.buf.definition',
      ['K'] = 'vim.lsp.buf.hover',
      ['gi'] = 'vim.lsp.buf.implementation',
      ['<C-k>'] = 'vim.lsp.buf.signature_help',
      ['gr'] = 'vim.lsp.buf.references',
      ['gl'] = 'vim.diagnostic.open_float'
    }
    for k, v in pairs(keymaps) do
      vim.api.nvim_buf_set_keymap(bufnr, 'n', k, '<cmd>lua ' .. v .. '()<CR>', opts)
    end
  end,
}

