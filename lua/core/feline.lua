vim.opt.termguicolors = true  -- Make sure termguicolors is enabled

require("feline").setup()

-- Make entire statusline background transparent
vim.api.nvim_set_hl(0, 'StatusLine', { bg = 'NONE' })
vim.api.nvim_set_hl(0, 'StatusLineNC', { bg = 'NONE' })

local M = {}

M.mode = {
  provider = function()
    local mode_map = {
      n = "NORMAL",
      i = "INSERT",
      v = "VISUAL",
      V = "V-LINE",
      [''] = "V-BLOCK",
      c = "COMMAND",
      R = "REPLACE",
      t = "TERMINAL",
    }
    local current_mode = vim.api.nvim_get_mode().mode
    return mode_map[current_mode] or current_mode
  end,
  hl = function()
    local mode_colors = {
      NORMAL = 'yellow',
      INSERT = 'black',
      VISUAL = 'yellow',
      ['V-LINE'] = 'yellow',
      ['V-BLOCK'] = 'yellow',
      REPLACE = 'red',
      COMMAND = 'magenta',
      TERMINAL = 'orange',
    }
    local mode_map = {
      n = "NORMAL",
      i = "INSERT",
      v = "VISUAL",
      V = "V-LINE",
      [''] = "V-BLOCK",
      c = "COMMAND",
      R = "REPLACE",
      t = "TERMINAL",
    }
    local current_mode = vim.api.nvim_get_mode().mode
    local mode_name = mode_map[current_mode] or current_mode

    return { fg = mode_colors[mode_name] or 'gray', bg = 'NONE', bold = true }
  end,
  left_sep = ' ',
  right_sep = ' ',
}

return M
