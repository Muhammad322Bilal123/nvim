-- Define key mappings for common functionality

local map = vim.keymap.set

-- Telescope bindings
map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Find Files" })
map("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { desc = "Grep Text" })

-- File explorer
vim.api.nvim_set_keymap('n', '<leader>e', ':NvimTreeToggle<CR>', { noremap = true, silent = true })

-- Diagnostic navigation
map("n", "<leader>d", vim.diagnostic.open_float, { desc = "Open Diagnostic" })
map("n", "[d", vim.diagnostic.goto_prev, { desc = "Prev Diagnostic" })
map("n", "]d", vim.diagnostic.goto_next, { desc = "Next Diagnostic" })
vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<CR>", { desc = "Find Files" })

local map = vim.keymap.set


-- Harppoon con
vim.api.nvim_set_keymap("n", "<leader>a", ":lua require('harpoon.mark').add_file()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>h", ":lua require('harpoon.ui').toggle_quick_menu()<CR>", { noremap = true, silent = true })

vim.api.nvim_set_keymap("n", "<leader>1", ":lua require('harpoon.ui').nav_file(1)<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>2", ":lua require('harpoon.ui').nav_file(2)<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>3", ":lua require('harpoon.ui').nav_file(3)<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>4", ":lua require('harpoon.ui').nav_file(4)<CR>", { noremap = true, silent = true })



local opts = { noremap = true, silent = true }
local luasnip = require('luasnip')

vim.keymap.set({'i', 's'}, '<C-j>', function()
  if luasnip.expand_or_jumpable() then
    luasnip.expand_or_jump()
  end
end, opts)

vim.keymap.set({'i', 's'}, '<C-k>', function()
  if luasnip.jumpable(-1) then
    luasnip.jump(-1)
  end
end, opts)




local dap = require('dap')
local dapui = require('dapui')

vim.keymap.set('n', '<C-d>', dap.continue)           -- Ctrl+s to start/continue debugging
vim.keymap.set('n', '<C-n>', dap.step_over)          -- Ctrl+n to step over
vim.keymap.set('n', '<C-i>', dap.step_into)          -- Ctrl+i to step into
vim.keymap.set('n', '<C-o>', dap.step_out)           -- Ctrl+o to step out
vim.keymap.set('n', '<C-b>', dap.toggle_breakpoint)  -- Ctrl+b to toggle breakpoint
vim.keymap.set('n', '<C-r>', dap.repl.open)          -- Ctrl+r to open debug REPL
vim.keymap.set('n', '<C-u>', dapui.toggle)           -- Ctrl+u to toggle dap UI


vim.keymap.set("n", "<leader>to", vim.cmd.UndotreeToggle)




