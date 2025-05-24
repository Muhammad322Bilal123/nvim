
-- core/providers.lua
-- Provides statusline components for Feline

local M = {}

-- Highlight groups for modes and colors
vim.api.nvim_set_hl(0, "StatusLineModeNormal", { fg = "#93C5FD", bg = "none", bold = true })
vim.api.nvim_set_hl(0, "StatusLineModeInsert", { fg = "#60A5FA", bg = "none", bold = true })
vim.api.nvim_set_hl(0, "StatusLineModeVisual", { fg = "#3B82F6", bg = "none", bold = true })
vim.api.nvim_set_hl(0, "StatusLineModeReplace", { fg = "#EF4444", bg = "none", bold = true })
vim.api.nvim_set_hl(0, "StatusLineModeCommand", { fg = "#8B5CF6", bg = "none", bold = true })
vim.api.nvim_set_hl(0, "StatusLineModeTerminal", { fg = "#FBBF24", bg = "none", bold = true })

vim.api.nvim_set_hl(0, "StatusLineBlueFG", { fg = "#93C5FD", bg = "none" })
vim.api.nvim_set_hl(0, "StatusLineGit", { fg = "#F87171", bg = "none", bold = true })     -- red for git
vim.api.nvim_set_hl(0, "StatusLineDiagnostics", { fg = "#FBBF24", bg = "none", bold = true }) -- yellow for diagnostics

-- Mode provider
M.mode = {
  provider = function()
    local mode_map = {
      n = "NORMAL",
      i = "INSERT",
      v = "VISUAL",
      V = "V-LINE",
      ["\22"] = "V-BLOCK",
      c = "COMMAND",
      R = "REPLACE",
      t = "TERMINAL",
    }
    local current_mode = vim.api.nvim_get_mode().mode
    return mode_map[current_mode] or current_mode
  end,
  hl = function()
    local mode_hl_map = {
      NORMAL = "StatusLineModeNormal",
      INSERT = "StatusLineModeInsert",
      VISUAL = "StatusLineModeVisual",
      ["V-LINE"] = "StatusLineModeVisual",
      ["V-BLOCK"] = "StatusLineModeVisual",
      REPLACE = "StatusLineModeReplace",
      COMMAND = "StatusLineModeCommand",
      TERMINAL = "StatusLineModeTerminal",
    }

    local mode_map = {
      n = "NORMAL",
      i = "INSERT",
      v = "VISUAL",
      V = "V-LINE",
      ["\22"] = "V-BLOCK",
      c = "COMMAND",
      R = "REPLACE",
      t = "TERMINAL",
    }

    local current_mode = vim.api.nvim_get_mode().mode
    local mode = mode_map[current_mode] or current_mode

    return mode_hl_map[mode] or "StatusLineModeNormal"
  end,
  left_sep = " ",
  right_sep = " ",
}

-- File info provider
M.file_info = {
  provider = "file_info",
  hl = "StatusLineBlueFG",
  left_sep = " ",
  right_sep = " ",
}

-- Cursor position provider
M.position = {
  provider = "position",
  hl = "StatusLineBlueFG",
  left_sep = " ",
  right_sep = " ",
}

-- Progress provider (percent through file)
M.progress = {
  provider = function()
    local current = vim.fn.line(".")
    local total = vim.fn.line("$")
    local percent = math.floor((current / total) * 100)
    return percent .. "%%"
  end,
  hl = "StatusLineBlueFG",
  left_sep = " ",
  right_sep = " ",
}

-- Git branch provider
M.git_branch = {
  provider = function()
    local branch = vim.b.gitsigns_head or ""
    if branch ~= "" then
      return " " .. branch
    else
      return ""
    end
  end,
  hl = "StatusLineGit",
  left_sep = " ",
  right_sep = " ",
}

-- Diagnostics provider (errors and warnings count)
M.diagnostics = {
  provider = function()
    local errors = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
    local warnings = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })
    local result = ""

    if errors > 0 then
      result = result .. " " .. errors .. " "
    end
    if warnings > 0 then
      result = result .. " " .. warnings .. " "
    end
    return result
  end,
  hl = "StatusLineDiagnostics",
  left_sep = " ",
  right_sep = " ",
}

return M
