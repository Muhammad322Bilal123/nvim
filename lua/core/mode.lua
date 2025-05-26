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
      NORMAL   = "#7dcfff", -- cyan
      INSERT   = "#9ece6a", -- green
      VISUAL   = "#e0af68", -- yellow
      ["V-LINE"]  = "#e0af68",
      ["V-BLOCK"] = "#e0af68",
      REPLACE  = "#f7768e", -- red
      COMMAND  = "#bb9af7", -- magenta
      TERMINAL = "#ff9e64", -- orange
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
    local bg_color = mode_colors[mode_name] or "#3b4261"

    return { fg = "#000000", bg = bg_color, bold = true }
  end,
  left_sep = " ",
  right_sep = " ",
}

return M
