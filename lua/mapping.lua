-- Define a local alias for vim.keymap.set for convenience
local map = vim.keymap.set

-- ========================
-- Telescope plugin bindings
-- ========================

-- <leader>ff: Open Telescope file finder to quickly find files in the project
map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Find Files" })

-- <leader>fg: Open Telescope live grep to search text content across files
map("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { desc = "Grep Text" })

-- ========================
-- File explorer (NvimTree)
-- ========================

-- <leader>e: Toggle the NvimTree file explorer window
vim.api.nvim_set_keymap('n', '<leader>e', ':NvimTreeToggle<CR>', { noremap = true, silent = true })

-- ========================
-- Diagnostic navigation
-- ========================

-- <leader>d: Open floating window with diagnostic info under cursor
map("n", "<leader>d", vim.diagnostic.open_float, { desc = "Open Diagnostic" })

-- [d: Jump to previous diagnostic in the buffer
map("n", "[d", vim.diagnostic.goto_prev, { desc = "Prev Diagnostic" })

-- ]d: Jump to next diagnostic in the buffer
map("n", "]d", vim.diagnostic.goto_next, { desc = "Next Diagnostic" })

-- (Note: <leader>ff was defined earlier — repeated here, could be removed for redundancy)

-- ========================
-- Harpoon plugin mappings (quick file marking and navigation)
-- ========================

-- <leader>a: Add current file to Harpoon marks
vim.api.nvim_set_keymap("n", "<leader>a", ":lua require('harpoon.mark').add_file()<CR>", { noremap = true, silent = true })

-- <leader>h: Toggle Harpoon quick menu window
vim.api.nvim_set_keymap("n", "<leader>h", ":lua require('harpoon.ui').toggle_quick_menu()<CR>", { noremap = true, silent = true })

-- <leader>1 to <leader>4: Navigate to Harpoon marks 1 through 4 respectively
vim.api.nvim_set_keymap("n", "<leader>1", ":lua require('harpoon.ui').nav_file(1)<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>2", ":lua require('harpoon.ui').nav_file(2)<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>3", ":lua require('harpoon.ui').nav_file(3)<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>4", ":lua require('harpoon.ui').nav_file(4)<CR>", { noremap = true, silent = true })

-- ========================
-- LuaSnip snippet navigation mappings
-- ========================

local opts = { noremap = true, silent = true }
local luasnip = require('luasnip')

-- In insert and select modes, Ctrl+j expands or jumps forward in snippet if possible
vim.keymap.set({'i', 's'}, '<C-j>', function()
  if luasnip.expand_or_jumpable() then
    luasnip.expand_or_jump()
  end
end, opts)

-- In insert and select modes, Ctrl+k jumps backward in snippet if possible
vim.keymap.set({'i', 's'}, '<C-k>', function()
  if luasnip.jumpable(-1) then
    luasnip.jump(-1)
  end
end, opts)

-- ========================
-- Terminal mapping
-- ========================

-- <leader>te: Open a new terminal in a horizontal split with height 12 lines
vim.api.nvim_set_keymap('n', '<leader>te', ':belowright split | resize 12 | terminal<CR>', { noremap = true, silent = true })

-- ========================
-- Debug Adapter Protocol (DAP) key mappings for debugging
-- ========================

local dap = require('dap')
local dapui = require('dapui')

-- Ctrl+d: Start or continue debugging session
vim.keymap.set('n', '<C-d>', dap.continue)

-- Ctrl+n: Step over the current line during debugging
vim.keymap.set('n', '<C-n>', dap.step_over)

-- Ctrl+i: Step into function calls during debugging
vim.keymap.set('n', '<C-i>', dap.step_into)

-- Ctrl+o: Step out of the current function during debugging
vim.keymap.set('n', '<C-o>', dap.step_out)

-- Ctrl+b: Toggle a breakpoint at the current line
vim.keymap.set('n', '<C-b>', dap.toggle_breakpoint)

-- Ctrl+r: Open the debug REPL (Read-Eval-Print Loop)
vim.keymap.set('n', '<C-r>', dap.repl.open)

-- Ctrl+u: Toggle the DAP UI sidebar
vim.keymap.set('n', '<C-u>', dapui.toggle)

-- ========================
-- UndoTree toggle mapping
-- ========================

-- <leader>to: Toggle the UndoTree visualizer
vim.keymap.set("n", "<leader>to", vim.cmd.UndotreeToggle)



-- ╭──────────────────────────────────────────────────────────╮
-- │ 🔧 LSP Keymaps                                           │
-- ╰──────────────────────────────────────────────────────────╯
vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { noremap = true, silent = true, desc = "Code Action" })

