
local dap = require('dap')
local opts = { noremap = true, silent = true }

vim.keymap.set('n', '<F9>', function() dap.toggle_breakpoint() end, opts)
vim.keymap.set('n', '<F5>', function() dap.continue() end, opts)
vim.keymap.set('n', '<F10>', function() dap.step_over() end, opts)
vim.keymap.set('n', '<F11>', function() dap.step_into() end, opts)
vim.keymap.set('n', '<F12>', function() dap.step_out() end, opts)
vim.keymap.set('n', '<leader>dr', function() dap.repl.open() end, opts)
vim.keymap.set('n', '<leader>dq', function() dap.terminate() end, opts)
