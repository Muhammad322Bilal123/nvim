local api = vim.api

-- Transparent backgrounds for UI elements
vim.cmd [[
  highlight Normal guibg=NONE ctermbg=NONE
  highlight NormalNC guibg=NONE ctermbg=NONE
  highlight EndOfBuffer guibg=NONE ctermbg=NONE
  highlight LineNr guibg=NONE ctermbg=NONE
  highlight SignColumn guibg=NONE ctermbg=NONE
  highlight VertSplit guibg=NONE guifg=NONE ctermbg=NONE ctermfg=NONE
  highlight WinSeparator guifg=NONE guibg=NONE
]]

-- Statusline mode highlights
api.nvim_set_hl(0, "StatusLineModeNormal", { fg = "#93C5FD", bg = "NONE", ctermbg = "NONE", bold = true })
api.nvim_set_hl(0, "StatusLineModeInsert", { fg = "#60A5FA", bg = "NONE", ctermbg = "NONE", bold = true })
api.nvim_set_hl(0, "StatusLineModeVisual", { fg = "#3B82F6", bg = "NONE", ctermbg = "NONE", bold = true })
api.nvim_set_hl(0, "StatusLineModeReplace", { fg = "#EF4444", bg = "NONE", ctermbg = "NONE", bold = true })
api.nvim_set_hl(0, "StatusLineModeCommand", { fg = "#8B5CF6", bg = "NONE", ctermbg = "NONE", bold = true })
api.nvim_set_hl(0, "StatusLineModeTerminal", { fg = "#FBBF24", bg = "NONE", ctermbg = "NONE", bold = true })

-- Lighter blue for file info in statusline
api.nvim_set_hl(0, "StatusLineBlueFG", { fg = "#93C5FD", bg = "NONE", ctermbg = "NONE" })

-- Transparent statusline background
api.nvim_set_hl(0, "StatusLine", { bg = "NONE", ctermbg = "NONE" })
api.nvim_set_hl(0, "StatusLineNC", { bg = "NONE", ctermbg = "NONE" })



