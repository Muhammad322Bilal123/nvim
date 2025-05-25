require("feline").setup()


local M = {}

M.mode = {
  provider = function()
    -- Get mode short name from Neovim API
    local mode_map = {
      n = "NORMAL",
      i = "INSERT",
      v = "VISUAL",
      V = "V-LINE",
      [''] = "V-BLOCK",  -- CTRL-V
      c = "COMMAND",
      R = "REPLACE",
      t = "TERMINAL",
    }
    local current_mode = vim.api.nvim_get_mode().mode
    return mode_map[current_mode] or current_mode
  end,
  hl = function()
    -- Map mode short name to color
    local mode_colors = {
      NORMAL = 'cyan',
      INSERT = 'green',
      VISUAL = 'yellow',
      ['V-LINE'] = 'yellow',
      ['V-BLOCK'] = 'yellow',
      REPLACE = 'red',
      COMMAND = 'magenta',
      TERMINAL = 'orange',
    }
    -- Get mode text as in provider above
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

    return { fg = 'black', bg = mode_colors[mode_name] or 'gray', bold = true }
  end,
  left_sep = ' ',
  right_sep = ' ',
}

-- Return the table
return M
