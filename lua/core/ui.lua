-- Transparent background for all main UI elements
vim.cmd [[
  augroup TransparentBG
    autocmd!
    autocmd ColorScheme * highlight Normal ctermbg=none guibg=none
    autocmd ColorScheme * highlight NormalNC ctermbg=none guibg=none
    autocmd ColorScheme * highlight NvimTreeNormal guibg=none ctermbg=none
    autocmd ColorScheme * highlight NvimTreeNormalNC guibg=none ctermbg=none
    autocmd ColorScheme * highlight EndOfBuffer ctermbg=none guibg=none
    autocmd ColorScheme * highlight FloatBorder ctermbg=none guibg=none
    autocmd ColorScheme * highlight NormalFloat ctermbg=none guibg=none
    autocmd ColorScheme * highlight TelescopeNormal ctermbg=none guibg=none
    autocmd ColorScheme * highlight TelescopeBorder ctermbg=none guibg=none
    autocmd ColorScheme * highlight DapUI* guibg=none ctermbg=none
    autocmd ColorScheme * highlight Pmenu guibg=none ctermbg=none
  augroup END
]]

-- Apply highlights immediately (helpful on startup)
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
vim.api.nvim_set_hl(0, "FloatBorder", { bg = "none" })
vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "none" })
vim.api.nvim_set_hl(0, "Pmenu", { bg = "none" })

-- Optional: Make DAP UI fully transparent
vim.api.nvim_set_hl(0, "DapUIVariable", { bg = "none" })
vim.api.nvim_set_hl(0, "DapUIScope", { bg = "none" })
vim.api.nvim_set_hl(0, "DapUIType", { bg = "none" })
vim.api.nvim_set_hl(0, "DapUIValue", { bg = "none" })
vim.api.nvim_set_hl(0, "DapUIModifiedValue", { bg = "none" })
vim.api.nvim_set_hl(0, "DapUIThread", { bg = "none" })
vim.api.nvim_set_hl(0, "DapUIStoppedThread", { bg = "none" })
vim.api.nvim_set_hl(0, "DapUISource", { bg = "none" })
vim.api.nvim_set_hl(0, "DapUILineNumber", { bg = "none" })
vim.api.nvim_set_hl(0, "DapUIFrameName", { bg = "none" })

