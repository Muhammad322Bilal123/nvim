-- lua/config/telescope.lua
local M = {}

-- Clear Telescope normal background
vim.cmd([[hi TelescopeNormal guibg=NONE ctermbg=NONE]])
vim.cmd([[hi TelescopeBorder guibg=NONE ctermbg=NONE]])
vim.cmd([[hi TelescopePromptNormal guibg=NONE ctermbg=NONE]])
vim.cmd([[hi TelescopePromptBorder guibg=NONE ctermbg=NONE]])
vim.cmd([[hi TelescopeResultsNormal guibg=NONE ctermbg=NONE]])
vim.cmd([[hi TelescopeResultsBorder guibg=NONE ctermbg=NONE]])
vim.cmd([[hi TelescopePreviewNormal guibg=NONE ctermbg=NONE]])
vim.cmd([[hi TelescopePreviewBorder guibg=NONE ctermbg=NONE]])


function M.setup()
  local ok, telescope = pcall(require, "telescope")
  if not ok then
    vim.notify("Telescope not found!", vim.log.levels.ERROR)
    return
  end

  telescope.setup({
    defaults = {
      find_command = { "rg", "--files", "--hidden", "--glob", "!.git/*" },
      prompt_prefix = "🔍 ",
      selection_caret = "➜ ",
      path_display = { "smart" },
      file_ignore_patterns = { "node_modules", ".git/" },
    },
  })

  local builtin = require("telescope.builtin")

  local opts = { noremap = true, silent = true }
  -- Find files with hidden and no_ignore options
  vim.keymap.set("n", "<leader>ff", function()
    builtin.find_files({ hidden = true, no_ignore = true })
  end, vim.tbl_extend("force", opts, { desc = "Find Files" }))

  vim.keymap.set("n", "<leader>fg", builtin.live_grep, vim.tbl_extend("force", opts, { desc = "Live Grep" }))
  vim.keymap.set("n", "<leader>fb", builtin.buffers, vim.tbl_extend("force", opts, { desc = "Find Buffers" }))
  vim.keymap.set("n", "<leader>fh", builtin.help_tags, vim.tbl_extend("force", opts, { desc = "Help Tags" }))
end

return M

