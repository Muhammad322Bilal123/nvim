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


local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<F9>', function() require('dap').toggle_breakpoint() end, opts)
vim.keymap.set('n', '<F5>', function() require('dap').continue() end, opts)
vim.keymap.set('n', '<F10>', function() require('dap').step_over() end, opts)
vim.keymap.set('n', '<F11>', function() require('dap').step_into() end, opts)
vim.keymap.set('n', '<F12>', function() require('dap').step_out() end, opts)
vim.keymap.set('n', '<leader>dr', function() require('dap').repl.open() end, opts)
vim.keymap.set('n', '<leader>dq', function() require('dap').terminate() end, opts)



vim.keymap.set("n", "<leader>to", vim.cmd.UndotreeToggle)




