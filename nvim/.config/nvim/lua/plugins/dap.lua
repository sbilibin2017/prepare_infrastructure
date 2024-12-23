local dap = require('dap')
local dapui = require('dapui')

-- Настройка адаптеров для Go и Python
dap.adapters.go = {
  type = 'executable',
  command = 'dlv',
  args = { 'dap', '-l', '127.0.0.1:38697' },
}

dap.adapters.python = {
  type = 'executable',
  command = 'python',
  args = { '-m', 'debugpy.adapter' },
}

dap.configurations.go = {
  {
    type = 'go',
    name = 'Debug',
    request = 'launch',
    program = "${file}",
  },
}

dap.configurations.python = {
  {
    type = 'python',
    request = 'launch',
    name = 'Launch file',
    program = "${file}",
    pythonPath = function()
      return '/usr/bin/python'
    end,
  },
}

dapui.setup()

